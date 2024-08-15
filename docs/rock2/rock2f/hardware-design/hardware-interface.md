---
sidebar_position: 1
---

# 硬件概览

# 芯片框图

<img src="/img/rock2f/rock-2f-chip-diagram.webp" alt="rk3528A chip diagram" width="700" />

# 系统框图

<img src="/img/rock2f/rock-2f-system-diagram.webp" width="800" alt="rock 2f pack" />

# 硬件概览

<img src="/img/rock2f/rock-2f-hardware-overview.webp" width="800" alt="rock 2f pack" />

以下是各个硬件接口的详细接口线序。

## microSD Card Slot

| PIN | Name        |
| --- | ----------- |
| 1   | SDMMC_D2    |
| 2   | SDMMC_D3    |
| 3   | SDMMC_CMD   |
| 4   | 3V3_SD      |
| 5   | SDMMC_CLK   |
| 6   | GND         |
| 7   | SDMMC_D0    |
| 8   | SDMMC_D1    |
| 9   | SDMMC_DET_L |
| 10  | GND         |

## HDMI

| Pin |       Name       | Pin |       Name       |
| :-: | :--------------: | :-: | :--------------: |
|  1  |  HDMI_TX2P_PORT  |  2  |       GND        |
|  3  |  HDMI_TX2N_PORT  |  4  |  HDMI_TX1P_PORT  |
|  5  |       GND        |  6  |  HDMI_TX1N_PORT  |
|  7  |  HDMI_TX0P_PORT  |  8  |       GND        |
|  9  |  HDMI_TX0N_PORT  | 10  |  HDMI_CLKP_PORT  |
| 11  |       GND        | 12  |  HDMI_CLKN_PORT  |
| 13  | HDMI_TX_CEC_PORT | 14  |        X         |
| 15  | HDMI_TX_SCL_PORT | 16  | HDMI_TX_SDA_PORT |
| 17  |       GND        | 18  |  VCC5V_HDMI_TX   |
| 19  | HDMI_TX_HPD_PORT | 20  |       GND        |
| 21  |       GND        | 22  |       GND        |
| 23  |       GND        |

## WIFI 6 & BT 5.4

| Pin |       Name       | Pin |      Name      |
| :-: | :--------------: | :-: | :------------: |
|  1  |  HOST_WAKE_BT_H  |  2  |      GND       |
|  3  |     UART1_TX     |  4  |      GND       |
|  5  |       GND        |  6  |      GND       |
|  7  |       GND        |  8  |    USB4_DP     |
|  9  |     USB4_DM      | 10  |      GND       |
| 11  |     UART1_RX     | 12  |      GND       |
| 13  |       GND        | 14  |    UART0_RX    |
| 15  |     UART0_TX     | 16  |      GND       |
| 17  |        X         | 18  |       X        |
| 19  |        X         | 20  |       X        |
| 21  |        X         | 22  |       X        |
| 23  |       GND        | 24  |    VCC_WIFI    |
| 25  |       GND        | 26  |      GND       |
| 27  |       GND        | 28  |      GND       |
| 29  |       GND        | 30  |       X        |
| 31  |       GND        | 32  |       X        |
| 33  |     VCC_WIFI     | 34  |    VCC_WIFI    |
| 35  |       GND        | 36  |      GND       |
| 37  |    WL_5G_ANT     | 38  |   WL_24G_ANT   |
| 39  |       GND        | 40  |      GND       |
| 41  |       GND        | 42  |      GND       |
| 43  |       GND        | 44  |      GND       |
| 45  |       GND        | 46  | WIFI_REG_ON_H  |
| 47  | WIFI_WAKE_HOST_H | 48  | BT_WAKE_HOST_H |
| 49  |       GND        | 50  |      GND       |
| 51  |       GND        | 52  |      GND       |

## FPC Connector with PCIE 2.0

| Pin |            Name             | Pin |            Name             |
| :-: | :-------------------------: | :-: | :-------------------------: |
|  1  |         VCC5V0_SYS          |  2  |         VCC5V0_SYS          |
|  3  |             GND             |  4  |       PCIE20_REFCLKP        |
|  5  |       PCIE20_REFCLKN        |  6  |             GND             |
|  7  | USB30_OTG0_SSRXP_PCIE20_RXP |  8  | USB30_OTG0_SSRXN_PCIE20_RXN |
|  9  |             GND             | 10  | USB30_OTG0_SSTXP_PCIE20_TXP |
| 11  | USB30_OTG0_SSTXN_PCIE20_TXN | 12  |             GND             |
| 13  |           PCIE_EN           | 14  |       PCIE20_WAKEn_M1       |
| 15  |      PCIE20_CLKREQn_M1      | 16  |      PCIE20_PERSTn_M1       |

## AV Out

| Pin | Name | Pin |   Name   |
| :-: | :--: | :-: | :------: |
|  1  |  X   |  2  | CVBS_OUT |
|  3  | LOUT |  4  |    X     |
|  5  | GND  |  6  |   ROUT   |
|  7  |  X   |  8  |    X     |

## 2X USB 2.0 HOST

| Pin |     Name     | Pin |  Name   |
| :-: | :----------: | :-: | :-----: |
|  1  | VCC5V0_USB20 |  2  | USB2_DM |
|  3  |   USB2_DP    |  4  |   GND   |
|  5  |     GND      |  6  |   GND   |

| Pin |     Name     | Pin |  Name   |
| :-: | :----------: | :-: | :-----: |
|  1  | VCC5V0_USB20 |  2  | USB3_DM |
|  3  |   USB3_DP    |  4  |   GND   |
|  5  |     GND      |  6  |   GND   |

## 40-Pin GPIO Header

- GPIO 电压

| GPIO       | 电压 | 最高 |
| ---------- | ---- | ---- |
| 所有的GPIO | 3.3V | 3.3V |
| SARADC_IN3 | 1.8V | 1.8V |

- GPIO Pinout

ROCK 2F 提供了一个40pin针脚的GPIO座子，兼容于市面上大部分传感器的应用。

**_提示:_ 实际兼容情况以使用为准。**

- ROCK 2F 有一个40针扩展接头。每个引脚都用颜色区分。

<div className='gpio_style' style={{ overflow :"auto"}} >

| GPIO number |  Function4  |   Function3   |  Function2   | Function1  |               Pin#               |              Pin#               | Function1 |   Function2   |  Function3  |                 Function4                 | GPIO number |
| :---------: | :---------: | :-----------: | :----------: | :--------: | :------------------------------: | :-----------------------------: | :-------: | :-----------: | :---------: | :---------------------------------------: | :---------: |
|             |             |               |              |   +3.3V    | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |               |             |                                           |             |
|     128     |             |  I2C0_SDA_M1  | SPIDIF_TX_M0 |  GPIO4_A0  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |               |             |                                           |             |
|     129     |             |               | I2C0_SCL_M1  |  GPIO4_A1  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |               |             |                                           |             |
|     134     |             |  UART1_TX_M0  |  I2S1_LRCK   |  GPIO4_A6  |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO4_D0  |               |             | <div className='orange'>UART2_TX_M0</div> |     152     |
|             |             |               |              |    GND     |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO4_C7  |               |             | <div className='orange'>UART2_RX_M0</div> |     151     |
|     143     |             |    PWM4_M0    | UART3_RX_M1  |  GPIO4_B7  | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO1_B5  | I2S0_SCLK_M1  |             |                                           |     45      |
|     144     |             |    PWM5_M0    | UART3_TX_M1  |  GPIO4_C0  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |               |             |                                           |             |
|     150     |   PWM3_M0   |  UART1_RX_M1  | I2C1_SDA_M1  |  GPIO4_C6  | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO4_B0  |   I2S1_SDO1   | UART3_RX_M0 |                                           |     136     |
|             |             |               |              |   +3.3V    | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO4_B1  |   I2S1_SDO2   |  PDM_SDI1   |                UART3_TX_M0                |     137     |
|     138     |  SPI0_MOSI  |   PDM_SDI0    |  I2S1_SDO3   |  GPIO4_B2  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |               |             |                                           |             |
|     139     |  SPI0_MISO  |   PDM_SDI2    |  I2S1_SDI1   |  GPIO4_B3  | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO1_B2  | UART2_RTSN_M1 | I2C5_SCL_M0 |                UART7_TX_M1                |     42      |
|     140     |             |   SPI0_CLK    |  I2S1_SDI0   |  GPIO4_B4  | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO4_B6  |   SPI0_CSN0   |             |                                           |     142     |
|             |             |               |              |    GND     | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO4_C1  |   PDM_SDI3    |  SPI0_CSN1  |                  PWM6_M0                  |     145     |
|     130     | I2C1_SDA_M0 |  UART3_RTSN   |  I2S1_SDI3   |  GPIO4_A2  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO4_A3  |   I2S1_SDI2   | UART3_CTSN  |                I2C1_SCL_M0                |     131     |
|     141     |             |               |   PDM_CLK0   |  GPIO4_B5  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |               |             |                                           |             |
|     40      |             | UART7_CTSN_M1 | UART2_RX_M1  |  GPIO1_B0  | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO4_C3  |  I2C0_SDA_M0  |   PWM0_M0   |                                           |     147     |
|     41      |             | UART7_RTSN_M1 | UART2_TX_M1  |  GPIO1_B1  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |               |             |                                           |             |
|     46      |             |   SPI1_CLK    | I2S0_LRCK_M1 |  GPIO1_B6  | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO1_B4  | I2S0_MCLK_M1  |             |                                           |     44      |
|             |             |               |              | SARADC_IN3 | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO1_B7  |  I2S0_SDI_M1  |  SPI1_MOSI  |                                           |     47      |
|             |             |               |              |    GND     | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO1_C0  |  I2S0_SDO_M1  |  SPI1_MISO  |                                           |     48      |

</div>

### 40-Pin 功能说明

在 ROCK 2F 的 40-Pin 接口中，以下引脚可以配置为 USB 2.0：

- USB 2.0 DM：引脚编号为 28，对应电阻位号为 R2417。
- USB 2.0 DP：引脚编号为 27，对应电阻位号为 R2416。

默认情况下，这些引脚被配置为 **I2C** 功能，USB 信号未激活。要将这些引脚改为 USB 功能，需要通过以下步骤修改预留电阻：

- **移除 R2406 和 R2407 的 0 欧电阻。**
- **焊接 0 欧电阻到 R2416 和 R2417 上。**

:::tip
原理图和位号信息可在硬件资料中查阅和下载，[硬件资料下载](../download)
:::

:::caution [操作提示]

此操作需要具备一定的焊接技巧，建议由有经验的技术人员完成。

:::
