---
sidebar_position: 21
---

# Erase SPI Flash

## Method 1： Erase SPI Flash on Board

Boot Linux from SD card or eMMC, log in to the system, and confirm that the SPI flash can be read.

```bash
ls /dev/mtdblock*
Under normal circumstances, it will return /dev/mtdblock0, and then execute the clear command.
```

```bash
sudo dd if=/dev/zero of=/dev/mtdblock0
sync
```

## Method 2: Under Linux PC / Mac

First, put the device [into MaskRom mode] (./maskrom.md), then connect the PC and the device via USB cable.
Then download [zero.img](https://dl.radxa.com/rock5/sw/images/others/zero.img.gz) and unzip it, then execute the following command

```bash
rkdeveloptool db rk3588_spl_loader_v1.08.111.bin (other devices need to select the corresponding loader file)
rkdeveloptool wl 0 zero.img
rkdeveloptool rd
```

## Method 3: Using RKDevTool under window

First, put the device into [MaskRom mode](./maskrom.md), then open the RkDevTool tool, select "Advanced Function", and follow the order on the picture below.

![Erase Data](/img/common/rkdevtool/700px-Eraseall_new.webp)
