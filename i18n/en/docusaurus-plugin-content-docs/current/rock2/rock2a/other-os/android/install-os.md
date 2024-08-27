---
sidebar_position: 2
title: Install OS
---

import Etcher from '../../../../common/general/\_etcherV2.mdx'
import Rkdevtool from "../../../../common/dev/\_rkdevtoolV3.mdx";
import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV3.mdx";

# Install the operating system

This document describes how to install an Android image to the ROCK 2A.

ROCK 2A can be booted from microSD card or EMMC, depending on the boot method, the system will be installed on different media.

<Tabs queryString="target">

<TabItem value="microsd" label="Install system to microSD card">

## Preparation

- 1x microSD card (capacity >=16GB, speed level >= class10)
- 1x microSD card reader
- 5V power adapter (Recommended [Radxa Power PD30W](../../../../accessories/pd_30w.md))

## Image Download

Please go to [Resource Download Summary](../../download) to download the corresponding image file.

## Install the system

<Etcher model="rock2A" />

## Boot the system

- After successfully burning the microSD card as described above, insert the microSD card into the microSD slot of ROCK 2A.
- The power supply interface of ROCK 2A is [Type C port](../../hardware-design/hardware-interface.md), please connect the power supply port and the adapter with Type-C cable.

## Reference Documentation

</TabItem>

<TabItem value="emmc" label="Installing the system to eMMC">

### Preparation

### Prepare installation media

- USB connector cable (A-A)
- 1x ROCK 2A with eMMC
- 5V power adapter (Recommended [Radxa Power PD30W](../../../../accessories/pd_30w.md))

### Download the image

Please go to [Resource Download Summary](../../download) to download the corresponding image file.

## System Installation

Enter maskrom mode

- Disconnect the board from the power supply.
- Remove the SD card
- Connect the USB3.0 port of the Radxa ROCK 2A to the PC side with USB A-A.
- Press and hold the Maskrom button
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

<TabItem value="mac" label="Mac">

<Rkdeveloptool platform="macos">
</Rkdeveloptool>

</TabItem>

<TabItem value="windows" label="Windows">

<Rkdevtool rkdevtool_emmc_img="/img/rkdevtool/emmc-path.webp" loader_name="false" emmc={false} pcie={false} sata={false} >
</Rkdevtool>

</TabItem>

</Tabs>

## System startup

### Starting the ROCK 2A

1. Power up the ROCK 2A via the adapter.
2. The ROCK 2A will start up with the green power LED on.

</TabItem>

</Tabs>
