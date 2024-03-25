---
sidebar_position: 6
---

# Radxa Wireless Module A8

Radxa 无线模块 A8 是基于 Realtek RTL8852BE 的标准 M.2 2230 无线模块，这是一款高度集成的单芯片，支持两个数据流传输的 Wi-Fi 6 （原 802.11ax） 解决方案，具有多用户 MIMO（多输入，多输出）和无线局域网（ WLAN ）PCI Express 网络接口控制器，集成 BT5 USB 接口控制器。 它将 WLAN MAC、支持 2T2R 的 WLAN 基带和 RF 组合在一个芯片中。

![Radxa Wireless Module A8](/img/accessories/a8-module-01.webp)

## 兼容性

- Radxa ROCK 3A
- Radxa ROCK 3B
- Radxa ROCK 5B
- Radxa ROCK 5A

## 使用教程

### 安装

对于支持 A8 模块的产品，瑞莎已在官方镜像中集成了对应驱动，直接将该无线模块插入 M.2 E Key 底座即可使用。

以在 ROCK 5B 上官方的 Debian 系统下使用为例，安装如图所示：

![Radxa Wireless Module A8](/img/accessories/a8-module-02.webp)

### Wi-Fi 使用

1. 在进入系统后，打开终端

2. 输入以下命令打开 Wi-Fi

```bash
sudo nmcli r wifi on
```

:::tip
首次使用 sudo 命令时需要输入登录账户的密码。
:::

3. 输入以下命令扫描 WIFI

```bash
sudo nmcli dev wifi
```

4. 输入以下命令连接 WIFI 网络

```bash
sudo nmcli dev wifi connect "wifi_name" password "wifi_password"
```

其中，`wifi_name` 为您要连接的 WiFi 名称（SSID），`wifi_password` 为该 WiFi 的密码。

另外，您也可以通过 Linux 桌面提供的 WiFi 控件来进行可视化操作。

### 蓝牙使用

1. 测试蓝牙模块情况，检查蓝牙设备。

```bash
sudo systemctl status bluetooth
```

2. 运行蓝牙设备。

```bash
sudo systemctl start bluetooth
```

3. 检测蓝牙设备

```bash
sudo hciconfig

# Output
hci0:   Type: Primary  Bus: UART
       BD Address: 10:2C:6B:49:D5:53  ACL MTU: 1021:8  SCO MTU: 64:1
       UP RUNNING
       RX bytes:850 acl:0 sco:0 events:58 errors:0
       TX bytes:2814 acl:0 sco:0 commands:58 errors:0
```

4. 测试蓝牙功能

   连接蓝牙扬声器：

   首先安装 `pulseaudio`

   ```bash
   sudo apt-get install -y pulseaudio-module-bluetooth pulseaudio
   ```

   运行 `pulseaudio`

   ```bash
   sudo pulseaudio --start
   ```

   使用 `pulseaudio` 连接

   ```bash
   sudo bluetoothctl

   [bluetooth]# default-agent
   [bluetooth]# power on
   [bluetooth]# scan on
   [bluetooth]# trust 41:42:1A:8D:A9:65       #BT-280
   [bluetooth]# pair 41:42:1A:8D:A9:65
   [bluetooth]# connect 41:42:1A:8D:A9:65
   ```

## 硬件信息

### 特征

- IEEE 802.11a/b/g/n/ac/ax 兼容无线局域网
- 支持 BT5 系统（BT 5.2 Logo Compliant）
- 适用于 2.4GHz 和 5Ghz 频段的完整 802.11n MIMO 解决方案
- 使用 20MHz 带宽时最大 PHY 数据速率高达 286.8 Mbps，使用 40MHz 带宽时高达 573.5Mbps，使用 80MHz 带宽时高达 1201Mbps
- 以 802.11n 数据速率运行时向后兼容 802.11a/b/g 设备
- 以 802.11ax 数据速率运行时向后兼容 802.11a/n/ac 设备
- 符合 Windows 操作系统主机实现的 FIPS 140-2 安全要求
- 支持 20/40/80MHz 5GHz
- 支持WLAN-Bluetooth共存
- 支持低功耗蓝牙
- 兼容蓝牙 v2.1 + EDR

### 结构框图

![A8 结构](/img/accessories/wireless-a8-block-diagram.webp)

### 规格

| 特征     | 描述                                                                                             |
| -------- | ------------------------------------------------------------------------------------------------ |
| 名字     | Radxa Wireless Module A8                                                                         |
| 产品描述 | IEEE 802.11a/b/g/n/ac/ax 无线 LAN 2T2R 和蓝牙 5.2 组合模块 (M.2 2230)                            |
| 芯片     | RTL8852BE                                                                                        |
| 主接口   | Wi-Fi: PCIe BT: USB                                                                              |
| 尺寸     | 22mm x 30mm x 2.25mm                                                                             |
| 接口规格 | M.2 2230 E Key                                                                                   |
| 天线     | I-PEX MHF4 Connector Receptacle (20449) ANT1(Main): WiFi/Bluetooth  TX/RX ANT2(AUX): WiFi  TX/RX |
| 工作温度 | 0 to +70°C                                                                                       |
| 重量     | 3g                                                                                               |

### 尺寸

![A8 2D size](/img/accessories/radxa-wireless-module-2d.webp)
