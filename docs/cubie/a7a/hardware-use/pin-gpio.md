---
sidebar_position: 4
---

# 40 Pin GPIO 接口

瑞莎 Cubie A7A 板载 40-Pin GPIO（通用输入输出）接口，为硬件扩展提供了高度灵活的接口支持。

用户可以通过 40-Pin GPIO 接口连接各类传感器、执行器、通信模块、显示屏以及其他嵌入式外设，从而快速实现物联网（IoT）、机器人控制、工业自动化等领域的原型开发与功能验证。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-gpio.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::danger
使用 40-Pin GPIO 接口时，请注意引脚和外设的接线，请确保引脚连接正确，不当操作可能导致设备硬件损坏。
:::

## GPIO 功能

Cubie A7A 支持给板载的 GPIO 引脚外接外部设备，支持 UART、SPI、I2C、ADC 等。

<TabItem value="Cubie A7A">
     <!-- <div className='gpio_style' style={{ overflow :"auto"}} >

|   Function7   |  Function6   |  Function5  |  Function4   |  Function3  |   Function2   | Function1  |               Pin#               |              Pin#               | Function1  |     Function2     |   Function3    |  Function4   |  Function5  |  Function6   |   Function7   |
| :-----------: | :----------: | :---------: | :----------: | :---------: | :-----------: | :--------: | :------------------------------: | :-----------------------------: | :--------: | :---------------: | :------------: | :----------: | :---------: | :----------: | :-----------: |
|               |              |             |              |             |               |    3V3     | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |     5V     |                   |                |              |             |              |               |
|               | PDM0_SDI1_M2 |             |              | I2C8_SDA_M1 |  UART2_RX_M0  | GPIO1_C7_d |  <div className='green'>3</div>  |  <div className='red'>4</div>   |     5V     |                   |                |              |             |              |               |
|               | PDM0_SDI0_M2 |             |              | I2C8_SCL_M1 |  UART2_TX_M0  | GPIO1_C6_d |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND     |                   |                |              |             |              |               |
|               |              |             | SPI2_CSN0_M1 | I2C6_SDA_M1 | UART4_CTSN_M1 | GPIO1_C3_u |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_D4_u | UART0_TX_M0_DEBUG |                |              |             |              |               |
|               |              |             |              |             |               |    GND     |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_D5_u | UART0_RX_M0_DEBUG |                |              |             |              |               |
| UART2_RTSN_M0 |              |             | SPI2_MOSI_M1 |             |  UART4_TX_M1  | GPIO1_C4_d | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO1_D1_d |   UART10_RX_M1    | I3C0_SDA_PU_M1 |              |             | SAI2_SCLK_M0 |               |
|               |              | PWM1_CH0_M2 |              |             |               | GPIO2_C0_d | <div className='green'>13</div>  | <div className='black'>14</div> |    GND     |                   |                |              |             |              |               |
| UART2_CTSN_M0 |              |             | SPI2_MISO_M1 |             |  UART4_RX_M1  | GPIO1_C5_d | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO2_B6_d |    UART7_TX_M0    |  I2C8_SCL_M2   |              |             |              |               |
|               |              |             |              |             |               |    3V3     | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO2_B7_d |    UART7_RX_M0    |  I2C8_SDA_M2   |              |             |              |               |
|               | SAI3_LRCK_M1 | PWM1_CH1_M1 | SPI1_MOSI_M0 | I2C9_SCL_M1 |               | GPIO1_B5_d | <div className='green'>19</div>  | <div className='black'>20</div> |    GND     |                   |                |              |             |              |               |
|               | SAI3_SDO_M1  |             | SPI1_MISO_M0 |             | UART3_CTSN_M2 | GPIO1_B6_d | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO2_D7_d |                   |                |              | PWM2_CH7_M2 |              |               |
|               | SAI3_SCLK_M1 | PWM1_CH0_M1 | SPI1_CLK_M0  | I2C9_SDA_M1 |               | GPIO1_B4_d | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO1_B7_d |                   |                | SPI1_CSN0_M0 |             | SAI3_SDI_M1  | UART3_RTSN_M2 |
|               |              |             |              |             |               |    GND     | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO1_C0_d |    UART3_TX_M2    |                | SPI1_CSN1_M0 | PWM0_CH0_M1 | PDM0_SDI2_M2 |               |
|  CAN1_RX_M1   | SAI4_SCLK_M2 | PWM2_CH3_M1 |              | I2C6_SDA_M3 |               | GPIO4_C7_d |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO4_C6_d |                   |  I2C6_SCL_M3   |              | PWM2_CH2_M1 | SAI4_SDI_M2  |  CAN1_TX_M1   |
|  CAN1_TX_M3   |              |             |              |             |               | GPIO3_A2_d | <div className='green'>29</div>  | <div className='black'>30</div> |    GND     |                   |                |              |             |              |               |
| PDM0_CLK0_M2  | SAI3_MCLK_M1 |             |              |             |  UART3_RX_M2  | GPIO1_C1_d | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO1_D5_d |  UART10_CTSN_M1   |  I2C5_SDA_M1   | SPI2_CLK_M1  |             | PDM0_CLK1_M2 |               |
|               |              | PWM1_CH2_M1 | SPI2_CSN1_M1 | I2C6_SCL_M1 | UART4_RTSN_M1 | GPIO1_C2_u | <div className='green'>33</div>  | <div className='black'>34</div> |    GND     |                   |                |              |             |              |               |
|               | SAI2_LRCK_M0 | PWM1_CH3_M1 |              | I3C0_SCL_M1 |               | GPIO1_D2_d | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO1_D4_d |  UART10_RTSN_M1   |  I2C5_SCL_M1   |              |             | SAI2_MCLK_M0 | PDM0_SDI3_M2  |
|  CAN1_RX_M3   |              |             |              |             |               | GPIO3_A3_d | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO1_D3_d |                   |  I3C0_SDA_M1   |              | PWM1_CH4_M1 | SAI2_SDI_M0  |               |
|               |              |             |              |             |               |    GND     | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO1_D0_d |   UART10_TX_M1    |                |              |             | SAI2_SDO_M0  |               |

   </div> -->
</TabItem>
