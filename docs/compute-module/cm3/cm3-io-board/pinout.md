---
sidebar_position: 50
---

# 引脚定义

## 电压范围

| Type | Voltage | Tolerance |
| ---- | ------- | --------- |
| GPIO | 3.3V    | 3.63V     |
| ADC  | 1.8V    | 1.98V     |

## GPIO 接口

Radxa CM3 IO 提供一个 40 pin GPIO 扩展座，兼容市场上大多数传感器应用。

:::caution
提示：实际兼容性以实际使用情况为准。
:::

<Tabs queryString="revision">
<TabItem value="v1_1" label="v1.1">

<div className='gpio_style'>

Radxa CM3 IO 板和 Raspberry Pi CM4 IO 底板的 40 引脚扩展头是兼容的。以下引脚布局适用于这两种产品：

| GPIO number |  Function4  |  Function3   |    Function2    | Function1 |               Pin#               |              Pin#               | Function1 |                 Function2                 |  Function3   |  Function4   | GPIO number |
| ----------- | :---------: | :----------: | :-------------: | :-------: | :------------------------------: | :-----------------------------: | :-------: | :---------------------------------------: | :----------: | :----------: | ----------- |
|             |             |              |                 |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |                                           |              |              |             |
| 14          |   PWM2_M1   | SPI0_MOSI_M0 |   I2C2_SDA_M0   | GPIO0_B6  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |                                           |              |              |             |
| 13          |   PWM1_M1   | SPI0_CLK_M0  |   I2C2_SCL_M0   | GPIO0_B5  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |                                           |              |              |             |
| 125         |             |              |  I2S1_SDI3_M1   | GPIO3_D5  |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_D1  | <div className='orange'>UART2_TX_M0</div> |              |              | 25          |
|             |             |              |                 |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_D0  | <div className='orange'>UART2_RX_M0</div> |              |              | 24          |
| 23          |             |  UART0_CTSn  |     PWM0_M1     | GPIO0_C7  | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO3_C7  |              I2S1_SCLK_TX_M1              |              |              | 119         |
| 15          |             |              |     PWM0_M0     | GPIO0_B7  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |                                           |              |              |             |
| 19          |             |              |      PWM4       | GPIO0_C3  | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO3_D4  |               I2S1_SDI2_M1                |              |              | 124         |
|             |             |              |                 |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO3_D3  |               I2S1_SDI1_M1                |              |              | 123         |
| 138         | I2C4_SDA_M0 | I2S2_SDI_M1  |  SPI3_MOSI_M0   | GPIO4_B2  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |                                           |              |              |             |
| 136         |             | I2S1_SDO1_M1 |  SPI3_MISO_M0   | GPIO4_B0  | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO3_C6  |               I2S1_MCLK_M1                |              |              | 118         |
| 139         | I2C4_SCL_M0 | I2S2_SDO_M1  |   SPI3_CLK_M0   | GPIO4_B3  | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO4_A6  |                SPI3_CS0_M0                | I2S1_SCLK_RX |              | 134         |
|             |             |              |                 |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO4_C5  |                UART9_TX_M1                | I2S3_SDO_M1  | SPI3_MISO_M1 |             |
| 140         |             |              |   I2C2_SDA_M1   | GPIO4_B4  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO4_B5  |                I2C2_SCL_M1                | I2S1_SDO3_M1 |              | 141         |
| 137         |             |              |  I2S1_SDO2_M1   | GPIO4_B1  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |                                           |              |              |             |
| 21          |             |     PWM6     |  SPI0_MISO_M0   | GPIO0_C5  | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO4_C0  |                PWM11_IR_M1                |              |              | 144         |
| 22          |             |   PWM7_IR    |   SPI0_CS0_M0   | GPIO0_C6  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |                                           |              |              |             |
| 120         |             |              | I2S1_LRCK_TX_M1 | GPIO3_D0  | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO4_A7  |              I2S1_LRCK_RX_M1              |              |              | 135         |
| 18          |             |              |     PWM3_IR     | GPIO0_C2  | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO3_D2  |               I2S1_SDI0_M1                |              |              | 122         |
|             |             |              |                 |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO3_D1  |               I2S1_SDO0_M1                |              |              | 121         |

</div>

### 关于 V1.1 硬件版本的 40-pin 扩展座的补充

- 标有橙色的引脚用于 debug console。
- PWM: x8, PWM0 / PWM1 / PWM2 / PWM3 / PWM4 / PWM6 / PWM7 / PWM11
- SPI: x2, SPI0 / SPI3
- I2C: x2, I2C2 / I2C4
- UART: x1, UART2

</TabItem>
</Tabs>
