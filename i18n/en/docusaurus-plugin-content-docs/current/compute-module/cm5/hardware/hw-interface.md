---
sidebar_position: 4
---

# Hardware Interface

:::warning
Don't put CM5 on Radxa CM3 IO board, otherwise the board will be demanged, more info please refer [faq](../faq)
:::

## Interface overview

![Radxa CM5](/img/cm5/cm5-overview.webp)

![Radxa CM5 IO Board](/img/cm5/cm5-io-board-overview.webp)

## Power

The Radxa CM5 IO is powered by a DC power connector, supporting 5V and 12V inputs, 12V is recommended for a more stable power supply.

## Debug Serial Port

[Debug serial port](../radxa-os/low-level-dev/serial)。

## Ethernet Port

The Radxa CM5 IO provides an Ethernet port for 1000M Ethernet.

## WIFI/BT

Provides M.2 KEY interface, compatible with common PCIe protocol NICs in the market, such as Radxa Wireless A8 module.

## HDMI

The Radxa CM5 IO is equipped with a full-size HDMI connector. It is recommended to use a monitor with HDMI capability.  
The Radxa CM5 IO supports resolutions up to 8K, as well as regular 4K, 2K, and 1080P resolutions.

## Type-C

The Radxa CM5 IO is equipped with a full-featured typec interface. Supports DP display and connection of USB-Hub devices.

## USB

With USB3.0 HOST x1 and USB2.0 HOST x2.

## MIPI CSI

Radxa CM5 IO Support for Camera Functions

## MIPI DSI

The Radxa CM5 IO supports the MIPI DSI display function.
:::tip
Radxa recommends using [Radxa Display 8 HD](/accessories/lcd-8-hd) or [Radxa Display 10 FHD](../../../accessories/lcd-10-fhd).
:::

## MicroSD

Can be used as a system boot disk or as a storage medium

## Headphone jack

Supports standard 3.5mm headset (with microphone)

## RTC

Connects to RTC battery， Battery Mode for CM5 IO is CR1220

## 40 PIN GPIO

### GPIO voltage

| GPIO       | Voltage | Max Voltage |
| ---------- | ------- | ----------- |
| All GPIO   | 3.3V    | 3.63V       |
| SARADC_IN4 | 1.8V    | 1.98V       |

### GPIO interface

Radxa CM5 IO provides a 40pin GPIO socket, which is compatible with most sensor applications on the market.

**_Tips:_ The actual compatibility is subject to usage. **

<Tabs queryString="revision">
<TabItem value="v2_21" label="v2.21">

<div className='gpio_style'>

| GPIO number |  Function5   |  Function4  |  Function3   |  Function2  |  Function1  |               Pin#               |              Pin#               | Function1 |                 Function2                 |  Function3   |  Function4   |  Function5  | GPIO number |
| ----------- | :----------: | :---------: | :----------: | :---------: | :---------: | :------------------------------: | :-----------------------------: | :-------: | :---------------------------------------: | :----------: | :----------: | :---------: | ----------- |
|             |              |             |              |             |    +3.3V    | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |                                           |              |              |             |             |
| 123         |              |  PWM10_M2   |              | I2C7_SDA_M2 |  GPIO3_D3   |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |                                           |              |              |             |             |
| 122         |              |             |              | I2C7_SCL_M2 |  GPIO3_D2   |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |                                           |              |              |             |             |
| 135         | I2S1_SDI2_M0 |             | SPI2_CS0_M1  | I2C5_SDA_M2 |  GPIO4_A7   |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_B5  | <div className='orange'>UART2_TX_M0</div> |              |              |             | 13          |
|             |              |             |              |             |     GND     |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_B6  | <div className='orange'>UART2_RX_M0</div> |              |              |             | 14          |
| 134         | I2S1_SDI1_M0 | UART3_RX_M2 | SPI2_CLK_M1  | I2C5_SCL_M2 |  GPIO4_A6   | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO0_C2  |                                           |              |              |             | 18          |
| 133         | I2S1_SDI0_M0 | UART3_TX_M2 | SPI2_MOSI_M1 | I2C3_SDA_M2 |  GPIO4_A5   | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |                                           |              |              |             |             |
| 132         |              |             | SPI2_MISO_M1 | I2C3_SCL_M2 |  GPIO4_A4   | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO1_C4  |                                           | SPI4_CS1_M0  |              | PWM11_IR_M2 | 52          |
|             |              |             |              |             |    +3.3V    | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO1_D5  |                                           | SPI1_CS1_M2  |              |             | 61          |
| 129         | I2S1_SCLK_M0 |             | SPI0_MOSI_M1 |             |  GPIO4_A1   | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |                                           |              |              |             |             |
| 128         | I2S1_MCLK_M0 |             | SPI0_MISO_M1 |             |  GPIO4_A0   | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO1_B1  |                                           |              |              |             | 41          |
| 130         | I2S1_LRCK_M0 |             | SPI0_CLK_M1  |             |  GPIO4_A2   | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO4_B2  |                                           | SPI0_CS0_M1  | I2S1_SDO1_M0 |  PWM14_M1   | 138         |
|             |              |             |              |             |     GND     | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO3_B7  |                I2C3_SCL_M1                | SPI1_MOSI_M1 |              |             | 111         |
| 63          |              |             |              | I2C8_SDA_M2 |  GPIO1_D7   |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO1_D6  |                I2C8_SCL_M                 |              |              |  PWM14_M2   | 62          |
| 24          | I2S1_SDI3_M1 | PWM7_IR_M0  |              | I2C6_SAL_M0 |  GPIO0_D0   | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |                                           |              |              |             |             |
| 23          | I2S1_SDI2_M1 |   PWM6_M0   |              | I2C6_SDA_M0 |  GPIO0_C7   | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO1_B7  |                                           |              |              |  PWM13_M2   | 47          |
| 49          |              |             |              |             |  GPIO1_C1   | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |                                           |              |              |             |             |
| 112         |              |             |              | I2C3_SDA_M1 |  GPIO3_C0   | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO1_C6  |                                           |              |              | PWM15_IR_M2 | 54          |
|             |              |             |              |             | SARADC_VIN4 | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO1_D2  |                                           | SPI1_CLK_M2  |  I2S0_SDI2   |  I2S0_SDO3  | 58          |
|             |              |             |              |             |     GND     | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO0_D3  |                                           | SPI3_CLK_M2  |              |             | 27          |

</div>

### Additional information about the 40-pin docking station for the v2.21 hardware version.

- The pins marked in orange are used for debug console.
- PWM: x7, PWM6 / PWM7 / PWM10 / PWM11 / PWM13 / PWM14 / PWM15
- SPI: x2, SPI0 / SPI2
- I2C: x5, I2C3 / I2C5 / I2C6 / I2C7 / I2C8
- UART: x2, UART2 / UART3
- ADC: x1, SARADC_VIN4

</TabItem>
</Tabs>
