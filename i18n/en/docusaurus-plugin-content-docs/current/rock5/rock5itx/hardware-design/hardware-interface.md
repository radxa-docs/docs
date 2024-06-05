---
sidebar_position: 4
---

# Hardware Interface Descriptions

## Chip block diagram

<img src="/img/rock5b/rk3588-block-diagram.webp" alt="rk3588 system diagram" width="700" />

## system block diagram

<img src="/img/rock5itx/rock5itx-system-block-diagram.webp" alt="rk3588 system diagram" width="700" />

## Physical image

<img src="/img/rock5itx/rock5itx-real.webp" width="600" />

The following are the detailed interface wiring sequences and descriptions for each hardware interface.

## TP Interface

| Pin |    Name     |           Description            |
| :-: | :---------: | :------------------------------: |
|  1  |  TP3_RST_L  |   Touchpad 3 Reset, active low   |
|  2  |  VCC3V3_TP  |  3.3V Power Supply for Touchpad  |
|  3  |     GND     |              Ground              |
|  4  |  TP3_INT_L  | Touchpad 3 Interrupt, active low |
|  5  | I2C6_SDA_M0 |  I2C Bus 6 Data Line, Master 0   |
|  6  | I2C6_SCL_M0 |  I2C Bus 6 Clock Line, Master 0  |
|  7  |     GND     |              Ground              |
|  8  |     GND     |              Ground              |

Spacing 0.5 mm

## LCD0

| Pin |        Name        |                   Description                    |
| :-: | :----------------: | :----------------------------------------------: |
|  0  |        GND         | Ground, common reference for electrical circuits |
|  1  |       VDD3V3       |                3.3V power supply                 |
|  2  |     VCC_1V8_S0     |          1.8V power supply for Sensor 0          |
|  3  |  SENSOR_INT_LCD1   |       Interrupt signal from Sensor to LCD1       |
|  4  |     LCD_RESET      |               Reset signal for LCD               |
|  5  |         /          |                  No connection                   |
|  6  |        GND         |                      Ground                      |
|  7  | MIPI_DPHY0_TX_D0N  |         MIPI D-PHY data lane 0 negative          |
|  8  | MIPI_DPHY0_TX_D0P  |         MIPI D-PHY data lane 0 positive          |
|  9  |        GND         |                      Ground                      |
| 10  | MIPI_DPHY0_TX_D1N  |         MIPI D-PHY data lane 1 negative          |
| 11  | MIPI_DPHY0_TX_D1P  |         MIPI D-PHY data lane 1 positive          |
| 12  |        GND         |                      Ground                      |
| 13  | MIPI_DPHY0_TX_CLKN |          MIPI D-PHY clock lane negative          |
| 14  | MIPI_DPHY0_TX_CLKP |          MIPI D-PHY clock lane positive          |
| 15  |        GND         |                      Ground                      |
| 16  | MIPI_DPHY0_TX_D2N  |         MIPI D-PHY data lane 2 negative          |
| 17  | MIPI_DPHY0_TX_D2P  |         MIPI D-PHY data lane 2 positive          |
| 18  |        GND         |                      Ground                      |
| 19  | MIPI_DPHY0_TX_D3N  |         MIPI D-PHY data lane 3 negative          |
| 20  | MIPI_DPHY0_TX_D3P  |         MIPI D-PHY data lane 3 positive          |
| 21  |        GND         |                      Ground                      |
| 22  |        GND         |                      Ground                      |
| 23  |     TP1_RST_L      |    Reset signal for Touch Panel 1, active low    |
| 24  |        GND         |                      Ground                      |
| 25  |     TP1_INT_L      | Interrupt signal from Touch Panel 1, active low  |
| 26  |    I2C6_SDA_M0     |          I2C Bus 6 Data Line, Master 0           |
| 27  |    I2C6_SCL_M0     |          I2C Bus 6 Clock Line, Master 0          |
| 28  |        GND         |                      Ground                      |
| 29  |        GND         |                      Ground                      |
| 30  |       VCC3V3       |                3.3V power supply                 |
| 31  |       VCC3V3       |                3.3V power supply                 |
| 32  |        GND         |                      Ground                      |
| 33  |        GND         |                      Ground                      |
| 34  |     VCC_LEDK1      |             Power supply for LED K1              |
| 35  |     VCC_LEDK1      |             Power supply for LED K1              |
| 36  |         /          |                  No connection                   |
| 37  |         /          |                  No connection                   |
| 38  |     VCC_LEDA1      |             Power supply for LED A1              |
| 39  |     VCC_LEDA1      |             Power supply for LED A1              |
| 40  |        GND         |                      Ground                      |

The LCD holder is FH35C-39S-0.3SHW (50) with 0.3 mm pitch.

## Camera Interface

### CAM0

| Pin |        Name        |                         Description                          |
| :-: | :----------------: | :----------------------------------------------------------: |
|  1  |        GND         |       Ground, common reference for electrical circuits       |
|  2  |  MIPI_CSI0_RX_D3N  |           MIPI CSI-0 receive data lane 3 negative            |
|  3  |  MIPI_CSI0_RX_D3P  |           MIPI CSI-0 receive data lane 3 positive            |
|  4  |        GND         |                            Ground                            |
|  5  |  MIPI_CSI0_RX_D2N  |           MIPI CSI-0 receive data lane 2 negative            |
|  6  |  MIPI_CSI0_RX_D2P  |           MIPI CSI-0 receive data lane 2 positive            |
|  7  |        GND         |                            Ground                            |
|  8  | MIPI_CSI0_RX_CLK1N |           MIPI CSI-0 receive clock lane 1 negative           |
|  9  | MIPI_CSI0_RX_CLK1P |           MIPI CSI-0 receive clock lane 1 positive           |
| 10  |        GND         |                            Ground                            |
| 11  |  MIPI_CSI0_RX_D1N  |           MIPI CSI-0 receive data lane 1 negative            |
| 12  |  MIPI_CSI0_RX_D1P  |           MIPI CSI-0 receive data lane 1 positive            |
| 13  |        GND         |                            Ground                            |
| 14  |  MIPI_CSI0_RX_D0N  |           MIPI CSI-0 receive data lane 0 negative            |
| 15  |  MIPI_CSI0_RX_D0P  |           MIPI CSI-0 receive data lane 0 positive            |
| 16  |        GND         |                            Ground                            |
| 17  | MIPI_CSI0_RX_CLK0N |           MIPI CSI-0 receive clock lane 0 negative           |
| 18  | MIPI_CSI0_RX_CLK0P |           MIPI CSI-0 receive clock lane 0 positive           |
| 19  |        GND         |                            Ground                            |
| 20  |  MIPI_CAM3_CLKOUT  |                Clock output for MIPI Camera 3                |
| 21  |         NC         |                        No connection                         |
| 22  |      GPIO1_B6      |        General Purpose Input/Output pin, bank 1 bit 6        |
| 23  |  MIPI_CSI0_PDN0_H  |        Power down signal for MIPI CSI-0, active high         |
| 24  |  I2C3_SCL_M0_MIPI  |      I2C bus 3 clock line, master 0 for MIPI interface       |
| 25  |  I2C3_SDA_M0_MIPI  |       I2C bus 3 data line, master 0 for MIPI interface       |
| 26  |  MIPI_CSI0_PDN1_H  | Power down signal for second port of MIPI CSI-0, active high |
| 27  |      CM_RST_L      |               Camera module reset, active low                |
| 28  |      3V3_CAM1      |                3.3V power supply for Camera 1                |
| 29  |      3V3_CAM1      |                3.3V power supply for Camera 1                |
| 30  |      3V3_CAM1      |                3.3V power supply for Camera 1                |
| 31  |      3V3_CAM1      |                3.3V power supply for Camera 1                |

### CAM 1

| Pin |        Name        |                         Description                          |
| :-: | :----------------: | :----------------------------------------------------------: |
|  1  |        GND         |       Ground, common reference for electrical circuits       |
|  2  |  MIPI_CSI1_RX_D3N  |           MIPI CSI-1 receive data lane 3 negative            |
|  3  |  MIPI_CSI1_RX_D3P  |           MIPI CSI-1 receive data lane 3 positive            |
|  4  |        GND         |                            Ground                            |
|  5  |  MIPI_CSI1_RX_D2N  |           MIPI CSI-1 receive data lane 2 negative            |
|  6  |  MIPI_CSI1_RX_D2P  |           MIPI CSI-1 receive data lane 2 positive            |
|  7  |        GND         |                            Ground                            |
|  8  | MIPI_CSI1_RX_CLK1N |           MIPI CSI-1 receive clock lane 1 negative           |
|  9  | MIPI_CSI1_RX_CLK1P |           MIPI CSI-1 receive clock lane 1 positive           |
| 10  |        GND         |                            Ground                            |
| 11  |  MIPI_CSI1_RX_D1N  |           MIPI CSI-1 receive data lane 1 negative            |
| 12  |  MIPI_CSI1_RX_D1P  |           MIPI CSI-1 receive data lane 1 positive            |
| 13  |        GND         |                            Ground                            |
| 14  |  MIPI_CSI1_RX_D0N  |           MIPI CSI-1 receive data lane 0 negative            |
| 15  |  MIPI_CSI1_RX_D0P  |           MIPI CSI-1 receive data lane 0 positive            |
| 16  |        GND         |                            Ground                            |
| 17  | MIPI_CSI1_RX_CLK0N |           MIPI CSI-1 receive clock lane 0 negative           |
| 18  | MIPI_CSI1_RX_CLK0P |           MIPI CSI-1 receive clock lane 0 positive           |
| 19  |        GND         |                            Ground                            |
| 20  |  MIPI_CAM4_CLKOUT  |                Clock output for MIPI Camera 4                |
| 21  |         NC         |                        No connection                         |
| 22  |  MIPI_CAM2_CLKOUT  |        General Purpose Input/Output pin, bank 1 bit 6        |
| 23  |  MIPI_CAM2_PDN_L   |        Power down signal for MIPI CSI-1, active high         |
| 24  |    I2C7_SCL_M0     |      I2C bus 3 clock line, master 0 for MIPI interface       |
| 25  |    I2C7_SDA_M0     |       I2C bus 3 data line, master 0 for MIPI interface       |
| 26  |  MIPI_CAM2_PDN2_L  | Power down signal for second port of MIPI CSI-1, active high |
| 27  |  MIPI_CAM2_RST_L   |               Camera module reset, active low                |
| 28  |      3V3_CAM1      |                3.3V power supply for Camera 1                |
| 29  |      3V3_CAM1      |                3.3V power supply for Camera 1                |
| 30  |      3V3_CAM1      |                3.3V power supply for Camera 1                |
| 31  |      3V3_CAM1      |                3.3V power supply for Camera 1                |

The camera holder is FH35C-31S-0.3SHW (50) with 0.3 mm pitch.

## Micro SD

| Pin |    Name     |          Description          |
| :-: | :---------: | :---------------------------: |
|  1  |  SDMMC_D2   |      SD card data line 2      |
|  2  |  SDMMC_D3   |      SD card data line 3      |
|  3  |  SDMMC_CMD  |   Command line for SD card    |
|  4  |  VCC3V3_SD  | 3.3V Power Supply for SD card |
|  5  |  SDMMC_CLK  |    Clock line for SD card     |
|  6  |     GND     |            Ground             |
|  7  |  SDMMC_D0   |      SD card data line 0      |
|  8  |  SDMMC_D1   |      SD card data line 1      |
|  9  | SDMMC_DET_L |  SD card detect, active low   |
| 10  |     GND     |            Ground             |
| 11  |     GND     |            Ground             |
| 12  |     GND     |            Ground             |
| 13  |     GND     |            Ground             |

Spacing 1.85 mm

## DEBUG UART

| Pin |    Name     |       Description        |
| :-: | :---------: | :----------------------: |
|  3  | UART2_RX_M0 | UART2 Receive, Master 0  |
|  2  | UART2_TX_M0 | UART2 Transmit, Master 0 |
|  1  |     GND     |          Ground          |

Spacing 2.54 mm

## RECOVERY

| Pin |   Name   |    Description    |
| :-: | :------: | :---------------: |
|  1  | RECOVERY | Recovery mode pin |
|  2  |   GND    |      Ground       |

Spacing 2.54 mm

## F_USB

| Pin |     Name     |         Description         |
| :-: | :----------: | :-------------------------: |
|  1  | VCC5V0_USB20 | 5V Power Supply for USB 2.0 |
|  2  | VCC5V0_USB20 | 5V Power Supply for USB 2.0 |
|  3  |   USB1_DM    |      USB 1 Data Minus       |
|  4  |   USB2_DM    |      USB 2 Data Minus       |
|  5  |   USB1_DP    |       USB 1 Data Plus       |
|  6  |   USB2_DP    |       USB 2 Data Plus       |
|  7  |     GND      |           Ground            |
|  8  |     GND      |           Ground            |
| 10  |      NC      |        No Connection        |

Spacing 2.54 mm

## F_AUDIO

| Pin |   Name   |         Description         |
| :-: | :------: | :-------------------------: |
|  1  | MIC_IN2P | Microphone Input 2 Positive |
|  2  |   GND    |           Ground            |
|  3  | MICBIAS1 |      Microphone Bias 1      |
|  4  |   GND    |           Ground            |
|  5  |   HPOR   |   Headphone Output Right    |
|  6  |   HPOR   |   Headphone Output Right    |
|  7  |    NC    |        No Connection        |
|  8  |    NC    |        No Connection        |
|  9  |   HPOL   |    Headphone Output Left    |
| 10  |   HPOL   |    Headphone Output Left    |

Spacing 2.54 mm

## SPDIF audio interface

| Pin |     Name     |       Description        |
| :-: | :----------: | :----------------------: |
|  1  | SPDIF1_TX_M2 | SPDIF1 Transmit, Mode 2  |
|  2  |  VCC3V3_SYS  | 3.3V System Power Supply |
|  3  |     GND      |          Ground          |

## POE

| Pin |  Name   |       Description       |
| :-: | :-----: | :---------------------: |
|  1  |  VIN+   |   Positive Voltage In   |
|  2  |  VIN-   |   Negative Voltage In   |
|  3  |   NC    |      Not Connected      |
|  4  |   NC    |      Not Connected      |
|  5  |   NC    |      Not Connected      |
|  6  |   NC    |      Not Connected      |
|  7  |   GND   |         Ground          |
|  8  | POE_12V | 12V Power over Ethernet |
|  9  |   GND   |         Ground          |
| 10  |   GND   |         Ground          |

Spacing 2.54 mm

## USB 3.0 + HDMI-10

| Pin |      Name      |     Description      | Pin |     Name     |       Description        |
| :-: | :------------: | :------------------: | :-: | :----------: | :----------------------: |
| 38  |      GND       |        Ground        | 39  |     GND      |          Ground          |
| 45  |      GND       |        Ground        | 40  |     GND      |          Ground          |
|  1  |   HDMI_D2_P    | HDMI Data 2 Positive | 20  | VCC5V0_USB12 |       5V USB Power       |
|  2  |      GND       |        Ground        | 21  |   HUB1_DM    |   USB Hub 1 Data Minus   |
|  3  |   HDMI_D2_N    | HDMI Data 2 Negative | 22  |   HUB1_DP    |   USB Hub 1 Data Plus    |
|  4  |   HDMI_D1_P    | HDMI Data 1 Positive | 23  |     GND      |          Ground          |
|  5  |      GND       |        Ground        | 24  | HUB1_SSRX_N  | USB Hub 1 SS RX Negative |
|  6  |   HDMI_D1_N    | HDMI Data 1 Negative | 25  | HUB1_SSRX_P  | USB Hub 1 SS RX Positive |
|  7  |   HDMI_D0_P    | HDMI Data 0 Positive | 26  |     GND      |          Ground          |
|  8  |      GND       |        Ground        | 27  | HUB1_SSTX_N  | USB Hub 1 SS TX Negative |
|  9  |   HDMI_D0_N    | HDMI Data 0 Negative | 28  | HUB1_SSTX_P  | USB Hub 1 SS TX Positive |
| 10  |   HDMI_CK_P    | HDMI Clock Positive  | 29  | VCC5V0_USB12 |       5V USB Power       |
| 11  |      GND       |        Ground        | 30  |   HUB2_DM    |   USB Hub 2 Data Minus   |
| 12  |   HDMI_CK_N    | HDMI Clock Negative  | 31  |   HUB2_DP    |   USB Hub 2 Data Plus    |
| 13  |      GND       |        Ground        | 32  |     GND      |          Ground          |
| 14  |       NC       |    No Connection     | 33  | HUB2_SSRX_N  | USB Hub 2 SS RX Negative |
| 15  |    HDMI_SCL    |       HDMI SCL       | 34  | HUB2_SSRX_P  | USB Hub 2 SS RX Positive |
| 16  |    HDMI_SDA    |       HDMI SDA       | 35  |     GND      |          Ground          |
| 17  |      GND       |        Ground        | 36  | HUB2_SSTX_N  | USB Hub 2 SS TX Negative |
| 18  | VCC5V_HDMI_TX0 |    5V HDMI Power     | 37  | HUB2_SSTX_P  | USB Hub 2 SS TX Positive |
| 19  |   HDMI0_HPD    | HDMI Hot Plug Detect |     |              |                          |
| 44  |      GND       |        Ground        | 41  |     GND      |          Ground          |
| 43  |      GND       |        Ground        | 42  |     GND      |          Ground          |

## USB 3.0 + HDMI-11

| Pin |      Name      |     Description      | Pin |     Name     |       Description        |
| :-: | :------------: | :------------------: | :-: | :----------: | :----------------------: |
| 38  |      GND       |        Ground        | 39  |     GND      |          Ground          |
| 45  |      GND       |        Ground        | 40  |     GND      |          Ground          |
|  1  |   HDMI_D2_P    | HDMI Data 2 Positive | 20  | VCC5V0_USB12 |       5V USB Power       |
|  2  |      GND       |        Ground        | 21  |   HUB1_DM    |   USB Hub 1 Data Minus   |
|  3  |   HDMI_D2_N    | HDMI Data 2 Negative | 22  |   HUB1_DP    |   USB Hub 1 Data Plus    |
|  4  |   HDMI_D1_P    | HDMI Data 1 Positive | 23  |     GND      |          Ground          |
|  5  |      GND       |        Ground        | 24  | HUB1_SSRX_N  | USB Hub 1 SS RX Negative |
|  6  |   HDMI_D1_N    | HDMI Data 1 Negative | 25  | HUB1_SSRX_P  | USB Hub 1 SS RX Positive |
|  7  |   HDMI_D0_P    | HDMI Data 0 Positive | 26  |     GND      |          Ground          |
|  8  |      GND       |        Ground        | 27  | HUB1_SSTX_N  | USB Hub 1 SS TX Negative |
|  9  |   HDMI_D0_N    | HDMI Data 0 Negative | 28  | HUB1_SSTX_P  | USB Hub 1 SS TX Positive |
| 10  |   HDMI_CK_P    | HDMI Clock Positive  | 29  | VCC5V0_USB12 |       5V USB Power       |
| 11  |      GND       |        Ground        | 30  |   HUB2_DM    |   USB Hub 2 Data Minus   |
| 12  |   HDMI_CK_N    | HDMI Clock Negative  | 31  |   HUB2_DP    |   USB Hub 2 Data Plus    |
| 13  |       NC       |    No Connection     | 32  |     GND      |          Ground          |
| 14  |       NC       |    No Connection     | 33  | HUB2_SSRX_N  | USB Hub 2 SS RX Negative |
| 15  |    HDMI_SCL    |       HDMI SCL       | 34  | HUB2_SSRX_P  | USB Hub 2 SS RX Positive |
| 16  |    HDMI_SDA    |       HDMI SDA       | 35  |     GND      |          Ground          |
| 17  |      GND       |        Ground        | 36  | HUB2_SSTX_N  | USB Hub 2 SS TX Negative |
| 18  | VCC5V_HDMI_TX0 |    5V HDMI Power     | 37  | HUB2_SSTX_P  | USB Hub 2 SS TX Positive |
| 19  |   HDMI0_HPD    | HDMI Hot Plug Detect | 41  |     GND      |          Ground          |
| 44  |      GND       |        Ground        | 42  |     GND      |          Ground          |
| 43  |      GND       |        Ground        |     |              |                          |

## Ethernet + USB 2.0-12

### Ethernet

| Pin |      Name      |                   Description                    |
| :-: | :------------: | :----------------------------------------------: |
|  1  |  MDI0+\_PHY2   | Medium Dependent Interface 0, Positive for PHY2  |
|  2  |  MDI0-\_PHY2   | Medium Dependent Interface 0, Negative for PHY2  |
|  3  |  MDI1+\_PHY2   | Medium Dependent Interface 1, Positive for PHY2  |
|  4  |  MDI1-\_PHY2   | Medium Dependent Interface 1, Negative for PHY2  |
|  5  |  MDI2+\_PHY2   | Medium Dependent Interface 2, Positive for PHY2  |
|  6  |  MDI2-\_PHY2   | Medium Dependent Interface 2, Negative for PHY2  |
|  7  |  MDI3+\_PHY2   | Medium Dependent Interface 3, Positive for PHY2  |
|  8  |  MDI3-\_PHY2   | Medium Dependent Interface 3, Negative for PHY2  |
|  9  |  LED_G+\_PHY2  |           LED Green Positive for PHY2            |
| 10  |  LED_G-\_PHY2  |           LED Green Negative for PHY2            |
| 11  | VCC33_LAN_PHY2 |          3.3V Power Supply for LAN PHY2          |
| 12  |  LED_Y-\_PHY2  |           LED Yellow Negative for PHY2           |
| 13  |     RN1_V+     | Termination Resistor Network 1, Positive Voltage |
| 14  |     RN2_V+     | Termination Resistor Network 2, Positive Voltage |

### USB 2.0

| Pin |      Name      |       Description        |
| :-: | :------------: | :----------------------: |
|  1  |  VCC5V0_USB20  |     5V USB 2.0 Power     |
|  2  | USB20_HOST1_DM | USB 2.0 HOST1 Data Minus |
|  3  | USB20_HOST1_DP | USB 2.0 HOST1 Data Plus  |
|  4  |      GND       |          Ground          |
|  5  |      GND       |          Ground          |
|  6  |      GND       |          Ground          |
|  7  |      GND       |          Ground          |
|  8  |      GND       |          Ground          |
|  9  |      GND       |          Ground          |
| 10  |      GND       |          Ground          |

## Ethernet + USB 2.0-13

### Ethernet

| Pin | Name      |              Description               |
| :-: | :-------- | :------------------------------------: |
|  1  | MDI0+     | Medium Dependent Interface 0, Positive |
|  2  | MDI0-     | Medium Dependent Interface 0, Negative |
|  3  | MDI1+     | Medium Dependent Interface 1, Positive |
|  4  | MDI1-     | Medium Dependent Interface 1, Negative |
|  5  | MDI2+     | Medium Dependent Interface 2, Positive |
|  6  | MDI2-     | Medium Dependent Interface 2, Negative |
|  7  | MDI3+     | Medium Dependent Interface 3, Positive |
|  8  | MDI3-     | Medium Dependent Interface 3, Negative |
|  9  | LED_G+    |          Green LED, Positive           |
| 10  | LED_G-    |          Green LED, Negative           |
| 11  | VCC33_LAN |       3.3V Power Supply for LAN        |
| 12  | LED_Y-    |          Yellow LED, Negative          |
| 13  | TN1_V+    |    Termination Network 1, Positive     |
| 14  | TN2_V+    |    Termination Network 2, Positive     |

### USB 2.0

| Pin | Name         |   Description    |
| :-: | :----------- | :--------------: |
|  1  | VCC5V0_USB20 | 5V USB 2.0 Power |
|  2  | USB4_DM      |  USB Data Minus  |
|  3  | USB4_DP      |  USB Data Plus   |
|  4  | GND          |      Ground      |
|  5  | GND          |      Ground      |
|  6  | GND          |      Ground      |
|  7  | GND          |      Ground      |
|  8  | GND          |      Ground      |
|  9  | GND          |      Ground      |
| 10  | GND          |      Ground      |

## RTC

| Left Pin | Left Name | Left Description  | Right Pin | Right Name  |   Right Description    |
| :------: | :-------- | :---------------- | :-------: | :---------: | :--------------------: |
|    1     | OSCI      | Oscillator Input  |     8     | VCC_3V3_S3  |   3.3V Power Supply    |
|    2     | OSCO      | Oscillator Output |     7     | 32KOUT_WIFI | 32 kHz Output for WiFi |
|    3     | RTC_INT_L | RTC Interrupt Low |     6     | I2C6_SCL_M0 |     I2C Clock Line     |
|    4     | GND       | Ground            |     5     | I2C6_SDA_M0 |     I2C Data Line      |

RTC takes Lithium coin cell CR1220-3V.

## SATA

### SATA PORT

| Pin | Name     |   Description   |
| :-: | :------- | :-------------: |
|  1  | GND      |     Ground      |
|  2  | STXP0_64 | Serial TX+ Port |
|  3  | STXN0_64 | Serial TX- Port |
|  4  | GND      |     Ground      |
|  5  | SRXN0_64 | Serial RX- Port |
|  6  | SRXP0_64 | Serial RX+ Port |
|  7  | GND      |     Ground      |
|  8  | GND      |     Ground      |
|  9  | GND      |     Ground      |

### SATA Power

| Pin |    Name     | Description |
| :-: | :---------: | :---------: |
|  1  |   VCC12V    |  12V Power  |
|  2  |     GND     |   Ground    |
|  3  |     GND     |   Ground    |
|  4  | VCC5V0_SATA |  5V Power   |

SATA Power is a Floppy Power Header with 2.54 mm per pin spacing.

## FAN

| Pin | Name      |   Description    |
| :-: | :-------- | :--------------: |
|  4  | FAN_PWM   |  Fan PWM Signal  |
|  3  | FAN_SPEED | Fan Speed Signal |
|  2  | VCC12V    | 12V Power Supply |
|  1  | GND       |      Ground      |

Pin spacing 2.54 mm

## PCIE M KEY

| Pin |         Name         |         Description          | Pin |         Name          |       Description       |
| :-: | :------------------: | :--------------------------: | :-: | :-------------------: | :---------------------: |
|  1  |         GND          |            Ground            |  2  |      VCC3V3_MKEY      | 3.3V Power for M.2 Key  |
|  3  |         GND          |            Ground            |  4  |      VCC3V3_MKEY      | 3.3V Power for M.2 Key  |
|  5  |          NC          |        No Connection         |  6  |          NC           |      No Connection      |
|  7  |          NC          |        No Connection         |  8  |          NC           |      No Connection      |
|  9  |         GND          |            Ground            | 10  |          NC           |      No Connection      |
| 11  |          NC          |        No Connection         | 12  |      VCC3V3_MKEY      | 3.3V Power for M.2 Key  |
| 13  |          NC          |        No Connection         | 14  |      VCC3V3_MKEY      | 3.3V Power for M.2 Key  |
| 15  |         GND          |            Ground            | 16  |      VCC3V3_MKEY      | 3.3V Power for M.2 Key  |
| 17  |          NC          |        No Connection         | 18  |      VCC3V3_MKEY      | 3.3V Power for M.2 Key  |
| 19  |          NC          |        No Connection         | 20  |          NC           |      No Connection      |
| 21  |         GND          |            Ground            | 22  |          NC           |      No Connection      |
| 23  |          NC          |        No Connection         | 24  |          NC           |      No Connection      |
| 25  |          NC          |        No Connection         | 26  |          NC           |      No Connection      |
| 27  |         GND          |            Ground            | 28  |          NC           |      No Connection      |
| 29  |  PCIE30_PORT0_RX1N   |    PCI-E 3.0 RX1 Negative    | 30  |          NC           |      No Connection      |
| 31  |  PCIE30_PORT0_RX1P   |    PCI-E 3.0 RX1 Positive    | 32  |          NC           |      No Connection      |
| 33  |         GND          |            Ground            | 34  |          NC           |      No Connection      |
| 35  |  PCIE30_PORT0_TX1N   |    PCI-E 3.0 TX1 Negative    | 36  |          NC           |      No Connection      |
| 37  |  PCIE30_PORT0_TX1P   |    PCI-E 3.0 TX1 Positive    | 38  |          NC           |      No Connection      |
| 39  |         GND          |            Ground            | 40  |          NC           |      No Connection      |
| 41  |  PCIE30_PORT0_RX0N   |    PCI-E 3.0 RX0 Negative    | 42  |          NC           |      No Connection      |
| 43  |  PCIE30_PORT0_RX0P   |    PCI-E 3.0 RX0 Positive    | 44  |          NC           |      No Connection      |
| 45  |         GND          |            Ground            | 46  |          NC           |      No Connection      |
| 47  |  PCIE30_PORT0_TX0N   |    PCI-E 3.0 TX0 Negative    | 48  |          NC           |      No Connection      |
| 49  |  PCIE30_PORT0_TX0P   |    PCI-E 3.0 TX0 Positive    | 50  | PCIE30X4_PERSTn_M1_L  |     PCI-E 3.0 Reset     |
| 51  |         GND          |            Ground            | 52  | PCIE30X4_CLKREQn_M1_L | PCI-E 3.0 Clock Request |
| 53  | PCIE30_REFCLKN_SLOT1 | PCI-E 3.0 Ref Clock Negative | 54  |  PCIE30X4_WAKEn_M1_L  |  PCI-E 3.0 Wake Signal  |
| 55  | PCIE30_REFCLKP_SLOT1 | PCI-E 3.0 Ref Clock Positive | 56  |          NC           |      No Connection      |
| 57  |         GND          |            Ground            | 58  |          NC           |      No Connection      |
| 59  |          NC          |        No Connection         | 60  |          NC           |      No Connection      |
| 61  |          NC          |        No Connection         | 62  |          NC           |      No Connection      |
| 63  |          NC          |        No Connection         | 64  |          NC           |      No Connection      |
| 65  |          NC          |        No Connection         | 66  |          NC           |      No Connection      |
| 67  |          NC          |        No Connection         | 68  |          NC           |      No Connection      |
| 69  |          NC          |        No Connection         | 70  |          NC           |      No Connection      |
| 71  |         GND          |            Ground            | 72  |          NC           |      No Connection      |
| 73  |         GND          |            Ground            | 74  |          NC           |      No Connection      |
| 75  |         GND          |            Ground            | 76  |          NC           |      No Connection      |

The PCIe M Key holders are LOTES APC10359-P001A with 0.5 mm pitch.

## PCIE E KEY

| Pin | Name                      | Description                   | Pin | Name                   | Description                         |
| :-: | :------------------------ | :---------------------------- | :-: | :--------------------- | :---------------------------------- |
|  1  | GND                       | Ground                        |  2  | VCC3V3_Ekey            | 3.3V Power Supply                   |
|  3  | USB3_DP                   | USB 3.0 Data Positive         |  4  | VCC3V3_Ekey            | 3.3V Power Supply                   |
|  5  | USB3_DM                   | USB 3.0 Data Negative         |  6  | NC                     | Not Connected                       |
|  7  | GND                       | Ground                        |  8  | I2S2_SCLK_M0_BT        | Bluetooth I2S Clock                 |
|  9  | SDIO-CLK-M0               | SDIO Clock                    | 10  | I2S2_LRCK_M0_BT        | Bluetooth I2S Left/Right Clock      |
| 11  | SDIO-CMD-M0               | SDIO Command Line             | 12  | I2S2_SDI_M0_BT         | Bluetooth I2S Serial Data Input     |
| 13  | SDIO-D0-M0                | SDIO Data 0                   | 14  | I2S2_SDO_M0_BT         | Bluetooth I2S Serial Data Output    |
| 15  | SDIO-D1-M0                | SDIO Data 1                   | 16  | NC                     | Not Connected                       |
| 17  | SDIO-D2-M0                | SDIO Data 2                   | 18  | GND                    | Ground                              |
| 19  | SDIO-D3-M0                | SDIO Data 3                   | 20  | BT_WAKE_HOST_H         | Bluetooth Wake Host                 |
| 21  | WIFI_WAKE_HOST_H          | WiFi Wake Host                | 22  | UART6-RX               | UART Receive                        |
| 23  | NC                        | Not Connected                 |     |                        |                                     |
| 33  | GND                       | Ground                        | 32  | UART6-TX               | UART Transmit                       |
| 35  | PCIE20_1_TXP/SATA30_1_TXP | PCIe/SATA Transmit Positive   | 34  | UART6-CTSN             | UART Clear To Send                  |
| 37  | PCIE20_1_TXN/SATA30_1_TXN | PCIe/SATA Transmit Negative   | 36  | UART6-RTSN             | UART Ready To Send                  |
| 39  | GND                       | Ground                        | 38  | NC                     | Not Connected                       |
| 41  | PCIE20_1_RXP/SATA30_1_RXP | PCIe/SATA Receive Positive    | 40  | NC                     | Not Connected                       |
| 43  | PCIE20_1_RXN/SATA30_1_RXN | PCIe/SATA Receive Negative    | 42  | BT_REG_ON_H            | Bluetooth Regulator On              |
| 45  | GND                       | Ground                        | 44  | NC                     | Not Connected                       |
| 47  | PCIE20_1_REFCLKP          | PCIe Reference Clock Positive | 46  | NC                     | Not Connected                       |
| 49  | PCIE20_1_REFCLKN          | PCIe Reference Clock Negative | 48  | NC                     | Not Connected                       |
| 51  | GND                       | Ground                        | 50  | 32KOUT_WIFI            | 32K Clock Output for WiFi           |
| 53  | PCIE30x1_0_CLKREQn_M1_L   | PCIe Clock Request            | 52  | PCIE30x1_0_PERSTn_M1_L | PCIe Peripheral Reset               |
| 55  | PCIE30x1_0_WAKEn_M1_L     | PCIe Wake Signal              | 54  | BT_WAKE_L              | Bluetooth Low Energy Wake Signal    |
| 57  | GND                       | Ground                        | 56  | W-DISABLE              | WiFi Disable Signal                 |
| 59  | NC                        | Not Connected                 | 58  | I2C4_SDA_E             | I2C Data Line for External Devices  |
| 61  | NC                        | Not Connected                 | 60  | I2C4_SCL_E             | I2C Clock Line for External Devices |
| 63  | GND                       | Ground                        | 62  | NC                     | Not Connected                       |
| 65  | NC                        | Not Connected                 | 64  | NC                     | Not Connected                       |
| 67  | NC                        | Not Connected                 | 66  | NC                     | Not Connected                       |
| 69  | GND                       | Ground                        | 68  | NC                     | Not Connected                       |
| 71  | NC                        | Not Connected                 | 70  | BT_WAKE_L              | Bluetooth Low Energy Wake Signal    |
| 73  | NC                        | Not Connected                 | 72  | VCC3V3_Ekey            | 3.3V Power Supply                   |
| 75  | GND                       | Ground                        | 74  | VCC3V3_Ekey            | 3.3V Power Supply                   |

The PCIe E Key holder is APCI0108-P001A with 0.5 mm pitch.
