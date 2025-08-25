---
sidebar_position: 7
---

# PCIe 3.0 FPC Interface

The Radxa Cubie A7Z features an onboard PCIe 3.0 FPC interface, supporting the PCIe 3.0 standard with a single-lane (x1) high-speed data expansion interface.

You can connect a PCIe to M.2 M Key HAT via the PCIe 3.0 FPC interface and use it with an M.2 NVMe SSD to expand storage capacity.

:::info Interface Location
For the specific location of the PCIe 3.0 FPC interface, please refer to the interface description section in the [Hardware Interface](./hardware-info) tutorial!
:::

## Usage Guide

:::danger Note
Currently, NVMe SSDs can only be used as expanded storage. Full functionality is under development!
:::

To use an M.2 NVMe SSD, you need to connect it to the Cubie A7Z's FPC interface using a PCIe to M.2 M Key HAT.

- Expanding Storage

Install the PCIe to M.2 M Key HAT expansion board onto the Cubie A7Z, then install the NVMe SSD into the M.2 M Key slot on the expansion board.

After installation, use the `lsblk` command to verify if the NVMe SSD is recognized.

## Interface Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematic](../download) document in the download section.
:::
