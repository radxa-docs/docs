---
sidebar_position: 1
---

# 硬件概览

## 芯片框图

<img src="/img/radxa-e20c/radxa-e20c-chip-diagram.webp" width="800" alt="radxa-e20c pack" />

## 系统框图

<img src="/img/radxa-e20c/radxa-e20c-system-diagram.webp" width="800" alt="radxa-e20c pack" />

## 硬件概览

<img src="/img/radxa-e20c/radxa-e20c-hardware-overview.webp" width="800" alt="radxa-e20c pack" />

以下是各个硬件接口的详细接口线序。

### microSD Card Slot

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

### USB 2.0 HOST Type-A

| PIN | Name           |
| --- | -------------- |
| 1   | VCC5V0_USB20   |
| 2   | USB20_HOST1_DM |
| 3   | USB20_HOST1_DP |
| 4   | GND            |

### USB Type-C

| PIN | Name       |
| --- | ---------- |
| 1   | DBG_USB_DP |
| 2   | DBG_USB_DN |

## Gigabit Ethernet Port

有两个

## right

提供以太网接口，可接入千兆以太网

| Pin |   Name    | Pin |   Name    |
| :-: | :-------: | :-: | :-------: |
|  1  | LAN1_DP0  |  2  | LAN1_DN0  |
|  3  | LAN1_DP1  |  4  | LAN1_DN1  |
|  5  | LAN1_DP2  |  6  | LAN1_DN2  |
|  7  | LAN1_DP3  |  8  | LAN1_DN3  |
|  9  |    VCC    | 10  |    GND    |
| 11  | P3V3_LAN1 | 12  | LAN1_LED0 |
| 13  | P3V3_LAN1 | 14  | LAN1_LED0 |
| 15  |     X     | 16  |     X     |
| 17  |    GND    | 18  |    GND    |

## left

提供以太网接口，可接入千兆以太网

| Pin |    Name    | Pin |   Name    |
| :-: | :--------: | :-: | :-------: |
|  1  | PHY_MDI0+  |  2  | PHY_MDI0- |
|  3  | PHY_MDI1+  |  4  | PHY_MDI1- |
|  5  | PHY_MDI2+  |  6  | PHY_MDI2- |
|  7  | PHY_MDI3+  |  8  | PHY_MDI3- |
|  9  |    VCC     | 10  |    GND    |
| 11  |  PHY_LED1  | 12  |    GND    |
| 13  | VCC3V3_PHY | 14  | PHY_LED2  |
| 15  |     X      | 16  |     X     |
| 17  |    GND     | 18  |    GND    |
