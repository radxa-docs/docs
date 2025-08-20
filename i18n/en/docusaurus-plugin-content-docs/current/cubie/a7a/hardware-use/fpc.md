---
sidebar_position: 9
---

# PCIe 3.0 FPC Interface

The Radxa Cubie A7A features an onboard PCIe 3.0 FPC interface that supports the PCIe 3.0 standard with a single lane (x1) for high-speed data expansion.

You can connect a PCIe to M.2 M Key HAT via the PCIe 3.0 FPC interface and use it with an M.2 NVMe SSD to expand storage capacity.

:::tip
For the exact location of the PCIe 3.0 FPC interface, please refer to the interface description section in the [Hardware Interface](./hardware-info) guide!
:::

## User Guide

:::danger Note
Currently, NVMe SSDs can only be used as expanded storage. Support is being developed!
:::

To use an M.2 NVMe SSD, you need to connect it to the Cubie A7A's FPC interface using a PCIe to M.2 M Key HAT.

- **Expanding Storage**

Install the PCIe to M.2 M Key HAT expansion board onto the Cubie A7A, then install the NVMe SSD into the M.2 M Key slot on the expansion board.

After installation, use the `lsblk` command to verify if the NVMe SSD is recognized.

- **As a System Boot Drive**

To use an M.2 NVMe SSD as a system boot drive, refer to the [Installing System to M.2 NVMe SSD](../getting-started/install-system/nvme-system/) guide.

## Interface Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematics](../download) document in the download section.
:::
