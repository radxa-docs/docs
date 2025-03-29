---
sidebar_position: 5
title: Resource Download
---

# Resource Download

## OS image

### Official Operating System Image

- [Radxa ZERO 2 PRO Debian Build 32](https://github.com/radxa-build/radxa-zero-2pro/releases/download/b32/radxa-zero-2pro_debian_bookworm_kde_b32.img.xz)

:::caution
Except for the above images which have been fully tested officially, the other images have not been rigorously tested and may have unknown issues and are for evaluation use only.
:::

### Third-Party Operating System images

- [Radxa ZERO 2 PRO Armbian](https://www.armbian.com/radxa-zero2/)

## Tools

- [Zagdig](https://zadig.akeo.ie/)：Windows Maskrom Driver.
- [RZ USB Boot Helper](https://dl.radxa.com/zero/tools/windows/RZ_USB_Boot_Helper_V1.0.0.zip)：Windows bootloader Load Tool.
- [radxa-zero2-2pro-erase-emmc.bin](https://dl.radxa.com/zero2pro/images/loader/radxa-zero-2pro-erase-emmc.bin)：Automatically erases the eMMC and then displays the eMMC as a USB storage device. This is the recommended method for loading a new Linux image.
- [rz-2pro-fastboot-loader.bin](https://dl.radxa.com/zero2pro/images/loader/rz-2pro-fastboot-loader.bin)：Enable fastboot mode. It cannot be used to install our official Android system.
- [rz-2pro-udisk-loader.bin](https://dl.radxa.com/zero2pro/images/loader/rz-2pro-udisk-loader.bin): Use the onboard eMMC as a USB mass storage device.
- [u-boot.bin](https://dl.radxa.com/zero2pro/images/loader/u-boot.bin)：Mainline U-Boot bootloader for USB booting. Does not work if flashing to eMMC/microSD.
- [u-boot.bin.sd.bin](https://dl.radxa.com/zero2pro/images/loader/u-boot.bin.sd.bin)：Mainline U-Boot bootloader for eMMC/microSD booting.

## Hardware Design
