---
sidebar_position: 4
---

# Hardware interface description

## Interface overview

- **Radxa ZERO 3W**
  ![ZERO 3W Overview](/img/zero/zero3/radxa_zero_3w.webp)

- **Radxa ZERO 3E**
  ![ZERO 3E Overview](/img/zero/zero3/radxa_zero_3e.webp)

## Power

## Debug Serial Port

## Ethernet Port

## 40 PIN GPIO

#### GPIO voltage

| GPIO       | Voltage | Maximum |
| ---------- | ------- | ------- |
| All GPIOs  | 3.3V    | 3.63V   |
| SARADC_IN5 | 3.3V    | 3.3V    |

#### GPIO interface

Radxa ZERO 3 provides a 40-pin GPIO header, which is compatible with most SBC accessories on the market.

**Tips: Actual compatibility is based on usage **

<div className='gpio_style'>

:::tip
Pin 3, Pin 5, Pin 27, and Pin 28 add extra pull-up resistors for I2C device power supply, so they work abnormally when used as GPIOs.
:::

| GPIO number | Function5   |  Function4   |    Function3    |  Function2   | Function1 |               Pin#               |              Pin#               | Function1 |                 Function2                 | Function3 |  Function4  | Function5    | GPIO number |
| ----------- | ----------- | :----------: | :-------------: | :----------: | :-------: | :------------------------------: | :-----------------------------: | :-------: | :---------------------------------------: | :-------: | :---------: | ------------ | ----------- |
|             |             |              |                 |              |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |                                           |           |             |              |             |
| 32          |             |              |   I2C3_SDA_M0   | UART3_RX_M0  | GPIO1_A0  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |                                           |           |             |              |             |
| 33          |             |              |   I2C3_SCL_M0   | UART3_TX_M0  | GPIO1_A1  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |                                           |           |             |              |             |
| 116         |             |   PWM14_M0   |                 |              | GPIO3_C4  |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_D1  | <div className='orange'>UART2_TX_M0</div> |           |             |              | 25          |
|             |             |              |                 |              |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_D0  | <div className='orange'>UART2_RX_M0</div> |           |             |              | 24          |
| 97          |             |              |                 |              | GPIO3_A1  | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO3_A3  |                                           |           |             | I2S3_SCLK_M0 | 99          |
| 98          |             | I2S3_MCLK_M0 |                 |              | GPIO3_A2  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |                                           |           |             |              |             |
| 104         |             |              |                 |              | GPIO3_B0  | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO3_B1  |                UART4_RX_M1                |  PWM8_M0  |             |              | 105         |
|             |             |              |                 |              |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO3_B2  |                UART4_TX_M1                |  PWM9_M0  |             |              | 106         |
| 147         |             | PWM15_IR_M1  |  I2S3_SCLK_M1   | SPI3_MOSI_M1 | GPIO4_C3  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |                                           |           |             |              |             |
| 149         | UART9_TX_M1 |   PWM12_M1   |   I2S3_SDO_M1   | SPI3_MISO_M1 | GPIO4_C5  | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO3_C1  |                                           |           |             | I2S1_SDO2_M2 | 113         |
| 146         |             |   PWM14_M1   |  I2S3_MCLK_M1   | SPI3_CLK_M1  | GPIO4_C2  | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO4_C6  |                SPI3_CS0_M1                | PWM13_M1  | UART9_RX_M1 | I2S3_SDI_M1  | 150         |
|             |             |              |                 |              |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> |    NC     |                                           |           |             |              |             |
| 138         |             | I2C4_SDA_M0  |   I2S2_SDI_M1   |              | GPIO4_B2  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO4_B3  |                                           |           | I2C4_SCL_M0 | I2S2_SDO_M1  | 139         |
| 107         |             |              |                 |              | GPIO3_B3  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |                                           |           |             |              |             |
| 108         |             |              |                 |              | GPIO3_B4  | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO3_C2  |                UART5_TX_M1                |           |             | I2S1_SDO3_M2 | 114         |
| 115         | UART5_RX_M1 |              | I2S1_SCLK_RX_M2 |              | GPIO3_C3  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |                                           |           |             |              |             |
| 100         |             |              |  I2S3_LRCK_M0   |              | GPIO3_A4  | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO3_A7  |                                           |           |             |              | 103         |
| 36          |             |              | I2S1_SCLK_RX_M0 |              | GPIO1_A4  | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO3_A6  |                                           |           |             | I2S3_SDI_M0  | 102         |
|             |             |              |                 |              |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO3_A5  |                                           |           |             | I2S3_SDO_M0  | 101         |

</div>

## Bluetooth

## USB C OTG

## HDMI

## USB

## MIPI CSI

## MIPI DSI

## WIFI

## MicroSD
