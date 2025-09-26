---
sidebar_position: 4
---

# M.2 M Key 2230 Slot

The Radxa Dragon Q6A features an onboard M.2 M Key 2230 slot, ideal for users requiring high read/write speeds and large storage capacity. It can be used as a system boot drive or to expand storage space.

## Interface Parameters

| Parameter         | Description                             |
| ----------------- | --------------------------------------- |
| Interface Type    | M.2 M Key 2230 Slot                     |
| Protocol/Channels | PCIe Gen3 x2 (2 lanes)                  |
| Read Speed        | 1649 MB/s (Theoretical up to 2000 MB/s) |
| Write Speed       | 1467 MB/s (Theoretical up to 2000 MB/s) |

> Note: Actual read/write speeds may vary depending on the NVMe SSD brand and usage environment. The above speeds are test data for reference only.

## Hardware Connection

Install the M.2 M Key 2230 SSD into the M.2 M Key 2230 slot on the Radxa Dragon Q6A.

:::tip Interface Location
Refer to the [Hardware Information](./hardware_info) tutorial to locate the corresponding hardware interface.
:::

## Usage Guide

The M.2 M Key 2230 SSD can be used as a system boot media or as expanded storage space.

### System Boot Media

When the M.2 M Key 2230 SSD contains a normally functioning system and there are no boot media with higher boot priority than the M.2 M Key 2230 SSD, the Radxa Dragon Q6A will default to booting the system from the M.2 M Key 2230 SSD.

:::tip

Please refer [Install the system to an NVMe SSD](../getting-started/install-system/nvme_system/)

:::

### Expanding Storage Space

M.2 M Key 2230 SSD does not exist in the system or start the system through other system boot media. M.2 M Key 2230 SSD will be used as expanded storage space.

## Interface Pin Definition

Please refer to the hardware schematic diagram on the [Resource Summary Download](../download) page.
