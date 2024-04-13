---
sidebar_position: 4
---

# 硬件接口说明

## 接口总览

![Radxa CM5](/img/cm5/cm5-overview.webp)

![Radxa CM5 IO Board](/img/cm5/cm5-io-board-overview.webp)

## 电源接口

Radxa CM5 IO 采用 DC 电源接口供电，支持 5V、12V 输入，推荐使用12V，这样供电比较稳定。

## 调试串口

用于[串口调试](../radxa-os/low-level-dev/serial)。

## 有线网口

Radxa CM5 IO 提供以太网口可接入1000M 以太网

## WIFI/BT

提供 M.2 KEY 接口，可兼容市面上常见的 PCIe 协议网卡，如 Radxa Wireless A8 模组 。

## HDMI

Radxa CM5 IO 配备了全尺寸 HDMI 接口。建议使用具有 HDMI 功能的显示器。  
Radxa CM5 IO 最高支持 8K 分辨率，以及常规的4K、2K、1080P等分辨率。

## Type-C

Radxa CM5 IO 配备了全功能typec接口。支持DP显示，以及连接 USB-Hub 设备。

## USB

搭配 USB3.0 x1 和 USB2.0 x2 HOST

## MIPI CSI

Radxa CM5 IO 支持摄像头功能

## MIPI DSI

Radxa CM5 IO 支持 MIPI DSI 显示功能。
:::tip
瑞莎建议使用 [Radxa Display 8 HD](/accessories/lcd-8-hd) 或 [Radxa Display 10 FHD](/accessories/lcd-10-fhd)。
:::

## MicroSD

可用于系统启动盘，也可以充当存储介质使用

## 耳机接口

支持标准3.5mm 耳机（带麦克风）

## RTC

连接 RTC 电池, CM5 IO 使用的 RTC 电池型号：CR1220


## 40 PIN GPIO

### GPIO 电压

| GPIO       | 电压 | 最高  |
| ---------- | ---- | ----- |
| 所有的GPIO | 3.3V | 3.63V |
| SARADC_IN4 | 1.8V | 1.98V |

### GPIO 接口

Radxa CM5 IO 提供了一个40pin针脚的GPIO座子，兼容于市面上大部分传感器的应用。
**_提示:_ 实际兼容情况以使用为准。**

<Tabs queryString="revision">
<TabItem value="x2_2" label="x2.2">

<div className='gpio_style'>

| GPIO number |  Function5   |  Function4  |  Function3   |  Function2  |  Function1  |               Pin#               |              Pin#               | Function1 |                 Function2                 |  Function3   |  Function4   |  Function5  | GPIO number |
| ----------- | :----------: | :---------: | :----------: | :---------: | :---------: | :------------------------------: | :-----------------------------: | :-------: | :---------------------------------------: | :----------: | :----------: | :---------: | ----------- |
|             |              |             |              |             |    +3.3V    | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |                                           |              |              |             |             |
| 123         |              |  PWM10_M2   |              | I2C7_SDA_M2 |  GPIO3_D3   |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |                                           |              |              |             |             |
| 122         |              |             |              | I2C7_SCL_M2 |  GPIO3_D2   |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |                                           |              |              |             |             |
| 135         | I2S1_SDI2_M0 |             | SPI2_CS0_M1  | I2C5_SDA_M2 |  GPIO4_A7   |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_B5  | <div className='orange'>UART2_TX_M0</div> |              |              |             | 13          |
|             |              |             |              |             |     GND     |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_B6  | <div className='orange'>UART2_RX_M0</div> |              |              |             | 14          |
| 134         | I2S1_SDI1_M0 | UART3_RX_M2 | SPI2_CLK_M1  | I2C5_SCL_M2 |  GPIO4_A6   | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO0_C2  |                                           |              |              |             | 18          |
| 133         | I2S1_SDI0_M0 | UART3_TX_M2 | SPI2_MOSI_M1 | I2C3_SDA_M2 |  GPIO4_A5   | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |                                           |              |              |             |             |
| 132         |              |             | SPI2_MISO_M1 | I2C3_SCL_M2 |  GPIO4_A4   | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO1_C4  |                                           | SPI4_CS1_M0  |              | PWM11_IR_M2 | 52          |
|             |              |             |              |             |    +3.3V    | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO1_D5  |                                           | SPI1_CS1_M2  |              |             | 61          |
| 129         | I2S1_SCLK_M0 |             | SPI0_MOSI_M1 |             |  GPIO4_A1   | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |                                           |              |              |             |             |
| 128         | I2S1_MCLK_M0 |             | SPI0_MISO_M1 |             |  GPIO4_A0   | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO1_B1  |                                           |              |              |             | 41          |
| 130         | I2S1_LRCK_M0 |             | SPI0_CLK_M1  |             |  GPIO4_A2   | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO4_B2  |                                           | SPI0_CS0_M1  | I2S1_SDO1_M0 |  PWM14_M1   | 138         |
|             |              |             |              |             |     GND     | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO3_B7  |                I2C3_SCL_M1                | SPI1_MOSI_M1 |              |             | 111         |
| 63          |              |             |              | I2C8_SDA_M2 |  GPIO1_D7   |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO1_D6  |                I2C8_SCL_M                 |              |              |  PWM14_M2   | 62          |
| 24          | I2S1_SDI3_M1 | PWM7_IR_M0  |              | I2C6_SAL_M0 |  GPIO0_D0   | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |                                           |              |              |             |             |
| 23          | I2S1_SDI2_M1 |   PWM6_M0   |              | I2C6_SDA_M0 |  GPIO0_C7   | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO1_B7  |                                           |              |              |  PWM13_M2   | 47          |
| 49          |              |             |              |             |  GPIO1_C1   | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |                                           |              |              |             |             |
| 112         |              |             |              | I2C3_SDA_M1 |  GPIO3_C0   | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO1_C6  |                                           |              |              | PWM15_IR_M2 | 54          |
|             |              |             |              |             | SARADC_VIN4 | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO1_D2  |                                           | SPI1_CLK_M2  |  I2S0_SDI2   |  I2S0_SDO3  | 58          |
|             |              |             |              |             |     GND     | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO0_D3  |                                           | SPI3_CLK_M2  |              |             | 27          |

</div>

### 关于 X2.2 硬件版本的 40-pin 扩展座的补充

- 标有橙色的引脚用于 debug console。
- PWM: x7, PWM6 / PWM7 / PWM10 / PWM11 / PWM13 / PWM14 / PWM15
- SPI: x2, SPI0 / SPI2
- I2C: x5, I2C3 / I2C5 / I2C6 / I2C7 / I2C8
- UART: x2, UART2 / UART3
- ADC: x1, SARADC_VIN4

</TabItem>
</Tabs>
