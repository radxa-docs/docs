---
sidebar_position: 1
---

# 硬件概览

## 芯片框图

<img src="/img/e/e54c/rk3582_blockdiagram.webp" width="800" alt="radxa-e54c pack" />

## 系统框图

<img src="/img/e/e54c/radxa-e54c-system-diagrm.webp" width="800" alt="radxa-e54c pack" />

## 硬件概览

<img src="/img/e/e54c/radxa-e54c-hardware-overview.webp" width="800" alt="radxa-e54c pack" />

以下是各个硬件接口的详细接口线序。

### microSD Card 座子

| PIN | Name       |
| --- | ---------- |
| 1   | SDMMC_D2   |
| 2   | SDMMC_D3   |
| 3   | SDMMC_CMD  |
| 4   | VCC_3V3    |
| 5   | SDMMC_CLK  |
| 6   | GND        |
| 7   | SDMMC_D0   |
| 8   | SDMMC_D1   |
| 9   | SDMMC_DETN |
| 10  | GND        |
| 11  | GND        |
| 12  | GND        |
| 13  | GND        |

### USB 3.0 HOST Type-A 口

| PIN | Name         |
| --- | ------------ |
| 1   | VCC5V0_USB   |
| 2   | USB3_HOST_DM |
| 3   | USB3_HOST_DP |
| 4   | GND          |
| 5   | USB3_SSRX1N  |
| 6   | USB3_SSRX1P  |
| 7   | GND          |
| 8   | USB3_SSTX1N  |
| 9   | USB3_SSTX1P  |

### USB 2.0 HOST Type-A 口

| PIN | Name         |
| --- | ------------ |
| 1   | VCC5V0_USB   |
| 2   | USB2_HOST_DM |
| 3   | USB2_HOST_DP |
| 4   | GND          |

### USB 3.0 OTG Type-C 口

| PIN     | Name       |
| ------- | ---------- |
| A1/B1   | GND        |
| A4/B4   | VCC5V0_USB |
| A5      | CC1        |
| A6/B6   | DP         |
| A7/B7   | DN         |
| B5      | CC2        |
| A8      | SBU1       |
| B8      | SBU2       |
| A2/B2   | SSTX+      |
| A3/B3   | SSTX-      |
| B11     | SSRX+      |
| B10     | SSRX-      |
| A11     | SSRX+      |
| A10     | SSRX-      |
| B2      | SSTX+      |
| B3      | SSTX-      |
| A12/B12 | GND        |

### HDMI 2.1 接口

| PIN | Name        |
| --- | ----------- |
| 1   | HDMI_TX2+   |
| 2   | GND         |
| 3   | HDMI_TX2-   |
| 4   | HDMI_TX1+   |
| 5   | GND         |
| 6   | HDMI_TX1-   |
| 7   | HDMI_TX0+   |
| 8   | GND         |
| 9   | HDMI_TX0-   |
| 10  | HDMI_TXC+   |
| 11  | GND         |
| 12  | HDMI_TXC-   |
| 13  | HDMI_CEC    |
| 14  | NC          |
| 15  | HDMI_SCL    |
| 16  | HDMI_SDA    |
| 17  | GND         |
| 18  | VCC5V0_HDMI |
| 19  | HDMI_HPD    |

### 千兆以太网接口 (RJ45)

| PIN | Name    |
| --- | ------- |
| 1   | ETH_TXP |
| 2   | ETH_TXN |
| 3   | ETH_RXP |
| 4   | NC      |
| 5   | NC      |
| 6   | ETH_RXN |
| 7   | NC      |
| 8   | NC      |

### M.2 M Key 接口

| PIN | Name          |
| --- | ------------- |
| 1   | GND           |
| 2   | VCC3V3_PCIE   |
| 3   | GND           |
| 4   | VCC3V3_PCIE   |
| 5   | GND           |
| 6   | NC            |
| 7   | GND           |
| 8   | NC            |
| 9   | GND           |
| 10  | NC            |
| 11  | GND           |
| 12  | NC            |
| 13  | GND           |
| 14  | NC            |
| 15  | GND           |
| 16  | NC            |
| 17  | GND           |
| 18  | NC            |
| 19  | GND           |
| 20  | NC            |
| 21  | GND           |
| 22  | NC            |
| 23  | GND           |
| 24  | NC            |
| 25  | GND           |
| 26  | NC            |
| 27  | GND           |
| 28  | NC            |
| 29  | GND           |
| 30  | NC            |
| 31  | GND           |
| 32  | NC            |
| 33  | GND           |
| 34  | NC            |
| 35  | GND           |
| 36  | NC            |
| 37  | GND           |
| 38  | NC            |
| 39  | VCC3V3_PCIE   |
| 40  | NC            |
| 41  | VCC3V3_PCIE   |
| 42  | NC            |
| 43  | GND           |
| 44  | NC            |
| 45  | NC            |
| 46  | NC            |
| 47  | GND           |
| 48  | NC            |
| 49  | GND           |
| 50  | PCIE_CLKREQ_N |
| 51  | GND           |
| 52  | PCIE_WAKE_N   |
| 53  | GND           |
| 54  | PCIE_REFCLK_P |
| 55  | PCIE_REFCLK_N |
| 56  | NC            |
| 57  | GND           |
| 58  | PCIE_RX_N     |
| 59  | PCIE_RX_P     |
| 60  | GND           |
| 61  | GND           |
| 62  | PCIE_TX_N     |
| 63  | PCIE_TX_P     |
| 64  | GND           |
| 65  | GND           |
| 66  | NC            |
| 67  | NC            |
| 68  | PCIE_RST_N    |
| 69  | GND           |
| 70  | NC            |
| 71  | GND           |
| 72  | NC            |
| 73  | GND           |
| 74  | NC            |
| 75  | GND           |

### 风扇接口 (2-Pin 1.25mm)

| PIN | Name |
| --- | ---- |
| 1   | PWM  |
| 2   | GND  |

### RTC 电池接口 (2-Pin 1.25mm)

| PIN | Name       |
| --- | ---------- |
| 1   | VCC3V0_RTC |
| 2   | GND        |

### 14-Pin GPIO 接口 (0.1"/2.54mm)

| PIN | Name   | 功能          |
| --- | ------ | ------------- |
| 1   | VCC5V0 | 5V 电源输出   |
| 2   | VCC5V0 | 5V 电源输出   |
| 3   | VCC3V3 | 3.3V 电源输出 |
| 4   | GND    | 接地          |
| 5   | GPIO0  | SPI_CLK       |
| 6   | GPIO1  | SPI_MOSI      |
| 7   | GPIO2  | SPI_MISO      |
| 8   | GPIO3  | SPI_CS        |
| 9   | GPIO4  | UART_TX       |
| 10  | GPIO5  | UART_RX       |
| 11  | GPIO6  | I2C_SCL       |
| 12  | GPIO7  | I2C_SDA       |
| 13  | GPIO8  | 通用 GPIO     |
| 14  | GND    | 接地          |
