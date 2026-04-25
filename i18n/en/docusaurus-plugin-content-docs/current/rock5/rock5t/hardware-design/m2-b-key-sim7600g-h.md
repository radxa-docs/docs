---
sidebar_position: 10
---

# M.2 B Key - SIM7600G-H LTE Setup

**System:** Radxa Rock 5T · Ubuntu 24.04 · Kernel 6.1.115-3-rockchip  
**Modem:** SimCom SIM7600G-H in M.2 B-Key slot  
**Goal:** Automatic LTE connection on every boot

---

## 1. Identify GPIO Pins

The SIM7600G-H is controlled via 4 GPIO pins of the RK3588.  
The Linux GPIO number is calculated as: `Bank × 32 + Group × 8 + Bit`

| Signal | GPIO Name | Calculation | Linux No. | Logic |
|---|---|---|---|---|
| `4G_PWREN` | GPIO2_B1 | 2×32 + 1×8 + 1 | **73** | Active-HIGH |
| `4G_WAKE_ON_HOST` | GPIO2_B2 | 2×32 + 1×8 + 2 | **74** | Active-HIGH |
| `4G_RESET#` | GPIO2_B3 | 2×32 + 1×8 + 3 | **75** | Active-LOW |
| `4G_DISABLE#` | GPIO3_A6 | 3×32 + 0×8 + 6 | **102** | Active-LOW |

:::caution
`RESET#` and `W_DISABLE#` are Active-Low signals. A LOW level means reset active or RF disabled respectively. Setting these pins LOW will prevent the modem from starting.
:::

---

## 2. Export GPIOs and Start Modem (Manual Test)

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

## 3. Verify Modem

```bash
mmcli -L
mmcli -m 0
```

Expected output shows:
- `model: SIMCOM_SIM7600G-H`
- `state: locked` (SIM PIN required)
- `ports: cdc-wdm0 (qmi), ttyUSB0..4, wwan0 (net)`

---

## 4. Unlock SIM PIN and Disable PIN Lock

```bash
# Install minicom
sudo apt install minicom -y

# Connect to AT command port
sudo minicom -D /dev/ttyUSB2 -b 115200
```

In minicom, run the following AT commands:

```
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

## 5. Solve APN Issue (Telekom Carrier Config)

The modem ships with `carrier config: Commercial-DT`. The Deutsche Telekom network enforces `INTERNET.TELEKOM` as the only allowed APN. MVNOs running on the Telekom network (e.g. Congstar, Aldi Talk) must also use this APN.

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

```
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

## 6. Automatic Boot Script

Create the connection script:

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

## 7. Create Systemd Service

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

## 8. Toggle LTE Manually

Create a script to turn LTE off when using WiFi:

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

## 9. Test Connection

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

## Troubleshooting

| Problem | Cause | Solution |
|---|---|---|
| Modem not visible in `lsusb` | RESET# logic inverted (Active-Low!) | Keep gpio75 = HIGH during normal operation |
| `unknown-apn` error | Telekom carrier config blocks custom APNs | Use `APN=INTERNET.TELEKOM` |
| `PDH already exists` error | Stale state file in /tmp | `rm -f /tmp/qmi-network-state-cdc-wdm0` |
| No IPv4 after connect | DHCP does not work in raw_ip mode | Set IP manually via `qmicli --wds-get-current-settings` |
| Service fails at boot | ModemManager blocks cdc-wdm0 | Disable ModemManager via systemctl |
