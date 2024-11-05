---
sidebar_position: 4
---

# 硬件接口说明

## 接口总览

- **ZERO 3W**
  ![ZERO 3W Overview](/img/zero/zero3/radxa_zero_3w.webp)

- **ZERO 3E**
  ![ZERO 3E Overview](/img/zero/zero3/radxa_zero_3e.webp)

## 电源接口

## 调试串口

## 有线网口

## 40 PIN GPIO

### GPIO 电压

| GPIO        | 电压 | 最高  |
| ----------- | ---- | ----- |
| 所有的 GPIO | 3.3V | 3.63V |
| SARADC_IN5  | 3.3V | 3.3V  |

### GPIO 接口

ZERO 3W/3E 提供了一个40 pin 针脚的 GPIO 座子，与市场上大多数的 SBC 配件兼容。

**提示：实际兼容情况以使用情况为准。**

<div className='gpio_style'>

:::tip
Pin 3、Pin 5、Pin 27 和 Pin 28 为 I2C 设备供电添加了额外的上拉电阻，故在作为 GPIO 使用时会工作异常。
:::

| GPIO number | Function5   |  Function4   |    Function3    |  Function2   | Function1 |               Pin#               |              Pin#               | Function1 |                 Function2                 | Function3 |  Function4  | Function5    | GPIO number |
| ----------- | ----------- | :----------: | :-------------: | :----------: | :-------: | :------------------------------: | :-----------------------------: | :-------: | :---------------------------------------: | :-------: | :---------: | ------------ | ----------- |
|             |             |              |                 |              |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |                                           |           |             |              |             |
| 32          |             |              |   I2C3_SDA_M0   | UART3_RX_M0  | GPIO1_A0  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |                                           |           |             |              |             |
| 33          |             |              |   I2C3_SCL_M0   | UART3_TX_M0  | GPIO1_A1  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |                                           |           |             |              |             |
| 116         |             |   PWM14_M0   |                 |              | GPIO3_C4  |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_D1  | <div className='orange'>UART2_TX_M0</div> |           |             |              | 25          |
|             |             |              |                 |              |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_D0  | <div className='orange'>UART2_RX_M0</div> |           |             |              | 24          |
| 97          |             |              |                 |              | GPIO3_A1  | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO3_A3  |                                           |           |             | I2S3_SCLK_M0 | 99          |
| 98          |             | I2S3_MCLK_M0 |                 |              | GPIO3_A2  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |                                           |           |             |              |             |
| 104         |             |              |                 |              | GPIO3_B0  | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO3_B1  |                UART4_RX_M1                |  PWM8_M0  |             |              | 105         |
|             |             |              |                 |              |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO3_B2  |                UART4_TX_M1                |  PWM9_M0  |             |              | 106         |
| 147         |             | PWM15_IR_M1  |  I2S3_SCLK_M1   | SPI3_MOSI_M1 | GPIO4_C3  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |                                           |           |             |              |             |
| 149         | UART9_TX_M1 |   PWM12_M1   |   I2S3_SDO_M1   | SPI3_MISO_M1 | GPIO4_C5  | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO3_C1  |                                           |           |             | I2S1_SDO2_M2 | 113         |
| 146         |             |   PWM14_M1   |  I2S3_MCLK_M1   | SPI3_CLK_M1  | GPIO4_C2  | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO4_C6  |                SPI3_CS0_M1                | PWM13_M1  | UART9_RX_M1 | I2S3_SDI_M1  | 150         |
|             |             |              |                 |              |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> |    NC     |                                           |           |             |              |             |
| 138         |             | I2C4_SDA_M0  |   I2S2_SDI_M1   |              | GPIO4_B2  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO4_B3  |                                           |           | I2C4_SCL_M0 | I2S2_SDO_M1  | 139         |
| 107         |             |              |                 |              | GPIO3_B3  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |                                           |           |             |              |             |
| 108         |             |              |                 |              | GPIO3_B4  | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO3_C2  |                UART5_TX_M1                |           |             | I2S1_SDO3_M2 | 114         |
| 115         | UART5_RX_M1 |              | I2S1_SCLK_RX_M2 |              | GPIO3_C3  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |                                           |           |             |              |             |
| 100         |             |              |  I2S3_LRCK_M0   |              | GPIO3_A4  | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO3_A7  |                                           |           |             |              | 103         |
| 36          |             |              | I2S1_SCLK_RX_M0 |              | GPIO1_A4  | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO3_A6  |                                           |           |             | I2S3_SDI_M0  | 102         |
|             |             |              |                 |              |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO3_A5  |                                           |           |             | I2S3_SDO_M0  | 101         |

</div>

### 40-Pin 引脚 USB 功能配置

在 ZERO 3W / 3E 的 40-Pin 接口中，以下引脚可以配置为 USB 2.0：

- USB2_HOST2_DM：引脚编号为 28，对应电阻位号为 R46。
- USB2_HOST2_DP：引脚编号为 27，对应电阻位号为 R45。

默认情况下，Pin-27 可以在软件中配置为 GPIO4_B2 等功能（详见 40-Pin Pinout），同时 USB2_HOST2_DP 信号在硬件上未激活。Pin-28 可以在软件中配置为 GPIO4_B3 等功能（详见 40-Pin Pinout），USB2_HOST2_DM 信号在硬件上也未激活。如需将这些引脚改为 USB 功能，请按照以下步骤修改预留电阻：

- **移除 R32 和 R39 的 0 欧电阻。**
- **焊接 0 欧电阻到 R45 和 R46 上。**

:::tip
原理图和位号信息可在硬件资料中查阅和下载，[硬件资料下载](../getting-started/download)
:::

:::caution [操作提示]

此操作需要具备一定的焊接技巧，建议由有经验的技术人员完成。
:::

## USB C 口

共有两个 USB TYPE-C 口，分别为 USB 2.0 OTG 口 和 USB3.0 HOST 口，其中供电使用 USB 2.0 OTG口

## HDMI接口

提供一个 Micro HDMI 接口

## MIPI CSI

| PIN | Name              |
| --- | ----------------- |
| 1   | GND               |
| 2   | MIPI_CSI_RX_D0N   |
| 3   | MIPI_CSI_RX_D0P   |
| 4   | GND               |
| 5   | MIPI_CSI_RX_D1N   |
| 6   | MIPI_CSI_RX_D1P   |
| 7   | GND               |
| 8   | MIPI_CSI_RX_CLK0N |
| 9   | MIPI_CSI_RX_CLK0P |
| 10  | GND               |
| 11  | MIPI_CSI_RX_D2N   |
| 12  | MIPI_CSI_RX_D2P   |
| 13  | GND               |
| 14  | MIPI_CSI_RX_D3N   |
| 15  | MIPI_CSI_RX_D3P   |
| 16  | GND               |
| 17  | CAMERAB_PDN_L     |
| 18  | CIF_CLKOUT        |
| 19  | GND               |
| 20  | I2C2_SCL_M1       |
| 21  | I2C2_SDA_M1       |
| 22  | VCC_3V3           |
