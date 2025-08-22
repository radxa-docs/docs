---
sidebar_position: 5
---

# 40 Pin GPIO 接口

瑞莎 Cubie A7Z 板载 40-Pin GPIO（通用输入输出）接口，为硬件扩展提供了高度灵活的接口支持。

用户可以通过 40-Pin GPIO 接口连接各类传感器、执行器、通信模块、显示屏以及其他嵌入式外设，从而快速实现物联网（IoT）、机器人控制、工业自动化等领域的原型开发与功能验证。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7z/a7z-gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::danger
使用 40-Pin GPIO 接口时，请注意引脚和外设的接线，请确保引脚连接正确，不当操作可能导致设备硬件损坏。
:::

## GPIO 功能

Cubie A7Z 支持给板载的 GPIO 引脚外接外部设备，支持 UART、SPI、I2C、ADC 等。

<TabItem value="Cubie A7Z">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

| Function8 |  Function7  | Function6 | Function5  |  Function4  |  Function3  |  Function2  | Function1 |               Pin#               |              Pin#               | Function1 |  Function2  |  Function3  |  Function4  |  Function5  |  Function6   |  Function7  | Function8 | Function9 |
| :-------: | :---------: | :-------: | :--------: | :---------: | :---------: | :---------: | :-------: | :------------------------------: | :-----------------------------: | :-------: | :---------: | :---------: | :---------: | :---------: | :----------: | :---------: | :-------: | :-------: |
|           |             |           |            |             |             |             |   3.3V    | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |    5V     |             |             |             |             |              |             |           |           |
| PJ-EINT23 |  TWI11-SDA  | TWI3-SDA  |  TWI7-SDA  |  UART2-CTS  |  UART3-RX   |   PWM1-5    |   PJ23    |  <div className='green'>3</div>  |  <div className='red'>4</div>   |    5V     |             |             |             |             |              |             |           |           |
| PJ-EINT23 |  TWI11-SCK  | TWI3-SCK  |  TWI7-SCK  |  UART2-RTS  |  UART3-TX   |   PWM1-4    |   PJ22    |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |             |             |             |             |              |             |           |           |
| PB-EINT1  |   JTAG-MS   |           |            |  SPI2-CS0   |  UART0-TX   |  UART2-TX   |    PB0    |  <div className='green'>7</div>  | <div className='green'>8</div>  |    PB9    |  UART0-TX   |  I2S0-DIN2  | I2S0-DOUBT2 |   PWM1-1    | WATCHDOG-SIG |  TWI8-SCK   | TWI0-SCK  | PB-EINT9  |
|           |             |           |            |             |             |             |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> |   PB10    |  UART0-RX   |  I2S0-DIN3  | I2S0-DOUBT3 |   PWM1-2    | PLL-LOCK-DBG |  TWI8-SDA   | TWI0-SDA  | PB-EINT10 |
| PB-EINT1  |             |  JTAG-CK  |            |  SPI2-CLK   |  UART0-RX   |  UART2-RX   |    PB1    | <div className='green'>11</div>  | <div className='green'>12</div> |    PB5    |  I2S0-BCLK  |  SPI2-CS2   |   PWM0-1    | TRACE-DATA0 |   TWI1-SDA   |  PB-EINT5   |           |           |
| PL-EINT6  |             | S-PWM0-4  |  S-IR-RX   | S-SPI0-MOSI | S-UART0-TX  |  S-JTAG-DO  |    PL6    | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |             |             |             |             |              |             |           |           |
| PL-EINT7  |             |           |  S-PWM0-5  | S-SPI0-MISO | S-UART0-RX  |  S-JTAG-DI  |    PL7    | <div className='green'>15</div>  | <div className='green'>16</div> |   PJ24    |   PWM1-6    |  UART4-TX   |  TWI4-SCK   |  SPI3-CLK   |  PJ-EINT24   |             |           |           |
|           |             |           |            |             |             |             |   3.3V    | <div className='yellow'>17</div> | <div className='green'>18</div> |   PJ25    |   PWM1-7    |  UART4-RX   |  TWI4-SDA   |  SPI3-MOSI  |  PJ-EINT25   |             |           |           |
| PD-EINT12 |   PWM1-2    | SPI1-MOSI |  EINK-D12  |  DSI1-D1P   |  LVDS1-D1P  |             |   PD12    | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |             |             |             |             |              |             |           |           |
| PD-EINT13 |   PWM1-3    | SPI1-MISO |  EINK-D13  |  DSI1-D1N   |  LVDS1-D1N  |             |   PD13    | <div className='green'>21</div>  | <div className='green'>22</div> |    PL5    |  S-JTAG-CK  | S-TWI2-SDA  | S-SPI0-CLK  |  S-PWM0-3   |   PL-EINT5   |             |           |           |
| PD-EINT11 |   PWM1-1    | SPI1-CLK  |  EINK-D11  |  DSI1-D0N   |  LVDS1-D0N  |             |   PD11    | <div className='green'>23</div>  | <div className='green'>24</div> |   PD10    |  LVDS1-D0P  |  DSI1-D0P   |  EINK-D10   |  SPI1-CS0   |    PWM1-0    |  PD-EINT10  |           |           |
|           |             |           |            |             |             |             |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> |   PD14    |  LVDS1-D2P  |  DSI1-CKP   |  EINK-D14   |  SPI1-HOLD  |  UART3-RTS   |  PD-EINT14  |           |           |
| PD-EINT17 |  UART3-RX   | TWI2-SDA  |  EINK-LEH  |  DSI1-D2N   |  LVDS1-CKN  |             |   PD17    |  <div className='blue'>27</div>  | <div className='blue'>28</div>  |   PD16    |  LVDS1-CKP  |  DSI1-D2P   |  EINK-OEH   |  TWI2-SCK   |   UART3-TX   |  PD-EINT16  |           |           |
| PB-EINT2  |  TWI0-SCK   |  JTAG-DO  |            |  HDMI-SCL   |  SPI2-MOSI  |  UART2-RTS  |    PB2    | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |             |             |             |             |              |             |           |           |
| PB-EINT3  |  TWI0-SDA   |  JTAG-DI  |            |  HDMI-SDA   |  SPI2-MISO  |  UART2-CTS  |    PB3    | <div className='green'>31</div>  | <div className='green'>32</div> |    PM5    | S-UART0-RX  | S-TWI2-SDA  | S-TWI1-SDA  | S-UART1-RX  |   S-PWM0-1   |   S-IR-RX   | PM-EINT5  |           |
| PM-EINT3  |             | S-PWM0-5  | S-UART1-RX | S-UART0-RX  | S-SPI0-MISO |  S-JTAG-DI  |    PM3    | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |             |             |             |             |              |             |           |           |
| PB-EINT6  | TRACE-DATA1 |  PWM0-8   |   PWM0-2   |  SPI2-CS3   |  I2S0-LRCK  | CLK-FANOUT1 |    PB6    | <div className='green'>35</div>  | <div className='green'>36</div> |    PB4    |   PWM0-0    |  I2S0-MCLK  |  SPI2-CS1   |  HDMI-CEC   |              |  TRACE-CLK  | TWI1-SCK  | PB-EINT4  |
| PM-EINT4  |   S-IR-RX   | S-PWM0-0  | S-UART1-TX | S-TWI1-SCK  | S-TWI2-SCK  | S-UART0-TX  |    PM4    | <div className='green'>37</div>  | <div className='green'>38</div> |    PB8    | CLK-FANOUT3 |  I2S0-DIN0  | I2S0-DOUBT1 |   PWM1-0    |   OWA0-OUT   | TRACE-DATA3 | TWI1-SDA  | PB-EINT8  |
|           |             |           |            |             |             |             |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> |    PB7    | CLK-FANOUT2 | I2S0-DOUBT0 |  I2S0-DIN1  |   PWM0-9    |   OWA0-IN    | TRACE-DATA2 | TWI1-SCK  | PB-EINT7  |

   </div>
</TabItem>
