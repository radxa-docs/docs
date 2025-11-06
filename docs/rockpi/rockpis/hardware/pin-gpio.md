---
sidebar_position: 5
---

# GPIO 拓展座

瑞莎 ROCK Pi S 配备 2 个 26 引脚的 GPIO 扩展接口，为硬件扩展提供了高度灵活的接口支持。

用户可以通过 GPIO 口连接各类传感器、执行器、通信模块、显示屏以及其他嵌入式外设，从而快速实现物联网（IoT）、机器人控制、工业自动化等领域的原型开发与功能验证。

<div style={{ textAlign: 'center' }}> 26 Pin GPIO 拓展座 1 </div>

<TabItem value="26 Pin GPIO 拓展座 1">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

| Function4 | Function3    | Function2     | Function1 | Pin#                             | Pin#                            | Function1 | Function2        | Function3 | Function4 |
| --------- | ------------ | ------------- | --------- | -------------------------------- | ------------------------------- | --------- | ---------------- | --------- | --------- |
|           |              |               |           |                                  |                                 |           |                  |           |           |
|           |              |               | +3.3V     | <div className='yellow'>1</div>  | <div className='red'>2</div>    | +5.0V     |                  |           |           |
|           |              | I2C1_SDA      | GPIO0_B3  | <div className='green'>3</div>   | <div className='red'>4</div>    | +5.0V     |                  |           |           |
|           |              | I2C1_SCL      | GPIO0_B4  | <div className='green'>5</div>   | <div className='black'>6</div>  | GND       |                  |           |           |
|           | PDM_CLK_M_M2 | I2S0_8CH_MCLK | GPIO2_A4  | <div className='green'>7</div>   | <div className='green'>8</div>  | GPIO2_A1  | UART0_TX         | SPI0_MOSI |           |
|           |              |               | GND       | <div className='black'>9</div>   | <div className='green'>10</div> | GPIO2_A0  | UART0_RX         | SPI0_MISO |           |
|           | I2C3_SDA_M0  | PWM2          | GPIO0_B7  | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO2_A5  | I2S0_8CH_SCLK_TX |           |           |
|           | I2C3_SCL_M0  | PWM3          | GPIO0_C0  | <div className='green'>13</div>  | <div className='black'>14</div> | GND       |                  |           |           |
|           |              | SPDIF_TX      | GPIO0_C1  | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO2_B2  | I2S0_8CH_SDO1    |           |           |
|           |              |               | +3.3V     | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO2_B1  | I2S0_8CH_SDO0    |           |           |
| SPI2_MOSI | UART2_TX_M0  | UART1_RTSN    | GPIO1_C7  | <div className='green'>19</div>  | <div className='black'>20</div> | GND       |                  |           |           |
| SPI2_MISO | UART2_RX_M0  | UART1_CTSN    | GPIO1_C6  | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO2_A7  | I2S0_8CH_LRCK_TX |           |           |
| SPI2_CLK  | I2C0_SDA     | UART1_RX      | GPIO1_D0  | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO1_D1  | UART1_TX         | I2C0_SCL  | SPI2_CSN0 |
|           |              |               | GND       | <div className='black'>25</div>  | <div className='green'>26</div> | ADC_IN0   |                  |           |           |

   </div>
</TabItem>

<div style={{ textAlign: 'center' }}> 26 Pin GPIO 拓展座 2 </div>

<TabItem value="26 Pin GPIO 拓展座 2">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

| Function4 | Function3   | Function2        | Function1   | Pin#                            | Pin#                            | Function1 | Function2        | Function3    | Function4 |
| --------- | ----------- | ---------------- | ----------- | ------------------------------- | ------------------------------- | --------- | ---------------- | ------------ | --------- |
|           |             |                  |             |                                 |                                 |           |                  |              |           |
|           |             |                  | GND         | <div className='black'>27</div> | <div className='green'>28</div> | GPIO2_B5  | I2S0_8CH_SDI0    | PDM_SDI0_M2  |           |
|           |             |                  | ADC_KEY_IN1 | <div className='green'>29</div> | <div className='green'>30</div> | GPIO2_B6  | I2S0_8CH_SDI1    | PDM_SDI1_M2  |           |
|           |             |                  | MICBIAS2    | <div className='green'>31</div> | <div className='green'>32</div> | GPIO2_B7  | I2S0_8CH_SDI2    | PDM_SDI2_M2  |           |
|           |             |                  | MICBIAS1    | <div className='green'>33</div> | <div className='green'>34</div> | GPIO2_C0  | I2S0_8CH_SDI3    | PDM_SDI3_M2  |           |
|           |             |                  | MICN8       | <div className='green'>35</div> | <div className='green'>36</div> | MCIP8     |                  |              |           |
|           |             |                  | MICN7       | <div className='green'>37</div> | <div className='green'>38</div> | MCIP7     |                  |              |           |
| UART3_TX  | I2C3_SCL_M1 | SPI1_CSN0        | GPIO3_B5    | <div className='green'>39</div> | <div className='green'>40</div> | GPIO3_B4  | SPI1_MOSI        | I2C3_SDA_M1  | UART3_RX  |
|           |             | SPI1_CLK         | GPIO3_B3    | <div className='green'>41</div> | <div className='green'>42</div> | GPIO3_B2  | SPI1_MISO        |              |           |
|           |             | I2S0_8CH_SDO3    | GPIO2_B4    | <div className='green'>43</div> | <div className='green'>44</div> | GPIO2_B3  | I2S0_8CH_SDO2    |              |           |
|           |             | I2S0_8CH_LRCK_RX | GPIO2_B0    | <div className='green'>45</div> | <div className='green'>46</div> | GPIO2_A6  | I2S0_8CH_SCLK_RX | PDM_CLK_S_M2 |           |
|           |             |                  | MICN2       | <div className='green'>47</div> | <div className='green'>48</div> | MCIP2     |                  |              |           |
|           |             |                  | MICN1       | <div className='green'>49</div> | <div className='green'>50</div> | MCIP1     |                  |              |           |
|           |             |                  | LINEOUT_R   | <div className='green'>51</div> | <div className='green'>52</div> | LINEOUT_L |                  |              |           |

   </div>
</TabItem>
