---
sidebar_position: 1
description: "Detailed hardware information for ROCK 5T"
---

# Hardware Interface Description

## Chip block diagram

<img src="/img/rock5b/rk3588-block-diagram.webp" alt="rk3588 system diagram" width="700" />

## Physical photographs

<img src="/img/rock5t/rock-5t-overview-v12.webp" alt="rock 5t overview" width="700" />

## Interface details

### FAN Header

- Refer to [Fan](../getting-started/interface-usage/fan) to install

### GPIO

- GPIO Voltage

| GPIO       | Voltage | MAX   |
| ---------- | ------- | ----- |
| All GPIO   | 3.3V    | 3.63V |
| SARADC_IN4 | 3.3V    | 1.8V  |

- GPIO Pinout

<TabItem value="ROCK 5T">
        <div className='gpio_style' style={{ overflow :"auto"}} >

        | GPIO number |  Function8  |  Function7   |  Function6   |  Function5  |   Function4   |  Function3  | Function2  | Function1 |               Pin#               |              Pin#               | Function1  | Function2  | Function3  |                 Function4                 |  Function5  |  Function6   |  Function7   | Function8 | GPIO number |
        | :---------: | :---------: | :----------: | :----------: | :---------: | :-----------: | :---------: | :--------: | :-------: | :------------------------------: | :-----------------------------: | :--------: | :--------: | :--------: | :---------------------------------------: | :---------: | :----------: | :----------: | :-------: | :---------: |
        |             |             |              |              |             |               |             |            |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V    |            |            |                                           |             |              |              |           |             |
        |     139     |             |              | I2S1_SDO2_M0 | I2C7_SDA_M3 | UART8_CTSN_M0 | PWM15_IR_M1 | CAN1_TX_M1 | GPIO4_B3  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V    |            |            |                                           |             |              |              |           |             |
        |     138     |             |              | I2S1_SDO1_M0 | I2C7_SCL_M3 | UART8_RTSN_M0 |  PWM14_M1   | CAN1_RX_M1 | GPIO4_B2  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND     |            |            |                                           |             |              |              |           |             |
        |     115     |             | SPI1_CS1_M1  |              | I2C8_SDA_M4 | UART7_CTSN_M1 | PWM15_IR_M0 |            | GPIO3_C3  |  <div className='green'>7</div>  | <div className='green'>8</div>  |  GPIO0_B5  |            |            | <div className='orange'>UART2_TX_M0</div> | I2C1_SCL_M0 | I2S1_MCLK_M1 |              |           |     13      |
        |             |             |              |              |             |               |             |            |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> |  GPIO0_B6  |            |            | <div className='orange'>UART2_RX_M0</div> | I2C1_SDA_M0 | I2S1_SCLK_M1 |              |           |     14      |
        |     113     |             | SPI1_CLK_M1  |              |             |  UART7_RX_M1  |             |            | GPIO3_C1  | <div className='green'>11</div>  | <div className='green'>12</div> |  GPIO3_B5  | CAN1_RX_M0 |  PWM12_M0  |                UART3_TX_M1                |             | I2S2_SCLK_M1 |              |           |     109     |
        |     111     |             | SPI1_MOSI_M1 |              | I2C3_SCL_M1 |               |             |            | GPIO3_B7  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND     |            |            |                                           |             |              |              |           |             |
        |     112     |             | SPI1_MISO_M1 |              | I2C3_SDA_M1 |  UART7_TX_M1  |             |            | GPIO3_C0  | <div className='green'>15</div>  | <div className='green'>16</div> |  GPIO3_A4  |            |            |                                           |             |              |              |           |     100     |
        |             |             |              |              |             |               |             |            |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> |  GPIO4_C4  |            |  PWM5_M2   |                                           |             |              | SPI3_MISO_M0 |           |     148     |
        |     42      |             | SPI0_MOSI_M2 |              |             |  UART4_RX_M2  |             |            | GPIO1_B2  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND     |            |            |                                           |             |              |              |           |             |
        |     41      |             | SPI0_MISO_M2 |              |             |               |             |            | GPIO1_B1  | <div className='green'>21</div>  | <div className='green'>22</div> | SARADC_IN4 |            |            |                                           |             |              |              |           |             |
        |     43      |             | SPI0_CLK_M2  |              |             |  UART4_TX_M2  |             |            | GPIO1_B3  | <div className='green'>23</div>  | <div className='green'>24</div> |  GPIO1_B4  |            |            |                UART7_RX_M2                |             |              | SPI0_CS0_M2  |           |     44      |
        |             |             |              |              |             |               |             |            |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> |  GPIO1_B5  |            |            |                UART7_TX_M2                |             |              | SPI0_CS1_M2  |           |     45      |
        |     150     |             | SPI3_CLK_M0  |              | I2C0_SDA_M1 |               | PWM7_IR_M3  |            | GPIO4_C6  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  |  GPIO4_C5  |            |  PWM6_M2   |                                           | I2C0_SCL_M1 |              | SPI3_MOSI_M0 |           |     149     |
        |     35      |             |              |              | I2C4_SCL_M3 |               |  PWM1_M2    |            | GPIO1_A3  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND     |            |            |                                           |             |              |              |           |             |
        |     34      |             |              |              | I2C4_SDA_M3 |               |  PWM0_M2    |            | GPIO1_A2  | <div className='green'>31</div>  | <div className='green'>32</div> |  GPIO3_C2  |            |  PWM14_M0  |               UART7_RTSN_M1               | I2C8_SCL_M4 |              | SPI1_CS0_M1  |           |     114     |
        |     103     |             |              |              |             |               |   PWM8_M0   |            | GPIO3_A7  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND     |            |            |                                           |             |              |              |           |             |
        |     110     |             |              | I2S2_LRCK_M1 |             |  UART3_RX_M1  |  PWM13_M0   | CAN1_TX_M0 | GPIO3_B6  | <div className='green'>35</div>  | <div className='green'>36</div> |  GPIO3_B1  |            |  PWM2_M1   |                UART2_TX_M2                |             |              |              |           |     105     |
        |    39      |             |              |              |             |               |             |            | GPIO1_A7  | <div className='green'>37</div>  | <div className='green'>38</div> |  GPIO3_B2  |            | PWM3_IR_M1 |                UART2_RX_M2                |             | I2S2_SDI_M1  |              |           |     106     |
        |             |             |              |              |             |               |             |            |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> |  GPIO3_B3  |            |            |                UART2_RTSN                 |             | I2S2_SDO_M1  |              |           |     107     |

   </div>
</TabItem>

### Gigabit Ethernet

### Maskrom Button

### MIPI CSI

#### CAM0

| Pin |        Name        |                         Description                          |
| :-: | :----------------: | :----------------------------------------------------------: |
|  1  |        GND         |       Ground, common reference for electrical circuits       |
|  2  |  MIPI_CSI0_RX_D3N  |           MIPI CSI-0 receive data lane 3 negative            |
|  3  |  MIPI_CSI0_RX_D3P  |           MIPI CSI-0 receive data lane 3 positive            |
|  4  |        GND         |                            Ground                            |
|  5  |  MIPI_CSI0_RX_D2N  |           MIPI CSI-0 receive data lane 2 negative            |
|  6  |  MIPI_CSI0_RX_D2P  |           MIPI CSI-0 receive data lane 2 positive            |
|  7  |        GND         |                            Ground                            |
|  8  | MIPI_CSI0_RX_CLK1N |           MIPI CSI-0 receive clock lane 1 negative           |
|  9  | MIPI_CSI0_RX_CLK1P |           MIPI CSI-0 receive clock lane 1 positive           |
| 10  |        GND         |                            Ground                            |
| 11  |  MIPI_CSI0_RX_D1N  |           MIPI CSI-0 receive data lane 1 negative            |
| 12  |  MIPI_CSI0_RX_D1P  |           MIPI CSI-0 receive data lane 1 positive            |
| 13  |        GND         |                            Ground                            |
| 14  |  MIPI_CSI0_RX_D0N  |           MIPI CSI-0 receive data lane 0 negative            |
| 15  |  MIPI_CSI0_RX_D0P  |           MIPI CSI-0 receive data lane 0 positive            |
| 16  |        GND         |                            Ground                            |
| 17  | MIPI_CSI0_RX_CLK0N |           MIPI CSI-0 receive clock lane 0 negative           |
| 18  | MIPI_CSI0_RX_CLK0P |           MIPI CSI-0 receive clock lane 0 positive           |
| 19  |        GND         |                            Ground                            |
| 20  |  MIPI_CAM3_CLKOUT  |                Clock output for MIPI Camera 3                |
| 21  |        GND         |                            Ground                            |
| 22  |  MIPI_CAM1_CLKOUT  |                Clock output for MIPI Camera 1                |
| 23  |  MIPI_CSI0_PDN0_H  |        Power down signal for MIPI CSI-0, active high         |
| 24  |  I2C3_SCL_M0_MIPI  |      I2C bus 3 clock line, master 0 for MIPI interface       |
| 25  |  I2C3_SDA_M0_MIPI  |       I2C bus 3 data line, master 0 for MIPI interface       |
| 26  |  MIPI_CSI0_PDN1_H  | Power down signal for second port of MIPI CSI-0, active high |
| 27  |     CAM1_RST_L     |               Camera module reset, active low                |
| 28  |     VCC_3V3_S3     |                3.3V power supply for Camera 1                |
| 29  |     VCC_3V3_S3     |                3.3V power supply for Camera 1                |
| 30  |       VCC_5V       |                3.3V power supply for Camera 1                |
| 31  |       VCC_5V       |                3.3V power supply for Camera 1                |

#### CAM1

| Pin |        Name        |                         Description                          |
| :-: | :----------------: | :----------------------------------------------------------: |
|  1  |        GND         |       Ground, common reference for electrical circuits       |
|  2  |  MIPI_CSI1_RX_D3N  |           MIPI CSI-1 receive data lane 3 negative            |
|  3  |  MIPI_CSI1_RX_D3P  |           MIPI CSI-1 receive data lane 3 positive            |
|  4  |        GND         |                            Ground                            |
|  5  |  MIPI_CSI1_RX_D2N  |           MIPI CSI-1 receive data lane 2 negative            |
|  6  |  MIPI_CSI1_RX_D2P  |           MIPI CSI-1 receive data lane 2 positive            |
|  7  |        GND         |                            Ground                            |
|  8  | MIPI_CSI1_RX_CLK1N |           MIPI CSI-1 receive clock lane 1 negative           |
|  9  | MIPI_CSI1_RX_CLK1P |           MIPI CSI-1 receive clock lane 1 positive           |
| 10  |        GND         |                            Ground                            |
| 11  |  MIPI_CSI1_RX_D1N  |           MIPI CSI-1 receive data lane 1 negative            |
| 12  |  MIPI_CSI1_RX_D1P  |           MIPI CSI-1 receive data lane 1 positive            |
| 13  |        GND         |                            Ground                            |
| 14  |  MIPI_CSI1_RX_D0N  |           MIPI CSI-1 receive data lane 0 negative            |
| 15  |  MIPI_CSI1_RX_D0P  |           MIPI CSI-1 receive data lane 0 positive            |
| 16  |        GND         |                            Ground                            |
| 17  | MIPI_CSI1_RX_CLK0N |           MIPI CSI-1 receive clock lane 0 negative           |
| 18  | MIPI_CSI1_RX_CLK0P |           MIPI CSI-1 receive clock lane 0 positive           |
| 19  |        GND         |                            Ground                            |
| 20  |  MIPI_CAM4_CLKOUT  |                Clock output for MIPI Camera 4                |
| 21  |        GND         |                            Ground                            |
| 22  |  MIPI_CAM2_CLKOUT  |        General Purpose Input/Output pin, bank 1 bit 6        |
| 23  |  MIPI_CAM2_PDN_L   |        Power down signal for MIPI CSI-1, active high         |
| 24  |    I2C7_SCL_M0     |      I2C bus 3 clock line, master 0 for MIPI interface       |
| 25  |    I2C7_SDA_M0     |       I2C bus 3 data line, master 0 for MIPI interface       |
| 26  |  MIPI_CAM2_PDN2_L  | Power down signal for second port of MIPI CSI-1, active high |
| 27  |     CAM2_RST_L     |               Camera module reset, active low                |
| 28  |     VCC_3V3_S3     |                3.3V power supply for Camera 1                |
| 29  |     VCC_3V3_S3     |                3.3V power supply for Camera 1                |
| 30  |       VCC_5V       |                3.3V power supply for Camera 1                |
| 31  |       VCC_5V       |                3.3V power supply for Camera 1                |

The camera seat adopts FH35C-31S-0.3SHW (50) with a spacing of 0.3 mm.

### MIPI DSI

| Pin |        Name        |                   Description                    |
| :-: | :----------------: | :----------------------------------------------: |
|  0  |        GND         | Ground, common reference for electrical circuits |
|  1  |       VDD3V3       |                3.3V power supply                 |
|  2  |     VCC_1V8_S0     |          1.8V power supply for Sensor 0          |
|  3  |  SENSOR_INT_LCD1   |       Interrupt signal from Sensor to LCD1       |
|  4  |     LCD_RESET      |               Reset signal for LCD               |
|  5  |         /          |                  No connection                   |
|  6  |        GND         |                      Ground                      |
|  7  | MIPI_DPHY0_TX_D0N  |         MIPI D-PHY data lane 0 negative          |
|  8  | MIPI_DPHY0_TX_D0P  |         MIPI D-PHY data lane 0 positive          |
|  9  |        GND         |                      Ground                      |
| 10  | MIPI_DPHY0_TX_D1N  |         MIPI D-PHY data lane 1 negative          |
| 11  | MIPI_DPHY0_TX_D1P  |         MIPI D-PHY data lane 1 positive          |
| 12  |        GND         |                      Ground                      |
| 13  | MIPI_DPHY0_TX_CLKN |          MIPI D-PHY clock lane negative          |
| 14  | MIPI_DPHY0_TX_CLKP |          MIPI D-PHY clock lane positive          |
| 15  |        GND         |                      Ground                      |
| 16  | MIPI_DPHY0_TX_D2N  |         MIPI D-PHY data lane 2 negative          |
| 17  | MIPI_DPHY0_TX_D2P  |         MIPI D-PHY data lane 2 positive          |
| 18  |        GND         |                      Ground                      |
| 19  | MIPI_DPHY0_TX_D3N  |         MIPI D-PHY data lane 3 negative          |
| 20  | MIPI_DPHY0_TX_D3P  |         MIPI D-PHY data lane 3 positive          |
| 21  |        GND         |                      Ground                      |
| 22  |        GND         |                      Ground                      |
| 23  |     TP1_RST_L      |    Reset signal for Touch Panel 1, active low    |
| 24  |        GND         |                      Ground                      |
| 25  |     TP1_INT_L      | Interrupt signal from Touch Panel 1, active low  |
| 26  |    I2C6_SDA_M0     |          I2C Bus 6 Data Line, Master 0           |
| 27  |    I2C6_SCL_M0     |          I2C Bus 6 Clock Line, Master 0          |
| 28  |        GND         |                      Ground                      |
| 29  |        GND         |                      Ground                      |
| 30  |       VCC3V3       |                3.3V power supply                 |
| 31  |       VCC3V3       |                3.3V power supply                 |
| 32  |        GND         |                      Ground                      |
| 33  |        GND         |                      Ground                      |
| 34  |     VCC_LEDK1      |             Power supply for LED K1              |
| 35  |     VCC_LEDK1      |             Power supply for LED K1              |
| 36  |         /          |                  No connection                   |
| 37  |         /          |                  No connection                   |
| 38  |     VCC_LEDA1      |             Power supply for LED A1              |
| 39  |     VCC_LEDA1      |             Power supply for LED A1              |
| 40  |        GND         |                      Ground                      |

The LCD seat adopts FH35C-39S-0.3SHW (50) with a spacing of 0.3 mm.

### PCIe

### POE

### TF Card Slot

| Pin# | Name         |
| :--: | :----------- |
|  1   | SDMMC0_D2    |
|  2   | SDMMC0_D3    |
|  3   | SDMMC0_CMD   |
|  4   | VCC3V3_SYS   |
|  5   | SDMMC0_CLK   |
|  6   | GND          |
|  7   | SDMMC0_D0    |
|  8   | SDMMC0_D1    |
|  9   | SDMMC0_DET_L |
|  10  | GND          |
|  11  | GND          |
|  12  | GND          |
|  13  | GND          |
