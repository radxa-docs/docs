---
sidebar_position: 2
---

# Installing the operating system

## Preparation

- ZERO 2 PRO motherboard with onboard eMMC
- Type-c to Type-a cable

## Image Download

Please go to [Resource Download Summary](./download) to download the corresponding image file.

## Install the system

1. Download the Android image and unzip it.
2. Refer to [Environment Preparation](../../low-level-dev/install-os-on-emmc#Environment-preparation) to load the bootloader.img in the zip package, and then you can enter fastboot mode.
3. Run `./flash-all.bat` script for Windows and run `./flash-all.sh` script on Linux to start flashing the system.

## Reference Documents

- [Installing an OS image to eMMC from a USB OTG port](../../low-level-dev/install-os-on-emmc)
