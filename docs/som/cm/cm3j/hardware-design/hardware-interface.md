---
sidebar_position: 1
---

# 硬件接口说明

## 芯片框图

<img src="/img/rock3/3b/rk3568-block-diagram.webp" alt="rk3568 chip block diagram" style={{ width: "80%" }} />

## 系统框图

<img src="/img/cm3j/radxa-cm3j-System-block-diagram.webp" alt="cm3j board block diagram" style={{ width: "80%" }} />

## 相关接口

<img src="/img/cm3j/radxa-cm3j-hardware-overview.webp" alt="cm3j" style={{ width: "80%" }} />

### 40-PIN GPIO

:::caution
提示：实际兼容性以实际使用情况为准。
:::

:::tip

以下引脚布局适用于树莓派 Compute Module 4 IO，WaveShare CM4-POE-UPS-BASE，WaveShare CM4-IO-BASE-B，WaveShare CM4-NANO-B

:::

| GPIO number |    Function4    |  Function3   |  Function2  | Function1 |               Pin#               |              Pin#               | Function1 |                 Function2                 |  Function3   |    Function4    | GPIO number |
| ----------- | :-------------: | :----------: | :---------: | :-------: | :------------------------------: | :-----------------------------: | :-------: | :---------------------------------------: | :----------: | :-------------: | ----------- |
|             |                 |              |             |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |                                           |              |                 |             |
| 110         |                 | PWM11_IR_M0  | I2C3_SDA_M1 | GPIO3_B6  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |                                           |              |                 |             |
| 109         |                 |   PWM10_M0   | I2C3_SCL_M1 | GPIO3_B5  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |                                           |              |                 |             |
| 94          |  I2S1_SDI3_M2   | SPI2_MOSI_M1 |             | GPIO2_D6  |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_D1  | <div className='orange'>UART2_TX_M0</div> |              |                 | 25          |
|             |                 |              |             |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_D0  | <div className='orange'>UART2_RX_M0</div> |              |                 | 24          |
| 106         |                 |   PWM9_M0    | UART4_TX_M1 | GPIO3_B2  | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO3_A3  |                                           |              |  I2S3_SCLK_M0   | 99          |
| 105         |                 |   PWM8-M0    | UART4_RX_M1 | GPIO3_B1  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |                                           |              |                 |             |
| 112         |   PDM_SDI3_M2   |   PWM13_M0   | UART3_RX_M1 | GPIO3_C0  | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO3_C1  |                                           | SPI1_MOSI_M1 |  I2S1_SDO2_M2   | 113         |
|             |                 |              |             |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO3_A1  |                                           | SPI1_CS0_M1  |                 | 97          |
| 89          | I2S1_SCLK_TX_M2 | SPI0_MOSI_M1 |             | GPIO2_D1  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |                                           |              |                 |             |
| 88          |  I2S1_MCLK_M2   | SPI0_MISO_M1 |             | GPIO2_D0  | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO3_A2  |                                           |              |  I2S3_MCLK_M0   | 98          |
| 91          |  I2S1_SDI0_M2   | SPI0_CLK_M1  |             | GPIO2_D3  | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO2_D2  |                                           | SPI0_CS0_M1  | I2S1_LRCK_TX_M2 | 90          |
|             |                 |              |             |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO3_C2  |                UART5_TX_M1                | SPI1_MISO_M1 |  I2S1_SDO3_M2   | 114         |
| 108         |   PDM_SDI1_M2   |              | I2C5_SDA_M0 | GPIO3_B4  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO3_B3  |                                           | I2C5_SCL_M0  |   PDM_SDI0_M2   | 107         |
| 96          |  I2S1_SDO1_M2   | SPI2_CLK_M1  | UART8_RX_M1 | GPIO3_A0  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |                                           |              |                 |             |
| 95          |  I2S1_SDO0_M2   | SPI2_MISO_M1 | UART8_TX_M1 | GPIO2_D7  | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO3_B7  |                UART3_TX_M1                |   PWM12_M0   |   PDM_SDI2_M2   | 111         |
| 93          |  I2S1_SDI2_M2   | SPI2_CS0_M1  |             | GPIO2_D5  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |                                           |              |                 |             |
| 100         |  I2S3_LRCK_M0   |              |             | GPIO3_A4  | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO3_C3  |                UART5_RX_M1                | SPI1_CLK_M1  | I2S1_SCLK_RX_M2 | 115         |
| 117         | I2S1_LRCK_RX_M2 | PWM15_IR_M0  |             | GPIO3_C5  | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO3_A6  |                                           |              |   I2S3_SDI_M0   | 102         |
|             |                 |              |             |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO3_A5  |                                           |              |   I2S3_SDO_M0   | 101         |
