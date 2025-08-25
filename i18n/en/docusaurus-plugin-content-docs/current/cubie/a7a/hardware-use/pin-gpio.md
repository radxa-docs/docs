---
sidebar_position: 4
---

# 40 Pin GPIO Interface

Radxa Cubie A7A features an onboard 40-Pin GPIO (General Purpose Input/Output) interface, providing highly flexible support for hardware expansion.

Users can connect various sensors, actuators, communication modules, displays, and other embedded peripherals to the 40-Pin GPIO interface, enabling rapid prototyping and functional verification for IoT, robotics control, industrial automation, and other fields.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::danger
When using the 40-Pin GPIO interface, please pay attention to the wiring of the pins and peripherals. Make sure the pin connections are correct, as improper operation may cause hardware damage to the device.
:::

## GPIO Functions

Cubie A7A supports connecting external devices to the onboard GPIO pins, supporting UART, SPI, I2C, ADC, and more.

<TabItem value="Cubie A7A">
     <div className='gpio_style' style={{ overflow :"auto"}}  >
| FUNC8     | FUNC7     | FUNC6         | FUNC5     | FUNC4       | FUNC3        | FUNC2     | FUNC1 | Pin# | Pin# | FUNC1 | FUNC2      | FUNC3      | FUNC4      | FUNC5      | FUNC6          | FUNC7    | FUNC8     |
| :------: | :-----: | :----------: | :-----: | :-----------: | :------: | :------: | :---:| :----: | :----: | :-----: | :----------: | :--------: | :--------: | :-------: | :--------------: | :--------: | :---------: |
|           |           |               |           |             |              |           | +3.3V | <div className='yellow'>1</div> | <div className='red'>2</div>    | +5.0V |            |            |            |            |                |          |           |
| PJ-EINT23 | TWI11-SDA | TWI3-SDA      | TWI7-SDA  | UART2-CTS   | UART3-RX     | PWM1-5    | PJ23  | <div className='green'>3</div>  | <div className='red'>4</div>    | +5.0V |            |            |            |            |                |          |           |
| PJ-EINT22 | TWI11-SCK | TWI3-SCK      | TWI7-SCK  | UART2-RTS   | UART3-TX     | PWM1-4    | PJ22  | <div className='green'>5</div>  | <div className='black'>6</div>  | GND   |            |            |            |            |                |          |           |
|           |           |               | PB-EINT0  | SPI2-CS0    | UART0-TX     | UART2-TX  | PB0   | <div className='green'>7</div>  | <div className='green'>8</div>  | PB9   | UART0-TX   | I2S0-DIN2  | I2S0-DOUBT2 | PWM1-1     | TWI8-SCK       | TWI0-SCK | PB-EINT9  |
|           |           |               |           |             |              |           | GND   | <div className='black'>9</div>  | <div className='green'>10</div> | PB10  | UART0-RX   | I2S0-DIN3  | I2S0-DOUBT3 | PWM1-2     | TWI8-SDA       | TWI0-SDA | PB-EINT10 |
|           |           | PB-EINT1      | JTAG-CK   | SPI2-CLK    | UART0-RX     | UART2-RX  | PB1   | <div className='green'>11</div> | <div className='green'>12</div> | PK0   | UART6-DCD  | I2S4-BCLK  | HDMI-CEC   | TWI1-SDA   | SGPIO-SLOAD    | PK-EINT0 |           |
|           | PL-EINT6  | S-PWM0-4      | S-IR-RX   | S-SPI0-MOSI | S-UART0-TX   | S-JTAG-DO | PL6   | <div className='green'>13</div> | <div className='black'>14</div> | GND   |            |            |            |            |                |          |           |
|           |           | PL-EINT7      | S-PWM0-5  | S-SPI0-MISO | S-UART0-RX   | S-JTAG-DI | PL7   | <div className='green'>15</div> | <div className='green'>16</div> | PJ24  | PWM1-6     | UART4-TX   | TWI4-SCK   | SPI3-CLK   | PJ-EINT24      |          |           |
|           |           |               |           |             |              |           | +3.3V | <div className='yellow'>17</div> | <div className='green'>18</div> | PJ25  | PWM1-7     | UART4-RX   | TWI4-SDA   | SPI3-MOSI  | PJ-EINT25      |          |           |
|           |           |               |           | PD-EINT12   | PWM1-2       | SPI1-MOSI | PD12  | <div className='green'>19</div> | <div className='black'>20</div> | GND   |            |            |            |            |                |          |           |
|           |           |               |           | PD-EINT13   | PWM1-3       | SPI1-MISO | PD13  | <div className='green'>21</div> | <div className='green'>22</div> | PL10  | S-UART0-TX | S-TWI2-SCK | S-UART1-TX | S-PWM0-8   | PL-EINT10      |          |           |
|           |           |               |           | PD-EINT11   | PWM1-1       | SPI1-CLK  | PD11  | <div className='green'>23</div> | <div className='green'>24</div> | PD10  | SPI1-CS0   | PWM1-0     | PD-EINT10  |            |                |          |           |
|           |           |               |           |             |              |           | GND   | <div className='black'>25</div> | <div className='green'>26</div> | PD14  | SPI1-HOLD  | UART3-RTS  | PD-EINT14  |            |                |          |           |
|           | PD-EINT1  | UART3-RX      | TWI2-SDA  | DSI1-D2N    | LVDS1-CKN    | LCD0-D23  | PD17  | <div className='blue'>27</div> | <div className='blue'>28</div>  | PD16  | TWI2-SCK   | UART3-TX   | PD-EINT16  |            |                |          |           |
|           | PK-EINT5  | SPI3-CLK      | PWM1-9    | PWM1-8      | PCIE-CLKREQN | MCSIA-CKP | PK5   | <div className='green'>29</div> | <div className='black'>30</div> | GND   |            |            |            |            |                |          |           |
|           | PK-EINT6  | SPI3-MOSI     | UART2-RTS | UART4-TX    | TWI2-SCK     | MCSIA-D2N | PK6   | <div className='green'>31</div> | <div className='green'>32</div> | PD16  | EINK-OEH   | TWI2-SCK   | UART3-TX   | PD-EINT16  |                |          |           |
|           | PK-EINT7  | SPI3-MISO     | UART2-CTS | UART4-RX    | TWI2-SDA     | MCSIA-D2P | PK7   | <div className='green'>33</div> | <div className='black'>34</div> | GND   |            |            |            |            |                |          |           |
|           | PK-EINT2  | SGPIO-SDATAIN | TWI5-SDA  | I2S4-LRCK   | UART6-DTR    | MCSIA-D1N | PK2   | <div className='green'>35</div> | <div className='green'>36</div> | PK1   | UART6-DSR  | I2S4-MCLK  | TWI1-SCK   | SGPIO-SCLK | PK-EINT1       |          |           |
|           | PK-EINT8  | SPI3-CS1      | UART2-TX  | UART4-RTS   | MCSI0-MCLK   | MCSIA-D3N | PK8   | <div className='green'>37</div> | <div className='green'>38</div> | PK3   | UART6-RI   | I2S4-DIN0  | I2S4-DOUBT1 | TWI5-SCK   | SGPIO-SDATAOUT | PK-EINT3 |           |
|           |           |               |           |             |              |           | GND   | <div className='black'>39</div> | <div className='green'>40</div> | PK4   | I2S4-DOUBT0 | I2S4-DIN1  | SPI3-CS0   | PK-EINT4   |                |          |           |

   </div>
</TabItem>
