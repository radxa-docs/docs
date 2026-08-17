---
sidebar_position: 1
---

# Hardware Information

## System Block Diagram

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/q6a_block_diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Interface Description

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_interface.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

| No. | Description             | No. | Description                                                     | No. | Description           |
| :-: | :---------------------- | :-: | :-------------------------------------------------------------- | :-: | :-------------------- |
|  1  | Qualcomm QCS6490        |  2  | [40-Pin GPIO Header](./pin-gpio)                                |  3  | [M.2 M Key slot](./nvme)        |
|  4  | [WiFi 6 / BT 5.4](./ante) |  5  | [Antenna connector](./ante)                                     |  6  | [Power button](./power)          |
|  7  | User LED                |  8  | Power LED                                                       |  9  | [Type-C power input](./power-header) |
| 10  | [Power input header](./power-header) | 11  | [MIPI CSI (4 Lane)](./mipi-csi)                                 | 12  | [microSD card slot](./microsd) |
| 13  | [MIPI DSI (4 Lane)](./mipi-dsi) | 14  | [PoE header](./eth-poe)                                         | 15  | [Gigabit Ethernet](./eth-poe) |
| 16  | QSPI Nor Flash          | 17  | [USB ports](./usb)<br/>USB 2.0 Type-A (upper) / USB 3.1 OTG Type-A (lower) | 18  | LPDDR5 memory         |
| 19  | [2x USB 2.0 Type-A ports](./usb) | 20  | [EDL button](./edl)                                             | 21  | [Headphone jack](./headphone) |
| 22  | [Standard HDMI](./hdmi) | 23  | [eMMC & UFS module connector](./ufs-emmc-com)                   | 24  | [RTC battery connector](./rtc) |
| 25  | [2x MIPI CSI (2 Lane)](./mipi-csi) |     |                                                                 |     |                       |

### Power Input Header Pinout

No. 10 is the 12V external power input interface, a 3-pin header with the following pin functions:

| Pin | Definition |
| :-: | :--------: |
|  1  | 12V        |
|  2  | GND        |
|  3  | PWR        |

#### External power supply

Connect the positive and negative terminals of the 12V power supply to the 12V and GND pins on the motherboard to power the board.

:::danger
Please do not connect the power supply incorrectly or in reverse, as improper operation may cause hardware damage.
:::

#### External power button

By default, when the motherboard is powered off, briefly short the PWR and GND pins to start the board; when the motherboard is powered on, briefly short the PWR and GND pins to bring up the shutdown menu.
