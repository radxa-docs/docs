---
sidebar_position: 3
---

# 接口使用

## 1. 接口说明

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rock4d-interface.webp" style={{width: '100%', maxWidth: '800px'}} />
</div>

| 序号 | 说明                    | 数量 |
| :--: | :---------------------- | :--: |
|  ①   | USB Type-C 供电接口     |  1   |
|  ②   | 用户指示灯              |  1   |
|  ③   | 电源指示灯              |  1   |
|  ④   | 电源按键                |  1   |
|  ⑤   | FPC 接口                |  1   |
|  ⑥   | WiFi6 和 蓝牙 5.4       |  1   |
|  ⑦   | 外接天线接口            |  1   |
|  ⑧   | 40 Pin GPIO             |  1   |
|  ⑨   | LPDDR5 内存             |  1   |
|  ⑩   | PoE 接口                |  1   |
|  ⑪   | Maskrom 按键            |  1   |
|  ⑫   | USB 2.0 Type-A          |  2   |
|  ⑬   | Rockchip RK3576（J）    |  1   |
|  ⑭   | USB 3.0 Type-A          |  2   |
|  ⑮   | SPI NOR Flash           |  1   |
|  ⑯   | 千兆以太网口（支持PoE） |  1   |
|  ⑰   | 风扇接口                |  1   |
|  ⑱   | 耳机插孔                |  1   |
|  ⑲   | MIPI CSI 接口           |  1   |
|  ⑳   | HDMI 2.1 接口           |  1   |
|  ㉑  | Recovery 接口           |  1   |
|  ㉒  | UFS 模块接口            |  1   |
|  ㉓  | RTC 接口                |  1   |
|  ㉔  | eMMC 模块接口           |  1   |
|  ㉕  | MIPI CSI 接口           |  1   |
|  ㉖  | MicroSD 卡槽            |  1   |
|  ㉗  | MIPI DSI 接口           |  1   |

## 2. 接口使用

主要对 Radxa ROCK 4D 可以外拓的接口进行使用说明介绍。

### 2.1 USB Type-C 供电接口

Radxa ROCK 4D 主板支持 Type-C 和 GPIO 供电，我们推荐使用 Type-C 电源适配器供电，请确保电源适配器能够提供 5V 电源输入，并且能够兼容 PD 协议。

:::tip
Radxa ROCK 4D 主板仅支持 5V 电源输入，建议电流 2A 以上，确保所有外设稳定运行。

参考电源：

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)

- 标准 Type-C 电源适配器( 5V 电源输入，支持 PD 协议，建议电流 2A 以上)
  :::

### 2.2 电源按键

短按触发开机或者电源菜单选项，长按关机。

### 2.3 FPC 接口

支持 FPC PCIe 拓展接口，可用于连接扩展配件。

### 2.4 外接天线接口

支持给板载的 WiFi6 和 蓝牙 5.4 芯片外接天线。

### 2.5 40 Pin GPIO

支持给板载的 GPIO 引脚外接外部设备，支持 UART、SPI、I2C、I2S、PWM、CAN、ADC 等。

### 2.6 PoE 接口

支持给板载的 PoE 接口外接 PoE 电源。

### 2.7 Maskrom 按键

上电前按下 Maskrom 按键，上电后松开，进入 Maskrom 模式。

### 2.8 USB 2.0 Type-A

提供两个 USB 2.0 接口，用于连接外部设备，如键盘、鼠标、存储设备等。

### 2.9 USB 3.0 Type-A

提供高速 USB 3.0 接口，用于连接外部设备，如存储设备、网络适配器等。

:::tip

1. 可以通过反复插拔 USB 设备，在系统命令行输入 `lsusb` 命令查看设备是否被识别
2. USB 3.0 的上层 Type-A 接口支持 OTG 功能
   :::

### 2.10 千兆网口接口

千兆以太网口（支持 PoE，需外接 HAT）。

### 2.11 风扇接口

1× 2-pin 1.25mm PWM 控制风扇接口。

### 2.12 耳机插孔

3.5mm 四段耳机插孔，支持麦克风输入。

### 2.13 MIPI CSI 接口

支持 MIPI CSI 接口，可用于连接高清摄像头。

### 2.14 HDMI 2.1 接口

HDMI 2.1 接口支持高清视频输出，最高支持 4K@120fps。

### 2.15 Recovery 接口

短接 Recovery 接口，进入 Recovery 模式。

### 2.16 UFS 模块接口

支持 UFS 2.0 接口，可用于连接扩展存储设备和启动系统。

### 2.17 RTC 接口

支持 RTC 实时时钟模块接口，可以连接 RTC 模块以保持系统时间。

### 2.18 eMMC 5.1 模块接口

支持 eMMC 5.1 接口，可用于连接扩展存储设备和启动系统。

### 2.19 MIPI CSI 接口

支持 MIPI CSI 接口，可用于连接高清摄像头。

### 2.20 MicroSD 卡槽

支持 MicroSD 卡槽，可用于连接扩展存储设备和启动系统。

### 2.21 MIPI DSI 接口

支持 MIPI DSI 接口，可用于连接高清显示屏。
