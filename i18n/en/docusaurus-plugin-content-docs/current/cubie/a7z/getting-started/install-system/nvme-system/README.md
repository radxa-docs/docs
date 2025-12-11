---
sidebar_position: 3
---

# Install System to NVMe SSD

To use NVMe SSD as a boot system disk, you need to follow these steps and tutorials:

## Flash SPI Boot Firmware

- [Flash SPI Boot Firmware](./burn-spi.md)

## Write System Image to NVMe SSD

You can choose different writing methods based on your hardware devices:

- [Install System Using External Enclosure](./install-system/reader.md): Requires an NVMe SSD enclosure, relatively simple operation!
- [Install System from SD Card to NVMe](./install-system/no-reader.md): Requires booting the system normally from MicroSD card, then use the `dd` command to install the system to NVMe SSD.
