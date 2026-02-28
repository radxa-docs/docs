---
sidebar_position: 50
---

# ROCK 4 系列 GPIO 定义

## GPIO 电压

RK3399 与 OP1 支持 1.8V/3.0V/3.3V 三种 IO 电压，以下为默认配置：

| GPIO       | Voltage Level | Tolerance |
| ---------- | ------------- | --------- |
| GPIO3_C0   | 3.3V          | 3.465V    |
| ADC_IN0    | 1.8V          | 1.98V     |
| Other GPIO | 3.0V          | 3.14V     |

## GPIO 接口

ROCK 4 系列提供 40Pin 扩展排针，不同颜色表示不同类型引脚。
下表适用于 ROCK 4 系列产品。

<div className='gpio_style'>

:::caution
同一引脚在同一时刻只能复用一种功能，无法同时启用多个复用功能。
:::

| GPIO number | Function2 |               Function1                |   GPIO   |               Pin#               |              Pin#               |   GPIO   |                Function1                | Function2  | GPIO number |
| :---------: | :-------: | :------------------------------------: | :------: | :------------------------------: | :-----------------------------: | :------: | :-------------------------------------: | :--------: | :---------: |
|             |           |                 +3.3V                  |          | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |          |                  +5.0V                  |            |             |
|     71      |           |                I2C7_SDA                | GPIO2_A7 |  <div className='green'>3</div>  |  <div className='red'>4</div>   |          |                  +5.0V                  |            |             |
|     72      |           |                I2C7_SCL                | GPIO2_B0 |  <div className='green'>5</div>  | <div className='black'>6</div>  |          |                   GND                   |            |             |
|     75      |           |                SPI2_CLK                | GPIO2_B3 |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO4_C4 | <div className='orange'>UART2_TXD</div> |            |     148     |
|             |           |                  GND                   |          |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO4_C3 | <div className='orange'>UART2_RXD</div> |            |     147     |
|     146     |           |                  PWM0                  | GPIO4_C2 | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO4_A3 |                I2S1_SCLK                |            |     131     |
|     150     |           |                  PWM1                  | GPIO4_C6 | <div className='green'>13</div>  | <div className='black'>14</div> |          |                   GND                   |            |             |
|     149     |           |                SPDIF_TX                | GPIO4_C5 | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO4_D2 |                                         |            |     154     |
|             |           |                 +3.3V                  |          | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO4_D4 |                                         |            |     156     |
|     40      | UART4_TXD | <div className='orange'>SPI1_TXD</div> | GPIO1_B0 | <div className='green'>19</div>  | <div className='black'>20</div> |          |                   GND                   |            |             |
|     39      | UART4_RXD | <div className='orange'>SPI1_RXD</div> | GPIO1_A7 | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO4_D5 |                                         |            |     157     |
|     41      |           | <div className='orange'>SPI1_CLK</div> | GPIO1_B1 | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO1_B2 | <div className='orange'>SPI1_CSn</div>  |            |     42      |
|             |           |                  GND                   |          | <div className='black'>25</div>  | <div className='green'>26</div> |          |                 ADC_IN0                 |            |             |
|     64      |           |                I2C2_SDA                | GPIO2_A0 |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO2_A1 |                I2C2_CLK                 |            |     65      |
|     74      | I2C6_SCL  |                SPI2_TXD                | GPIO2_B2 | <div className='green'>29</div>  | <div className='black'>30</div> |          |                   GND                   |            |             |
|     73      | I2C6_SDA  |                SPI2_RXD                | GPIO2_B1 | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO3_C0 |                SPDIF_TX                 | UART3_CTSn |     112     |
|     76      |           |                SPI2_CSn                | GPIO2_B4 | <div className='green'>33</div>  | <div className='black'>34</div> |          |                   GND                   |            |             |
|     133     |           |              I2S1_LRCK_TX              | GPIO4_A5 | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO4_A4 |              I2S1_LRCK_RX               |            |     132     |
|     158     |           |                                        | GPIO4_D6 | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO4_A6 |                I2S1_SDI                 |            |     134     |
|             |           |                  GND                   |          | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO4_A7 |                I2S1_SDO                 |            |     135     |

</div>

## 40Pin 排针说明

- 橙色标注为该引脚默认功能。
- 除电源引脚外，其余引脚均直接连接到 SoC。
- 3、5、27、28、29、31 号引脚默认通过 4.7K 上拉电阻连接到 3.0V。
- 7 号引脚与板载 MIPI CSI 引脚直连。
- SPI
  - 19、21、23、24 号引脚同时连接板载 SPI Flash。若设备已焊接 SPI Flash，则排针侧 SPI 功能不可用。
- UART
  - UART2 默认作为 U-Boot 与 Linux 串口控制台。
  - UART2 与 UART4 支持较宽波特率范围（例如 115200、500000、1500000）。
  - 对于 v1.4 及之后硬件版本，UART4 引脚可能被 SPI Flash 复用。
- I2C-2 与 I2C-7
  - 可通过标准 I2C 设备文件完成读写访问。
