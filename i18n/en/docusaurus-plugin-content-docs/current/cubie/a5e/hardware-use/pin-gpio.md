---
sidebar_position: 4
---

# 40 Pin GPIO Interface

The Radxa Cubie A5E features an onboard 40-pin GPIO (General Purpose Input/Output) interface, providing highly flexible hardware expansion capabilities.

Users can connect various sensors, actuators, communication modules, displays, and other embedded peripherals through the 40-pin GPIO interface, enabling rapid prototyping and functional verification in fields such as IoT, robotics control, and industrial automation.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a5e/a5e_gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::danger
When using the 40-pin GPIO interface, please pay attention to pin connections and peripheral wiring. Ensure all connections are correct, as improper operation may cause hardware damage to the device.
:::

## GPIO Features

The Cubie A5E supports connecting external devices to its onboard GPIO pins, with support for UART, SPI, I2C, ADC, and more.

<TabItem value="Cubie A5E">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

|  Function7  |  Function6  | Function5  |  Function4  | Function3  | Function2  | Function1 |               Pin#               |              Pin#               | Function1 | Function2  | Function3  | Function4   | Function5   | Function6   | Function7   |
| :---------: | :---------: | :--------: | :---------: | :--------: | :--------: | :-------: | :------------------------------: | :-----------------------------: | :-------- | :--------- | :--------- | :---------- | :---------- | :---------- | :---------- |
|             |             |            |             |            |            |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   | +5.0V     |            |            |             |             |             |             |
|  PB-EINT5   |  HDMI-SDA   |   PWM0-9   |  TRACE-CLK  | I2S0-BCLK  |  TWI1-SDA  |    PB5    |  <div className='green'>3</div>  |  <div className="red">4</div>   | +5.0V     |            |            |             |             |             |             |
|  PB-EINT4   |  HDMI-SCL   |   PWM0-8   | TRACE-DATA2 | I2S0-MCLK  |  TWI1-SCK  |    PB4    |  <div className='green'>5</div>  | <div className='black'>6</div>  | GND       |            |            |             |             |             |             |
|             |  PI-EINT7   |  SPI2-CLK  |   PWM0-8    | UART4-CTS  |  UART6-RX  |    PI7    |  <div className='green'>7</div>  | <div className='green'>8</div>  | PB9       | UARTO-TX   | TWIO-SCK   | TRACE-DATA1 | I2S0-DIN2   | I2S0-DOUBT2 | PB-EINT9    |
|             |             |            |             |            |            |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> | PB10      | UARTO-RX   | TWIO-SDA   | PWM0-1      | I2S0-DIN3   | I2S0-DOUBT3 | PB-EINT10   |
|             |             |  PI-EINT9  |   PWM0-10   | DMIC-DATA2 |  TWI5-SDA  |    PI9    | <div className='green'>11</div>  | <div className='green'>12</div> | PI2       | UART5-TX   | SPI1-CSO   | PWM0-3      | I2S2-BCLK   | I2S2-BCLK   | PI-EINT2    |
|             |  PI-EINT10  | I2S2-MCLK  |   PWM0-11   | DMIC-DATA1 |  OWA-OUT   |   PI10    | <div className='green'>13</div>  | <div className='black'>14</div> | GND       |            |            |             |             |             |             |
| S-PL-EINT12 | S-SPI0-MOSI | DMIC-DATA2 | S-UART0-TX  | MCU-PWM0-6 | S-TWI2-SCK |   PL12    | <div className='green'>15</div>  | <div className='green'>16</div> | PI11      | UART3-TX   | DMIC-DATA0 | PWM0-12     | PI-EINT11   |             |             |
|             |             |            |             |            |            |   +3.3V   | <div className="yellow">17</div> | <div className='green'>18</div> | PI14      | UART6-RTS  | DMIC-CLK   | PWM0-15     | PI-EINT14   |             |             |
|             |             | PI-EINT13  |   PWM0-4    |  UART7-TX  |  TWI4-SCK  |   PB13    | <div className='green'>19</div>  | <div className='black'>20</div> | GND       |            |            |             |             |             |             |
|  PB-EINT14  |  SPI1-MISO  |   PWM0-5   |  SPI1-MOSI  |  UART7-RX  |  TWI4-SDA  |   PB14    | <div className='green'>21</div>  | <div className='green'>22</div> | PL13      | S-TWI2-SDA | MCU-PWM0-7 | S-UARTO-RX  | DMIC-DATA3  | S-SPI-MISO  | S-PL-EINT13 |
|             |  PB-EINT12  |   PWM0-3   |  SPI1-CLK   | UART7-CTS  |  TWI5-SDA  |   PB12    | <div className='green'>23</div>  | <div className='green'>24</div> | PB11      | TWI5-SCK   | UART7-RTS  | PWM0-2      | SPI1-CSO    | PB-EINT11   |             |
|             |             |            |             |            |            |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> | PI0       | TWI4-SCK   | UART4-TX   | PWM0-1      | I2S2-DIN3   | I2S2-DOUBT3 | PI-EINT0    |
|             |  (USB2-DM)  | PI-EINT16  |   PWM1-1    |  TWI2-SDA  | UART3-CTS  |   PI16    |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | PI15      | TWI2-SCK   | UART3-RTS  | PWM1-0      | PI-EINT15   | (USB2-DP)   |             |
|             |  PI-EINT8   | SPI2-MOSI  |   PWM0-9    |   IR-RX    |  TWI5-SCK  |    PI8    | <div className='green'>29</div>  | <div className='black'>30</div> | GND       |            |            |             |             |             |             |
|             |             | PI-EINT12  |  SPI2-MISO  |  PWM0-13   |  UART3-RX  |   PI12    | <div className='green'>31</div>  | <div className='green'>32</div> | PI1       | TWI4-SDA   | UART4-RX   | PWM0-2      | I2S2-DIN2   | I2S2-DOUBT2 | PI-EINT1    |
|             |  PI-EINT6   |  SPI2-CSO  |   PWM0-7    |  UART6-TX  | UART4-RTS  |    PI6    | <div className='green'>33</div>  | <div className='black'>34</div> | GND       |            |            |             |             |             |             |
|             |  PI-EINT13  | I2S2-MCLK  |   PWM0-14   | DMIC-DATA3 | UART6-CTS  |   PI13    | <div className='green'>35</div>  | <div className='green'>36</div> | PI3       |            | UART5-RX   | PWM0-4      | I2S2-LRCK   | SPI1-CLK    | PI-EINT3    |
|             |             |            |             |            |            |  GPADC2   | <div className='green'>37</div>  | <div className='green'>38</div> | PI5       | UART5-CTS  | SPI1-MISO  | PWM0-6      | I2S2-DIN0   | I2S2-DOUBT1 | PI-EINT5    |
|             |             |            |             |            |            |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> | PI4       | UART5-RTS  | SPI1-MOSI  | PWM0-5      | I2S2-DOUBT0 | I2S2-DIN1   | PI-EINT4    |

   </div>
</TabItem>
