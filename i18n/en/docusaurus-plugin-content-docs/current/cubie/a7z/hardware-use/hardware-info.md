---
sidebar_position: 1
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# Hardware Interfaces

This section provides an overview of the hardware interfaces on the Cubie A7Z.

## System Block Diagram

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a7z/block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Interface Description

<Tabs queryString="a7z-revision">
<TabItem value="v1" label="V1.10 / V1.11" default>

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a7z/a7z-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description                      | No. | Description               | No. | Description            |
| --- | -------------------------------- | --- | ------------------------- | --- | ---------------------- |
| ①   | USB-C 2.0 OTG & Power Port       | ⑥   | Antenna Connector         | ⑪   | PCIe 3.0 FPC Connector |
| ②   | USB-C 3.1 OTG & DP Alt Mode Port | ⑦   | WiFi 6 / BT5 Module       | ⑫   | 40-Pin GPIO Header     |
| ③   | Allwinner A733 SoC               | ⑧   | 4-lane MIPI CSI Connector | ⑬   | LPDDR4/4x RAM          |
| ④   | Micro HDMI Port                  | ⑨   | Onboard UFS               | ⑭   | microSD Card Slot      |
| ⑤   | Fan Connector                    | ⑩   | U-Boot Button             |     |                        |

</TabItem>
<TabItem value="v2" label="V2.00">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a7z/a7z-interface-v2.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Cubie A7Z V2.00 Interface Diagram" />
</div>

| No. | Description                      | No. | Description                | No. | Description        |
| --- | -------------------------------- | --- | -------------------------- | --- | ------------------ |
| ①   | USB-C 2.0 OTG & Power Port       | ⑥   | Antenna Connector          | ⑪   | 4-lane MIPI DSI    |
| ②   | USB-C 3.1 OTG & DP Alt Mode Port | ⑦   | WiFi 6 / BT5 Module        | ⑫   | 2x 4-lane MIPI CSI |
| ③   | Allwinner A733 SoC               | ⑧   | FPC Connector (PCIe Gen 3) | ⑬   | 40-Pin GPIO Header |
| ④   | Micro HDMI Port                  | ⑨   | Onboard UFS                | ⑭   | LPDDR4/4x RAM      |
| ⑤   | Fan Connector                    | ⑩   | USB BOOT Button            | ⑮   | microSD Card Slot  |

</TabItem>
</Tabs>

- Power Indicator

When the Cubie A7Z is powered on normally, the power indicator will light up green.

- LPDDR4/4x

LPDDR4/4x options available: 1GB / 2GB / 4GB / 8GB / 16GB

- Onboard UFS

The onboard UFS module supports up to 1TB of storage capacity.
