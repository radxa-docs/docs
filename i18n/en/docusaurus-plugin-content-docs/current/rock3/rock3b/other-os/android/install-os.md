---
sidebar_position: 2
title: Install OS
---

import Etcher from '../../../../common/general/\_etcher.mdx'
import Rkdevtool from "../../../../common/dev/\_rkdevtoolV3.mdx";
import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV3.mdx";

# Install the operating system

This document introduces how to install Android image to Rock 3B.

Rock 3B can boot from microSD card, eMMC, SSD, so install os on microSD card, eMMC or SSD based on your choose.

<Tabs queryString="target">

<TabItem value="microsd/emmc" label="Install OS on microSD card/eMMC">

Before starting ROCK 3B using microSD card/eMMC, it is necessary to erase the SPI as follows:

1. Please go to [Download Summary](../../../images) to download image.

2. Enter maskrom mode

- Disconnect the board from the power supply.
- Remove the SD card, NVME SSD and insert the eMMC module.
- Connect the USB3.0 port of the Radxa ROCK 3B to the PC side with USB cable.
- Short circuit Maskrom Key with DuPont wire to power on the development board.
- Check for USB devices
  - Linux/macOS: Check if "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company" is displayed after running lsusb.
  - Windows: Open RKDevTool and you will see the device in "maskrom mode".
- Unplug the short DuPont wire

3. Erase SPI as follows

<Tabs queryString="target">

<TabItem value="windows" label="Windows">

Windows use rkdevtool
![ROCK 3B erase SPI](/img/rock5itx/rock5itx_erase_spi_en.webp)

</TabItem>

<TabItem value="linux/mac" label="Linux/Mac">

Linux/Mac use rkdeveloptool

```bash
dd if=/dev/zero of=zero.img bs=16M count=1
rkdeveloptool db rk3588_spl_loader_v1.15.113.bin (select the loader file downloaded in step 1)
rkdeveloptool wl 0 zero.img
rkdeveloptool rd
```

</TabItem>

</Tabs>

## Preparation

- 1x microSD card / eMMC(capacity >=8GB)
- 1x microSD card / eMMC reader
- 5V power adapter (recommended [Radxa Power PD30W] (/accessories/pd-30w))

## Image Download

Please go to [Resource Download](../../../images) to download the corresponding image file.

## Install the system

<Etcher model="rock3b" />

## Start the system

- After successfully burning the microSD card/ eMMC as described above, insert the slot of the ROCK 3B.
- The power supply interface of ROCK 3B is [USB 2.0 OTG Type C port](../../hardware-design/hardware-interface), please use Type-C cable to connect the power supply port and the adapter.

:::tip
Radxa ROCK 3B supports QC 3.0/2.0 adapter, 9V/2A, 12V/1.5A. Radxa recommends using the [Radxa Power PD30W](../../../../accessories/pd_30w).
:::

</TabItem>

<TabItem value="spi_nvme" label="Install OS on SPI-NVME ">

## Preparation

### Prepare the installation media

- 1x NVME ssd （M.2）

### Prepare the image file

Please go to [Resource Download](../../../images) to download image.

## System installation

1. Connect the micro usb cable to the host computer.
2. Enter Maskrom mode.

- Disconnect power to the board
- Remove the SD card,eMMC module and insert the NVME SSD.
- Connect the USB3.0 port of the Radxa ROCK 3B to the PC with USB A-A.
- Short the Maskrom key.
- Power up the board.
- Unplug the short DuPont wire

<Tabs queryString="target">

<TabItem value="linux" label="Linux">

<Rkdeveloptool platform="linux">
</Rkdeveloptool>

</TabItem>

<TabItem value="mac" label="mac">

<Rkdeveloptool platform="macos">
</Rkdeveloptool>

</TabItem>

<TabItem value="windows" label="Windows">

### Install RKDevTool

RKDevTool is Rockchip's software for USB burning on Windows platform. If RKDevTool is not installed on your Windows host, please follow the steps below to install it.

Please download and extract the following files to install RKDevTool:

- [RKDevTool v2.96](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96_zh.zip) (Includes Chinese documentation)
- [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

### Installation of drivers

Download and unzip DriverAssistant, then execute DriverInstall.exe and click the `Install Driver` button to install the driver.
If you have already installed another version of driver, please click `Uninstall Driver` to uninstall the driver first, and then reinstall it again.

![RK Driver](/img/configuration/RK-Driver-Assistant-Install-Uninstall.webp)

### Install RKDevTool

unzip RKDevTool_Release_v2.96_zh.zip ，click RKDevTool.exe to open.

## Enter Maskrom mode

If the operation is normal, RKDevTool will prompt `A MASKROM device was found`.

<img src="/img/rkdevtool/rkdevtool_maskrom.webp" alt="rkdevtool maskrom" />

## Follow the steps below to flash the operation image

![RK Android update](/img/rock5itx/rock5itx_android_update_en.webp)

</TabItem>

</Tabs>

## System startup

### Rock 3B

- Power on the Rock 3B via the DC adapter.
- The Rock 3B will boot up with the green power LED on.

</TabItem>

</Tabs>

## Frequently Asked Questions

## Reference
