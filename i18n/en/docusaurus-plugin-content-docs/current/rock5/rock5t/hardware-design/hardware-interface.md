---
sidebar_position: 1
description: "Detailed hardware information for ROCK 5T"
---

# Hardware Interface Description

## Chip block diagram

<img src="/img/rock5b/rk3588-block-diagram.webp" alt="rk3588 system diagram" width="700" />

## Physical photographs

<img src="/img/rock5t/rock-5t-overview-x1-0.webp" alt="rock 5t overview" width="700" />

## Interface details

### FAN Header

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
        |             |             |              |              |             |               |             |            | GPIO0_A0  | <div className='green'>37</div>  | <div className='green'>38</div> |  GPIO3_B2  |            | PWM3_IR_M1 |                UART2_RX_M2                |             | I2S2_SDI_M1  |              |           |     106     |
        |             |             |              |              |             |               |             |            |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> |  GPIO3_B3  |            |            |                UART2_RTSN                 |             | I2S2_SDO_M1  |              |           |     107     |

   </div>
</TabItem>

### Gigabit Ethernet

### Maskrom Button

### MIPI CSI

### MIPI DSI

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
