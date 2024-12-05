---
sidebar_position: 2
title: Install OS
---

import Images from "../../\_image.mdx";
import Etcher from '../../../../common/general/\_etcherV2.mdx'
import Rkdevtool from "../../../../common/dev/\_rkdevtoolV3.mdx";
import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV3.mdx";

This document describes how to install an Android image to the ROCK 5 ITX.

ROCK 5 ITX can be booted from microSD card , EMMC and SPI+NVME, depending on the boot method, the system will be installed on different media.

# Install the operating system

Before starting ROCK 5 ITX using microSD card/eMMC, it is necessary to erase the SPI as follows:

1. Download the Loader file locally

<Images loader={false} system_img={false} spi_img={false} miniloader={true} />

2. Enter maskrom mode

- Disconnect the board from the power supply.
- Connect the USB3.0 port of the Radxa ROCK 5 ITX to the PC side with USB cable.
- Press and hold the Maskrom key，Power up the board.
- Remove the right yellow jumper cap and keep the left yellow jumper cap.

- Check for USB devices
  - Linux/macOS: Check if "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company" is displayed after running lsusb.
  - Windows: Open RKDevTool and you will see the device in "maskrom mode".

3. Erase SPI as follows

<Tabs queryString="target">

<TabItem value="windows" label="Windows">

Windows use rkdevtool
![ROCK 5 ITX erase SPI](/img/rock5itx/rock5itx_erase_spi_en.webp)

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

<Tabs queryString="target">

<TabItem value="microsd" label="Install system to microSD card">

## Preparation

- 1x microSD card (capacity >=16GB, speed level >= class10)
- 1x microSD card reader
- 12V DC Power Supply

## Image Download

Please go to [Resource Download](../../download) to download the corresponding image file.

## Install the system

<Etcher model="rock5itx" />

## Boot the system

- After successfully burning the microSD card as described above, insert the microSD card into the microSD slot of ROCK 5 ITX.
- Using a 12V DC power adapter to power the ROCK 5 ITX.

## Reference Documentation

</TabItem>

<TabItem value="emmc" label="Installing the system to eMMC">

### Preparation

### Prepare installation media

- Type-C to Type-A USB connector cable
- 1x eMMC module (On board)
- 12V DC Power Supply

### Download the image

Please go to [Resource Download](../../download) to download the corresponding image file.

## System Installation

Enter maskrom mode

- Disconnect the board from the power supply.
- Remove the SD card
- Use Type-C to Type-A USB cable to connect ROCK 5 ITX and PC
- Press and hold the Maskrom key，Power up the board.
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

### Starting the ROCK 5 ITX

Power up the ROCK 5 ITX via the adapter.

</TabItem>

<TabItem value="spi-nvme" label="Install system to SPI-NVME">

### Prepare installation media

- Type-C to Type-A USB connector cable
- 1x NVME ssd （M.2）
- 12V Power Supply

### Download the image

Please go to [Resource Download](../../download) to download the corresponding image file.

## System Installation

Enter maskrom mode

- Disconnect the board from the power supply.
- Remove the SD card and insert the NVME SSD into the M.2 slot of the ROCK 5 ITX
- Use Type-C to Type-A USB cable to connect ROCK 5 ITX and PC
- Press and hold the Maskrom key，Power up the board.
- Check for USB devices
  - Linux/macOS: Check if "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company" is displayed after running lsusb.
  - Windows: Open RKDevTool and you will see the device in "maskrom mode".

## Install the system

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

## Boot the system

- Using a 12V power supply to power the ROCK 5 ITX

## Reference Documentation

</TabItem>

</Tabs>
