---
sidebar_position: 1
---

# 硬件接口

主要介绍主板的硬件接口信息。

## 芯片框图

<div style={{textAlign: 'center'}}>
   <img src="/img/rock5a/rk3588s-chip-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/rock5a/block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<img src="/img/rock5a/rock-5a-interface.webp" width="800" alt="rock 5a real" />

| 序号 | 说明                                                      | 序号 | 说明                                             | 序号 | 说明                   |
| ---- | --------------------------------------------------------- | ---- | ------------------------------------------------ | ---- | ---------------------- |
| 1    | Micro HDMI                                                | 2    | 重启接口（未焊接）                               | 3    | Maskrom 接口（未焊接） |
| 4    | 耳机插孔                                                  | 5    | USB 2.0 Type-A                                   | 6    | 风扇接口               |
| 7    | Up: USB 3.0 Type-A(OTG) <br /> Down: USB 3.0 Type-A(HOST) | 8    | 千兆以太网口 <br />- 支持 PoE，需搭配 PoE 扩展板 | 9    | PoE 接口               |
| 10   | eMMC & SPI Flash 接口                                     | 11   | 瑞芯微 RK3588S                                   | 12   | Micro HDMI             |
| 13   | M.2 E Key 2230 插槽                                       | 14   | USB Type-C 供电                                  | 15   | 状态指示灯             |
| 16   | 电源指示灯                                                | 17   | 电源按键                                         | 18   | MIPI DSI 显示接口      |
| 19   | 40-Pin GPIO 排针                                          | 20   | LPDDR4X 内存                                     | 21   | MIPI CSI 摄像头接口    |
| 22   | microSD 卡槽                                              |      |                                                  |      |                        |

## 接口详情

### 40-Pin GPIO 排针

ROCK 5A 板载 40-Pin GPIO（通用输入输出）排针，为硬件扩展提供了高度灵活的接口支持。

#### GPIO 功能

<Tabs queryString="gpio_revision">

<TabItem value="x1_2" label="x1.2/v1.1">

 <div className='gpio_style' style={{ overflow :"auto"}}  >

| GPIO number |  Function7   |  Function6   |  Function5   |  Function4  |  Function3  |   Function2   |  Function1  |               Pin#               |              Pin#               | Function1 |                 Function2                 |  Function3  | Function4  |  Function5   |  Function6   |  Function7   | GPIO number |
| :---------: | :----------: | :----------: | :----------: | :---------: | :---------: | :-----------: | :---------: | :------------------------------: | :-----------------------------: | :-------: | :---------------------------------------: | :---------: | :--------: | :----------: | :----------: | :----------: | :---------: |
|             |              |              |              |             |             |               |    +3.3V    | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |                                           |             |            |              |              |              |             |
|     63      |              |              |              | PWM15_IR_M3 | I2C8_SDA_M2 |               |  GPIO1_D7   |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |                                           |             |            |              |              |              |             |
|     62      |              |              |              |  PWM14_M2   | I2C8_SCL_M2 |               |  GPIO1_D6   |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |                                           |             |            |              |              |              |             |
|     43      |              |              |              |             |             |  UART4_TX_M2  |  GPIO1_B3   |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_B5  | <div className='orange'>UART2_TX_M0</div> | I2C1_SCL_M0 |            |              | I2S1_MCLK_M1 |              |     13      |
|             |              |              |              |             |             |               |     GND     |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_B6  | <div className='orange'>UART2_RX_M0</div> | I2C1_SDA_M0 |            |              | I2S1_SCLK_M1 |              |     14      |
|     139     |              | I2S1_SDO2_M0 |              | PWM15_IR_M1 | I2C7_SDA_M3 | UART8_CTSN_M0 |  GPIO4_B3   | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO4_A1  |                                           |             |            |              | I2S1_SCLK_M0 | SPI0_MOSI_M1 |     129     |
|     138     | SPI0_CS0_M1  | I2S1_SDO1_M0 |              |  PWM14_M1   | I2C7_SCL_M3 | UART8_RTSN_M0 |  GPIO4_B2   | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |                                           |             |            |              |              |              |             |
|     140     |              | I2S1_SDO3_M0 | SPDIF0_TX_M1 | PWM11_IR_M1 |             |               |  GPIO4_B4   | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO1_A5  |                                           |             |            |              |              | SPI2_MOSI_M0 |     37      |
|             |              |              |              |             |             |               |    +3.3V    | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO1_B0  |                                           |             |            |              |              | SPI2_CS1_M0  |     40      |
|     33      | SPI4_MOSI_M2 |              |              |             | I2C2_SCL_M4 |  UART6_TX_M1  |  GPIO1_A1   | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |                                           |             |            |              |              |              |             |
|     32      | SPI4_MISO_M2 |              |              |             | I2C2_SDA_M4 |  UART6_RX_M1  |  GPIO1_A0   | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO1_B5  |                UART7_TX_M2                |             |            |              |              | SPI0_CS1_M2  |     45      |
|     34      | SPI4_CLK_M2  |              |              |   PWM0_M2   | I2C4_SDA_M3 | UART6_RTSN_M1 |  GPIO1_A2   | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO1_A3  |               UART6_CTSN_M1               | I2C4_SCL_M3 |  PWM1_M2   |              |              | SPI4_CS0_M2  |     35      |
|             |              |              |              |             |             |               |     GND     | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO1_A4  |                                           |             |            |              |              | SPI2_MISO_M0 |     36      |
|     23      | SPI0_MISO_M0 | I2S1_SDI2_M1 |              |   PWM6_M0   | I2C6_SDA_M0 |               |  GPIO0_C7   |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO0_D0  |                                           | I2C6_SCL_M0 | PWM7_IR_M0 |              | I2S1_SDI3_M1 | SPI3_MISO_M2 |     24      |
|     42      | SPI0_MOSI_M2 |              |              |             |             |  UART4_RX_M2  |  GPIO1_B2   | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |                                           |             |            |              |              |              |             |
|     41      | SPI0_MISO_M2 |              |              |             |             |               |  GPIO1_B1   | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO4_B0  |                UART8_TX_M0                | I2C6_SDA_M3 |            |              | I2S1_SDI3_M0 | SPI2_CS1_M1  |     136     |
|     44      | SPI0_CS0_M2  |              |              |             |             |  UART7_RX_M2  |  GPIO1_B4   | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |                                           |             |            |              |              |              |             |
|     128     | SPI0_MISO_M1 | I2S1_MCLK_M0 |              |             |             |               |  GPIO4_A0   | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO4_A2  |                                           |             |            |              | I2S1_LRCK_M0 | SPI0_CLK_M1  |     130     |
|             |              |              |              |             |             |               | SARADC_VIN2 | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO4_A5  |                                           | I2C3_SDA_M2 |            |              | I2S1_SDI0_M0 |              |     133     |
|             |              |              |              |             |             |               |     GND     | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO4_B1  |                UART8_RX_M0                | I2C6_SCL_M3 |            | SPDIF1_TX_M1 | I2S1_SDO0_M0 | SPI0_CS1_M1  |     137     |

</div>
</TabItem>

<TabItem value="x1_1" label="x1.1">

<div className='gpio_style' style={{ overflow :"auto"}}  >

| GPIO number | Function6 | Function5 | Function4 | Function3 | Function2 | Function1 |               Pin#               |              Pin#               |  Function1  |                 Function2                 | Function3 | Function4 | Function5 | Function6 | Function7 | GPIO number |
| :---------: | --------- | --------- | :-------: | :-------: | :-------: | :-------: | :------------------------------: | :-----------------------------: | :---------: | :---------------------------------------: | :-------: | :-------: | --------- | --------- | --------- | :---------: |
|             |           |           |           |           |           |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |    +5.0V    |                                           |           |           |           |           |           |             |
|     32      |           |           | UART6_RX  | SPI4_MISO | I2C2_SDA  | GPIO1_A0  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |    +5.0V    |                                           |           |           |           |           |           |             |
|     33      |           |           | UART6_TX  | SPI4_MOSI | I2C2_SCL  | GPIO1_A1  |  <div className='green'>5</div>  | <div className='black'>6</div>  |     GND     |                                           |           |           |           |           |           |             |
|     43      |           |           | PDM1_CLK1 | UART4_TX  | SPI0_CLK  | GPIO1_B3  |  <div className='green'>7</div>  | <div className='green'>8</div>  |  GPIO0_B5   | <div className='orange'>UART2_TX_M0</div> | I2C1_SCL  | I2S1_MCLK |           |           |           |     13      |
|             |           |           |           |           |           |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> |  GPIO0_B6   | <div className='orange'>UART2_RX_M0</div> | I2C1_SDA  | I2S1_SCLK |           |           |           |     14      |
|     34      |           | PWM0      | UART6_RTS | SPI4_CLK  | I2C4_SDA  | GPIO1_A2  | <div className='green'>11</div>  | <div className='green'>12</div> |  GPIO4_A1   |                 SPI0_MOSI                 |           | I2S1_SCLK |           |           |           |     129     |
|     35      |           | PWM1      | UART6_CTS | SPI4_CS0  | I2C4_SCL  | GPIO1_A3  | <div className='green'>13</div>  | <div className='black'>14</div> |     GND     |                                           |           |           |           |           |           |             |
|     140     |           | I2S1_SDO3 | SPDIF0_TX |   PWM11   |           | GPIO4_B4  | <div className='green'>15</div>  | <div className='green'>16</div> |  GPIO1_D6   |                 I2C8_SCL                  |           |   PWM14   |           |           |           |     62      |
|             |           |           |           |           |           |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> |  GPIO1_D7   |                 I2C8_SDA                  |           |   PWM15   |           |           |           |     63      |
|     37      |           |           |           |           | SPI2_MOSI | GPIO1_A5  | <div className='green'>19</div>  | <div className='black'>20</div> |     GND     |                                           |           |           |           |           |           |             |
|     36      |           |           |           |           | SPI2_MISO | GPIO1_A4  | <div className='green'>21</div>  | <div className='green'>22</div> |  GPIO1_B5   |                 SPI0_CS1                  |           |           |           |           |           |     45      |
|     38      |           |           |           |           | SPI2_CLK  | GPIO1_A6  | <div className='green'>23</div>  | <div className='green'>24</div> |  GPIO1_A7   |                 SPI2_CS0                  | PDM1_SDI0 |   PWM3    |           |           |           |     39      |
|             |           |           |           |           |           |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> | SARADC_VIN5 |                                           |           |           |           |           |           |             |
|     139     |           | I2S1_SDO2 |   PWM15   | UART8_CTS | I2C7_SDA  | GPIO4_B3  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  |  GPIO4_B2   |                 I2C7_SCL                  | SPI0_CS0  | UART8_RTS | PWM14     | I2S1_SDO1 |           |     138     |
|     42      |           |           | PDM1_SDI3 | UART4_RX  | SPI0_MOSI | GPIO1_B2  | <div className='green'>29</div>  | <div className='black'>30</div> |     GND     |                                           |           |           |           |           |           |             |
|     41      |           |           |           | PDM1_SDI2 | SPI0_MISO | GPIO1_B1  | <div className='green'>31</div>  | <div className='green'>32</div> |  GPIO4_B0   |                 I2C6_SDA                  | UART8_TX  | I2S1_SDI3 |           |           |           |     136     |
|     44      |           |           |           | PDM1_CLK0 |           | GPIO1_B4  | <div className='green'>33</div>  | <div className='black'>34</div> |     GND     |                                           |           |           |           |           |           |             |
|     128     |           |           | I2S1_MCLK |           | SPI0_MISO | GPIO4_A0  | <div className='green'>35</div>  | <div className='green'>36</div> |  GPIO4_A2   |                 SPI0_CLK                  | I2S1_LRCK |           |           |           |           |     130     |
|     40      |           |           |           | PDM1_SDI1 | SPI2_CS1  | GPIO1_B0  | <div className='green'>37</div>  | <div className='green'>38</div> |  GPIO4_A5   |                 I2C3_SDA                  |           | I2S1_SDI0 |           |           |           |     133     |
|             |           |           |           |           |           |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> |  GPIO4_B1   |                 I2C6_SCL                  | SPI0_CS1  | UART8_RX  | SPDIF1_TX | I2S1_SDO0 |           |     137     |

</div>
</TabItem>

</Tabs>

#### 40-Pin 引脚 USB 功能配置

在 ROCK 5A 的 40-Pin 接口中，以下引脚可以配置为 USB 2.0：

- USB4_DM：引脚编号为 28，对应电阻位号为 R104。
- USB4_DP：引脚编号为 27，对应电阻位号为 R106。

默认情况下，Pin-27 可以在软件中配置为 GPIO0_C7 等功能（详见 40-Pin Pinout），同时 USB4_DP 信号在硬件上未激活。Pin-28 可以在软件中配置为 GPIO0_D0 等功能（详见 40-Pin Pinout），USB4_DM 信号在硬件上也未激活。如需将这些引脚改为 USB 功能，请按照以下步骤修改预留电阻：

- **移除 R169 和 R170 的 0 欧电阻。**
- **焊接 0 欧电阻到 R104 和 R106 上。**

:::tip
原理图和位号信息可在硬件资料中查阅和下载，[硬件资料下载](../download)
:::

:::caution [操作提示]

此操作需要具备一定的焊接技巧，建议由有经验的技术人员完成。
:::

### 千兆以太网

ROCK 5A 板载 1 个 千兆以太网口（支持 PoE 供电，需搭配 PoE 扩展板使用），可用于有线连接网络，支持 10/100/1000 Mbps 自适应速率。

<div style={{textAlign: 'center'}}>
   <img src="/img/rock5a/rj45_led.webp" style={{width: '25%', maxWidth: '1200px'}} />
</div>

| LED  | 状态 | 描述                                   |
| ---- | ---- | -------------------------------------- |
| 橙色 | 常亮 | 链路已建立（设备已连接到网络）         |
| 绿色 | 闪烁 | 正在进行数据传输（网络活动中）         |
| 关闭 | -    | 未检测到链路（网线未插或存在网络问题） |

### USB

ROCK 5A 板载 2 个 USB 2.0 Type-A、2 个 USB 3.0 Type-A 以及 1 个 USB Type-C 接口。

- USB 2.0 Type-A：用于连接 USB 设备，如鼠标、键盘、U 盘等。
- USB 3.0 Type-A：用于连接 USB 设备，其中一个 USB 3.0 支持 OTG 功能。
- USB Type-C：供电接口，兼容 PD 和 QC 协议。

### 风扇接口

板载 2-Pin 1.25mm 风扇接口，支持 PWM 控制，可用于外接主动散热器，通过风扇给主板散热以维持最佳性能。

### 耳机插孔

板载 4 段式 3.5mm 耳机插孔，支持麦克风输入，可用于连接有线耳机。

### Micro HDMI

板载 2 个 Micro HDMI 接口，用于连接显示器，最高可输出 8K@60Hz。

### eMMC & SPI Flash 接口

支持安装 eMMC 模块或者 SPI Flash 模块，但二者互斥，相同时间只能安装其中一种。

### M.2 E Key 接口

可安装 M.2 E Key 2230 规格的 WiFi / 蓝牙模组，拓展无线功能。

### 状态指示灯

板载 1 个 电源指示灯和 1 个 状态指示灯，用于显示系统状态。

- 电源指示灯：绿色常亮，表示系统供电正常
- 状态指示灯：蓝色闪烁，表示系统启动正常

### 电源按键

用于控制主板系统开关机。

### MIPI CSI 摄像头接口

板载 1 个 4 通道 MIPI CSI 接口，可连接 MIPI CSI 摄像头。

主板 MIPI CSI 接口规格如下：

- 接口类型：31-Pin 0.3 mm 间距 SMD 卧式 FPC 接口
- 连接方式：翻盖式，下接触

### MIPI DSI 显示接口

板载 1 个 MIPI DSI 接口，可连接 MIPI DSI 显示屏。

主板 MIPI DSI 接口规格如下：

- 接口类型：39-Pin 0.3 mm 间距 SMD 卧式 FPC 接口
- 连接方式：翻盖式，下接触

### Maskrom 接口

主板在上电前短接 Maskrom 接口，然后使用电源适配器供电，可以使主板进入 Maskrom 模式。

### Recovery 接口

主板在上电前短接 Recovery 接口，然后使用电源适配器供电，可以使主板进入 Recovery 模式。
