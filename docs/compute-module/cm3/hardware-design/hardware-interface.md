---
sidebar_position: 1
description: "详细介绍 CM3/CM3 IO 硬件信息"
---

# 硬件接口说明

## 芯片框图

<img src="/img/rock3/rk3566_block_diagram.webp" alt="rk3566 block diagram" style={{ width: "80%" }} />

## Radxa CM3 IO 底板框图

<img src="/img/cm3/radxa-cm3-io-block-diagram.webp" alt="cm3 io block diagram" style={{ width: "80%" }} />

## 接口预览

<Tabs queryString="model">
    <TabItem value="CM3 核心板">
        <img src="/img/cm3/radxa-cm3-core-v1-32.webp" alt="cm3" style={{ width: "80%" }} />
    </TabItem>
    <TabItem value="CM3 IO 板">
        <img src="/img/cm3/radxa-cm3-io-v1-32.webp" alt="cm3 io v1.32" style={{ width: "80%" }} />
    </TabItem>
</Tabs>

## 接口详情

以下介绍 Radxa CM3 IO Board 的接口详情信息：

### BAT

    | Pin |       Name       | Pin |       Name       |
    | :-: | :--------------: | :-: | :--------------: |
    |  1  |  BAT_3V7_PLUS    |  2  |       TS         |
    |  3  |  BAT_3V7_LOSE    |     |                  |

###  DIP_2.54MM_3PIN_180

- U31

    | Pin |       Name       | Pin |       Name       |
    | :-: | :--------------: | :-: | :--------------: |
    |  1  |     WL_nDis      |  2  |       GND        |
    |  3  |     BT_nDis      |     |                  |

- U32

    | Pin |       Name       | Pin |       Name       |
    | :-: | :--------------: | :-: | :--------------: |
    |  1  |    PWRON_KEY     |  2  |       GND        |
    |  3  |      RUN_PG      |     |                  |

### EDP

RK3566 集成了一个 eDP（嵌入式 DisplayPort）v1.3 控制器，支持 1.62Gbps/lane 和 2.7Gbps/lane 的数据速率。 它可以在 1 通道、2 通道和 4 通道模式下运行，最大输出分辨率为 2560x1600@60Hz。 eDP 接口还包括一个最大速率为 1Mbps 的 AUX 通道。

对于 eDP 接口中的耦合差分信号，建议在发射端附近放置 100nF 的耦合电容。 建议使用 0201 封装尺寸的电容以降低 ESR（等效串联电阻）和 ESL（等效串联电感）。

- eDP接口功能꞉

    - 支持 1 个 eDP 1.3 接口
    - 支持多达 4 个 2.7Gbps 的物理通道
    - 支持面板自刷新 (PSR)
    - 支持分辨率高达 2560x1600@60Hz
    - 支持高达 10 位的 RGB 格式

- eDP接口信号的阻抗和说明

    | 信号              | 阻抗       | 描述                          |
    | ----------------- | ---------- | ----------------------------- |
    | eDP_TX_DP/DN[3꞉0] | 100ohm±10% | eDP TX数据传输，外加100nF电容 |
    | eDP_TX_AUXP/N     | 100ohm±10% | eDP TX辅助通道，外接100nF电容 |
    | eDP_HPDIN         | N/A        | 无 eDP TX 插入检测            |

    <img src="/img/cm3/edp-design.webp" alt="EDP" style={{ width: "80%" }}  />

- eDP布局要求

    | 范围                                          | 要求                                         |
    | --------------------------------------------- | -------------------------------------------- |
    | Trace Impedance                               | 100Ω ±10% differential                       |
    | Max intra‑pair skew                           | \<12mil                                      |
    | Max trace length on carrier board             | \<6 inches                                   |
    | Minimum pair to pair spacing                  | Recommend ≥4 times the width of eDP trace    |
    | AC coupling capacitors                        | 100nF ±20%, discrete 0201 package preferable |
    | Minimum spacing between eDP and other signals | ≥4 times the width of eDP trace              |
    | Maximum allowed via Recommend                 | ≤ 4 vias                                     |

- 计算模块上 eDP 信号的走线长度

    | Signal      | Length       |
    | ----------- | ------------ |
    | EDP_TX_AUXN | 1125.784mil  |
    | EDP_TX_AUXP | 1145.200mil  |
    | EDP_TX_D0N  | 1,551.442mil |
    | EDP_TX_D0P  | 1,605.627mil |
    | EDP_TX_D1N  | 1,394.502mil |
    | EDP_TX_D1P  | 1,387.683mil |
    | EDP_TX_D2N  | 1,223.146mil |
    | EDP_TX_D2P  | 1,278.783mil |
    | EDP_TX_D3N  | 1,074.909mil |
    | EDP_TX_D3P  | 1,092.072mil |

    **注意：在eDP显示器的连接器端，建议为AUXP预留一个100k的下拉电阻，为AUXN预留一个100k的上拉电阻。**

### Ethernet

Radxa CM3 板集成了千兆 PHY 芯片 RTL8211F。 四组差分信号 PHY1_MDI0、PHY1_MDI01、PHY1_MDI02 和 PHY1_MDI03 连接到 B2B 连接器。 在 1000BASE‑T 下运行时，将使用所有四组差分信号。 在 100BASE‑TX 下运行时，仅使用 PHY1_MDI0 和 PHY1_MDI01。

** 参考示意图 **

** 具体信号定义请参考示意图 **

<img src="/img/cm3/ethernet-phy-design.webp" alt="Ethernet Phy Design" style={{ width: "80%" }}  />

Radxa CM3 IO Board 采用变压器和以太网网口一体式设计。参考提供设计如下：

<img src="/img/cm3/ethernet_combo.webp" alt="Ethernet Combo" style={{ width: "80%" }}  />

计算模块上 MDI 信号的走线长度。

| 信号       | 长度       |
| ---------- | ---------- |
| PHY1_MDI0+ | 319.903mil |
| PHY1_MDI0- | 326.000mil |
| PHY1_MDI1+ | 249.671mil |
| PHY1_MDI1- | 277.370mil |
| PHY1_MDI2+ | 394.321mil |
| PHY1_MDI2- | 400.440mil |
| PHY1_MDI3+ | 335.779mil |
| PHY1_MDI3- | 347.346mil |

千兆以太网的 MDI（Medium Dependent Interface）差分信号一般控制差分阻抗在 100 欧姆。

### FAN

    | Pin |       Name       | Pin |       Name       |
    | :-: | :--------------: | :-: | :--------------: |
    |  1  |     PMW0_M1      |  2  |    +5V_INPUT     |
    |  3  |      GND         |  4  |       GND        |

### HDMI

HDMI（高清多媒体接口）是一种通过 TMDS（最小化传输差分信号）兼容的物理链路将视频和音频数据传输到音频/视频显示设备的统一方法。 HDMI 接口与 DVI（数字视频接口）标准电气兼容。

-  特征

    - HPD（热插拔检测）输入模拟比较器
    - 13.5–600 MHz 的输入参考时钟范围
    - 支持高达 10 位的深色模式
    - 聚合带宽高达 18Gbps
    - 支持高达 1080p@120Hz 和 4096x2304@60Hz 的视频分辨率
    - 与 3‑D 视频格式的兼容性

    | 信号               | 阻抗          | 描述                                                                                  |
    | ------------------ | ------------- | ------------------------------------------------------------------------------------- |
    | HDMI_TX_DP/DN[2꞉0] | 100ohm±10%    | HDMI TX data transmission                                                             |
    | HDMI_TX_CLKP/CLKN  | 100ohm±10%    | HDMI TX clock transmission                                                            |
    | HDMI_TX_HPDIN      | Not specified | HDMI TX hot‑plug detection                                                            |
    | HDMI_TX_REXT       | Not specified | External resistor for HDMI reference connection(Default꞉ 1% precision 1.62k resistor) |
    | HDMITX_SCL/SDA     | Not specified | HDMI data communication channel                                                       |
    | HDMITX_CEC         | Not specified | HDMI Consumer Electronics Control pin                                                 |

    在 RADXA CM3 计算模块上，HDMITX_SCL/SDA 和 HDMITX_CEC 信号已经通过电平转换处理。 HDMI_TX_HPDIN 信号有一个 100k 欧姆的下拉电阻，并通过一个 1k 欧姆的电阻串联到 RK3566。 设计底板时，用户无需担心电平转换问题。 请参考以下设计꞉

    <img src="/img/cm3/hdmi-design.webp" alt="HDMI Design" style={{ width: "80%" }}  />

- HDMI 2.0 布局要求

    | 范围                                           | 要求                                                                        |
    | ---------------------------------------------- | --------------------------------------------------------------------------- |
    | Trace Impedance                                | 100Ω ±10% differential                                                      |
    | Max intra‑pair skew                            | \<12mil                                                                     |
    | Max mismatch between clock and data pairs      | \<480mil                                                                    |
    | Max trace length on carrier board              | \<6 inches                                                                  |
    | Minimum pair to pair spacing                   | ≥5 times the width of HDMI trace (At least 4 times the width of HDMI trace) |
    | Minimum spacing between HDMI and other Signals | ≥5 times the width of HDMI trace (At least 4 times the width of HDMI trace) |
    | Maximum allowed via                            | Recommend ≤ 2 vias                                                          |

- 计算模块上 HDMI 信号的走线长度

    | 信号             | 长度         |
    | ---------------- | ------------ |
    | HDMI_TX0N_PORT   | 1310.556mil  |
    | HDMI_TX0P_PORT   | 1302.62mil   |
    | HDMI_TX1N_PORT   | 1218.286mil  |
    | HDMI_TX1P_PORT   | 1156.647mil  |
    | HDMI_TX2N_PORT   | 1122.794mil  |
    | HDMI_TX2P_PORT   | 1118.675mil  |
    | HDMI_TXCLKN_PORT | 1437.63mil   |
    | HDMI_TXCLKP_PORT | 1,398.265mil |

### MIPI CSI

- Camera_1

    | Pin |        Name       | Pin |        Name       |
    | :-: | :---------------: | :-: | :---------------: |
    |  1  |   VCC3V3_SYS      |  2  |  I2C0_SDA_PMIC    |
    |  3  |   I2C0_SCL_PMIC   |  4  |  CAM_CLKOUT0      |
    |  5  |   CAM_GPIO        |  6  |      GND          |
    |  7  | MIPI_CSI_RX_CLK0P |  8  | MIPI_CSI_RX_CLK0N |
    |  9  |       GND         | 10  | MIPI_CSI_RX_D1P   |
    | 11  | MIPI_CSI_RX_D1N   | 12  |      GND          |
    | 13  | MIPI_CSI_RX_D0P   | 14  | MIPI_CSI_RX_D0N   |
    | 15  |       GND         | 16  |      GND          |
    | 17  |       GND         |     |                   |

- Camera_2

    | Pin |        Name       | Pin |       Name        |
    | :-: | :---------------: | :-: | :---------------: |
    |  1  |   VCC3V3_SYS      |  2  |  I2C2_SDA_M1      |
    |  3  |   I2C2_SCL_M1     |  4  |  CAM_CLKOUT1      |
    |  5  |   CAM_PWR_2       |  6  |      GND          |
    |  7  | MIPI_CSI_RX_CLK1P |  8  | MIPI_CSI_RX_CLK1N |
    |  9  |      GND          | 10  | MIPI_CSI_RX_D3P   |
    | 11  | MIPI_CSI_RX_D3N   | 12  |      GND          |
    | 13  | MIPI_CSI_RX_D2P   | 14  | MIPI_CSI_RX_D2N   |
    | 15  |       GND         | 16  |      GND          |
    | 17  |       GND         |     |                   |

### MIPI DSI

- LCD_1

    | Pin |             Name              | Pin |               Name                |
    | :-: | :---------------------------: | :-: | :-------------------------------: |
    |  1  |       VCC_LEDA1                 |  2  |        VCC_LEDA1                |
    |  3  |       VCC_LEDA1                 |  4  |            GND                  |
    |  5  |       VCC_LEDK1                 |  6  |        VCC_LEDK1                |
    |  7  |       VCC_LEDK1                 |  8  |        VCC_LEDK1                |
    |  9  |           GND                   | 10  |            GND                  |
    | 11  | MIPI_DSI_TX0_D2P/LVDS_TX0_D2P   | 12  | MIPI_DSI_TX0_D2N/LVDS_TX0_D2N   |
    | 13  |           GND                   | 14  | MIPI_DSI_TX0_D1P/LVDS_TX0_D1P   |
    | 15  | MIPI_DSI_TX0_D1N/LVDS_TX0_D1N   | 16  |            GND                  |
    | 17  | MIPI_DSI_TX0_CLKP/LVDS_TX0_CLKP | 18  | MIPI_DSI_TX0_CLKN/LVDS_TX0_CLKN |
    | 19  |           GND                   | 20  | MIPI_DSI_TX0_D0P/LVDS_TX0_D0P   |
    | 21  | MIPI_DSI_TX0_D0N/LVDS_TX0_D0N   | 22  |            GND                  |
    | 23  | MIPI_DSI_TX0_D3P/LVDS_TX0_D3P   | 24  | MIPI_DSI_TX0_D3N/LVDS_TX0_D3N   |
    | 25  |           GND                   | 26  |        Not Connected            |
    | 27  |       MIPI_RESET_1              | 28  |            GND                  |
    | 29  |        VCC_1V8_1                | 30  |         VCC_LCD_MIPI            |
    | 31  |       VCC_LCD_MIPI              |     |                                 |

- LCD_2

    | Pin |       Name       | Pin |       Name       |
    | :-: | :--------------: | :-: | :--------------: |
    |  1  |  VCC_LCD_MIPI_2  |  2  |   VCC_1V8_2      |
    |  3  |  Not Connected   |  4  |   MIPI_RESET_2   |
    |  5  |  Not Connected   |  6  |      GND         |
    |  7  | MIPI_DSI_TX1_D0N |  8  | MIPI_DSI_TX1_D0P |
    |  9  |      GND         | 10  | MIPI_DSI_TX1_D1N |
    | 11  | MIPI_DSI_TX1_D1P | 12  |      GND         |
    | 13  | MIPI_DSI_TX1_CLKN| 14  | MIPI_DSI_TX1_CLKP|
    | 15  |      GND         | 16  | MIPI_DSI_TX1_D2N |
    | 17  | MIPI_DSI_TX1_D2P | 18  |      GND         |
    | 19  | MIPI_DSI_TX1_D3N | 20  | MIPI_DSI_TX1_D3P |
    | 21  |      GND         | 22  |      GND         |
    | 23  |    TP_RST_LCD    | 24  |    VCC_TP        |
    | 25  |    TP_INT_LCD    | 26  | I2C2_SDA_LCD     |
    | 27  | I2C2_SCL_LCD     | 28  |      GND         |
    | 29  |      GND         | 30  | VCC_LCD_MIPI_2   |
    | 31  | VCC_LCD_MIPI_2   | 32  |      GND         |
    | 33  |      GND         | 34  | VCC_LEDK2        |
    | 35  | VCC_LEDK2        | 36  | Not Connected    |
    | 37  | Not Connected    | 38  | VCC_LEDA2        |
    | 39  | VCC_LEDA2        | 40  |      GND         |
    | 41  | VCC_LCD_MIPI_2   |     |                  |

### PCIe

    | Pin  |       Name       | Pin  |       Name       |
    | :--: | :--------------: | :--: | :--------------: |
    |  B1  |     VCC12V       |  A1  | Not Connected    |
    |  B2  |     VCC12V       |  A2  |    VCC12V        |
    |  B3  |     VCC12V       |  A3  |    VCC12V        |
    |  B4  |       GND        |  A4  |      GND         |
    |  B5  | Not Connected    |  A5  |  VCC3V3_PCIE     |
    |  B6  | Not Connected    |  A6  |  VCC3V3_PCIE     |
    |  B7  |       GND        |  A7  | Not Connected    |
    |  B8  | VCC3V3_PCIE      |  A8  |  VCC3V3_PCIE     |
    |  B9  | VCC3V3_PCIE      |  A9  |  VCC3V3_PCIE     |
    |  B10 | VCC3V3_PCIE      |  A10 |  VCC3V3_PCIE     |
    |  B11 | PCIE20_WAKEn     |  A11 |    Pcie_nRST     |
    |  B12 | PCIE20_CLKREQn_M2|  A12 |      GND         |
    |  B13 |       GND        |  A13 |  PCIE20_REFCLKP  |
    |  B14 | PCIE20_TXP_1     |  A14 |  PCIE20_REFCLKN  |
    |  B15 | PCIE20_TXN_1     |  A15 |      GND         |
    |  B16 |       GND        |  A16 |  PCIE20_RXP_1    |
    |  B17 | Not Connected    |  A17 |  PCIE20_RXP_1    |
    |  B18 |       GND        |  A18 |      GND         |
    |      |                  |      |                  |
    |  C1  | Not Connected    |  C2  | Not Connected    |

### RTC

<img src="/img/cm3/radxa-cm3-rtc-schematic.webp" alt="rtc schematic" style={{ width: "80%" }} />

### SATA

SATA（Serial Advanced Technology Attachment）是 RK3566 支持的串行通讯硬盘接口。 它支持 SATA 3 协议并提供以下功能꞉

- 兼容 SATA 1 以及 SATA 2。
- 支持单数据通道最大信号传输速率6GT/s。
- 支持带外 (OOB) 通信。
- 支持SATA Power Management (PM) 功能和外接扩展芯片。
- 支持扩频功能。

下表提供了 SATA 接口信号的阻抗和说明꞉

| 信号        | 阻抗      | 描述                                         |
| ----------- | --------- | -------------------------------------------- |
| SATAx_TXP/N | 90ohm±10% | SATA数据发送，靠近主板连接器放置耦合电容10nF |
| SATAx_RXP/N | 90ohm±10% | SATA数据接收，靠近主板连接器放置耦合电容10nF |

SATA 3.0꞉ 应考虑以下布局要求

| 范围                         | 要求                                |
| ---------------------------- | ----------------------------------- |
| 走线阻抗                     | 100Ω ±10% 差分                      |
| 最大对内偏差                 | \<1200 万                           |
| 载板上的最大走线长度         | \<6 英寸                            |
| 交流耦合电容                 | 10nF ±20%，最好采用分立式 0201 封装 |
| 最小对对间距                 | ≥SATA走线宽度的4倍                  |
| SATA与其他信号之间的最小间距 | ≥SATA走线宽度的4倍                  |
| 允许的最大值                 | 推荐 ≤ 2 个过孔                     |

- SATA3.0 Port2 J7

    | Pin |       Name       | Pin |       Name       |
    | :-: | :--------------: | :-: | :--------------: |
    |  1  |       GND        |  2  |    SATA1_TXP     |
    |  3  |    SATA1_TXN     |  4  |       GND        |
    |  5  |    SATA1_RXN     |  6  |    SATA1_RXP     |
    |  7  |       GND        |  8  |       GND        |
    |  9  | SATA30_7P_V_DIP  |     |                  |

- SATA3.0 Port2 J20

    | Pin |       Name       | Pin |       Name       |
    | :-: | :--------------: | :-: | :--------------: |
    |  1  |       GND        |  2  |    SATA2_TXP     |
    |  3  |    SATA2_TXN     |  4  |       GND        |
    |  5  |    SATA2_RXN     |  6  |    SATA2_RXP     |
    |  7  |       GND        |  8  |       GND        |
    |  9  | SATA30_7P_V_DIP  |     |                  |

### TP

    | Pin |       Name       | Pin |       Name       |
    | :-: | :--------------: | :-: | :--------------: |
    |  1  |      TP_RST_L    |  2  |   VCC3V3_TP      |
    |  3  |      GND         |  4  |   TP_INT_L       |
    |  5  |  I2C3_SDA_TP     |  6  |   I2C3_SCL_TP    |
    |  7  |      GND         |  8  |      GND         |

### USB

- USB2.0

    | Pin |       Name       | Pin |       Name       |
    | :-: | :--------------: | :-: | :--------------: |
    |  1  |   VCC5V0_USB1    |  2  |     USB2_DM      |
    |  3  |     USB2_DP      |  4  |       GND        |
    |  5  |   VCC5V0_USB1    |  6  |     USB1_DM      |
    |  7  |     USB1_DP      |  8  |       GND        |
    |  9  |       GND        | 10  |       GND        |
    | 11  |       GND        | 12  |       GND        |

- USB3.0

    | Pin |       Name       | Pin |       Name       |
    | :-: | :--------------: | :-: | :--------------: |
    |  1  |     5V0_USB30    |  2  |   USB3_HOST1_DM  |
    |  3  |  USB3_HOST1_DP   |  4  |       GND        |
    |  5  |   USB3_SSRXN     |  6  |    USB3_SSRXP    |
    |  7  |       GND        |  8  |    USB3_SSTXN    |
    |  9  |   USB3_SSTXP     | 10  |       GND        |
    | 11  |       GND        |     |                  |

### 40-PIN GPIO

- 电压范围

| Type | Voltage | Tolerance |
| ---- | ------- | --------- |
| GPIO | 3.3V    | 3.63V     |
| ADC  | 1.8V    | 1.98V     |

- GPIO 接口

Radxa CM3 IO 提供一个 40 pin GPIO 扩展座，兼容市场上大多数传感器应用。

:::caution
提示：实际兼容性以实际使用情况为准。
:::

<Tabs queryString="revision">
<TabItem value="v1_1" label="v1.1">

<div className='gpio_style'>

:::tip

Radxa CM3 IO 板和 Raspberry Pi CM4 IO 底板的 40 引脚扩展头是兼容的。以下引脚布局适用于这两种产品：

:::

| GPIO number |  Function4  |  Function3   |    Function2    | Function1 |               Pin#               |              Pin#               | Function1 |                 Function2                 |  Function3   |  Function4   | GPIO number |
| ----------- | :---------: | :----------: | :-------------: | :-------: | :------------------------------: | :-----------------------------: | :-------: | :---------------------------------------: | :----------: | :----------: | ----------- |
|             |             |              |                 |   +3.3V   | <div className='yellow'>1</div>  |  <div className='red'>2</div>   |   +5.0V   |                                           |              |              |             |
| 14          |   PWM2_M1   | SPI0_MOSI_M0 |   I2C2_SDA_M0   | GPIO0_B6  |  <div className='green'>3</div>  |  <div className='red'>4</div>   |   +5.0V   |                                           |              |              |             |
| 13          |   PWM1_M1   | SPI0_CLK_M0  |   I2C2_SCL_M0   | GPIO0_B5  |  <div className='green'>5</div>  | <div className='black'>6</div>  |    GND    |                                           |              |              |             |
| 125         |             |              |  I2S1_SDI3_M1   | GPIO3_D5  |  <div className='green'>7</div>  | <div className='green'>8</div>  | GPIO0_D1  | <div className='orange'>UART2_TX_M0</div> |              |              | 25          |
|             |             |              |                 |    GND    |  <div className='black'>9</div>  | <div className='green'>10</div> | GPIO0_D0  | <div className='orange'>UART2_RX_M0</div> |              |              | 24          |
| 23          |             |  UART0_CTSn  |     PWM0_M1     | GPIO0_C7  | <div className='green'>11</div>  | <div className='green'>12</div> | GPIO3_C7  |              I2S1_SCLK_TX_M1              |              |              | 119         |
| 15          |             |              |     PWM0_M0     | GPIO0_B7  | <div className='green'>13</div>  | <div className='black'>14</div> |    GND    |                                           |              |              |             |
| 19          |             |              |      PWM4       | GPIO0_C3  | <div className='green'>15</div>  | <div className='green'>16</div> | GPIO3_D4  |               I2S1_SDI2_M1                |              |              | 124         |
|             |             |              |                 |   +3.3V   | <div className='yellow'>17</div> | <div className='green'>18</div> | GPIO3_D3  |               I2S1_SDI1_M1                |              |              | 123         |
| 138         | I2C4_SDA_M0 | I2S2_SDI_M1  |  SPI3_MOSI_M0   | GPIO4_B2  | <div className='green'>19</div>  | <div className='black'>20</div> |    GND    |                                           |              |              |             |
| 136         |             | I2S1_SDO1_M1 |  SPI3_MISO_M0   | GPIO4_B0  | <div className='green'>21</div>  | <div className='green'>22</div> | GPIO3_C6  |               I2S1_MCLK_M1                |              |              | 118         |
| 139         | I2C4_SCL_M0 | I2S2_SDO_M1  |   SPI3_CLK_M0   | GPIO4_B3  | <div className='green'>23</div>  | <div className='green'>24</div> | GPIO4_A6  |                SPI3_CS0_M0                | I2S1_SCLK_RX |              | 134         |
|             |             |              |                 |    GND    | <div className='black'>25</div>  | <div className='green'>26</div> | GPIO4_C5  |                UART9_TX_M1                | I2S3_SDO_M1  | SPI3_MISO_M1 |             |
| 140         |             |              |   I2C2_SDA_M1   | GPIO4_B4  |  <div className='blue'>27</div>  | <div className='blue'>28</div>  | GPIO4_B5  |                I2C2_SCL_M1                | I2S1_SDO3_M1 |              | 141         |
| 137         |             |              |  I2S1_SDO2_M1   | GPIO4_B1  | <div className='green'>29</div>  | <div className='black'>30</div> |    GND    |                                           |              |              |             |
| 21          |             |     PWM6     |  SPI0_MISO_M0   | GPIO0_C5  | <div className='green'>31</div>  | <div className='green'>32</div> | GPIO4_C0  |                PWM11_IR_M1                |              |              | 144         |
| 22          |             |   PWM7_IR    |   SPI0_CS0_M0   | GPIO0_C6  | <div className='green'>33</div>  | <div className='black'>34</div> |    GND    |                                           |              |              |             |
| 120         |             |              | I2S1_LRCK_TX_M1 | GPIO3_D0  | <div className='green'>35</div>  | <div className='green'>36</div> | GPIO4_A7  |              I2S1_LRCK_RX_M1              |              |              | 135         |
| 18          |             |              |     PWM3_IR     | GPIO0_C2  | <div className='green'>37</div>  | <div className='green'>38</div> | GPIO3_D2  |               I2S1_SDI0_M1                |              |              | 122         |
|             |             |              |                 |    GND    | <div className='black'>39</div>  | <div className='green'>40</div> | GPIO3_D1  |               I2S1_SDO0_M1                |              |              | 121         |

</div>

- 关于 V1.1 硬件版本的 40-pin 扩展座的补充

- 标有橙色的引脚用于 debug console。
- PWM: x8, PWM0 / PWM1 / PWM2 / PWM3 / PWM4 / PWM6 / PWM7 / PWM11
- SPI: x2, SPI0 / SPI3
- I2C: x2, I2C2 / I2C4
- UART: x1, UART2

</TabItem>
</Tabs>
