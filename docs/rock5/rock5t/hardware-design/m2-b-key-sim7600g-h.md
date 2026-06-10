---
sidebar_position: 10
---

# M.2 B Key - SIM7600G-H LTE 配置指南

**System:** Radxa Rock 5T · Ubuntu 24.04 · Kernel 6.1.115-3-rockchip  
**模组:** SimCom SIM7600G-H 安装在 M.2 B-Key插槽  
**目标:**每次开机自动建立 LTE 连接

---

##1.确认 GPIO 引脚

SIM7600G-H 通过 RK3588 的 4 个 GPIO 引脚进行控制。  
Linux GPIO编号的计算公式为: `Bank × 32 + Group × 8 + Bit`

| Signal            | GPIO Name | Calculation    | Linux No. | 电平逻辑   |
| ----------------- | --------- | -------------- | --------- | ---------- |
| `4G_PWREN`        | GPIO2_B1  | 2×32 + 1×8 + 1 | **73**    | 高电平有效 |
| `4G_WAKE_ON_HOST` | GPIO2_B2  | 2×32 + 1×8 + 2 | **74**    | 高电平有效 |
| `4G_RESET#`       | GPIO2_B3  | 2×32 + 1×8 + 3 | **75**    | 低电平有效 |
| `4G_DISABLE#`     | GPIO3_A6  | 3×32 + 0×8 + 6 | **102**   | 低电平有效 |

:::caution
`RESET#` 与 `W_DISABLE#`均为低电平有效信号。 低电平分别代表正在复位或射频已关闭。 把这两个引脚拉低会导致模组无法启动。
:::

---

##2.导出 GPIO 并启动模组（手动测试）

```bash
# Export GPIOs and set as output
for pin in 73 74 75 102; do
    echo $pin | sudo tee /sys/class/gpio/export
    echo out | sudo tee /sys/class/gpio/gpio${pin}/direction
done

# Set clean initial state
echo 0 | sudo tee /sys/class/gpio/gpio73/value   # Power OFF
echo 1 | sudo tee /sys/class/gpio/gpio75/value   # RESET# HIGH (inactive)
echo 1 | sudo tee /sys/class/gpio/gpio102/value  # W_DISABLE# HIGH (RF enabled)
sleep 1

# Power on
echo 1 | sudo tee /sys/class/gpio/gpio73/value
sleep 2

# Send reset pulse
echo 0 | sudo tee /sys/class/gpio/gpio75/value
sleep 0.5
echo 1 | sudo tee /sys/class/gpio/gpio75/value
sleep 15

# Modem should now appear
lsusb | grep -i sim
# Expected: ID 1e0e:9001 SimTech, Incorporated
```

---

##3.验证模组

```bash
mmcli -L
mmcli -m 0
```

预期输出应包含:

- `model: SIMCOM_SIM7600G-H`
- `state: locked`（需要输入 SIM PIN）
- `ports: cdc-wdm0 (qmi), ttyUSB0..4, wwan0 (net)`

---

##4. 解锁 SIM PIN 并关闭 PIN校验

```bash
# Install minicom
sudo apt install minicom -y

# Connect to AT command port
sudo minicom -D /dev/ttyUSB2 -b 115200
```

在 minicom 中执行以下 AT 命令:

```text
AT+CPIN?           # → +CPIN: SIM PIN  (PIN required)
AT+CPIN="1234"     # Enter your PIN
AT+CPIN?           # → +CPIN: READY

# Disable PIN lock permanently (recommended for embedded use)
AT+CLCK="SC",0,"1234"

# Check network
AT+CSQ             # Signal strength (>10 = good)
AT+CREG?           # → 0,1 = registered
AT+COPS?           # Show network operator
```

---

##5.解决 APN 问题（Telekom运营商配置）

模组出厂默认携带 `carrier config: Commercial-DT`。Deutsche Telekom 网络强制要求使用 `INTERNET.TELEKOM` 作为唯一允许的 APN。依托 Telekom 网络的虚拟运营商（例如 Congstar、Aldi Talk）也必须使用该 APN。

```bash
# Install libqmi
sudo apt install libqmi-utils -y

# Set interface to raw_ip mode
sudo ip link set wwan0 down
echo 'Y' | sudo tee /sys/class/net/wwan0/qmi/raw_ip
sudo ip link set wwan0 up

# Create qmi-network configuration
sudo nano /etc/qmi-network.conf
```

```text
APN=INTERNET.TELEKOM
PROFILE=2
```

```bash
# Test connection
sudo qmi-network /dev/cdc-wdm0 start
# → "Network started successfully"

# Read IP from QMI
sudo qmicli -d /dev/cdc-wdm0 --wds-get-current-settings
```

---

##6.开机自动连接脚本

创建连接脚本:

```bash
sudo nano /usr/local/bin/sim7600-connect.sh
```

```bash
#!/bin/bash

# GPIO Init — Power on modem
for pin in 73 74 75 102; do
    echo $pin > /sys/class/gpio/export 2>/dev/null
    echo out > /sys/class/gpio/gpio${pin}/direction
done
echo 0 > /sys/class/gpio/gpio73/value   # Power off
echo 1 > /sys/class/gpio/gpio75/value   # RESET# inactive
echo 1 > /sys/class/gpio/gpio102/value  # RF enabled
sleep 1
echo 1 > /sys/class/gpio/gpio73/value   # Power on
sleep 2
echo 0 > /sys/class/gpio/gpio75/value   # Reset pulse
sleep 0.5
echo 1 > /sys/class/gpio/gpio75/value

# Wait for USB modem to appear (max 30s)
echo "Waiting for modem..."
for i in $(seq 1 30); do
    [ -c /dev/cdc-wdm0 ] && break
    sleep 1
done

# Clean up old QMI state (prevents "PDH already exists" error)
rm -f /tmp/qmi-network-state-cdc-wdm0

# Prepare interface
ip link set wwan0 down
echo 'Y' > /sys/class/net/wwan0/qmi/raw_ip
ip link set wwan0 up

# Bring up connection
qmi-network /dev/cdc-wdm0 stop 2>/dev/null
sleep 1
qmi-network /dev/cdc-wdm0 start
sleep 3

# Get IP address from QMI and configure interface
IP=$(qmicli -d /dev/cdc-wdm0 --wds-get-current-settings 2>&1 \
    | grep "IPv4 address" | awk '{print $NF}')
DNS1=$(qmicli -d /dev/cdc-wdm0 --wds-get-current-settings 2>&1 \
    | grep "IPv4 primary DNS" | awk '{print $NF}')
DNS2=$(qmicli -d /dev/cdc-wdm0 --wds-get-current-settings 2>&1 \
    | grep "IPv4 secondary DNS" | awk '{print $NF}')

if [ -n "$IP" ]; then
    ip addr flush dev wwan0
    ip addr add ${IP}/32 dev wwan0
    # No gateway needed for raw_ip point-to-point
    ip route add default dev wwan0 metric 700
    resolvectl dns wwan0 $DNS1 $DNS2 2>/dev/null
    echo "LTE active: $IP"
else
    echo "ERROR: Failed to get IP address!"
    exit 1
fi
```

```bash
sudo chmod +x /usr/local/bin/sim7600-connect.sh
```

---

##7. 创建 Systemd 服务

```bash
sudo nano /etc/systemd/system/sim7600-init.service
```

```ini
[Unit]
Description=SIM7600 Modem Init and Connect
After=sysinit.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/local/bin/sim7600-connect.sh

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl daemon-reload
sudo systemctl enable sim7600-init.service

# Disable ModemManager (conflicts with direct QMI usage)
sudo systemctl disable ModemManager
```

---

##8.手动切换 LTE

创建一个在切换到 WiFi 时关闭 LTE 的脚本:

```bash
sudo nano /usr/local/bin/lte-off.sh
```

```bash
#!/bin/bash
qmi-network /dev/cdc-wdm0 stop
rm -f /tmp/qmi-network-state-cdc-wdm0
ip addr flush dev wwan0
ip link set wwan0 down
echo 0 > /sys/class/gpio/gpio73/value
echo "LTE off."
```

```bash
sudo chmod +x /usr/local/bin/lte-off.sh

# Usage:
sudo lte-off.sh              # Turn LTE off, use WiFi
sudo sim7600-connect.sh      # Turn LTE back on
```

---

##9. 测试连接

```bash
# After reboot or manual start:
ip addr show wwan0          # IPv4 address must be visible
ip route show               # default via wwan0 must be present
ping -c 3 8.8.8.8           # Ping over LTE
curl -s ifconfig.me         # Show public IP
nmcli radio wifi off        # Disable WiFi — LTE only
ping -c 3 google.com        # DNS test
nmcli radio wifi on         # Re-enable WiFi
```

---

##排障

| 问题                          | 原因                                | 解决方案                                            |
| ----------------------------- | ----------------------------------- | --------------------------------------------------- |
| `lsusb` 中看不到模组          | RESET# 电平逻辑反了（低电平有效！） | 正常工作时保持 gpio75 = HIGH                        |
| 出现 `unknown-apn`错误        | Telekom运营商配置阻止自定义 APN     | 使用 `APN=INTERNET.TELEKOM`                         |
| 出现 `PDH already exists`错误 | /tmp 中残留旧的状态文件             | `rm -f /tmp/qmi-network-state-cdc-wdm0`             |
| 连接后没有 IPv4               | raw_ip模式下 DHCP 不生效            | 通过 `qmicli --wds-get-current-settings`手动设置 IP |
| 开机时服务失败                | ModemManager 占用了 cdc-wdm0        | 通过 systemctl禁用 ModemManager                     |
