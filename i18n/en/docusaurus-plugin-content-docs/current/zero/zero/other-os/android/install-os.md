---
sidebar_position: 2
---

## Installing the operating system

## Preparation

- ZERO motherboard with onboard eMMC
- Type-c to Type-a cable

## Image Download

Please go to [Resource Download Summary](./download) to download the corresponding image file.

## Installation

1. Download the Android image and unzip it.
2. Please refer to [Environment Preparation](../../low-level-dev/install-os-on-emmc#environment-preparation) to load [ android-bootloader.img ](https://dl.radxa.com/zero/images/loader/android-bootloader.img). You can boot into fastboot mode.
3. Run `. /flash-all.bat` script for Windows or run `./flash-all.sh` script on Linux to start flashing the system.

## Reference Documents

- [Installing an OS image to eMMC from a USB OTG port](../../low-level-dev/install-os-on-emmc)
