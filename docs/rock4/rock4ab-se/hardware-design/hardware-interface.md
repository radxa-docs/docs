---
sidebar_position: 1
---

import GPIO from '../../\_rock4-gpio.mdx';

# 硬件接口说明

## 芯片框图

<Tabs queryString="model">

    <TabItem value="Rockchip RK3399">
        <img src="/img/rock4/rk3399-block-diagram.webp" width="800" alt="rk3399 block diagram" />
    </TabItem>

    <TabItem value="Rockchip RK3399-T">
        <img src="/img/rock4/rk3399t-block-diagram.webp" width="800" alt="rk3399-t block diagram" />
    </TabItem>

</Tabs>

## 实物照片

<Tabs queryString="model">

    <TabItem value="ROCK 4A">
        <img src="/img/rock4/rock4a-interfaces.webp" width="800" alt="rock4a real" />
    </TabItem>

    <TabItem value="ROCK 4B">
        <img src="/img/rock4/rock4b-interfaces.webp" width="800" alt="rock4b real" />
    </TabItem>

    <TabItem value="ROCK 4A+">
        <img src="/img/rock4/rock4ap-interfaces.webp" width="800" alt="rock4ap real" />
    </TabItem>

    <TabItem value="ROCK 4B+">
        <img src="/img/rock4/rock4bp-interfaces.webp" width="800" alt="rock4bp real" />
    </TabItem>

    <TabItem value="ROCK 4SE">
        <img src="/img/rock4/rock4se-interfaces.webp" width="800" alt="rock4se real" />
    </TabItem>

</Tabs>

## 接口详情

### 40-PIN GPIO Header

<GPIO />

### eMMC Connector

| Pin |  Name   | Pin |    Name    |
| :-: | :-----: | :-: | :--------: |
|  1  | VCC_1V8 |  2  | VCC3V3_SYS |
|  3  | VCC_1V8 |  4  | VCC3V3_SYS |
|  5  | VCC_1V8 |  6  | VCC3V3_SYS |
|  7  | VCC_1V8 |  8  | VCC3V3_SYS |
|  9  | VCC_1V8 | 10  |    GND     |
| 11  |   GND   | 12  |  eMMC_RST  |
| 13  |   GND   | 14  |  eMMC_CLK  |
| 15  |   GND   | 16  |  eMMC_CMD  |
| 17  |   GND   | 18  |  eMMC_D7   |
| 19  |   GND   | 20  |  eMMC_D6   |
| 21  |   GND   | 22  |  eMMC_D5   |
| 23  |   GND   | 24  |  eMMC_D4   |
| 25  |   GND   | 26  |  eMMC_D3   |
| 27  |   GND   | 28  |  eMMC_D2   |
| 29  |   GND   | 30  |  eMMC_D1   |
| 31  |   GND   | 32  |  eMMC_D0   |
| 33  |   NC    | 34  |  eMMC_DQS  |
| 35  |   NC    | 36  |     NC     |
| 37  |   NC    | 38  |     NC     |
| 39  |         | 40  |     NC     |
| 41  |         | 42  |     NC     |

### HDMI

| Pin |   Name    | Pin |    Name     |
| :-: | :-------: | :-: | :---------: |
|  1  | HDMI_TX2P |  2  |     GND     |
|  3  | HDMI_TX2N |  4  |  HDMI_TX1P  |
|  5  |    GND    |  6  |  HDMI_TX1N  |
|  7  | HDMI_TX0P |  8  |     GND     |
|  9  | HDMI_TX0N | 10  |  HDMI_TXCP  |
| 11  |    GND    | 12  |  HDMI_TXCN  |
| 13  | PORT_CEC  | 14  |     NC      |
| 15  |  DDC_SCL  | 16  |   DDC_SDA   |
| 17  |    GND    | 18  | VCC5V0_HDMI |
| 19  | HDMI_HPD  | 20  |     GND     |
| 21  |    GND    | 22  |     GND     |
| 23  |    GND    | 24  |             |

### MicroSD

| Pin |     Name     |
| :-: | :----------: |
|  1  |  SDMMC0_D2   |
|  2  |  SDMMC0_D3   |
|  3  |  SDMMC0_CMD  |
|  4  |  VCC3V3_SYS  |
|  5  |  SDMMC0_CLK  |
|  6  |     GND      |
|  7  |  SDMMC0_D0   |
|  8  |  SDMMC0_D1   |
|  9  | SDMMC0_DET_L |
| 10  |     GND      |
| 11  |     GND      |
| 12  |     GND      |
| 13  |     GND      |

### MIPI CSI

| Pin |     Name      |
| :-: | :-----------: |
|  1  |    VCC_CAM    |
|  2  |   I2C4_SCL    |
|  3  |   I2C4_SDA    |
|  4  |   CAM_MCLK    |
|  5  |   CAM_GPIO1   |
|  6  |      GND      |
|  7  | MIPI_RX0_CLKP |
|  8  | MIPI_RX0_CLKN |
|  9  |      GND      |
| 10  | MIPI_RX0_D1P  |
| 11  | MIPI_RX0_D1N  |
| 12  |      GND      |
| 13  | MIPI_RX0_D0P  |
| 14  | MIPI_RX0_D0N  |
| 15  |      GND      |

### MIPI DSI

| Pin |      Name       |
| :-: | :-------------: |
|  1  |    VCC_MIPI     |
|  2  |    VCC_MIPI     |
|  3  |       GND       |
|  4  |  I2C_SDA_AUDIO  |
|  5  |  I2C_SCL_AUDIO  |
|  6  |       GND       |
|  7  | MIPI_TX/RX_D0P  |
|  8  | MIPI_TX/RX_D0N  |
|  9  |       GND       |
| 10  | MIPI_TX/RX_CLKP |
| 11  | MIPI_TX/RX_CLKN |
| 12  |       GND       |
| 13  | MIPI_TX/RX_D1P  |
| 14  | MIPI_TX/RX_D1N  |
| 15  |       GND       |

### PCIe

| Pin |      Name      | Pin |     Name      |
| :-: | :------------: | :-: | :-----------: |
|  1  |      GND       |  2  |  VCC3V3_PCIE  |
|  3  |      GND       |  4  |  VCC3V3_PCIE  |
|  5  |   PCIE_RX3_N   |  6  |      NC       |
|  7  |   PCIE_RX3_P   |  8  |      NC       |
|  9  |      GND       | 10  |      NC       |
| 11  |   PCIE_TX3N    | 12  |  VCC3V3_PCIE  |
| 13  |   PCIE_TX3P    | 14  |  VCC3V3_PCIE  |
| 15  |      GND       | 16  |  VCC3V3_PCIE  |
| 17  |   PCIE_RX2_N   | 18  |  VCC3V3_PCIE  |
| 19  |   PCIE_RX2_P   | 20  |      NC       |
| 21  |      GND       | 22  |      NC       |
| 23  |   PCIE_TX2N    | 24  |      NC       |
| 25  |   PCIE_TX2P    | 26  |      NC       |
| 27  |      GND       | 28  |      NC       |
| 29  |   PCIE_RX1_N   | 30  |      NC       |
| 31  |   PCIE_RX1_P   | 32  |      NC       |
| 33  |      GND       | 34  |      NC       |
| 35  |   PCIE_TX1N    | 36  |      NC       |
| 37  |   PCIE_TX1P    | 38  |      NC       |
| 39  |      GND       | 40  |      NC       |
| 41  |   PCIE_RX0_N   | 42  |      NC       |
| 43  |   PCIE_RX0_P   | 44  |      NC       |
| 45  |      GND       | 46  |      NC       |
| 47  |   PCIE_TX0N    | 48  |      NC       |
| 49  |   PCIE_TX0P    | 50  | PCIE_PERST_L  |
| 51  |      GND       | 52  | PCIE_CLKREQ_L |
| 53  | PCIE_REF_CLK_N | 54  |      NC       |
| 55  | PCIE_REF_CLK_P | 56  |      NC       |
| 57  |      GND       | 58  |      NC       |
|     |                |     |               |
| 67  |       NC       | 68  |      NC       |
| 69  |       NC       | 70  |  VCC3V3_PCIE  |
| 71  |      GND       | 72  |  VCC3V3_PCIE  |
| 73  |      GND       | 74  |  VCC3V3_PCIE  |
| 75  |      GND       | 76  |      GND      |
| 77  |      GND       |     |               |

### USB

- USB 2.0

| Pin |       Name       |
| :-: | :--------------: |
|  1  |     HOST0_DP     |
|  2  |     HOST0_DM     |
|  3  |    TYPEC0_DP     |
|  4  |    TYPEC0_DM     |
|  5  |    TYPEC0_ID     |
|  6  | TYPEC0_U2VBUSDET |
|  7  |       GND        |
|  8  |     HOST1_DP     |
|  9  |     HOST1_DM     |
| 10  |     USB3_DP      |
| 11  |     USB3_DM      |
| 12  |        NC        |
| 13  |        NC        |
| 14  |       GND        |
| 15  |     VCC_0V9      |
| 16  |     VCCA_1V8     |
| 17  |    VCC3V3_SYS    |

- USB 3.0

| Pin |    Name     |
| :-: | :---------: |
|  1  | USB3_SSTX1P |
|  2  | USB3_SSTX1N |
|  3  | USB3_SSRX1P |
|  4  | USB3_SSRX1N |
|  5  |     NC      |
|  6  |     NC      |
|  7  |     NC      |
|  8  |     NC      |
|  9  |     NC      |
| 10  |     NC      |
| 11  |     NC      |
| 12  |     NC      |
| 13  |     NC      |
| 14  |     NC      |
| 15  |     NC      |
| 16  |     NC      |
| 17  |     NC      |
| 18  |     GND     |
| 19  |   VCC_0V9   |
| 20  |   VCC_0V9   |
| 21  |  VCCA_1V8   |
| 22  | VCC3V3_SYS  |
