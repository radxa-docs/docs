---
sidebar_position: 2
title: Install OS
---

import Etcher from '../../../../common/general/\_etcherV2.mdx'

This document describes how to install an Android image to the ROCK 5B/5B+.

ROCK 5B/5B+ can be booted from microSD card or EMMC, depending on the boot method, the system will be installed on different media.

### Erase SPI Flash

Before using a microSD card/eMMC to boot an SBC with SPI Flash, the SPI needs to be erased. Refer to [Erase SPI Flash](../../low-level-dev/maskrom/erase.md)

## Installation System

<Tabs queryString="target">

<TabItem value="microsd" label="Install system to microSD card">

#### Preparation

- 1x microSD card (capacity >=8GB)
- 1x microSD card reader
- 5V power adapter (Recommended [Radxa Power PD30W](/accessories/pd_30w))

#### Image Download

Please go to [Resource Download Summary](./download) to download the corresponding image file.

#### Install the system

<Etcher model="rock5b" />

#### Boot the system

- After successfully burning the microSD card as described above, insert the microSD card into the microSD slot of Radxa ROCK 5B.
- The power supply interface of Radxa ROCK 5B is [USB 2.0 OTG Type C port](/rock5/rock5b/hardware-design/hardware-interface), please connect the power supply port and the adapter with Type-C cable.

:::tip
The ROCK 5B supports USB Type-C PD 2.0 at 9V/2A, 12V/2A, 15V/2A and 20V/2A. Radxa recommends using the [Radxa Power PD30W](/accessories/pd_30w).
:::

#### Reference Documentation

</TabItem>

<TabItem value="emmc" label="Installing the system to eMMC">

#### Preparation

- usb connector cable

#### Download the image

Please go to [Resource Download Summary](./download) to download the corresponding image file.

#### System Installation

1. Connect the micro usb cable to the host computer. 2.

2. Enter maskrom mode

- Disconnect the board from the power supply.
- Remove the SD card and insert the eMMC module.
- Connect the USB3.0 port of the Radxa ROCK 5B to the PC side with USB A-A.
- Short the following pins
- Power up the board.
- Remove the right yellow jumper cap and keep the left yellow jumper cap.

<img src="/img/rock5b/rock-5b-maskrom-01.webp" alt="ROCK 5B maskrom" width="500" />

- Check for USB devices
  - Linux/macOS: Check if "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company" is displayed after running lsusb.
  - Windows: Open RKDevTool and you will see the device in "maskrom mode".
    <img src="/img/rock5b/rock-5b-select-loader-bin.webp" alt="ROCK 5B select loader bin" width="500" />

<Tabs queryString="target">

<TabItem value="linux" label="Linux">

#### Linux systems are written using rkdeveloptool

[rkdeveloptool](../../low-level-dev/maskrom/linux)

</TabItem>

<TabItem value="mac" label="Mac">

#### Mac systems are written using rkdeveloptool

[rkdeveloptool](../../low-level-dev/maskrom/mac-os)

</TabItem>

<TabItem value="windows" label="Windows">

#### Windows systems write with rkdevetool

[rkdevtool](/rock5/rock5b/low-level-dev/maskrom/windows)

</TabItem>

</Tabs>

#### Starting the ROCK 5B

1. Power up the ROCK 5B via the adapter.
2. The ROCK 5B will start up with the green power LED on.

</TabItem>

<TabItem value="spi-nvme" label="Install system to SPI-NVME">

#### Prepare installation media

- Type-C to Type-A USB connector cable
- 1x NVME ssd （M.2）
- 12V Power Supply

#### Download the image

Please go to [Resource Download Summary](./download.md) to download the corresponding image file.

#### System Installation

Enter maskrom mode

- Disconnect the board from the power supply.
- Remove the SD card and insert the NVME SSD into the M.2 slot of the Radxa SBC
- Use  USB cable to connect Radxa SBC and PC
- Press and hold the Maskrom key，Power up the board.
- Check for USB devices
  - Linux/macOS: Check if "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company" is displayed after running lsusb.
  - Windows: Open RKDevTool and you will see the device in "maskrom mode".

:::tip
Some SBCs do not have maskrom buttons and need to short-circuit the corresponding pins before powering on
:::

#### Install the system

<Tabs queryString="target">

<TabItem value="linux" label="Linux">

#### Linux systems are written using rkdeveloptool

[rkdeveloptool](../../low-level-dev/maskrom/linux.md)

</TabItem>

<TabItem value="mac" label="Mac">

#### Mac systems are written using rkdeveloptool

[rkdeveloptool](../../low-level-dev/maskrom/mac-os.md)

</TabItem>

<TabItem value="windows" label="Windows">

#### Install RKDevTool

RKDevTool is Rockchip's software for USB burning on Windows platform. If RKDevTool is not installed on your Windows host, please follow the steps below to install it.

Please download and extract the following files to install RKDevTool:

- [RKDevTool v2.96](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96_zh.zip) (Includes Chinese documentation)
- [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

#### Installation of drivers

Download and unzip DriverAssistant, then execute DriverInstall.exe and click the `Install Driver` button to install the driver.
If you have already installed another version of driver, please click `Uninstall Driver` to uninstall the driver first, and then reinstall it again.

![RK Driver](/img/configuration/RK-Driver-Assistant-Install-Uninstall.webp)

#### Install RKDevTool

unzip RKDevTool_Release_v2.96_zh.zip ，click RKDevTool.exe to open.

#### Enter Maskrom mode

If the operation is normal, RKDevTool will prompt `A MASKROM device was found`.

<img src="/img/rkdevtool/rkdevtool_maskrom.webp" alt="rkdevtool maskrom" />

##### Follow the steps below to flash the operation image

![RK Android update](/img/rock5itx/rock5itx_android_update_en.webp)

</TabItem>

</Tabs>

#### Boot the system

1. Power the ROCK 5B through an adapter
2. ROCK 5B/5B+ will start when the green power LED lights up

</TabItem>

</Tabs>

:::tip
The first startup of the Android system after flashing is often relatively long, please be patient and wait
:::

## Frequently asked questions

- SPI-NVME encountered the following error during system installation: Switching PCIE storage failed, loader does not support switching
  1. Check if the SSD is plugged into the corresponding interface of Radxa SBC. The ROCK 5B+only has one M.2 interface that supports SPI-NVME startup. If the startup fails, try changing the interface
  2. Check if the SSD format is FAT32 format

## Documentation
