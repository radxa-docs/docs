---
sidebar_position: 3
---

# Install System to NVMe SSD

NVMe SSDs are high-speed, high-capacity, and low-cost storage devices that can be used as either storage devices or boot drives.

## Storage Device

To use an NVMe SSD as a storage device, simply connect and install the NVMe SSD to the M.2 M Key 2230 slot on the Cubie A5E.

## Boot Drive

To use an NVMe SSD as a boot drive, you need to follow these steps and tutorials:

1. Burn SPI Boot Firmware

After [burning the SPI boot firmware](./burn-spi.md), the Cubie A5E will support booting the system from an NVMe SSD.

2. Install System to NVMe SSD

You can choose different installation methods based on your hardware:

- [Install System Using an External Enclosure](./install-system/reader.md): Requires an NVMe SSD enclosure, relatively simple to operate!
- [Install System from SD Card to NVMe](./install-system/no-reader.md): Requires booting the system normally from a MicroSD card first, then using the `dd` command to install the system to the NVMe SSD.
