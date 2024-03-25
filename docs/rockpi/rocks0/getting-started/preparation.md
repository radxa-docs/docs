---
sidebar_position: 1
---

# 准备工作

## 必备线材

** Radxa ROCK S0 必须配置专用线材才可以使用 **

### 线材信号定义

#### USB OTG / HOST 信号定义

| 颜色 | 定义   |
| ---- | ------ |
| 红色 | 5V     |
| 白色 | USB_DM |
| 绿色 | USB_DP |
| 黑色 | GND    |

#### 100Mbps 网口信号定义

| 颜色 | 定义 |
| ---- | ---- |
| 红色 | RXN  |
| 绿色 | RXP  |
| 白色 | TXN  |
| 黑色 | TXP  |

![rocks0 sequence](/img/rockpi/s0/rock-s0-signal-sequence.webp)

### USB OTG 线材

Radxa 4P to USB-A Male Cable 是 4-Pin MX1.25mm 转公头 USB 的线材，该线材可接到 5V 适配器上为 ROCK S0 供电，也可以直接接到主机进行通信。

![rocks0 otg](/img/rockpi/s0/rocks0-otg-wire.webp)

### USB HOST 线材

Radxa 4P to USB-A Female Cable 是 4-Pin MX1.25mm 转母头 USB 线材，该线材可为 ROCK S0 提供一个接 USB 设备的接口。

![rocks0 usb](/img/rockpi/s0/rocks0-usb-wire.webp)

### 以太网线材

Radxa 4P to Ethernet Adapter Cable 是 4-Pin MX1.25mm 转网口线材，该线材可为 ROCK S0 接入 100Mbps 以太网网络。

![rocks0 eth](/img/rockpi/s0/rocks0-eth-wire.webp)

## 开发准备

### 电源

Radxa ROCK S0 的供电接口为 4-Pin USB2.0 OTG 接口，可以用 [USB OTG 线材](/rockpi/rocks0/getting-started/preparation#usb-otg-线材)，**仅支持 5V 输入**。

### 启动介质

microSD 卡，容量不小于 8GB, 用于系统启动盘

### microSD 读卡器

用于制作系统启动盘

### 网络连接

ROCK S0 板载 Wi-Fi 模块。可通过 Wi-Fi 和 4-Pin 100Mbps 以太网接口访问网络。4-Pin 100Mbps 以太网接口需要一根[以太网线材](/rockpi/rocks0/getting-started/preparation#以太网线材)。

### 串口调试

请参考[串口调试文档](/rockpi/rocks0/low-level-dev/serial)。

## 天线切换

请参考[天线切换文档](antenna-switch)

## 常见问题

## 注意事项

## 配件
