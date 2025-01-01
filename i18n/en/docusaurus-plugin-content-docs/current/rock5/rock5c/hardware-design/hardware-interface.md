---
sidebar_position: 1
---

# Hardware interface description

## Chip block diagram

<Tabs queryString="target">
  <TabItem value="rk3588s2" label="RK3588S2">
  <img src="/img/rock5c/rk3588s2_blockdiagram.webp" alt="rock 5c overview" width="700" />
  </TabItem>
  <TabItem value="rk3582" label="RK3582">
  <img src="/img/rock5c/rk3582_blockdiagram.webp" alt="rock 5c lite overview" width="700" />
  </TabItem>
</Tabs>

## System block diagram

<img src="/img/rock5c/rock-5c-system-block-diagram.webp" alt="rock 5c system diagram" width="700" />

## Physical photographs

<img src="/img/rock5c/rock-5c-overview-new.webp" alt="rock 5c new overview" width="700" />

## Interface overview

<Tabs queryString="target">

  <TabItem value="rock-5c" label="ROCK 5C">
  <img src="/img/rock5c/rock-5c-overview.webp" alt="rock 5c overview" width="700" />
  </TabItem>

  <TabItem value="rock-5c-lite" label="ROCK 5C Lite">
  <img src="/img/rock5c/rock-5c-lite-overview.webp" alt="rock 5c lite overview" width="700" />
  </TabItem>

</Tabs>

- 1x USB3.0 Host
- 1x USB3.0 OTG
- 2x USB2.0 Host
- 1x 4lane MIPI CSI
- 1x 4lane MIPI DSI
- 1x FPC Pcie 1lane
- 1x TF Card Slot
- 1x Emmc Socket
- 1x Headphone Jack
- 1x HDMI
- 1x Gigabit Ethernet
- 1x 40 PIN IO
- 1x Fan Header
- 2x LED Light
- 1x TypeC Power Input
- 1x Maskrom Key (reserve)
- 1x Recovery Key (reserve)
- 1x Pwrkey/Gnd/5v Header (reserve)
- 1x RTC (reserve)
- 1x Poe Header
- 1x Power Key

## Interface details

### Power connector

Power adapter with fixed voltage in 5V range on the USB Type-C port

### FAN Header

| Pin |  Name   | Pin |  Name   |
| :-: | :-----: | :-: | :-----: |
|  1  | FAN-PWM |  2  | VCC_5V0 |
|  3  |   GND   |  4  |   GND   |

### Ethernet Port

Provides Ethernet interface to Gigabit Ethernet.

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

### 40 PIN GPIO Header

#### GPIO voltage

| GPIO      | Voltage | Max Voltage |
| --------- | ------- | ----------- |
| All GPIO  | 3.3V    | 3.63V       |
| SARADC_IN | 1.8V    | 1.98V       |

#### GPIO Pinout

ROCK 5C provides a 40pin GPIO socket, which is compatible with most sensor applications on the market.
**Tips: The actual compatibility is subject to usage.**

<div className='gpio_style' style={{ overflow :"auto"}}>

| GPIO number |  Function7   |  Function6   |  Function5   |  Function4  |  Function3  |   Function2   |  Function1  |               Pin#               |              Pin#               | Function1 |                 Function2                 |  Function3  | Function4  |  Function5   |  Function6   |  Function7   | GPIO number |
| :---------: | :----------: | :----------: | :----------: | :---------: | :---------: | :-----------: | :---------: | :------------------------------: | :-----------------------------: | :-------: | :---------------------------------------: | :---------: | :--------: | :----------: | :----------: | :----------: | :---------: |
|             |              |              |              |             |             |               |    +3.3V    | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |                                           |             |            |              |              |              |             |
|     63      |              |              |              | PWM15_IR_M3 | I2C8_SDA_M2 | UART1_CTSN_M1 |  GPIO1_D7   |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |                                           |             |            |              |              |              |             |
|     62      |              |              |              |  PWM14_M2   | I2C8_SCL_M2 | UART1_RTSN_M1 |  GPIO1_D6   |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |                                           |             |            |              |              |              |             |
|     43      |              |              |              |             |             |  UART4_TX_M2  |  GPIO1_B3   |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_B5  | <div className='orange'>UART2_TX_M0</div> | I2C1_SCL_M0 |            |              | I2S1_MCLK_M1 |              |     13      |
|             |              |              |              |             |             |               |     GND     |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_B6  | <div className='orange'>UART2_RX_M0</div> | I2C1_SDA_M0 |            |              | I2S1_SCLK_M1 |              |     14      |
|     139     |              | I2S1_SDO2_M0 |              | PWM15_IR_M1 | I2C7_SDA_M3 | UART8_CTSN_M0 |  GPIO4_B3   | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO4_A1  |               UART9_CTSN_M1               |             |            |              | I2S1_SCLK_M0 | SPI0_MOSI_M1 |     129     |
|     138     | SPI0_CS0_M1  | I2S1_SDO1_M0 |              |  PWM14_M1   | I2C7_SCL_M3 | UART8_RTSN_M0 |  GPIO4_B2   | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |                                           |             |            |              |              |              |             |
|     140     |              | I2S1_SDO3_M0 | SPDIF0_TX_M1 | PWM11_IR_M1 |             |  UART9_TX_M1  |  GPIO4_B4   | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO1_A5  |                                           |             |            |              |              | SPI2_MOSI_M0 |     37      |
|             |              |              |              |             |             |               |    +3.3V    | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO1_B0  |                                           |             |            |              |              | SPI2_CS1_M0  |     40      |
|     33      | SPI4_MOSI_M2 |              |              |             | I2C2_SCL_M4 |  UART6_TX_M1  |  GPIO1_A1   | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |                                           |             |            |              |              |              |             |
|     32      | SPI4_MISO_M2 |              |              |             | I2C2_SDA_M4 |  UART6_RX_M1  |  GPIO1_A0   | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO1_B5  |                UART7_TX_M2                |             |            |              |              | SPI0_CS1_M2  |     45      |
|     34      | SPI4_CLK_M2  |              |              |   PWM0_M2   | I2C4_SDA_M3 | UART6_RTSN_M1 |  GPIO1_A2   | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO1_A3  |               UART6_CTSN_M1               | I2C4_SCL_M3 |  PWM1_M2   |              |              | SPI4_CS0_M2  |     35      |
|             |              |              |              |             |             |               |     GND     | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO1_A4  |                                           |             |            |              |              | SPI2_MISO_M0 |     36      |
|     23      | SPI0_MISO_M0 | I2S1_SDI2_M1 |              |   PWM6_M0   | I2C6_SDA_M0 | UART1_RTSN_M2 |  GPIO0_C7   |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO0_D0  |               UART1_CTSN_M2               | I2C6_SCL_M0 | PWM7_IR_M0 |              | I2S1_SDI3_M1 | SPI3_MISO_M2 |     24      |
|     42      | SPI0_MOSI_M2 |              |              |             |             |  UART4_RX_M2  |  GPIO1_B2   | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |                                           |             |            |              |              |              |             |
|     41      | SPI0_MISO_M2 |              |              |             |             |               |  GPIO1_B1   | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO4_B0  |                UART8_TX_M0                | I2C6_SDA_M3 |            |              | I2S1_SDI3_M0 | SPI2_CS1_M1  |     136     |
|     44      | SPI0_CS0_M2  |              |              |             |             |  UART7_RX_M2  |  GPIO1_B4   | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |                                           |             |            |              |              |              |             |
|     128     | SPI0_MISO_M1 | I2S1_MCLK_M0 |              |             |             | UART9_RTSN_M1 |  GPIO4_A0   | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO4_A2  |                                           |             |            |              | I2S1_LRCK_M0 | SPI0_CLK_M1  |     130     |
|             |              |              |              |             |             |               | SARADC_VIN2 | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO4_A5  |                UART3_TX_M2                | I2C3_SDA_M2 |            |              | I2S1_SDI0_M0 |              |     133     |
|             |              |              |              |             |             |               |     GND     | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO4_B1  |                UART8_RX_M0                | I2C6_SCL_M3 |            | SPDIF1_TX_M1 | I2S1_SDO0_M0 | SPI0_CS1_M1  |     137     |

</div>

#### USB Function Configuration on 40-Pin

On the ROCK 5C's 40-Pin interface, the following pins can be configured for USB 2.0:

- USB4_DM: Pin number 28, resistor location R104.
- USB4_DP: Pin number 27, resistor location R106.

By default, Pin-27 can be configured in software for functions such as GPIO0_C7 (see 40-Pin Pinout), while the USB4_DP signal is not activated on the hardware. Pin-28 can be configured in software for functions such as GPIO0_D0 (see 40-Pin Pinout), and the USB4_DM signal is also not activated on the hardware. To change these pins to USB functions, please follow the steps below to modify the reserved resistors:

- **Remove the 0-ohm resistors at R169 and R170.**
- **Solder 0-ohm resistors at R104 and R106.**

:::tip
The schematic and resistor locations can be viewed and downloaded from the hardware documentation.[Hardware Documentation Download](../download)
:::

:::caution [Operation Note]

This procedure requires soldering skills, and it is recommended that it be performed by an experienced technician.

:::

### HDMI

Equipped with a full-size HDMI connector that supports resolutions up to 8K.

### USB

Provides two USB3.0 ports and two USB2.0 ports, upper USB3.0 port with OTG function.

- USB2.0

| Pin |      Name       | Pin |     Name     |
| :-: | :-------------: | :-: | :----------: |
|  1  | VCC5V0_USB_HOST |  2  | USB2_HOST1DM |
|  3  |  USB2_HOST1DP   |  4  |     GND      |
|  5  | VCC5V0_USB_HOST |  6  | USB2_HOST2DM |
|  7  |  USB2_HOST2DP   |  8  |     GND      |
|  9  |       GND       | 10  |     GND      |
| 11  |       GND       |     |              |

- USB3.0

| Pin |      Name       | Pin |      Name       |
| :-: | :-------------: | :-: | :-------------: |
|  1  | VCC5V0_USB_OTG0 |  2  |   USB3_OTG0DM   |
|  3  |   USB3_OTG0DP   |  4  |       GND       |
|  5  | USB3_OTG0SSRXN  |  6  | USB3_OTG0SSRXP  |
|  7  |       GND       |  8  | USB3_OTG0SSTXN  |
|  9  | USB3_OTG0SSTXP  | 10  |       GND       |
| 11  |       GND       | 12  | VCC5V0_USB_HOST |
| 13  |  USB3_HOST1DM   | 14  |  USB3_HOST1DP   |
| 15  |       GND       | 16  | USB3_HOST1SSRXN |
| 17  | USB3_HOST1SSRXP | 18  |       GND       |
| 19  | USB3_HOST1SSTXN | 20  | USB3_HOST1SSTXP |
| 21  |       GND       | 22  |       GND       |

### MIPI CSI

MIPI camera support. Utilizes a 31-pin, 0.3 mm pitch, gold-plated connector, model FH35C-31S-0.3SHW(50).

<img src="/img/rock5c/rock-5c-csi-interface.webp" alt="rock 5c csi" width="500"/>

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

Refer [Camera accessories](../accessories/camera)

### MIPI DSI

MIPI screen support. Utilizes a 39-pin, 0.3 mm pitch, gold-plated connector, model FH35C-39S-0.3SHW(50).

<img src="/img/rock5c/rock-5c-dsi-interface.webp" alt="rock 5c dsi" width="500"/>

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
|   39   |   LED+   |         |

</div>

Refer [Display accessories](../accessories/display)

### MicroSD

Can be used as a system boot disk or as a storage medium.

| Pin |    Name     | Pin |    Name    |
| :-: | :---------: | :-: | :--------: |
|  1  |  SDMMC_D2   |  2  |  SDMMC_D3  |
|  3  |  SDMMC_CMD  |  4  | VCC_3V3_S3 |
|  5  |  SDMMC_CLK  |  6  |    GND     |
|  7  |  SDMMC_D0   |  8  |  SDMMC_D1  |
|  9  | SDMMC_DET_L | 10  |    GND     |
| 11  |     GND     | 12  |    GND     |
| 13  |     GND     | 14  |    GND     |
| 15  |     GND     | 16  |    GND     |
| 17  |     GND     | 18  |    GND     |

### eMMC Socket && SPI Flash Connector

Supports emmc storage devices for use as system boot disks or as storage media.

| Pin |       Name        | Pin |      Name       |
| :-: | :---------------: | :-: | :-------------: |
|  1  |        GND        |  2  |     eMMC_D5     |
|  3  |        GND        |  4  |     eMMC_D4     |
|  5  |        GND        |  6  | eMMC_D0/FSPI_D0 |
|  7  |        GND        |  8  |   eMMC_CLKOUT   |
|  9  |        GND        | 10  | eMMC_D3/FSPI_D3 |
| 11  |        GND        | 12  |   VCCIO_FLASH   |
| 13  |        GND        | 14  |       GND       |
| 15  | eMMC_DATA_STROBE  | 16  |       GND       |
| 17  |        GND        | 18  |       GND       |
| 19  |        GND        | 20  |       GND       |
| 21  |        GND        | 22  |       GND       |
| 23  |        GND        | 24  |       GND       |
| 25  | eMMC_CMD/FSPI_CLK | 26  |       GND       |
| 27  |  eMMC_D2/FSPI_D2  | 28  |       GND       |
| 29  |  eMMC_D1/FSPI_D1  | 30  |       GND       |
| 31  |      eMMC_D7      | 32  |       GND       |
| 33  | eMMC_D6/FSPI_CS0  | 34  |       GND       |
| 35  |        GND        | 36  |       GND       |
| 37  |        GND        | 38  |       GND       |
| 39  |        GND        | 40  |       GND       |
| 41  |        GND        | 42  |       GND       |
| 43  |        GND        | 44  |       GND       |
| 45  |        GND        | 46  |       GND       |
| 47  |        GND        | 48  |       GND       |
| 49  |        GND        | 50  |       GND       |
| 51  |        GND        | 52  |       GND       |
| 53  |        GND        | 54  |       GND       |
| 55  |        GND        | 56  |       GND       |
| 57  |        GND        | 58  |       GND       |
| 59  |        GND        | 60  |       GND       |
| 61  |        GND        | 62  |       GND       |
| 63  |        GND        | 64  |       GND       |

:::tip

eMMC and SPI Flash are mutually exclusive, the connector can only connect to one of eMMC or SPI Flash at a time

:::

### Debug Serial Port

For system debugging, underlying log message output
