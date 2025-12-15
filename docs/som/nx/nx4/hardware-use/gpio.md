---
sidebar_position: 5
---

# 40-Pin GPIO 排针

瑞莎 NX4 载板板载 40-Pin GPIO（通用输入输出）接口，为硬件扩展提供了高度灵活的接口支持。

用户可以通过 40-Pin GPIO 接口连接各类传感器、执行器、通信模块、显示屏以及其他嵌入式外设，从而快速实现物联网、机器人控制、工业自动化等领域的原型开发与功能验证。

:::danger 使用说明

使用 40-Pin GPIO 接口时，请注意引脚和外设的接线，请确保引脚连接正确，不当操作可能导致设备硬件损坏。

:::

## GPIO 功能

<TabItem value="C200 NX4">
     <div className='gpio_style' style={{ overflow :"auto"}}  >

| GPIO number |  Function5  |  Function4   |  Function3  |  Function2  | Function1 | Voltage |               Pin#               |              Pin#               | Voltage | Function1 |  Function2   |  Function3  |  Function4   |  Function5  | Function6  | GPIO number |
| :---------: | :---------: | :----------: | :---------: | :---------: | :-------: | :-----: | :------------------------------: | :-----------------------------: | :-----: | :-------: | :----------: | :---------: | :----------: | :---------: | :--------: | :---------: |
|             |             |              |             |             |           |  3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   5V    |           |              |             |              |             |            |             |
|     55      |             |              | I2C8_SDA_M1 | UART2_RX_M0 | GPIO1_C7  |  3.3V   |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   5V    |           |              |             |              |             |            |             |
|     54      |             |              | I2C8_SCL_M1 | UART2_TX_M0 | GPIO1_C6  |  3.3V   |  <div className='green'>5</div>  | <div className='black'>6</div>  |   GND   |           |              |             |              |             |            |             |
|     51      |             | SPI2_CSN0_M1 |             |             | GPIO1_C3  |  3.3V   |  <div className='green'>7</div>  | <div className='green'>8</div>  |  3.3V   | GPIO4_B4  | UART2_RX_M1  |             |              |             | CAN1_RX_M2 |     140     |
|             |             |              |             |             |           |   GND   |  <div className='black'>9</div>  | <div className='green'>10</div> |  3.3V   | GPIO4_B5  | UART2_TX_M1  |             |              |             | CAN1_TX_M2 |     141     |
|     52      |             | SPI2_MOSI_M1 |             | UART4_TX_M1 | GPIO1_C4  |  3.3V   | <div className='green'>11</div>  | <div className='green'>12</div> |  3.3V   | GPIO1_D1  | UART10_RX_M1 |             |              |             |            |     57      |
|     80      | PWM1_CH0_M2 |              |             |             | GPIO2_C0  |  3.3V   | <div className='green'>13</div>  | <div className='black'>14</div> |   GND   |           |              |             |              |             |            |             |
|     53      |             | SPI2_MISO_M1 |             | UART4_RX_M1 | GPIO1_C5  |  3.3V   | <div className='green'>15</div>  | <div className='green'>16</div> |  3.3V   | GPIO2_B6  | UART7_TX_M0  |             |              |             |            |     78      |
|             |             |              |             |             |           |  3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> |  3.3V   | GPIO2_B7  | UART7_RX_M0  |             |              |             |            |     79      |
|     45      | PWM1_CH1_M1 | SPI1_MOSI_M0 |             |             | GPIO1_B5  |  3.3V   | <div className='green'>19</div>  | <div className='black'>20</div> |   GND   |           |              |             |              |             |            |             |
|     46      |             | SPI1_MISO_M0 |             |             | GPIO1_B6  |  3.3V   | <div className='green'>21</div>  | <div className='green'>22</div> |  3.3V   | GPIO2_D7  |              |             |              | PWM2_CH7_M2 |            |     95      |
|     44      | PWM1_CH0_M1 | SPI1_CLK_M0  |             |             | GPIO1_B4  |  3.3V   | <div className='green'>23</div>  | <div className='green'>24</div> |  3.3V   | GPIO1_B7  |              |             | SPI1_CSN0_M0 |             |            |     47      |
|             |             |              |             |             |           |   GND   | <div className='black'>25</div>  | <div className='green'>26</div> |  3.3V   | GPIO1_C0  | UART3_TX_M2  |             | SPI1_CSN1_M0 | PWM0_CH0_M1 |            |     48      |
|     151     |             |              | I2C6_SDA_M3 |             | GPIO4_C7  |  3.3V   |  <div className='blue'>27</div>  | <div className='blue'>28</div>  |  3.3V   | GPIO4_C6  |              | I2C6_SCL_M3 |              |             |            |     150     |
|     98      |             |              |             |             | GPIO3_A2  |  3.3V   | <div className='green'>29</div>  | <div className='black'>30</div> |   GND   |           |              |             |              |             |            |             |
|     49      |             |              |             | UART3_RX_M2 | GPIO1_C1  |  3.3V   | <div className='green'>31</div>  | <div className='green'>32</div> |  3.3V   | GPIO1_D5  |              |             | SPI2_CLK_M1  |             |            |     61      |
|     50      | PWM1_CH2_M1 | SPI2_CSN1_M1 |             |             | GPIO1_C2  |  3.3V   | <div className='green'>33</div>  | <div className='black'>34</div> |   GND   |           |              |             |              |             |            |             |
|     58      | PWM1_CH3_M1 |              |             |             | GPIO1_D2  |  3.3V   | <div className='green'>35</div>  | <div className='green'>36</div> |  3.3V   | GPIO1_D4  |              |             |              |             |            |     60      |
|     99      |             |              |             |             | GPIO3_A3  |  3.3V   | <div className='green'>37</div>  | <div className='green'>38</div> |  3.3V   | GPIO1_D3  |              |             |              | PWM1_CH4_M1 |            |     59      |
|             |             |              |             |             |           |   GND   | <div className='black'>39</div>  | <div className='green'>40</div> |  3.3V   | GPIO1_D0  | UART10_TX_M1 |             |              |             |            |     56      |

   </div>
</TabItem>
