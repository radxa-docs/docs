---
sidebar_position: 2
title: Install OS
---

import Etcher from '../../../../common/general/\_etcherV2.mdx'
import Rkdevtool from "../../../../common/dev/\_rkdevtoolV3.mdx";
import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV3.mdx";

# Install the operating system

This document describes how to install an Android image to the ROCK 5C.

ROCK 5C can be booted from microSD card or EMMC, depending on the boot method, the system will be installed on different media.

<Tabs queryString="target">

<TabItem value="microsd" label="Install system to microSD card">

## Preparation

- 1x microSD card (capacity >=16GB, speed level >= class10)
- 1x microSD card reader
- 5V power adapter (Recommended [Radxa Power PD30W](../../accessories/pd-30w))

## Image Download

Please go to [Resource Download](../../download) to download the corresponding image file.

## Install the system

<Etcher model="rock5c" />

## Boot the system

- After successfully burning the microSD card as described above, insert the microSD card into the microSD slot of ROCK 5C.
- The power supply interface of ROCK 5C is [Type C port](../../hardware-design/hardware-interface), please connect the power supply port and the adapter with Type-C cable.

## Reference Documentation

</TabItem>

<TabItem value="emmc" label="Installing the system to eMMC">

### Preparation

### Prepare installation media

- USB connector cable (A-A)
- 1x eMMC module
- 5V power adapter (Recommended [Radxa Power PD30W](../../accessories/pd-30w))

### Download the image

Please go to [Resource Download](../../download) to download the corresponding image file.

## System Installation

Enter maskrom mode

- Disconnect the board from the power supply.
- Remove the SD card and insert the eMMC module.
- Connect the USB3.0 port of the Radxa ROCK 5C to the PC side with USB A-A.
- Short the Maskrom pins
- Power up the board.
- Remove the right yellow jumper cap and keep the left yellow jumper cap.

- Check for USB devices
  - Linux/macOS: Check if "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company" is displayed after running lsusb.
  - Windows: Open RKDevTool and you will see the device in "maskrom mode".

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

<Tabs queryString="system image">

<TabItem value="use gpt.img">

<Rkdevtool rkdevtool_emmc_img="/en/img/rkdevtool/emmc-path.webp" loader_name="false" emmc={false} pcie={false} sata={false} >
</Rkdevtool>

</TabItem>

<TabItem value="use update.img">

### Install RKDevTool

RKDevTool is Rockchip's software for USB burning on Windows platform. If RKDevTool is not installed on your Windows host, please follow the steps below to install it.

Please download and extract the following files to install RKDevTool:

- [RKDevTool v2.96](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96_zh.zip) (Includes Chinese documentation)
- [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

### Installation of drivers

Download and unzip DriverAssistant, then execute DriverInstall.exe and click the `Install Driver` button to install the driver.
If you have already installed another version of driver, please click `Uninstall Driver` to uninstall the driver first, and then reinstall it again.

<img src="/en/img/configuration/RK-Driver-Assistant-Install-Uninstall.webp" alt="RK Driver" />

### Install RKDevTool

unzip RKDevTool_Release_v2.96_zh.zip ，click RKDevTool.exe to open.

## Enter Maskrom mode

If the operation is normal, RKDevTool will prompt `A MASKROM device was found`.

<img src="/en/img/rkdevtool/rkdevtool_maskrom.webp" alt="rkdevtool maskrom" />

## Follow the steps below to flash the operation image

<img src="/en/img/rock5itx/rock5itx_android_update_en.webp" alt="RK Android update" />

</TabItem>

</Tabs>

</TabItem>

</Tabs>

## System startup

### Starting the ROCK 5C

1. Power up the ROCK 5C via the adapter.
2. The ROCK 5C will start up with the blue power LED on.

</TabItem>

</Tabs>
