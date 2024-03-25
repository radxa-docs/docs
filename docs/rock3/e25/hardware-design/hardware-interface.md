---
sidebar_position: 4
---

# 硬件接口说明

## 接口总览

- Radxa E25
  ![Radxa E25](/img/cm3i/e25/e25-overview.webp)

## 26 PIN GPIO

#### GPIO 电压

| GPIO        | 电压 | 最高  |
| ----------- | ---- | ----- |
| 所有的 GPIO | 3.3V | 3.63V |
| SARADC_IN5  | 3.3V | 3.3V  |

#### GPIO 接口

E25 提供了一个 26 pin 针脚的 GPIO 座子

**提示：实际兼容情况以使用情况为准。**

<div className='gpio_style'>

| Gpio number | Function3       | Function2   | Function1    |   GPIO   |               PIN               |               PIN               |    GPIO     | Function1    | Function2   | Function3       | Gpio number |
| :---------: | --------------- | ----------- | ------------ | :------: | :-----------------------------: | :-----------------------------: | :---------: | ------------ | ----------- | --------------- | :---------: |
|             |                 |             |              |   3.3V   | <div className='yellow'>1</div> |  <div className='red'>2</div>   |     5V      |              |             |                 |             |
|     32      | I2C3_SDA_M0     | CAN1_RX_M0  | UART3_RX_M0  | GPIO1_A0 | <div className='green'>3</div>  |  <div className='red'>3</div>   |     5V      |              |             |                 |             |
|     33      | I2C3_SCL_M0     | CAN1_TX_M0  | UART3_TX_M0  | GPIO1_A1 | <div className='green'>5</div>  | <div className='black'>6</div>  |     GND     |              |             |                 |             |
|     111     | UART3_TX_M1     | PWM12_M0    |              | GPIO3_B7 | <div className='green'>7</div>  | <div className='green'>8</div>  |  GPIO3_C2   | SPI1_MISO_M1 | UART5_TX_M1 | I2S1_SDO3_M2    |     114     |
|             |                 |             |              |   GND    | <div className='black'>9</div>  | <div className='green'>10</div> |  GPIO3_C3   | SPI1_CLK_M1  | UART5_RX_M1 | I2S1_SCLK_RX_M2 |     115     |
|     116     |                 | UART7_TX_M1 | PWM14_M0     | GPIO3_C4 | <div className='green'>11</div> | <div className='green'>12</div> |  GPIO3_A3   |              |             |                 |     99      |
|     117     | I2S1_LRCK_RX_M2 | UART7_RX_M1 | PWM15_IR_M0  | GPIO3_C5 | <div className='green'>13</div> | <div className='black'>14</div> |     GND     |              |             |                 |             |
|     113     | I2S1_SDO2_M2    |             | SPI1_MOSI_M1 | GPIO3_C1 | <div className='green'>15</div> | <div className='green'>16</div> |  GPIO2_D2   | SPI0_CSO_M1  |             | I2S1_LRCK_TX_M2 |     90      |
|     97      |                 |             | SPI1_CS0_M1  | GPIO3_A1 | <div className='green'>17</div> | <div className='green'>18</div> |  GPIO0_C6   |              | PWM7_IR     |                 |     22      |
|     89      | I2S1_SCLK_TX_M2 |             | SPI0_MOSI_M1 | GPIO2_D1 | <div className='green'>19</div> | <div className='black'>20</div> |     GND     |              |             |                 |             |
|     88      | I2S1_MCLK_M2    |             | SPI0_MISO_M1 | GPIO2_D0 | <div className='green'>21</div> | <div className='green'>22</div> | SARADC_VIN5 |              |             |                 |             |
|     91      | I2S1_SDI0_M2    |             | SPI0_CLK_M1  | GPIO2_D3 | <div className='green'>23</div> | <div className='green'>24</div> |  GPIO4_C6   |              | PWM13_M1    |                 |     150     |
|             |                 |             |              |   GND    | <div className='black'>25</div> | <div className='green'>26</div> |  GPIO3_C0   |              | PWM13_M0    | UART3_RX_M1     |     112     |

</div>
