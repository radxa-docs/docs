---
sidebar_position: 4
---

# Hardware interface description

## Interface overview

![NIO 12L Overview](/img/nio/nio12l/nio-12l-v131-overview.webp)

## Interface details

### SoC

The SoC is Mediatek Genio 1200 SoC (MT8395).

### RAM

NIO 12L is equipped with LPDDR4X。

### UFS

NIO 12L is equipped with UFS2.1。

### Power supply

The power supply port of NIO 12L is a Type-C DC port, which only supports 5V input.
It is recommended to use a minimum 5V/3A power adapter. Most mobile phone chargers will suffice.

:::tip
Radxa recommends [Radxa Power PD30W](../../../accessories/pd_30w).
:::

### Button

NIO 12L has 3 buttons: Power button, Download button and Home button.

- Power button
  - Used to power on and off the device.
- Download button
  - Used to boot the device into download mode.
- Home button
  - User-defined button.

### LED

- Power LED (green)
  - When the power adapter is plugged in, the green power LED will be on. Not controlled by software.
- System status LED (blue)
  - The status LED can be controlled by software. It can be controlled by the GPIO_07 pin.
- User LED (red)
  - The user LED can be controlled by software. It can be controlled by the GPIO_06 pin.

### HDMI TX

NIO 12L is equipped with an HDMI connector for HDMI output. The maximum resolution supported is 4K@P60Hz. It also supports HDMI CEC function.

### HDMI RX

NIO 12L is equipped with an HDMI connector for HDMI input. The maximum resolution supported is 4K@P60Hz.

### MIPI DSI

NIO 12L provides one MIPI DSI port.
Utilizes a 39-pin, 0.3 mm pitch, gold-plated connector, model FH35C-39S-0.3SHW(50).

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

NIO 12L provides two MIPI CSI ports.
Utilizes a 31-pin, 0.3 mm pitch, gold-plated connector, model FH35C-31S-0.3SHW(50).

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

### Ethernet Port

NIO 12L provides Ethernet interface to Gigabit Ethernet.

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

### Wireless Module

NIO 12L is equipped with the MT7921 wireless module for Wi-Fi6 / BT 5.2. When using it, you need to attach three antennas.

### USB

NIO 12L provides 4 Type-A USB3.0 host ports.
It also provides a Type-C port to support USB host/device and DP display.

### Headphone

NIO 12L headphones support audio output and input.

### Speaker

Supports connecting to speakers. Needs to attach components on the board to use.

### 40-PIN GPIO Header

#### GPIO voltage

The high level voltage of all GPIOs is 3.3V.

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
