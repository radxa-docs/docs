---
sidebar_position: 4
---

# 硬件接口说明

## 接口总览

![NIO 12L Overview](/img/nio/nio12l/nio-12l-v131-overview.webp)

## 接口详情

### SoC

Mediatek Genio 1200 SoC（MT8395）。

### 内存

DDR 是 LPDDR4X。

### UFS

使用的是 UFS2.1。

### 电源供电

NIO 12L 的供电口是 Type-C DC 口，仅支持 5V 输入。建议最低使用 5V/3A 电源适配器。大部分的手机充电器都可以满足。

:::tip
瑞莎推荐使用 [Radxa Power PD30W](/accessories/pd_30w)。
:::

### 按键

NIO 12L 有 3 个按键：Power 按键，Download 按键和 Home 按键。

- Power 按键
  - 用于设备的开机和关机。
- Download 按键
  - 用于把设备引导到 Dowmload 模式。
- Home 按键
  - 用户自定义按键。

### LED 灯

- 电源灯（绿色）
  - 插上电源适配器后，绿色电源灯就会常亮。不受软件控制。
- 系统状态灯（蓝色）
  - 状态灯可受软件控制。可通过主控的 GPIO_07 引脚控制。
- 用户灯（红色）
  - 用户灯可受软件控制。可通过主控的 GPIO_06 引脚控制。

### HDMI TX

NIO 12L 搭载了一个 HDMI 连接器，用于 HDMI 输出。支持最大的分辨率是 4K@P60Hz。同时支持 HDMI CEC 功能。

### HDMI RX

NIO 12L 搭载了一个 HDMI 连接器，用于 HDMI 输入。支持最大的分辨率是 4K@P60Hz。

### MIPI DSI 显示接口

NIO 12L 支持 MIPI 屏幕，采用了卧式 39PIN 0.3mm 脚距 FH35C-39S-0.3SHW(50) 镀金座子。

<img src="/img/nio/nio12l/nio-12l-mipi-dsi.webp" alt="nio 12l dsi" width="500"/>

<br></br>
<br></br>

<div className='gpio_style' style={{ overflow :"auto"}}>

| Number | Pin Name | Voltage |               &                | Number |   Pin Name   | Voltage |
| :----: | :------: | :-----: | :----------------------------: | :----: | :----------: | :-----: |
|   1    |  VDD3V3  |  3.3V   | <div className='black'>&</div> |   2    | IOVCC1V8-3V3 |  1.8V   |
|   3    |   NULL   |         | <div className='black'>&</div> |   4    |    RESET     |  3.3V   |
|   5    |   NULL   |         | <div className='black'>&</div> |   6    |     GND1     |         |
|   7    | MIPI-0N  |         | <div className='black'>&</div> |   8    |   MIPI-0P    |         |
|   9    |   GND2   |         | <div className='black'>&</div> |   10   |   MIPI-1N    |         |
|   11   | MIPI-1P  |         | <div className='black'>&</div> |   12   |     GND3     |         |
|   13   | MIPI-CKN |         | <div className='black'>&</div> |   14   |   MIPI-CKP   |         |
|   15   |   GND4   |         | <div className='black'>&</div> |   16   |   MIPI-2N    |         |
|   17   | MIPI-2P  |         | <div className='black'>&</div> |   18   |     GND5     |         |
|   19   | MIPI-3N  |         | <div className='black'>&</div> |   20   |   MIPI-3P    |         |
|   21   |   GND6   |         | <div className='black'>&</div> |   22   |     GND7     |         |
|   23   | TP-RESET |  3.3V   | <div className='black'>&</div> |   24   |    TP-VCC    |  3.3V   |
|   25   |  TP-INT  |  3.3V   | <div className='black'>&</div> |   26   |    TP-SDA    |  3.3V   |
|   27   |  TP-SCL  |  3.3V   | <div className='black'>&</div> |   28   |     GND8     |         |
|   29   |   GND9   |         | <div className='black'>&</div> |   30   |   VCC3V31    |  3.3V   |
|   31   | VCC3V32  |  3.3V   | <div className='black'>&</div> |   32   |    GND11     |         |
|   33   |  GND12   |         | <div className='black'>&</div> |   34   |    LED-1     |         |
|   35   |   LED-   |         | <div className='black'>&</div> |   36   |     NULL     |         |
|   37   |   NULL   |         | <div className='black'>&</div> |   38   |    LED+1     |         |
|   39   |   LED+   |         | <div className='black'>&</div> |        |              |         |

</div>

### MIPI CSI

NIO 12L 提供了2个 MIPI CSI 接口。
支持 MIPI 摄像头，采用了 31PIN 0.3mm 脚距 FH35C-31S-0.3SHW(50) 镀金座子。

<img src="/img/nio/nio12l/nio-12l-mipi-csi1.webp" alt="nio 12l csi1" width="500"/>
<img src="/img/nio/nio12l/nio-12l-mipi-csi2.webp" alt="nio 12l csi2" width="500"/>

<br></br>
<br></br>

<div className='gpio_style' style={{ overflow :"auto"}}>

| Number |   Pin Name   | Voltage |               &                | Number |   Pin Name   | Voltage |
| :----: | :----------: | :-----: | :----------------------------: | :----: | :----------: | :-----: |
|   1    |     GND      |         | <div className='black'>&</div> |   2    |  CSI_RX_D3N  |         |
|   3    |  CSI_RX_D3P  |         | <div className='black'>&</div> |   4    |     GND      |         |
|   5    |  CSI_RX_D2N  |         | <div className='black'>&</div> |   6    |  CSI_RX_D2P  |         |
|   7    |     GND      |         | <div className='black'>&</div> |   8    | CSI_RX_CLK1N |         |
|   9    | CSI_RX_CLK1P |         | <div className='black'>&</div> |   10   |     GND      |         |
|   11   |  CSI_RX_D1N  |         | <div className='black'>&</div> |   12   |  CSI_RX_D1P  |         |
|   13   |     GND      |         | <div className='black'>&</div> |   14   |  CSI_RX_D0N  |         |
|   15   |  CSI_RX_D0P  |         | <div className='black'>&</div> |   16   |     GND      |         |
|   17   | CSI_RX_CLK0N |         | <div className='black'>&</div> |   18   | CSI_RX_CLK0P |         |
|   19   |     GND      |         | <div className='black'>&</div> |   20   | CAMERA2_CLK  |         |
|   21   |     GND      |         | <div className='black'>&</div> |   22   | CAMERA1_CLK  |         |
|   23   |  CAM1_PDN_H  |  1.8V   | <div className='black'>&</div> |   24   |   SCL_CAM    |  1.8V   |
|   25   |   SDA_CAM    |  1.8V   | <div className='black'>&</div> |   26   |  CAM0_PDN_H  |  1.8V   |
|   27   |   CAM_RST    |  1.8V   | <div className='black'>&</div> |   28   |   VCC_3V3    |  3.3V   |
|   29   |   VCC_3V3    |  3.3V   | <div className='black'>&</div> |   30   |   VCC_5V0    |   5V    |
|   31   |   VCC_5V0    |   5V    | <div className='black'>&</div> |        |              |         |

</div>

### 有线网口

NIO 12L 提供以太网接口，可接入千兆以太网。

| Pin |    Name     | Pin |    Name     |
| :-: | :---------: | :-: | :---------: |
|  1  | PHY1_MDI0+  |  2  | PHY1_MDI0-  |
|  3  | PHY1_MDI1+  |  4  |     GND     |
|  5  |     GND     |  6  | PHY1_MDI1-  |
|  7  | PHY1_MDI2+  |  8  | PHY1_MDI2-  |
|  9  | PHY1_MDI3+  | 10  | PHY1_MDI3-  |
| 11  | PHY1_MDI0-  | 12  | PHY1_MDI0+  |
| 13  |     GND     | 14  | PHY1_MDI1+  |
| 15  | PHY1_LED_G+ | 16  | PHY1_G_LED- |
| 17  | PHY1_Y_LED+ | 18  | PHY1_Y_LED  |

### 无线模块

NIO 12L 搭载了 Wi-Fi6 / BT 5.2 的无线模块 MT7921。使用时，需要扣上三根天线。

### USB

NIO 12L 提供了 4 个 Type-A USB3.0 接口。
也提供了一个 Type-C 接口，用于支持 USB host/device 和 DP 显示。

### 耳机

NIO 12L 耳机支持音频输出和输入。

### 扬声器

支持接入扬声器。需要贴板上的元器件才能用。

### 40-PIN 引脚定义表

#### GPIO 电压

所有的 GPIO 的高电平电压是 3.3V。

| GPIO number | Function2  | Function1 | Pin# |     | Pin# | Function1 | Function2 | GPIO number |
| :---------: | :--------: | :-------: | :--: | :-: | :--: | :-------: | :-------: | :---------: |
|             |            |   +3.3V   |  1   |     |  2   |   +5.0V   |           |             |
|     359     |    SDA2    |  GPIO12   |  3   |     |  4   |   +5.0V   |           |             |
|     360     |    SCL2    |  GPIO13   |  5   |     |  6   |    GND    |           |             |
|     483     | SPIM1_CSB  |  GPIO136  |  7   |     |  8   |  GPIO98   |   UTXD0   |     445     |
|             |            |    GND    |  9   |     |  10  |  GPIO99   |   URXD0   |     446     |
|     484     | SPIM1_CLK  |  GPIO137  |  11  |     |  12  |  GPIO104  | DISP_PWM1 |     451     |
|     485     |  SPIM1_MO  |  GPIO138  |  13  |     |  14  |    GND    |           |             |
|     486     |  SPIM1_MI  |  GPIO139  |  15  |     |  16  |  GPIO61   | DMIC1_SLK |     408     |
|             |            |   +3.3V   |  17  |     |  18  |  GPIO62   | DMIC1_DAT |     409     |
|     489     |  SPIM2_MO  |  GPIO142  |  19  |     |  20  |    GND    |           |             |
|     490     |  SPIM2_MI  |  GPIO143  |  21  |     |  22  |  GPIO17   |   SCL4    |     364     |
|     488     | SPIM2_CLK  |  GPIO141  |  23  |     |  24  |  GPIO140  | SPIM2_CSB |     487     |
|             |            |    GND    |  25  |     |  26  |   ADCIN   |           |             |
|     362     |    SCL3    |  GPIO15   |  27  |     |  28  |  GPIO14   |   SDA3    |     361     |
|     404     | I2SO2_MCLK |  GPIO57   |  29  |     |  30  |    GND    |           |             |
|     405     | I2SO2_BCK  |  GPIO58   |  31  |     |  32  |  GPIO16   |   SDA4    |     363     |
|     406     |  I2SO2_WS  |  GPIO59   |  33  |     |  34  |    GND    |           |             |
|     407     |  I2SO2_D0  |  GPIO60   |  35  |     |  36  |  GPIO47   | I2SIN_BCK |     394     |
|     393     | I2SIN_MCK  |  GPIO46   |  37  |     |  38  |  GPIO48   | I2SIN_WS  |     395     |
|             |            |    GND    |  39  |     |  40  |  GPIO49   | I2SIN_D0  |     396     |
