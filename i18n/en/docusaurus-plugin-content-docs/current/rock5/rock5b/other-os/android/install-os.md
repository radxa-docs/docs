---
sidebar_position: 2
title: Install OS
---

import Etcher from '../../../../common/general/\_etcherV2.mdx'
import EnterMaskromMode from '../../\_enter_maskrom_mode.mdx'

This document describes how to install an Android image to the ROCK 5B/5B+.

ROCK 5B/5B+ can be booted from microSD card or EMMC, depending on the boot method, the system will be installed on different media.

### Erase SPI Flash

Before using a microSD card/eMMC to boot an SBC with SPI Flash, If there is data in SPI Flash, the SPI Flash needs to be erased. Refer to [Erase SPI Flash](../../low-level-dev/maskrom/erase)

<details>

<summary> When will SPI FLASH have data? </summary>

There are generally two scenarios where data will be written:

- Flash image in MaskROM Mode Without Pressing the MaskROM Button

In the case where both the eMMC and SPI Flash are empty, the board enters Maskrom mode for writing an image to the onboard eMMC via the USB interface. If the specific Maskrom button is not pressed during Maskrom mode, the system will automatically write the data (such as an operating system image) to the SPI Flash instead.

- Intentional writing, e.g., Booting from NVMe

For scenarios where an NVMe drive is needed to boot the system, the SPI Flash image must first be programmed.

</details>

## Installation System

<Tabs queryString="target">

<TabItem value="microsd" label="Install system to microSD card">

#### Preparation

- 1x microSD card (capacity >=8GB)
- 1x microSD card reader
- 5V power adapter (Recommended [Radxa Power PD30W](/accessories/pd_30w))

#### Image Download

Please go to [Resource Download](../../download) to download the corresponding image file.

#### Install the system

<Etcher model="rock5b" />

#### Boot the system

- After successfully burning the microSD card as described above, insert the microSD card into the microSD slot of Radxa ROCK 5B/5B+.
- The power supply interface of Radxa ROCK 5B is [USB 2.0 OTG Type C port](/rock5/rock5b/hardware-design/hardware-interface), please connect the power supply port and the adapter with Type-C cable.

:::tip
The ROCK 5B/5B+ supports USB Type-C PD 2.0 at 9V/2A, 12V/2A, 15V/2A and 20V/2A. Radxa recommends using the [Radxa Power PD30W](/accessories/pd_30w).
:::

#### Reference Documentation

</TabItem>

<TabItem value="emmc" label="Installing the system to eMMC">

#### Preparation

- 1x USB Type-A to Type-C cable
- x86 PC
- rock5b/5b+
- EMMC Module

#### Download the image

Please go to [Resource Download](../../download) to download the corresponding image file.

#### System Installation

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

#### Windows systems write with rkdevtool

[rkdevtool](/rock5/rock5b/low-level-dev/maskrom/windows)

</TabItem>

</Tabs>

#### Starting the ROCK 5B/5B+

1. Power up the ROCK 5B/5B+ via the adapter.
2. The ROCK 5B/5B++ will start up with the green power LED on.

</TabItem>

<TabItem value="spi-nvme" label="Install system to NVME">

#### Prepare installation media

- Type-C to Type-A USB connector cable
- 1x NVME ssd （M.2, FAT32 Format）
- 12V Power Supply

#### Download the image

Please go to [Resource Download](../../download) to download the corresponding image file.

#### System Installation

#### Install the system

<Tabs queryString="target">

<TabItem value="linux" label="Linux(Rock 5B)">

#### Linux systems are written using rkdeveloptool

[rkdeveloptool](../../low-level-dev/maskrom/linux)

</TabItem>

<TabItem value="mac" label="Mac(Rock 5B)">

#### Mac systems are written using rkdeveloptool

[rkdeveloptool](../../low-level-dev/maskrom/mac-os)

</TabItem>

<TabItem value="windows" label="Windows(Rock 5B/5B+)">

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

<EnterMaskromMode/>

##### Follow the steps below to flash the operation image

![RK Android update](/img/rock5itx/rock5itx_android_update_en.webp)

</TabItem>

</Tabs>

#### Boot the system

1. Power the ROCK 5B/5B+ through an adapter
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
