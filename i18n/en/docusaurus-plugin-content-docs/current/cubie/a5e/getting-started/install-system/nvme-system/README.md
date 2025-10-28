---
sidebar_position: 3
---

# Install System to NVMe SSD

NVMe SSDs are high-speed, high-capacity, and low-cost storage devices that can be used as either storage devices or boot drives. Cubie A5E supports 2230 M.2 NVMe SSDs, which can be used as storage devices or boot drives. If used as a storage device, you need to boot from an SD card or eMMC and simply insert the SSD into the M.2 interface. If used as a boot drive, you need to first flash the SPI boot firmware, then install the system image to the NVMe SSD, so you can boot the system on the NVMe SSD without an SD card or eMMC.

To use an NVMe SSD as a boot drive, you need to follow these steps and tutorials:

## Flash SPI Boot Firmware

- [Flash SPI Boot Firmware](./burn-spi.md)

## Write System Image to NVMe SSD

You can choose different writing methods based on your hardware:

- [Write System Image Using an External SSD Reader](./install-system/reader.md): Requires an NVMe SSD enclosure, relatively simple to operate!
- [Write System Image from SD Card to NVMe](./install-system/no-reader.md): Requires booting Cubie A5E system normally from a MicroSD card first, then using the `dd` command to install the system to the NVMe SSD.
