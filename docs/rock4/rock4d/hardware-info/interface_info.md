---
sidebar_position: 3
---

# 接口信息

## 芯片框图

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/hardware-rk3576.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 系统框图

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/hardware-rk3576-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rock4d-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
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

## 接口使用

主要对 Radxa ROCK 4D 可以外拓的接口进行使用说明介绍。

### 40 Pin GPIO

支持给板载的 GPIO 引脚外接外部设备，支持 UART、SPI、I2C、I2S、PWM、CAN、ADC 等。

| Function7     | Function6    | Function5   | Function4    | Function3   | Function2     | Function1  | Pin# | Pin# | Function1  | Function2         | Function3      | Function4    | Function5   | Function6    | Function7     |
| ------------- | ------------ | ----------- | ------------ | ----------- | ------------- | ---------- | ---- | ---- | ---------- | ----------------- | -------------- | ------------ | ----------- | ------------ | ------------- |
|               |              |             |              |             |               | 3V3        | 1    | 2    | 5V         |                   |                |              |             |              |               |
|               | PDM0_SDI1_M2 |             |              | I2C8_SDA_M1 | UART2_RX_M0   | GPIO1_C7_d | 3    | 4    | 5V         |                   |                |              |             |              |               |
|               | PDM0_SDI0_M2 |             |              | I2C8_SCL_M1 | UART2_TX_M0   | GPIO1_C6_d | 5    | 6    | GND        |                   |                |              |             |              |               |
|               |              |             | SPI2_CSN0_M1 | I2C6_SDA_M1 | UART4_CTSN_M1 | GPIO1_C3_u | 7    | 8    | GPIO0_D4_u | UART0_TX_M0_DEBUG |                |              |             |              |               |
|               |              |             |              |             |               | GND        | 9    | 10   | GPIO0_D5_u | UART0_RX_M0_DEBUG |                |              |             |              |               |
| UART2_RTSN_M0 |              |             | SPI2_MOSI_M1 |             | UART4_TX_M1   | GPIO1_C4_d | 11   | 12   | GPIO1_D1_d | UART10_RX_M1      | I3C0_SDA_PU_M1 |              |             | SAI2_SCLK_M0 |               |
|               |              | PWM1_CH0_M2 |              |             |               | GPIO2_C0_d | 13   | 14   | GND        |                   |                |              |             |              |               |
| UART2_CTSN_M0 |              |             | SPI2_MISO_M1 |             | UART4_RX_M1   | GPIO1_C5_d | 15   | 16   | GPIO2_B6_d | UART7_TX_M0       | I2C8_SCL_M2    |              |             |              |               |
|               |              |             |              |             |               | 3V3        | 17   | 18   | GPIO2_B7_d | UART7_RX_M0       | I2C8_SDA_M2    |              |             |              |               |
|               | SAI3_LRCK_M1 | PWM1_CH1_M1 | SPI1_MOSI_M0 | I2C9_SCL_M1 |               | GPIO1_B5_d | 19   | 20   | GND        |                   |                |              |             |              |               |
|               | SAI3_SDO_M1  |             | SPI1_MISO_M0 |             | UART3_CTSN_M2 | GPIO1_B6_d | 21   | 22   | GPIO2_D7_d |                   |                |              | PWM2_CH7_M2 |              |               |
|               | SAI3_SCLK_M1 | PWM1_CH0_M1 | SPI1_CLK_M0  | I2C9_SDA_M1 |               | GPIO1_B4_d | 23   | 24   | GPIO1_B7_d |                   |                | SPI1_CSN0_M0 |             | SAI3_SDI_M1  | UART3_RTSN_M2 |
|               |              |             |              |             |               | GND        | 25   | 26   | GPIO1_C0_d | UART3_TX_M2       |                | SPI1_CSN1_M0 | PWM0_CH0_M1 | PDM0_SDI2_M2 |               |
| CAN1_RX_M1    | SAI4_SCLK_M2 | PWM2_CH3_M1 |              | I2C6_SDA_M3 |               | GPIO4_C7_d | 27   | 28   | GPIO4_C6_d |                   | I2C6_SCL_M3    |              | PWM2_CH2_M1 | SAI4_SDI_M2  | CAN1_TX_M1    |
| CAN1_TX_M3    |              |             |              |             |               | GPIO3_A2_d | 29   | 30   | GND        |                   |                |              |             |              |               |
| PDM0_CLK0_M2  | SAI3_MCLK_M1 |             |              |             | UART3_RX_M2   | GPIO1_C1_d | 31   | 32   | GPIO1_D5_d | UART10_CTSN_M1    | I2C5_SDA_M1    | SPI2_CLK_M1  |             | PDM0_CLK1_M2 |               |
|               |              | PWM1_CH2_M1 | SPI2_CSN1_M1 | I2C6_SCL_M1 | UART4_RTSN_M1 | GPIO1_C2_u | 33   | 34   | GND        |                   |                |              |             |              |               |
|               | SAI2_LRCK_M0 | PWM1_CH3_M1 |              | I3C0_SCL_M1 |               | GPIO1_D2_d | 35   | 36   | GPIO1_D4_d | UART10_RTSN_M1    | I2C5_SCL_M1    |              |             | SAI2_MCLK_M0 | PDM0_SDI3_M2  |
| CAN1_RX_M3    |              |             |              |             |               | GPIO3_A3_d | 37   | 38   | GPIO1_D3_d |                   | I3C0_SDA_M1    |              | PWM1_CH4_M1 | SAI2_SDI_M0  |               |
|               |              |             |              |             |               | GND        | 39   | 40   | GPIO1_D0_d | UART10_TX_M1      |                |              |             | SAI2_SDO_M0  |               |

### USB Type-C 供电接口

Radxa ROCK 4D 主板支持 Type-C 和 GPIO 供电，我们推荐使用 Type-C 电源适配器供电，请确保电源适配器能够提供 5V 电源输入，并且能够兼容 PD 协议。

:::tip
Radxa ROCK 4D 主板仅支持 5V 电源输入，建议电流 2A 以上，确保所有外设稳定运行。

参考电源：

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)

- 标准 Type-C 电源适配器( 5V 电源输入，支持 PD 协议，建议电流 2A 以上)
  :::

### 电源按键

短按触发开机或者电源菜单选项，长按关机。

### FPC 接口

支持 FPC PCIe 拓展接口，可用于连接扩展配件。

### 外接天线接口

支持给板载的 WiFi6 和 蓝牙 5.4 芯片外接天线。

### PoE 接口

支持给板载的 PoE 接口外接 PoE 电源。

### Maskrom 按键

上电前按下 Maskrom 按键，上电后松开，进入 Maskrom 模式。

### USB 2.0 Type-A

提供两个 USB 2.0 接口，用于连接外部设备，如键盘、鼠标、存储设备等。

### USB 3.0 Type-A

提供高速 USB 3.0 接口，用于连接外部设备，如存储设备、网络适配器等。

:::tip

1. 可以通过反复插拔 USB 设备，在系统命令行输入 `lsusb` 命令查看设备是否被识别
2. USB 3.0 的上层 Type-A 接口支持 OTG 功能
   :::

### 千兆网口接口

千兆以太网口（支持 PoE，需外接 HAT）。

### 风扇接口

1× 2-pin 1.25mm PWM 控制风扇接口。

### 耳机插孔

3.5mm 四段耳机插孔，支持麦克风输入。

### MIPI CSI 接口

支持 MIPI CSI 接口，可用于连接高清摄像头。

### HDMI 2.1 接口

HDMI 2.1 接口支持高清视频输出，最高支持 4K@120fps。

### Recovery 接口

短接 Recovery 接口，进入 Recovery 模式。

### UFS 模块接口

支持 UFS 2.0 接口，可用于连接扩展存储设备和启动系统。

### RTC 接口

支持 RTC 实时时钟模块接口，可以连接 RTC 模块以保持系统时间。

### eMMC 5.1 模块接口

支持 eMMC 5.1 接口，可用于连接扩展存储设备和启动系统。

### MIPI CSI 接口

支持 MIPI CSI 接口，可用于连接高清摄像头。

### MicroSD 卡槽

支持 MicroSD 卡槽，可用于连接扩展存储设备和启动系统。

### MIPI DSI 接口

支持 MIPI DSI 接口，可用于连接高清显示屏。
