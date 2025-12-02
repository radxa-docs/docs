---
sidebar_position: 1
---

# 硬件接口说明

## 芯片框图

<img src="/img/rock3/3b/rk3568-block-diagram.webp" alt="rk3568 chip block diagram" style={{ width: "80%" }} />

## Radxa CM3I IO 底板框图

<img src="/img/cm3i/radxa-cm3i-io-board-block-diagram.webp" alt="cm3i io board block diagram" style={{ width: "80%" }} />

## 接口预览

<Tabs queryString="model">
    <TabItem value="CM3I 核心板">
        <img src="/img/cm3i/cm3i-overview.webp" alt="cm3i" style={{ width: "80%" }} />
    </TabItem>
    <TabItem value="CM3I IO 板">
        <img src="/img/cm3i/cm3i-io-overview.webp" alt="cm3i" style={{ width: "80%" }} />
    </TabItem>
</Tabs>

## 接口详情

<Tabs queryString="model">
    <TabItem value="CM3I 核心板">

        ### AP6256

            | Pin |       Name              | Pin |           Name          |
            | :-: | :---------------------: | :-: | :---------------------: |
            |  1  |          GND            |  2  |          GND            |
            |  3  |          GND            |  4  |      NOT CONNECTED      |
            |  5  |      NOT CONNECTED      |  6  | HOST_WAKE_BT_H_GPIO4_B5 |
            |  7  | BT_WAKE_HOST_H_GPIO4_B4 |  8  |      NOT CONNECTED      |
            |  9  |       VCC_3V3_1         | 10  |     WIFI1T1R_XTAL_IN    |
            | 11  |     WIFI1T1R_XTAL_OUT   | 12  |  WIFI_REG_ON_H_GPIO3_D4 |
            | 13  |WIFI_WAKE_HOST_H_GPIO3_D5| 14  |       SDMMC2_D2_M0      |
            | 15  |      SDMMC2_D3_M0       | 16  |       SDMMC2_CMD_M0     |
            | 17  |      SDMMC2_CLK_M0      | 18  |       SDMMC2_D0_M0      |
            | 19  |      SDMMC2_D1_M0       | 20  |          GND            |
            | 21  |          GND            | 22  |        VCC_3V3          |
            | 23  |          GND            | 24  |    WIFIBT_32KIN_1T1R    |
            | 25  |      NOT CONNECTED      | 26  |      NOT CONNECTED      |
            | 27  |      NOT CONNECTED      | 28  |      NOT CONNECTED      |
            | 29  |          GND            | 30  |      NOT CONNECTED      |
            | 31  |          GND            | 32  |      NOT CONNECTED      |
            | 33  |          GND            | 34  |   BT_REG_ON_H_GPIO4_B2  |
            | 35  |      NOT CONNECTED      | 36  |          GND            |
            | 37  |      NOT CONNECTED      | 38  |      NOT CONNECTED      |
            | 39  |      NOT CONNECTED      | 40  |      NOT CONNECTED      |
            | 41  |      UART8_CTS_M0       | 42  |      UART8_RX_M0        |
            | 43  |      UART8_TX_M0        | 44  |      UART8_RTS_M0       |
            | 35  |      NOT CONNECTED      | 46  |      NOT CONNECTED      |
            | 47  |      NOT CONNECTED      | 40  |                         |

        ### On Board eMMC

            | Pin |          Name         | Pin |       Name       |
            | :-: | :-------------------: | :-: | :--------------: |
            |  1  |  eMMC_D0/FLASH_D0     |  2  |  VCCIO_FLASH     |
            |  3  |  eMMC_D1/FLASH_D1     |  4  |  VCCIO_FLASH     |
            |  5  |  eMMC_D2/FLASH_D2     |  6  |  VCCIO_FLASH     |
            |  7  |  eMMC_D3/FLASH_D3     |  8  |  VCCIO_FLASH     |
            |  9  |  eMMC_D4/FLASH_D4     | 10  |  VCCIO_FLASH     |
            | 11  |  eMMC_D5/FLASH_D5     | 12  |  VCC_3V3         |
            | 13  |  eMMC_D6/FLASH_D6     | 14  |  VCC_3V3         |
            | 15  |  eMMC_D7/FLASH_D7     | 16  |  VCC_3V3         |
            | 17  | eMMC_CMD/FLASH_WRn    | 18  |  VCC_3V3         |
            | 19  | eMMC_CLKOUT/FLASH_DQS | 20  |   GND            |
            | 21  |     VCCIO_FLASH       | 22  |   GND            |
            | 23  |        GND            | 24  |   GND            |
            | 25  |  eMMC_DATA_STROBE     | 26  |   GND            |
            | 27  |   NOT CONNECTED       | 28  |   GND            |
            | 29  |   NOT CONNECTED       | 30  |   GND            |
            | 31  |   NOT CONNECTED       | 32  |   GND            |
            | 33  |   NOT CONNECTED       | 34  |   GND            |
            | 35  |                       | 36  |   GND            |
            | 37  |                       | 38  |   GND            |
            | 39  |                       | 40  |   GND            |
            | 41  |                       | 42  |   GND            |

        ### SPI Flash

            | Pin |             Name            | Pin |       Name        |
            | :-: | :-------------------------: | :-: | :---------------: |
            |  1  | FSPI_CS0n/FLASH_CS0n        |  2  | FSPI_D1/FLASH_RDn |
            |  3  | eMMC_RSTn/FSPI_D2/FLASH_WPn |  4  |       GND         |
            |  5  |     FSPI_D0/FLASH_RDY       |  6  | FSPI_CLK/FLASH_ALE|
            |  7  |     FSPI_D3/FLASH_CS1n      |  8  |    VCCIO_FLASH    |

        ### Gigabit Ethernet PHY

            | Pin |         Name        | Pin |           Name          |
            | :-: | :-----------------: | :-: | :---------------------: |
            |  1  |       AVDD33        |  2  |        PHY_MDI0+        |
            |  3  |     PHY_MDI0-       |  4  |         AVDD10          |
            |  5  |     PHY_MDI1+       |  6  |       PHY_MDI1-         |
            |  7  |     PHY_MDI2+       |  8  |       PHY_MDI2-         |
            |  9  |      AVDD10         | 10  |       PHY_MDI3+         |
            | 11  |     PHY_MDI3-       | 12  |        AVDD33           |
            | 13  | GMAC1_RSTn_GPIO3_B0 | 14  |     GMAC1_MDC_M1        |
            | 15  |  GMAC1_MDIO_M1      | 16  |     GMAC1_TXD3_M1       |
            | 17  |  GMAC1_TXD2_M1      | 18  |     GMAC1_TXD1_M1       |
            | 19  |  GMAC1_TXD0_M1      | 20  |     GMAC1_TXEN_M1       |
            | 21  |  GMAC1_TXCLK_M1     | 22  |        DVDD10           |
            | 23  |  GMAC1_RXD3_M1      | 24  |     GMAC1_RXD2_M1       |
            | 25  |  GMAC1_RXD1_M1      | 26  |     GMAC1_RXD0_M1       |
            | 27  |  GMAC1_RXDV_CRS_M1  | 28  |     GMAC1_RXCLK_M1      |
            | 29  |       DVDDRG        | 30  |        DVDD33           |
            | 31  |       DVDD33        | 32  |        REGOUT           |
            | 33  |    PTP_CLKIN_1      | 34  | GMAC1_INT/PMEB_GPIO3_A7 |
            | 35  |    LED0/PHYAD0      | 36  |     LED1/CFG_LDO0       |
            | 37  |    LED2/CFG_LDO1    | 38  |         HSIP            |
            | 39  |       HSIN          | 40  |         HSOP_1          |
            | 41  |      HSON_1         | 42  |       HSOP_CLK_1        |
            | 43  |    HSON_CLK_1       | 44  |     PHY_CLKOUT125       |
            | 45  |     XTAL_IN         | 46  |       XTAL_OUT          |
            | 47  |      AVDD10         | 48  |         RSET            |
            | 49  |       GND           |     |                         |

        ### 400-PIN 定义

        - <a href="https://dl.radxa.com/cm3i/docs/hw/radxa_cm3i_v1310_pinout.xlsx"> V1310 pinout </a>

    </TabItem>
    <TabItem  value="CM3I IO 板">

        ### CAN

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |      CANH        |  2  |      CANL        |
            |  3  |     CAN_VSS      |  4  |                  |

        ### EDP

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |                  |  2  |       GND        |
            |  3  |    EDP_TX_D3N    |  4  |   EDP_TX_D3P     |
            |  5  |       GND        |  6  |   EDP_TX_D2N     |
            |  7  |    EDP_TX_D2P    |  8  |      GND         |
            |  9  |    EDP_TX_D1N    | 10  |   EDP_TX_D1P     |
            | 11  |       GND        | 12  |   EDP_TX_D0N     |
            | 13  |    EDP_TX_D0P    | 14  |      GND         |
            | 15  |    EDP_TX_AUXP   | 16  |   EDP_TX_AUXN    |
            | 17  |       GND        | 18  |     VCC_LCD      |
            | 19  |      VCC_LCD     | 20  |     VCC_LCD      |
            | 21  |      VCC_LCD     | 22  |                  |
            | 23  |       GND        | 24  |      GND         |
            | 25  |       GND        | 26  |      GND         |
            | 27  |    EDP_HPD_1     | 28  |      GND         |
            | 29  |       GND        | 30  |      GND         |
            | 31  |       GND        | 32  |    LCD-EN        |
            | 33  |    LCD-PWM       | 34  |                  |
            | 35  |                  | 36  |    VCC5V_P       |
            | 37  |    VCC5V_P       | 38  |    VCC5V_P       |
            | 39  |    VCC5V_P       | 40  |                  |
            | 41  |                  | 42  |                  |
            | 43  |      GND         | 44  |      GND         |

        ### HDMI

            | Pin |         Name        | Pin |         Name        |
            | :-: | :-----------------: | :-: | :-----------------: |
            |  1  | HDMI_TX2P_PORT      |  2  |       GND           |
            |  3  | HDMI_TX2N_PORT      |  4  |  HDMI_TX1P_PORT     |
            |  5  |        GND          |  6  |  HDMI_TX1N_PORT     |
            |  7  | HDMI_TX0P_PORT      |  8  |       GND           |
            |  9  | HDMI_TX0N_PORT      | 10  | HDMI_TXCLKP_PORT    |
            | 11  |        GND          | 12  | HDMI_TXCLKN_PORT    |
            | 13  | HDMI_TX_CEC_PORT    | 14  |       GND           |
            | 15  | HDMI_TXDDC_SCL_PORT | 16  | HDMI_TXDDC_SDA_PORT |
            | 17  |        GND          | 18  |      +5V_INPUT      |
            | 19  | HDMI_TX_HPD_PORT    | 20  |       GND           |
            | 21  |        GND          | 22  |       GND           |
            | 23  |        GND          | 24  |                     |

        ### Micro SD Slot

            | Pin |         Name          | Pin |         Name          |
            | :-: | :-------------------: | :-: | :-------------------: |
            |  1  | SDMMC0_D2/ARMJTAG_TCK |  2  | SDMMC0_D3/ARMJTAG_TMS |
            |  3  |       SDMMC0_CMD      |  4  |      VCC3V3_SD_1      |
            |  5  |       SDMMC0_CLK      |  6  |         GND           |
            |  7  |       SDMMC0_D0       |  8  |      SDMMC0_D1        |
            |  9  |      SDMMC0_DET_L     | 10  |         GND           |
            | 11  |         GND           | 12  |         GND           |
            | 13  |         GND           | 14  |                       |

        ### MIPI CSI

        - CAMERA_1

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |    VCC3V3_SYS    |  2  |  I2C0_SDA_PMIC   |
            |  3  |  I2C0_SCL_PMIC   |  4  |    CAM_CLK_0     |
            |  5  |     CAM_GPIO     |  6  |      GND         |
            |  7  |MIPI_CSI_RX_CLK0P |  8  |MIPI_CSI_RX_CLK0N |
            |  9  |       GND        | 10  | MIPI_CSI_RX_D1P  |
            | 11  | MIPI_CSI_RX_D1N  | 12  |      GND         |
            | 13  | MIPI_CSI_RX_D0P  | 14  | MIPI_CSI_RX_D0N  |
            | 15  |       GND        | 16  | NOT CONNECTED    |
            | 17  | NOT CONNECTED    | 18  | NOT CONNECTED    |
            | 19  | NOT CONNECTED    | 20  | NOT CONNECTED    |
            | 21  | NOT CONNECTED    | 22  | NOT CONNECTED    |
            | 23  | NOT CONNECTED    | 24  | NOT CONNECTED    |
            | 25  | NOT CONNECTED    | 26  | NOT CONNECTED    |
            | 27  | NOT CONNECTED    | 28  | NOT CONNECTED    |
            | 29  | NOT CONNECTED    | 30  | NOT CONNECTED    |

        - CAMERA_2

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |    VCC3V3_SYS    |  2  |   I2C5_SDA_M0    |
            |  3  |    I2C5_SCL_M0   |  4  |    CAM_CLK_1     |
            |  5  |    CAM_GPIO_1    |  6  |      GND         |
            |  7  |MIPI_CSI_RX_CLK1P |  8  |MIPI_CSI_RX_CLK1N |
            |  9  |       GND        | 10  | MIPI_CSI_RX_D3P  |
            | 11  | MIPI_CSI_RX_D3N  | 12  |      GND         |
            | 13  | MIPI_CSI_RX_D2P  | 14  | MIPI_CSI_RX_D2N  |
            | 15  |       GND        | 16  | NOT CONNECTED    |
            | 17  |  NOT CONNECTED   | 18  | NOT CONNECTED    |
            | 19  |  NOT CONNECTED   | 20  | NOT CONNECTED    |
            | 21  |  NOT CONNECTED   | 22  | NOT CONNECTED    |
            | 23  |  NOT CONNECTED   | 24  | NOT CONNECTED    |
            | 25  |  NOT CONNECTED   | 26  | NOT CONNECTED    |
            | 27  |  NOT CONNECTED   | 28  | NOT CONNECTED    |
            | 29  |  NOT CONNECTED   | 30  | NOT CONNECTED    |

        ### MIPI DSI

            | Pin |               Name               | Pin |              Name               |
            | :-: | :------------------------------: | :-: | :-----------------------------: |
            |  1  |         VCC_LCD_MIPI             |  2  |            +1V8                 |
            |  3  |                                  |  4  |          LCD_RESET_1            |
            |  5  |                                  |  6  |           GND                   |
            |  7  | MIPI_DSI_TX0_D0N/LVDS_TX0_D0N    |  8  | MIPI_DSI_TX0_D0P/LVDS_TX0_D0P   |
            |  9  |                                  | 10  | MIPI_DSI_TX0_D1N/LVDS_TX0_D1N   |
            | 11  | MIPI_DSI_TX0_D1P/LVDS_TX0_D1P    | 12  |           GND                   |
            | 13  | MIPI_DSI_TX0_CLKN/LVDS_TX0_CLKN  | 14  | MIPI_DSI_TX0_CLKP/LVDS_TX0_CLKP |
            | 15  |                                  | 16  | MIPI_DSI_TX0_D2N/LVDS_TX0_D2N   |
            | 17  | MIPI_DSI_TX0_D2P/LVDS_TX0_D2P    | 18  |           GND                   |
            | 19  | MIPI_DSI_TX0_D3N/LVDS_TX0_D3N    | 20  | MIPI_DSI_TX0_D3P/LVDS_TX0_D3P   |
            | 21  |           GND                    | 22  |           GND                   |
            | 23  |         TP_RST_LCD               | 24  |          3V3_TP                 |
            | 25  |         TP_INT_LCD               | 26  |         TP_SDA_LCD              |
            | 27  |         TP_SCL_LCD               | 28  |           GND                   |
            | 29  |           GND                    | 30  |         VCC_LCD_MIPI            |
            | 31  |       VCC_LCD_MIPI               | 32  |           GND                   |
            | 33  |           GND                    | 34  |         VCC_LEDK1               |
            | 35  |       VCC_LEDK1                  | 36  |           GND                   |
            | 37  |           GND                    | 38  |         VCC_LEDA1               |
            | 39  |       VCC_LEDA1                  | 40  |           GND                   |

        ### PCIe

        - PCIe B Key

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |   NOT CONNECTED  |  2  |   3V3_BKEY       |
            |  3  |      GND         |  4  |   3V3_BKEY       |
            |  5  |      GND         |  6  |   4G_PWREN_H     |
            |  7  |   USB3_HOST1_DP  |  8  |   4G_DISABLE     |
            |  9  |   USB3_HOST1_DM  | 10  |   NOT CONNECTED  |
            | 11  |      GND         | 12  |                  |
            | 13  |                  | 14  |                  |
            | 15  |                  | 16  |                  |
            | 17  |                  | 18  |                  |
            | 19  |                  | 20  |   NOT CONNECTED  |
            | 21  |      GND         | 22  |   NOT CONNECTED  |
            | 23  |  4G_WAKE_ON_HOST | 24  |   NOT CONNECTED  |
            | 25  |                  | 26  |   W_DISABLE      |
            | 27  |      GND         | 28  |   NOT CONNECTED  |
            | 29  | USB3_HOST1_SSTXN | 30  |   SIM1_RESET     |
            | 31  | USB3_HOST1_SSTXP | 32  |   SIM1_CLK       |
            | 33  |      GND         | 34  |   SIM1_DATA      |
            | 35  | USB3_HOST1_SSRXN | 36  |   SIM1_PWR       |
            | 37  | USB3_HOST1_SSRXP | 38  |   NOT CONNECTED  |
            | 39  |      GND         | 40  |   NOT CONNECTED  |
            | 41  |   PCIE20_RXN_1   | 42  |   NOT CONNECTED  |
            | 43  |   PCIE20_RXP_1   | 44  |   NOT CONNECTED  |
            | 45  |      GND         | 46  |   NOT CONNECTED  |
            | 47  |   PCIE20_TXN_1   | 48  |   NOT CONNECTED  |
            | 49  |   PCIE20_TXP_1   | 50  |   PCIE20-PERSTN  |
            | 51  |      GND         | 52  |   PCIE20-CLKREQN |
            | 53  |  PCIE20_REFCLKN  | 54  |   PCIE20-WAKEN   |
            | 55  |  PCIE20_REFCLKP  | 56  |   NOT CONNECTED  |
            | 57  |      GND         | 58  |   NOT CONNECTED  |
            | 59  |   NOT CONNECTED  | 60  |   NOT CONNECTED  |
            | 61  |   NOT CONNECTED  | 62  |   NOT CONNECTED  |
            | 63  |   NOT CONNECTED  | 64  |   NOT CONNECTED  |
            | 65  |   NOT CONNECTED  | 66  |   SIM1_DET       |
            | 67  |   4G_RESET       | 68  |   NOT CONNECTED  |
            | 69  |      GND         | 70  |   3V3_BKEY       |
            | 71  |      GND         | 72  |   3V3_BKEY       |
            | 73  |      GND         | 74  |   3V3_BKEY       |
            | 75  |      GND         | 76  |      GND         |
            | 77  |      GND         | 78  |      GND         |

        - PCIe M Key

            | Pin |         Name        | Pin |        Name         |
            | :-: | :-----------------: | :-: | :-----------------: |
            |  1  |         GND         |  2  |    VCC3V3_MKEY      |
            |  3  |         GND         |  4  |    VCC3V3_MKEY      |
            |  5  |    NOT CONNECTED    |  6  |    NOT CONNECTED    |
            |  7  |    NOT CONNECTED    |  8  |    NOT CONNECTED    |
            |  9  |         GND         | 10  |    NOT CONNECTED    |
            | 11  |    NOT CONNECTED    | 12  |    VCC3V3_MKEY      |
            | 13  |    NOT CONNECTED    | 14  |    VCC3V3_MKEY      |
            | 15  |         GND         | 16  |    VCC3V3_MKEY      |
            | 17  |    NOT CONNECTED    | 18  |    VCC3V3_MKEY      |
            | 19  |    NOT CONNECTED    | 20  |    NOT CONNECTED    |
            | 21  |         GND         | 22  |    NOT CONNECTED    |
            | 23  |    NOT CONNECTED    | 24  |    NOT CONNECTED    |
            | 25  |    NOT CONNECTED    | 26  |    NOT CONNECTED    |
            | 27  |         GND         | 28  |    NOT CONNECTED    |
            | 29  |    NOT CONNECTED    | 30  |    NOT CONNECTED    |
            | 31  |    NOT CONNECTED    | 32  |    NOT CONNECTED    |
            | 33  |         GND         | 34  |    NOT CONNECTED    |
            | 35  |    NOT CONNECTED    | 36  |    NOT CONNECTED    |
            | 37  |    NOT CONNECTED    | 38  |    NOT CONNECTED    |
            | 39  |         GND         | 40  |    NOT CONNECTED    |
            | 41  |     PCIE30_RX0N     | 42  |    NOT CONNECTED    |
            | 43  |     PCIE30_RX0P     | 44  |    NOT CONNECTED    |
            | 45  |                     | 46  |    NOT CONNECTED    |
            | 47  |     PCIE30_TX0N     | 48  |    NOT CONNECTED    |
            | 49  |     PCIE30_TX0P     | 50  | PCIE30X2_PERSTn_M1  |
            | 51  |         GND         | 52  | PCIE30X2_CLKREQn_M1 |
            | 53  | PCIE30_REFCLKN_MKEY | 54  | PCIE30X2_WAKEn_M1   |
            | 55  | PCIE30_REFCLKP_MKEY | 56  |    NOT CONNECTED    |
            | 57  |                     | 58  |    NOT CONNECTED    |
            | 59  |                     | 60  |                     |
            | 61  |                     | 62  |                     |
            | 63  |                     | 64  |                     |
            | 65  |                     | 66  |                     |
            | 67  |    NOT CONNECTED    | 68  |    NOT CONNECTED    |
            | 69  |    NOT CONNECTED    | 70  |    VCC3V3_MKEY      |
            | 71  |         GND         | 72  |    VCC3V3_MKEY      |
            | 73  |         GND         | 74  |    VCC3V3_MKEY      |
            | 75  |         GND         | 76  |         GND         |
            | 77  |         GND         | 78  |         GND         |

        ### POE 12V

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |     IN_VIN+      |  2  |      VIN_GND     |
            |  3  |     AT-DET       |  4  |                  |
            |  5  |                  |  6  |                  |
            |  7  |      GND         |  8  |      POE_12V     |
            |  9  |      ADJ         | 10  |        GND       |

        ### RTC

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |       GND        |  2  |       GND        |
            |  3  |  PMIC_RESET_KEY  |  4  |       GND        |
            |  5  |     I2C1_SDA     |  6  |    I2C1_SCL      |
            |  7  |    VCC3V3_SYS    |  8  |       GND        |

        ### SATA

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |       GND        |  2  |    SATA1_TXP     |
            |  3  |     SATA1_TXN    |  4  |       GND        |
            |  5  |     SATA1_RXN    |  6  |    SATA1_RXP     |
            |  7  |       GND        |  8  |  SATA_7P_H_SMD   |
            |  9  |       GND        | 10  |                  |

        ### Sim Slot

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |       GND        |  2  |       GND        |
            |  3  |       GND        |  4  |       GND        |
            |  5  |    SIM1_PWR      |  6  |       GND        |
            |  7  |   SIM1_RESET     |  8  |       GND        |
            |  9  |    SIM1_CLK      | 10  |    SIM1_DATA     |
            | 11  |    SIM1_DET      | 12  |                  |

        ### RS232

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |       GND        |  2  |         TX       |
            |  3  |        RX        |  4  |                  |

        ### RS485

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |       GND        |  2  |      RS485_A     |
            |  3  |      RS485_B     |  4  |      GND         |

        ### USB

        - USB2.0

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |     VCC5V0_USB   |  2  |  USB2_HOST2_DM   |
            |  3  |  USB2_HOST2_DP   |  4  |      GND         |
            |  5  |      GND         |  6  |                  |

        - USB3.0

            | Pin |       Name       | Pin |       Name       |
            | :-: | :--------------: | :-: | :--------------: |
            |  1  |    5V0_USB30     |  2  |   USB_OTG0_DM    |
            |  3  |   USB_OTG0_DP    |  4  |       GND        |
            |  5  | USB3_OTG0_SSRXN  |  6  | USB3_OTG0_SSRXP  |
            |  7  |       GND        |  8  | USB3_OTG0_SSTXN  |
            |  9  | USB3_OTG0_SSTXP  | 10  |       GND        |
            | 11  |       GND        | 12  |                  |

        ### 14 Pin Headers

            | Pin |           Name           | Pin |        Name         |
            | :-: | :----------------------: | :-: | :-----------------: |
            |  1  |         UART2_RX         |  2  |         GND         |
            |  3  |         UART2_TX         |  4  |       HPL_OUT       |
            |  5  |            GND           |  6  |       HP_SNS        |
            |  7  | SARADC_VIN0_KEY/RECOVERY |  8  |       HPR_OUT       |
            |  9  |          SPKN_OUT        | 10  |       HP_DET_L      |
            | 11  |          SPKP_OUT        | 12  | SARADC_VIN2_HP_HOOK |
            | 13  |          MIC1_INN        | 14  |       MIC1_INP      |

    </TabItem>

</Tabs>
