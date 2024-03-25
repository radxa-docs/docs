---
sidebar_position: 4
---

# GPIO 接口

ROCK Pi E 提供了一个40 pin 针脚的 GPIO 座子。

**提示：实际兼容情况以使用情况为准。**
**提示：V1.20，V1.21 和 V3.0 的 40-Pin GPIO 引脚功能一致**

<div className='gpio_style'>

| GPIO Number | Function3  | Function2    | Function1 | Pin#                             | Pin#                            | Function1 | Function2    | Function3 | GPIO Number |
| ----------- | ---------- | ------------ | --------- | -------------------------------- | ------------------------------- | --------- | ------------ | --------- | ----------- | --- |
|             |            |              | +3.3V     | <div className='yellow'>1</div>  | <div className='red'>2</div>    | +5.0V     |              |           |             |     |
| 100         |            | UART1_TX     | GPIO3_A4  | <div className='green'>3</div>   | <div className='red'>4</div>    | +5.0V     |              |           |             |     |
| 102         |            | UART1_RX     | GPIO3_A6  | <div className='green'>3</div>   | <div className='black'>6</div>  | GND       |              |           |             |     |
| 60          |            |              | GPIO1_D4  | <div className='green'>7</div>   | <div className='green'>8</div>  | GPIO2_A0  | UART2_TX     |           |             | 64  |
|             |            |              | GND       | <div className='black'>9</div>   | <div className='green'>10</div> | GPIO2_A1  | UART2_RX     |           |             | 65  |
| 66          |            | PWM_IR       | GPIO2_A2  | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO2_C2  | PDM_CLK      | I2S_SCLK  |             | 82  |
| 67          |            |              | GPIO2_A3  | <div className='green'>13</div>  | <div className='black'>14</div> | GND       |              |           |             |     |
| 27          |            |              | GPIO0_D3  | <div className='green'>15</div>  | <div className='green'>16</div> | USB20DM   |              |           |             |     |
|             |            |              | +3.3V     | <div className='yellow'>17</div> | <div className='green'>18</div> | USB20DP   |              |           |             |     |
| 97          |            | SPI0_TXD     | GPIO3_A1  | <div className='green'>19</div>  | <div className='black'>20</div> | GND       |              |           |             |     |
| 98          |            | SPI0_RXD     | GPIO3_A2  | <div className='green'>21</div>  | <div className='green'>22</div> | ADC_IN1   |              |           |             |     |
| 96          |            | SPI0_CLK     | GPIO3_A0  | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO3_B0  | SPI0_CSN0    |           |             | 104 |
|             |            |              | GND       | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO2_B4  |              |           |             | 76  |
| 68          |            | I2C1_SDA     | GPIO2_A4  | <div className='blue'>27</div>   | <div className='blue'>28</div>  | GPIO2_A5  | I2C1_SCL     |           |             | 69  |
| 84          | I2S1_SDIO1 | PDM_SDI1     | GPIO2_C4  | <div className='green'>29</div>  | <div className='black'>30</div> | GND       |              |           |             |     |
| 85          | I2S1_SDIO2 | PDM_SDI2     | GPIO2_C5  | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO2_C0  | I2S1_LRCK_RX |           |             | 80  |
| 70          |            | PWM2         | GPIO2_A6  | <div className='green'>33</div>  | <div className='black'>34</div> | GND       |              |           |             |     |
| 81          |            | I2S1_LRCK_TX | GPIO2_C1  | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO2_B7  | I2S1_MCLK    |           |             | 79  |
| 86          |            | PDM_SDI3     | GPIO2_C6  | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO2_C3  | PDM_SDIO     | I2S1_SDI  |             | 83  |
|             |            |              | GND       | <div className='green'>39</div>  | <div className='green'>40</div> | GPIO2_C7  | PDM_FSYNC    | I2S1_SDO  |             | 87  |

</div>
