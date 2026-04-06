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
|  1  | Qualcomm QCS6490        |  2  | 40-Pin GPIO Header                                              |  3  | M.2 M Key slot        |
|  4  | WiFi 6 / BT 5.4         |  5  | Antenna connector                                               |  6  | Power button          |
|  7  | User LED                |  8  | Power LED                                                       |  9  | Type-C power input    |
| 10  | Power input header      | 11  | MIPI CSI (4 Lane)                                               | 12  | microSD card slot     |
| 13  | MIPI DSI (4 Lane)       | 14  | PoE header                                                      | 15  | Gigabit Ethernet      |
| 16  | QSPI Nor Flash          | 17  | USB 2.0 Type-A port (upper)<br/>USB 3.1 OTG Type-A port (lower) | 18  | LPDDR5 memory         |
| 19  | 2x USB 2.0 Type-A ports | 20  | EDL button                                                      | 21  | Headphone jack        |
| 22  | Standard HDMI           | 23  | eMMC & UFS module connector                                     | 24  | RTC battery connector |
| 25  | 2x MIPI CSI (2 Lane)    |     |                                                                 |     |                       |

## M.2 M Key Slot Installation Guide

The M.2 M Key slot on Dragon Q6A supports **M.2 2230** sized NVMe SSDs.

### Installation Steps:
1. Insert the M.2 2230 NVMe SSD into the M.2 slot at approximately 30° angle
2. Gently press down the SSD to ensure good contact with the slot
3. Secure the SSD to the board using an **M2×3.5mm** screw

### Notes:
- Ensure you use the correct screw size (M2×3.5mm)
- Do not overtighten the screw to avoid damaging the SSD or motherboard
- Dragon Q6A only supports **M.2 2230** size, longer sizes like 2242, 2260, or 2280 are not supported
- This slot only supports NVMe protocol SSDs, SATA protocol M.2 SSDs are not supported
