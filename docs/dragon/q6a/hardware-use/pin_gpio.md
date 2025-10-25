---
sidebar_position: 9
---

# 40 Pin GPIO 接口

瑞莎 Dragon Q6A 板载 40-Pin GPIO（通用输入输出）接口，为硬件扩展提供了高度灵活的接口支持。

用户可以通过 40-Pin GPIO 接口连接各类传感器、执行器、通信模块、显示屏以及其他嵌入式外设，从而快速实现物联网（IoT）、机器人控制、工业自动化等领域的原型开发与功能验证。

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::danger
使用 40-Pin GPIO 接口时，请注意引脚和外设的接线，请确保引脚连接正确，不当操作可能导致设备硬件损坏。
:::

## GPIO 功能

Dragon Q6A 支持给板载的 GPIO 引脚外接外部设备，支持 UART、SPI、I2C、I3C、I2S 等。

<TabItem value="Dragon Q6A">
     <div className='gpio_style' style={{ overflow :"auto"}} >
| Function4  | Function3  | Function2  | Function1     | Function0  | Pin#                            | Pin#                           | Function0   | Function1   | Function2  | Function3   | Function4  |
|:----------:|:----------:|:----------:|:-------------:|:----------:|:-------------------------------:|:------------------------------:|:-----------:|:-----------:|:----------:|:-----------:|:----------:|
|            |            |            |               | 3V3        | <div className='yellow'>1</div> | <div className='red'>2</div>   | 5V          |             |            |             |            |
|            | SPI6_MISO  | I2C6_SDA   | UART6_CTS     | GPIO_24    | <div className='green'>3</div>  | <div className='red'>4</div>   | 5V          |             |            |             |            |
|            | SPI6_MOSI  | I2C6_SCL   | UART6_RFR     | GPIO_25    | <div className='green'>5</div>  | <div className='black'>6</div> | GND         |             |            |             |            |
|            |            |            | PRI_MI2S_MCLK | GPIO_96    | <div className='green'>7</div>  | <div className='green'>8</div> | GPIO_22     | UART5_TX    | SPI5_SCLK  |             |            |
|            |            |            |               | GND        | <div className='black'>9</div>  | <div className='green'>10</div>| GPIO_23     | UART5_RX    | SPI5_CS_0  |             |            |
|            | SPI7_MOSI  | I2C7_SCL   | UART7_RFR     | GPIO_29    | <div className='green'>11</div> | <div className='green'>12</div>| GPIO_97     | MI2S0_SCK   |            |             |            |
| I3C0_SDA   | SPI0_MISO  | I2C0_SDA   | UART0_CTS     | GPIO_0     | <div className='green'>13</div> | <div className='black'>14</div>| GND         |             |            |             |            |
| I3C0_SCL   | SPI0_MOSI  | I2C0_SCL   | UART0_RFR     | GPIO_1     | <div className='green'>15</div> | <div className='green'>16</div>| GPIO_26     | UART6_TX    | SPI6_SCLK  |             |            |
|            |            |            |               | 3V3        | <div className='yellow'>17</div>| <div className='green'>18</div>| GPIO_27     | UART6_RX    | SPI6_CS_0  |             |            |
|            | SPI12_MOSI | I2C12_SCL  | UART12_RFR    | GPIO_49    | <div className='green'>19</div> | <div className='black'>20</div>| GND         |             |            |             |            |
|            | SPI12_MISO | I2C12_SDA  | UART12_CTS    | GPIO_48    | <div className='green'>21</div> | <div className='green'>22</div>| GPIO_57     | UART14_RFR  | I2C14_SCL  | SPI14_MOSI  |            |
|            | SPI14_CS_3 | SPI12_SCLK | UART12_TX     | GPIO_50    | <div className='green'>23</div> | <div className='green'>24</div>| GPIO_51     | UART12_RX   | SPI12_CS_0 |             |            |
|            |            |            |               | GND        | <div className='black'>25</div> | <div className='green'>26</div>| GPIO_55     | UART13_RX   | SPI13_CS_0 | SPI12_CS_1  |            |
|            | SPI2_MISO  | I2C2_SDA   | UART2_CTS     | GPIO_8     | <div className='blue'>27</div>  | <div className='blue'>28</div> | GPIO_9      | UART2_RFR   | I2C2_SCL   | SPI2_MOSI   |            |
|            |            | SPI7_CS_0  | UART7_RX      | GPIO_31    | <div className='green'>29</div> | <div className='black'>30</div>| GND         |             |            |             |            |
|            | SPI7_MISO  | I2C7_SDA   | UART7_CTS     | GPIO_28    | <div className='green'>31</div> | <div className='green'>32</div>| GPIO_30     | UART7_TX    | SPI7_SCLK  |             |            |
|            | SPI14_MISO | I2C14_SDA  | UART14_CTS    | GPIO_56    | <div className='green'>33</div> | <div className='black'>34</div>| GND         |             |            |             |            |
|            |            |            | MI2S0_WS      | GPIO_100   | <div className='green'>35</div> | <div className='green'>36</div>| GPIO_59     | UART14_RX   | SPI14_CS_0 |             |            |
|            |            | SPI14_SCLK | UART14_TX     | GPIO_58    | <div className='green'>37</div> | <div className='green'>38</div>| GPIO_98     | MI2S0_DATA0 |            |             |            |
|            |            |            |               | GND        | <div className='black'>39</div> | <div className='green'>40</div>| GPIO_99     | MI2S0_DATA1 |            |             |            |
   </div>
</TabItem>
