---
sidebar_position: 1
---

# 硬件接口说明

## 芯片框图

<img src="/img/rock5b/rk3588-block-diagram.webp" alt="rk3588 system diagram" width="700" />

## 系统框图

<img src="/img/rock5a/rock5a-system-block-diagram.webp" width="700" alt="rock 5a system block diagram" />

## 实物照片

<img src="/img/rock5a/rock5a-real.webp" width="800" alt="rock 5a real" />

## 接口详情

### eMMC && SPI Flash Connector

| Pin |       Name        | Pin |      Name       |
| :-: | :---------------: | :-: | :-------------: |
|  1  |     eMMC_DTE      |  2  |     eMMC_D5     |
|  3  |        GND        |  4  |     eMMC_D4     |
|  5  |        GND        |  6  | eMMC_D0/FSPI_D0 |
|  7  |        GND        |  8  |   eMMC_CLKOUT   |
|  9  |        GND        | 10  | eMMC_D3/FSPI_D3 |
| 11  |        GND        | 12  |   VCCIO_FLASH   |
| 13  |        GND        | 14  |       GND       |
| 15  | eMMC_DATA_STROBE  | 16  |       GND       |
| 17  |        GND        | 18  |       GND       |
| 19  |        GND        | 20  |   VCCIO_FLASH   |
| 21  |    VCCIO_FLASH    | 22  |   VCC_3V3_S0    |
| 23  |    VCC_3V3_S0     | 24  |       GND       |
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
| 51  |                   | 52  |       GND       |
| 53  |                   | 54  |       GND       |
| 55  |                   | 56  |       GND       |
| 57  |                   | 58  |       GND       |
| 59  |                   | 60  |       GND       |
| 61  |                   | 62  |       GND       |
| 63  |                   | 64  |       GND       |

### FAN Header

| Pin |  Name   | Pin |  Name   |
| :-: | :-----: | :-: | :-----: |
|  1  | FAN-PWM |  2  | VCC_5V0 |
|  3  |   GND   |  4  |   GND   |

### GPIO

- GPIO 电压

<Tabs queryString="gpio_revision">
<TabItem value="x1_2" label="x1.2/v1.1">

<div className='voltage'>

| GPIO       | 电压 | 最高  |
| ---------- | ---- | ----- |
| 所有的GPIO | 3.3V | 3.63V |
| SARADC_IN2 | 1.8V | 1.8V  |

</div>
</TabItem>

<TabItem value="x1_1" label="x1.1">

<div className='voltage'>

| GPIO       | 电压 | 最高  |
| ---------- | ---- | ----- |
| 所有的GPIO | 3.3V | 3.63V |
| SARADC_IN5 | 1.8V | 1.8V  |

</div>
</TabItem>

</Tabs>

- GPIO Pinout

ROCK 5A 提供了一个40pin针脚的GPIO座子，兼容于市面上大部分传感器的应用。

<Tabs queryString="gpio_revision">

<TabItem value="x1_2" label="x1.2/v1.1">

<div className='gpio_style'>

| GPIO number |  Function7   |  Function6   |  Function5   |  Function4  |  Function3  |   Function2   |  Function1  |               Pin#               |              Pin#               | Function1 |                 Function2                 |  Function3  | Function4  |  Function5   |  Function6   |  Function7   | GPIO number |
| :---------: | :----------: | :----------: | :----------: | :---------: | :---------: | :-----------: | :---------: | :------------------------------: | :-----------------------------: | :-------: | :---------------------------------------: | :---------: | :--------: | :----------: | :----------: | :----------: | :---------: |
|             |              |              |              |             |             |               |    +3.3V    | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |                                           |             |            |              |              |              |             |
|     63      |              |              |              | PWM15_IR_M3 | I2C8_SDA_M2 | UART1_CTSN_M1 |  GPIO1_D7   |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |                                           |             |            |              |              |              |             |
|     62      |              |              |              |  PWM14_M2   | I2C8_SCL_M2 | UART1_RTSN_M1 |  GPIO1_D6   |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |                                           |             |            |              |              |              |             |
|     43      |              |              |              |             |             |  UART4_TX_M2  |  GPIO1_B3   |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_B5  | <div className='orange'>UART2_TX_M0</div> | I2C1_SCL_M0 |            |              | I2S1_MCLK_M1 |              |     13      |
|             |              |              |              |             |             |               |     GND     |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_B6  | <div className='orange'>UART2_RX_M0</div> | I2C1_SDA_M0 |            |              | I2S1_SCLK_M1 |              |     14      |
|     139     |              | I2S1_SDO2_M0 |  CAN1_TX_M1  | PWM15_IR_M1 | I2C7_SDA_M3 | UART8_CTSN_M0 |  GPIO4_B3   | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO4_A1  |               UART9_CTSN_M1               |             |            |              | I2S1_SCLK_M0 | SPI0_MOSI_M1 |     129     |
|     138     | SPI0_CS0_M1  | I2S1_SDO1_M0 |  CAN1_RX_M1  |  PWM14_M1   | I2C7_SCL_M3 | UART8_RTSN_M0 |  GPIO4_B2   | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |                                           |             |            |              |              |              |             |
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
</TabItem>

<TabItem value="x1_1" label="x1.1">

<div className='gpio_style'>

**_提示:_ 实际兼容情况以使用为准。**

| GPIO number | Function6 | Function5 | Function4 | Function3 | Function2 | Function1 |               Pin#               |              Pin#               |  Function1  |                 Function2                 | Function3 | Function4 | Function5 | Function6 | Function7 | GPIO number |
| :---------: | --------- | --------- | :-------: | :-------: | :-------: | :-------: | :------------------------------: | :-----------------------------: | :---------: | :---------------------------------------: | :-------: | :-------: | --------- | --------- | --------- | :---------: |
|             |           |           |           |           |           |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |    +5.0V    |                                           |           |           |           |           |           |             |
|     32      |           |           | UART6_RX  | SPI4_MISO | I2C2_SDA  | GPIO1_A0  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |    +5.0V    |                                           |           |           |           |           |           |             |
|     33      |           |           | UART6_TX  | SPI4_MOSI | I2C2_SCL  | GPIO1_A1  |  <div className='green'>5</div>  | <div className='black'>6</div>  |     GND     |                                           |           |           |           |           |           |             |
|     43      |           |           | PDM1_CLK1 | UART4_TX  | SPI0_CLK  | GPIO1_B3  |  <div className='green'>7</div>  | <div className='green'>8</div>  |  GPIO0_B5   | <div className='orange'>UART2_TX_M0</div> | I2C1_SCL  | I2S1_MCLK |           |           |           |     13      |
|             |           |           |           |           |           |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> |  GPIO0_B6   | <div className='orange'>UART2_RX_M0</div> | I2C1_SDA  | I2S1_SCLK |           |           |           |     14      |
|     34      |           | PWM0      | UART6_RTS | SPI4_CLK  | I2C4_SDA  | GPIO1_A2  | <div className='green'>11</div>  | <div className='green'>12</div> |  GPIO4_A1   |                 SPI0_MOSI                 | UART9_CTS | I2S1_SCLK |           |           |           |     129     |
|     35      |           | PWM1      | UART6_CTS | SPI4_CS0  | I2C4_SCL  | GPIO1_A3  | <div className='green'>13</div>  | <div className='black'>14</div> |     GND     |                                           |           |           |           |           |           |             |
|     140     |           | I2S1_SDO3 | SPDIF0_TX |   PWM11   | UART9_TX  | GPIO4_B4  | <div className='green'>15</div>  | <div className='green'>16</div> |  GPIO1_D6   |                 I2C8_SCL                  | UART1_RTS |   PWM14   |           |           |           |     62      |
|             |           |           |           |           |           |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> |  GPIO1_D7   |                 I2C8_SDA                  | UART1_CTS |   PWM15   |           |           |           |     63      |
|     37      |           |           |           |           | SPI2_MOSI | GPIO1_A5  | <div className='green'>19</div>  | <div className='black'>20</div> |     GND     |                                           |           |           |           |           |           |             |
|     36      |           |           |           |           | SPI2_MISO | GPIO1_A4  | <div className='green'>21</div>  | <div className='green'>22</div> |  GPIO1_B5   |                 SPI0_CS1                  | UART7_TX  |           |           |           |           |     45      |
|     38      |           |           |           |           | SPI2_CLK  | GPIO1_A6  | <div className='green'>23</div>  | <div className='green'>24</div> |  GPIO1_A7   |                 SPI2_CS0                  | PDM1_SDI0 |   PWM3    |           |           |           |     39      |
|             |           |           |           |           |           |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> | SARADC_VIN5 |                                           |           |           |           |           |           |             |
|     139     | CAN1_TX   | I2S1_SDO2 |   PWM15   | UART8_CTS | I2C7_SDA  | GPIO4_B3  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  |  GPIO4_B2   |                 I2C7_SCL                  | SPI0_CS0  | UART8_RTS | PWM14     | I2S1_SDO1 | CAN1_RX   |     138     |
|     42      |           |           | PDM1_SDI3 | UART4_RX  | SPI0_MOSI | GPIO1_B2  | <div className='green'>29</div>  | <div className='black'>30</div> |     GND     |                                           |           |           |           |           |           |             |
|     41      |           |           |           | PDM1_SDI2 | SPI0_MISO | GPIO1_B1  | <div className='green'>31</div>  | <div className='green'>32</div> |  GPIO4_B0   |                 I2C6_SDA                  | UART8_TX  | I2S1_SDI3 |           |           |           |     136     |
|     44      |           |           |           | PDM1_CLK0 | UART7_RX  | GPIO1_B4  | <div className='green'>33</div>  | <div className='black'>34</div> |     GND     |                                           |           |           |           |           |           |             |
|     128     |           |           | I2S1_MCLK | UART9_RTS | SPI0_MISO | GPIO4_A0  | <div className='green'>35</div>  | <div className='green'>36</div> |  GPIO4_A2   |                 SPI0_CLK                  | I2S1_LRCK |           |           |           |           |     130     |
|     40      |           |           |           | PDM1_SDI1 | SPI2_CS1  | GPIO1_B0  | <div className='green'>37</div>  | <div className='green'>38</div> |  GPIO4_A5   |                 I2C3_SDA                  | UART3_TX  | I2S1_SDI0 |           |           |           |     133     |
|             |           |           |           |           |           |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> |  GPIO4_B1   |                 I2C6_SCL                  | SPI0_CS1  | UART8_RX  | SPDIF1_TX | I2S1_SDO0 |           |     137     |

</div>
</TabItem>

</Tabs>

### Gigabit Ethernet

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
| 19  |     GND     | 20  |     GND     |

### Maskrom Button

| Pin |       Name       | Pin | Name |
| :-: | :--------------: | :-: | :--: |
|  1  | SARADC_VIN0_BOOT |  2  | GND  |

### MIPI CSI

| Pin |        Name        | Pin |        Name        |
| :-: | :----------------: | :-: | :----------------: |
|  1  |        GND         |  2  |  MIPI_CSI0_RX_D3N  |
|  3  |  MIPI_CSI0_RX_D3P  |  4  |        GND         |
|  5  |  MIPI_CSI0_RX_D2N  |  6  |  MIPI_CSI0_RX_D2P  |
|  7  |        GND         |  8  | MIPI_CSI0_RX_CLK1N |
|  9  | MIPI_CSI0_RX_CLK1P | 10  |        GND         |
| 11  |  MIPI_CSI0_RX_D1N  | 12  |  MIPI_CSI0_RX_D1P  |
| 13  |        GND         | 14  |  MIPI_CSI0_RX_D0N  |
| 15  |  MIPI_CSI0_RX_D0P  | 16  |        GND         |
| 17  | MIPI_CSI0_RX_CLK0N | 18  | MIPI_CSI0_RX_CLK0P |
| 19  |        GND         | 20  | MIPI_CAMERA2_CLK_1 |
| 21  |        GND         | 22  | MIPI_CAMERA1_CLK_1 |
| 23  |  MIPI_CAM1_PDN_H   | 24  |    I2C3_SCK_M0     |
| 25  |    I2C3_SDA_M0     | 26  |  MIPI_CAM0_PDN_H   |
| 27  |    MIPI_CAM_RST    | 28  |     VCC_3V3_S0     |
| 29  |     VCC_3V3_S0     | 30  |      VCC_5V0       |
| 31  |      VCC_5V0       |     |                    |

### MIPI CSI

| Pin |        Name        | Pin |        Name        |
| :-: | :----------------: | :-: | :----------------: |
|  1  |   VCC_LCD_MIPI_2   |  2  |     VCC_1V8_S0     |
|  3  |                    |  4  |    LCD_RESET_1     |
|  5  |                    |  6  |        GND         |
|  7  | MIPI_DPHY0_TX_D0N  |  8  | MIPI_DPHY0_TX_D0P  |
|  9  |        GND         | 10  | MIPI_DPHY0_TX_D1N  |
| 11  | MIPI_DPHY0_TX_D1P  | 12  |        GND         |
| 13  | MIPI_DPHY0_TX_CLKN | 14  | MIPI_DPHY0_TX_CLKP |
| 15  |        GND         | 16  | MIPI_DPHY0_TX_D2N  |
| 17  | MIPI_DPHY0_TX_D2P  | 18  |        GND         |
| 19  | MIPI_DPHY0_TX_D3N  | 20  | MIPI_DPHY0_TX_D3P  |
| 22  |        GND         | 22  |        GND         |
| 23  |     TP_RST_LCD     | 24  |       VCC_TP       |
| 25  |     TP_INT_LCD     | 26  |     TP_SDA_LCD     |
| 27  |     TP_SCL_LCD     | 28  |        GND         |
| 29  |        GND         | 30  |   VCC_LCD_MIPI_2   |
| 31  |   VCC_LCD_MIPI_2   | 32  |        GND         |
| 33  |        GND         | 34  |     VCC_LEDK2      |
| 35  |     VCC_LEDK2      | 36  |                    |
| 37  |                    | 38  |     VCC_LEDA2      |
| 39  |     VCC_LEDA2      | 40  |        GND         |
| 41  |        GND         |     |                    |

### PCIe E Key

| Pin |         Name          | Pin |         Name         |
| :-: | :-------------------: | :-: | :------------------: |
|  1  |          GND          |  2  |      VCC3V3_WF       |
|  3  |        USB3_DP        |  4  |      VCC3V3_WF       |
|  5  |        USB3_DM        |  6  |       WIFI_LED       |
|  7  |          GND          |  8  |          NC          |
|  9  |          NC           | 10  |          NC          |
| 11  |          NC           | 12  |          NC          |
| 13  |          NC           | 14  |          NC          |
| 15  |          NC           | 16  |          NC          |
| 17  |          NC           | 18  |         GND          |
| 19  |          NC           | 20  |          NC          |
| 21  |          NC           | 22  |          NC          |
| 23  |          NC           | 24  |          NC          |
|     |                       |     |                      |
|     |                       |     |                      |
| 33  |          NC           | 32  |          NC          |
| 35  |     PCIE20_0_TXP      | 34  |          NC          |
| 37  |     PCIE20_0_TXN      | 36  |          NC          |
| 39  |          GND          | 38  |          NC          |
| 41  |     PCIE20_0_RXP      | 40  |          NC          |
| 43  |     PCIE20_0_RXN      | 42  |     BT_REG_ON_H      |
| 45  |          GND          | 44  |          NC          |
| 47  |   PCIE20_0_REFCLKP    | 46  |          NC          |
| 49  |   PCIE20_0_REFCLKN    | 48  |          NC          |
| 51  |          GND          | 50  |  WIFIBT_32KIN_1T1R   |
| 53  | PCIE20x1_2_CLKREQn_M0 | 52  | PCIE20x1_2_PERSTn_M0 |
| 55  |  PCIE20x1_2_WAKEn_M0  | 54  |    HOST_WAKE_BT_H    |
| 57  |          GND          | 56  |     BT_REG_ON_H      |
| 59  |          NC           | 58  |     I2C2_SDA_M0      |
| 61  |          NC           | 60  |     I2C2_SCL_M0      |
| 63  |          GND          | 62  |          NC          |
| 65  |          NC           | 64  |          NC          |
| 67  |          NC           | 66  |          NC          |
| 69  |          GND          | 68  |          NC          |
| 71  |          NC           | 70  |    HOST_WAKE_BT_H    |
| 73  |          NC           | 72  |      VCC3V3_WF       |
| 75  |          GND          | 74  |      VCC3V3_WF       |

### POE

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
| 17  | PHY1_Y_LED+ | 18  | PHY1_Y_LED- |
| 19  |     GND     |     |             |

### TF Card Slot

| Pin |    Name     | Pin |    Name    |
| :-: | :---------: | :-: | :--------: |
|  1  |  SDMMC_D2   |  2  |  SDMMC_D3  |
|  3  |  SDMMC_CMD  |  4  | VCC_3V3_S3 |
|  5  |  SDMMC_CLK  |  6  |    GND     |
|  7  |  SDMMC_D0   |  8  |  SDMMC_D1  |
|  9  | SDMMC_DET_H | 10  |    GND     |
| 11  |     GND     | 12  |    GND     |
| 13  |     GND     |     |            |
