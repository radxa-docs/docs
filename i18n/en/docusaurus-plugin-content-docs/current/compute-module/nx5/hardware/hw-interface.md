---
sidebar_position: 4
---

# Hardware interface description

## Interface overview

![Radxa NX5](/img/nx5/nx5-overview.webp)
![Radxa NX5 IO](/img/nx5/nx5-io/nx5-io-overview.webp)

- 4x USB3.0 Host
- 1x Micro USB 2.0 OTG
- 2x MIPI CSI
- 1x M.2 E Key
- 1x TF Card Slot
- 1x DP
- 1x HDMI
- 1x Gigabit Ethernet
- 1x 40 PIN IO
- 1x Fan Header
- 2x LED Light
- 1x Power Input
- 1x Maskrom Key
- 1x Power Key

## Power

Powered by DC power connector, supports 5V input only.

## Debug Serial Port

For system debugging, low-level log message output.
Refer to [Serial Debugging](../radxa-os/low-level-dev/serial).

## Ethernet Port

Provides Ethernet interface to Gigabit Ethernet.

## 40 PIN GPIO

### GPIO voltage

| GPIO       | Voltage | Max Voltage |
| ---------- | ------- | ----------- |
| All GPIO   | 3.3V    | 3.63V       |
| SARADC_IN4 | 1.8V    | 1.98V       |

### GPIO interface

Radxa NX5 IO provides a 40pin GPIO socket, which is compatible with most sensor applications on the market.

**_Tips:_ The actual compatibility is subject to usage. **

<div className='gpio_style'>

| GPIO number | Function7 |  Function6   |   Function5   |  Function4   | Function3  |  Function2  | Function1 |               Pin#               |              Pin#               | Function1 |  Function2  |  Function3  |  Function4   |                 Function5                 |  Function6   | Function7  | GPIO number |
| :---------: | :-------: | :----------: | :-----------: | :----------: | :--------: | :---------: | :-------: | :------------------------------: | :-----------------------------: | :-------: | :---------: | :---------: | :----------: | :---------------------------------------: | :----------: | :--------: | :---------: |
|             |           |              |               |              |            |             |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |             |             |              |                                           |              |            |             |
|     28      |           | I2S1_SDO2_M1 |               | SPI3_CS0_M2  | PWM3_IR_M0 | I2C1_SCL_M2 | GPIO0_D4  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |             |             |              |                                           |              |            |             |
|     29      |           |              |               | SPI3_CS1_M2  |            | I2C1_SDA_M2 | GPIO0_D5  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |             |             |              |                                           |              |            |             |
|     141     |           |              |  UART9_RX_M1  | SPI3_MISO_M1 |  PWM12_M1  |             | GPIO1_C0  |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_B5  | I2C1_SCL_M0 |             |              | <div className='orange'>UART2_TX_M0</div> | I2S1_MCLK_M1 |            |     13      |
|             |           |              |               |              |            |             |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_B6  | I2C1_SDA_M0 |             |              | <div className='orange'>UART2_RX_M0</div> | I2S1_SCLK_M1 |            |     14      |
|     122     |           |              | UART9_RTSN_M2 | SPI0_MOSI_M3 |            | I2C7_SCL_M2 | GPIO3_D2  | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO1_C3  | I2C6_SCL_M1 | PWM7_IR_M2  | SPI4_CS0_M0  |                UART3_CTSN                 |  I2S0_SCLK   |            |     51      |
|     58      | I2S0_SDO3 |  I2S0_SDI2   |  UART4_TX_M0  | SPI1_CLK_M2  |  PWM0_M1   | I2C1_SCL_M4 | GPIO1_D2  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |             |             |              |                                           |              |            |             |
|      8      |           |              |  UART0_RX_M1  | SPI2_CS1_M2  |            | I2C1_SCL_M1 | GPIO0_B0  | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO1_D5  |             |             | SPI1_CS1_M2  |                                           |  I2S0_SDI1   |            |     61      |
|             |           |              |               |              |            |             |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO1_D3  | I2C1_SDA_M4 |   PWM1_M1   | SPI1_CS0_M2  |                UART4_RX_M0                |              |            |     59      |
|     42      |           |              |  UART4_RX_M2  | SPI0_MOSI_M2 |            |             | GPIO1_B2  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |             |             |              |                                           |              |            |             |
|     41      |           |              |               | SPI0_MISO_M2 |            |             | GPIO1_B1  | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO1_D0  | I2C7_SCL_M0 |             | SPI1_MISO_M2 |                UART6_TX_M2                |  I2S0_SDO1   |            |     56      |
|     43      |           |              |  UART4_TX_M2  | SPI0_CLK_M2  |            |             | GPIO1_B3  | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO1_B4  |             |             | SPI0_CS0_M2  |                UART7_RX_M2                |              |            |     44      |
|             |           |              |               |              |            |             |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO1_B5  |             |             | SPI0_CS1_M2  |                UART7_TX_M2                |              |            |     45      |
|     26      |           | I2S1_SDO1_M1 |  UART1_RX_M2  | SPI3_MOSI_M2 |            | I2C0_SDA_M2 | GPIO0_D2  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO0_D1  | I2C0_SCL_M2 |             | SPI0_CS0_M0  |                UART1_TX_M2                | I2S1_SDO0_M1 | UART0_CTSN |     25      |
|     142     |           |              |               | SPI3_MOSI_M1 |  PWM13_M1  | I2C5_SCL_M1 | GPIO4_B6  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |             |             |              |                                           |              |            |             |
|      0      |           |              |               |              |            |             | GPIO0_A0  | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO4_B3  | I2C7_SDA_M3 | PWM15_IR_M1 |              |               UART8_CTSN_M0               | I2S1_SDO2_M0 |            |     139     |
|     33      |           |              |  UART6_TX_M1  | SPI4_MOSI_M2 |            | I2C2_SCL_M4 | GPIO1_A1  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |             |             |              |                                           |              |            |             |
|     53      |           |  I2S0_LRCK   |  UART4_RTSN   |              |            | I2C2_SCL_M3 | GPIO1_C5  | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO3_D3  | I2C7_SDA_M2 |  PWM10_M2   | SPI0_CLK_M3  |                                           |              |            |     123     |
|     57      | I2S0_SDI3 |  I2S0_SDO2   |  UART6_RX_M2  | SPI1_MOSI_M2 |            | I2C7_SDA_M0 | GPIO1_D1  | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO1_D4  |             |             |              |                                           |  I2S0_SDI0   |            |     60      |
|             |           |              |               |              |            |             |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO1_C7  | I2C4_SCL_M4 |             |              |                UART4_CTSN                 |  I2S0_SDO0   |            |     55      |

</div>

## WIFI/BT

Provides M.2 KEY interface, which is compatible with common PCIe protocol NICs in the market, such as Radxa Wireless A8 modules.

## HDMI/DP

Equipped with full-size HDMI and DP connectors, supporting regular 4K, 2K, 1080P resolutions, the HDMI interface supports resolutions up to 8K.

## USB

Provides 4x USB3.0 ports, compatible with USB2.0.

## MIPI CSI

MIPI camera support.

## MicroSD

Can be used as a system boot disk or as a storage medium.
