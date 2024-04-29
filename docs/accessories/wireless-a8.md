---
sidebar_position: 6
---

# 瑞莎无线模块 A8

瑞莎无线模块 A8 是一款采用 Realtek RTL8852BE 芯片的标准 M.2 2230 规格无线模块，支持 Wi-Fi 6 和蓝牙 5.2 技术。

目前，瑞莎无线模块 A8 提供两个版本。

- V1.0

![Radxa Wireless Module A8 V1.0](/img/accessories/a8-module-01.webp)

- V2.0

![Radxa Wireless Module A8 V2.0](/img/accessories/a8-module-03.webp)

## 硬件信息

### 基本规格

| 特征     | 描述                                                                                 |
| -------- | ------------------------------------------------------------------------------------ |
| 名字     | Radxa Wireless Module A8                                                             |
| 产品描述 | IEEE 802.11a/b/g/n/ac/ax 无线局域网 2T2R 和蓝牙 5.2 组合模块 (M.2 2230)              |
| 芯片     | RTL8852BE                                                                            |
| 主接口   | Wi-Fi: PCIe BT: USB                                                                  |
| 尺寸     | 22mm x 30mm x 2.25mm                                                                 |
| 接口规格 | M.2 2230 E Key                                                                       |
| 天线接口 | I-PEX MHF4 接头插座 (20449) ANT1(Main): WiFi/Bluetooth  TX/RX ANT2(AUX): WiFi  TX/RX |
| 工作温度 | 0 to +70°C                                                                           |
| 重量     | 3g                                                                                   |

### 无线局域网

- IEEE 802.11 a/b/g/n/ac/ax 无线局域网
- IEEE 802.11 ac/ax 支持 2T2R，并且符合 Wave 2 技术标准，支持多用户多输入多输出( MU-MIMO )技术。
- IEEE 802.11 n 支持标准的 MIMO（多输入多输出），并且适用于 2.4 GHz 和 5 GHz 两个频段。
- 使用 20MHz 带宽时最大 PHY 数据速率高达 286.8 Mbps，使用 40MHz 带宽时高达 573.5Mbps，使用 80MHz 带宽时高达 1201Mbps
- 以 802.11n 数据速率运行时向后兼容 802.11a/b/g 设备
- 以 802.11ax 数据速率运行时向后兼容 802.11a/n/ac 设备
- 支持 IEEE 802.11i,包括 WPA, WPA2, WPA3 安全协议，并且还支持 WAPI 安全协议。
- 802.11g 的最大数据传输速率为 54Mbps，802.11n 的最大数据传输速率为 300Mbps，而 802.11ax 的最大数据传输速率则为 1201Mbps。

### 蓝牙

- 支持蓝牙 V5.2
- 兼容蓝牙 V2.1 + EDR
- 支持无线局域网和蓝牙共存
- 支持蓝牙低能耗（BLE）模式
- 支持在基本速率（BR）和增强数据率（EDR）下的所有蓝牙数据包类型

## ID 列表

| 版本 | 无线局域网 VID | 无线局域网 PID | 蓝牙 VID | 蓝牙 PID |
| ---- | -------------- | -------------- | -------- | -------- |
| V1.0 | 10EC           | B852           | 0BDA     | B85B     |
| V2.0 | 10EC           | B852           | 13D3     | 3570     |

## 支持列表

| 版本                                | V1.0 版本 | V1.0 版本 | V1.0 版本 | V2.0 版本          | V2.0 版本 | V2.0 版本 |
| ----------------------------------- | --------- | --------- | --------- | ------------------ | --------- | --------- |
| 系统                                | Linux     | Android   | Windows   | Linux              | Android   | Windows   |
| Radxa X2L                           | 支持      | N/A       | 支持      | 内核大于 6.7才支持 | N/A       | 支持      |
| Radxa ROCK 3A                       | 支持      | 支持      | N/A       | 支持               | 正在调试  | N/A       |
| Radxa ROCK 3B                       | 支持      | 支持      | N/A       | 支持               | 正在调试  | N/A       |
| Radxa ROCK 5A                       | 支持      | 支持      | N/A       | 支持               | 支持      | N/A       |
| Radxa ROCK 5B                       | 支持      | 支持      | N/A       | 支持               | 支持      | N/A       |
| Radxa ROCK 5 ITX                    | 支持      | 支持      | N/A       | 支持               | 支持      | N/A       |
| Radxa CM3I 搭配 Radxa CM3I IO Board | 支持      | 支持      | N/A       | 支持               | 支持      | N/A       |
| Radxa NX5 搭配 Radxa NX5 IO Board   | 支持      | 支持      | N/A       | 支持               | 支持      | N/A       |
| Radxa CM5 搭配 Radxa CM5 IO Board   | 支持      | 支持      | N/A       | 支持               | 支持      | N/A       |

### 原理框图

![原理框图](/img/accessories/wireless-a8-block-diagram.webp)

### 尺寸

![2D 尺寸图](/img/accessories/radxa-wireless-module-2d.webp)

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
