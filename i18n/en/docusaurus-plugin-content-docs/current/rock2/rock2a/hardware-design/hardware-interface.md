---
sidebar_position: 1
---

# Hardware Overview

## Chip Block Diagram

<img src="/img/rock2a/rock-2a-chip-diagram.webp" alt="rk3528A chip diagram" width="700" />

## System Block Diagram

<img src="/img/rock2a/rock-2a-system-diagram.webp" width="800" alt="rock 2a pack" />

## Hardware Overview

<img src="/img/rock2a/rock-2a-hardware-overview.webp" width="800" alt="rock 2a pack" />

Here are the detailed pinouts for each hardware interface.

### microSD Card Slot

| PIN | Name        |
| --- | ----------- |
| 1   | SDMMC_D2    |
| 2   | SDMMC_D3    |
| 3   | SDMMC_CMD   |
| 4   | 3V3_SD      |
| 5   | SDMMC_CLK   |
| 6   | GND         |
| 7   | SDMMC_D0    |
| 8   | SDMMC_D1    |
| 9   | SDMMC_DET_L |
| 10  | GND         |

### Gigabit Ethernet

| Pin |    Name    | Pin |    Name    |
| :-: | :--------: | :-: | :--------: |
|  1  | PHY1_MDI0+ |  2  | PHY1_MDI0- |
|  3  | PHY1_MDI1+ |  4  |    GND     |
|  5  |    GND     |  6  | PHY1_MDI1- |
|  7  | PHY1_MDI2+ |  8  | PHY1_MDI2- |
|  9  | PHY1_MDI3+ | 10  | PHY1_MDI3- |
| 11  |    TR0     | 12  |    TR1     |
| 13  |    TR2     | 14  |    TR3     |
| 15  |  PHY_LED1  | 16  |    GND     |
| 17  | VCC3V3_PHY | 18  |  PHY_LED2  |
| 19  |    GND     | 20  |    GND     |

### HDMI

| Pin |       Name       | Pin |       Name       |
| :-: | :--------------: | :-: | :--------------: |
|  1  |  HDMI_TX2P_PORT  |  2  |       GND        |
|  3  |  HDMI_TX2N_PORT  |  4  |  HDMI_TX1P_PORT  |
|  5  |       GND        |  6  |  HDMI_TX1N_PORT  |
|  7  |  HDMI_TX0P_PORT  |  8  |       GND        |
|  9  |  HDMI_TX0N_PORT  | 10  |  HDMI_CLKP_PORT  |
| 11  |       GND        | 12  |  HDMI_CLKN_PORT  |
| 13  | HDMI_TX_CEC_PORT | 14  |        X         |
| 15  | HDMI_TX_SCL_PORT | 16  | HDMI_TX_SDA_PORT |
| 17  |       GND        | 18  |  VCC5V_HDMI_TX   |
| 19  | HDMI_TX_HPD_PORT | 20  |       GND        |
| 21  |       GND        | 22  |       GND        |
| 23  |       GND        |

### WIFI 6 & BT 5.4

| Pin |       Name       | Pin |      Name      |
| :-: | :--------------: | :-: | :------------: |
|  1  |  HOST_WAKE_BT_H  |  2  |      GND       |
|  3  |     UART1_TX     |  4  |      GND       |
|  5  |       GND        |  6  |      GND       |
|  7  |       GND        |  8  |    USB4_DP     |
|  9  |     USB4_DM      | 10  |      GND       |
| 11  |     UART1_RX     | 12  |      GND       |
| 13  |       GND        | 14  |    UART0_RX    |
| 15  |     UART0_TX     | 16  |      GND       |
| 17  |       GND        | 18  |      GND       |
| 19  |       GND        | 20  |      GND       |
| 21  |       GND        | 22  |      GND       |
| 23  |       GND        | 24  |    VCC_WIFI    |
| 25  |       GND        | 26  |      GND       |
| 27  |       GND        | 28  |      GND       |
| 29  |       GND        | 30  |      GND       |
| 31  |       GND        | 32  |      GND       |
| 33  |     VCC_WIFI     | 34  |    VCC_WIFI    |
| 35  |       GND        | 36  |      GND       |
| 37  |    WL_5G_ANT     | 38  |   WL_24G_ANT   |
| 39  |       GND        | 40  |      GND       |
| 41  |       GND        | 42  |      GND       |
| 43  |       GND        | 44  |      GND       |
| 45  |       GND        | 46  | WIFI_REG_ON_H  |
| 47  | WIFI_WAKE_HOST_H | 48  | BT_WAKE_HOST_H |
| 49  |       GND        | 50  |      GND       |
| 51  |       GND        | 52  |      GND       |

### FPC Connector with PCIE 2.0

| Pin |       Name        | Pin |       Name       |
| :-: | :---------------: | :-: | :--------------: |
|  1  |    VCC5V0_SYS     |  2  |    VCC5V0_SYS    |
|  3  |        GND        |  4  |  PCIE20_REFCLKP  |
|  5  |  PCIE20_REFCLKN   |  6  |       GND        |
|  7  |    PCIE20_RXP     |  8  |    PCIE20_RXN    |
|  9  |        GND        | 10  |    PCIE20_TXP    |
| 11  |    PCIE20_TXN     | 12  |       GND        |
| 13  |      PCIE_EN      | 14  | PCIE20_WAKEn_M1  |
| 15  | PCIE20_CLKREQn_M1 | 16  | PCIE20_PERSTn_M1 |

### AV Out

| Pin | Name | Pin |   Name   |
| :-: | :--: | :-: | :------: |
|  1  |  X   |  2  | CVBS_OUT |
|  3  | LOUT |  4  |    X     |
|  5  | GND  |  6  |   ROUT   |
|  7  |  X   |  8  |    X     |

### USB 3.0 OTG/HOST & USB 2.0 HOST

| Pin |        Name        | Pin |       Name       |
| :-: | :----------------: | :-: | :--------------: |
|  1  | USB30_OTG0_VBUSDET |  2  |  USB20_OTG0_DM   |
|  3  |   USB20_OTG0_DP    |  4  |       GND        |
|  5  |  USB30_OTG0_SSRXN  |  6  | USB30_OTG0_SSRXP |
|  7  |        GND         |  8  | USB30_OTG0_SSTXN |
|  9  |  USB30_OTG0_SSTXP  | 10  |       GND        |
| 11  |        GND         | 12  |   VCC5V0_USB20   |
| 13  |      USB1_DM       | 14  |     USB1_DP      |
| 15  |        GND         | 16  |        X         |
| 17  |         X          | 18  |       GND        |
| 19  |         X          | 20  |        X         |
| 21  |        GND         | 22  |       GND        |

### 2 X USB 2.0 HOST

| Pin |     Name     | Pin |  Name   |
| :-: | :----------: | :-: | :-----: |
|  1  | VCC5V0_USB20 |  2  | USB2_DM |
|  3  |   USB2_DP    |  4  |   GND   |
|  5  | VCC5V0_USB20 |  6  | USB3_DM |
|  7  |   USB3_DP    |  8  |   GND   |
|  9  |     GND      | 10  |   GND   |
| 11  |     GND      | 12  |   GND   |

### 40-Pin GPIO Header

- GPIO Voltage

| GPIO       | Voltage | Maximum |
| ---------- | ------- | ------- |
| All GPIOs  | 3.3V    | 3.3V    |
| SARADC_IN3 | 1.8V    | 1.8V    |

- GPIO Pinout

ROCK 2A provides a 40-pin GPIO header, compatible with most sensors available on the market.

**_Note:_ Actual compatibility may vary based on use.**

- ROCK 2A has a 40-pin expansion header. Each pin is color-coded.

<div className='gpio_style' style={{ overflow :"auto"}} >

| GPIO number |  Function4  |   Function3   |  Function2   | Function1  |               Pin#               |              Pin#               | Function1 |   Function2   |  Function3  |                 Function4                 | GPIO number |
| :---------: | :---------: | :-----------: | :----------: | :--------: | :------------------------------: | :-----------------------------: | :-------: | :-----------: | :---------: | :---------------------------------------: | :---------: |
|             |             |               |              |   +3.3V    | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |               |             |                                           |             |
|     128     |             |  I2C0_SDA_M1  | SPIDIF_TX_M0 |  GPIO4_A0  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |               |             |                                           |             |
|     129     |             |               | I2C0_SCL_M1  |  GPIO4_A1  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |               |             |                                           |             |
|     134     |             |  UART1_TX_M0  |  I2S1_LRCK   |  GPIO4_A6  |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO4_D0  |               |             | <div className='orange'>UART2_TX_M0</div> |     152     |
|             |             |               |              |    GND     |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO4_C7  |               |             | <div className='orange'>UART2_RX_M0</div> |     151     |
|     143     |             |    PWM4_M0    | UART3_RX_M1  |  GPIO4_B7  | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO1_B5  | I2S0_SCLK_M1  |             |                                           |     45      |
|     144     |             |    PWM5_M0    | UART3_TX_M1  |  GPIO4_C0  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |               |             |                                           |             |
|     150     |   PWM3_M0   |  UART1_RX_M1  | I2C1_SDA_M1  |  GPIO4_C6  | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO4_B0  |   I2S1_SDO1   | UART3_RX_M0 |                                           |     136     |
|             |             |               |              |   +3.3V    | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO4_B1  |   I2S1_SDO2   |  PDM_SDI1   |                UART3_TX_M0                |     137     |
|     138     |  SPI0_MOSI  |   PDM_SDI0    |  I2S1_SDO3   |  GPIO4_B2  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |               |             |                                           |             |
|     139     |  SPI0_MISO  |   PDM_SDI2    |  I2S1_SDI1   |  GPIO4_B3  | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO1_B2  | UART2_RTSN_M1 | I2C5_SCL_M0 |                UART7_TX_M1                |     42      |
|     140     |             |   SPI0_CLK    |  I2S1_SDI0   |  GPIO4_B4  | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO4_B6  |   SPI0_CSN0   |             |                                           |     142     |
|             |             |               |              |    GND     | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO4_C1  |   PDM_SDI3    |  SPI0_CSN1  |                  PWM6_M0                  |     145     |
|     130     | I2C1_SDA_M0 |  UART3_RTSN   |  I2S1_SDI3   |  GPIO4_A2  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO4_A3  |   I2S1_SDI2   | UART3_CTSN  |                I2C1_SCL_M0                |     131     |
|     141     |             |               |   PDM_CLK0   |  GPIO4_B5  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |               |             |                                           |             |
|     40      |             | UART7_CTSN_M1 | UART2_RX_M1  |  GPIO1_B0  | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO4_C3  |  I2C0_SDA_M0  |   PWM0_M0   |                                           |     147     |
|     41      |             | UART7_RTSN_M1 | UART2_TX_M1  |  GPIO1_B1  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |               |             |                                           |             |
|     46      |             |   SPI1_CLK    | I2S0_LRCK_M1 |  GPIO1_B6  | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO1_B4  | I2S0_MCLK_M1  |             |                                           |     44      |
|             |             |               |              | SARADC_IN3 | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO1_B7  |  I2S0_SDI_M1  |  SPI1_MOSI  |                                           |     47      |
|             |             |               |              |    GND     | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO1_C0  |  I2S0_SDO_M1  |  SPI1_MISO  |                                           |     48      |

</div>
