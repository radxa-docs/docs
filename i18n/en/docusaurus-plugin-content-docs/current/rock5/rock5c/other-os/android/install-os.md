---
sidebar_position: 2
title: Install OS
---

import Etcher from '../../../../common/general/\_etcher.mdx'

This document describes how to install an Android image to the ROCK 5C.

ROCK 5C can be booted from microSD card or EMMC, depending on the boot method, the system will be installed on different media.

<Tabs queryString="target">

<TabItem value="microsd" label="Install system to microSD card">

# Install the operating system

## Preparation

- 1x microSD card (capacity >=16GB, speed level >= class10)
- 1x microSD card reader
- 5V power adapter (Recommended [Radxa Power PD30W](../../accessories/pd-30w))

## Image Download

Please go to [Resource Download Summary](../../download) to download the corresponding image file.

## Install the system

<Etcher model="rock5c" />

## Boot the system

- After successfully burning the microSD card as described above, insert the microSD card into the microSD slot of ROCK 5C.
- The power supply interface of ROCK 5C is [Type C port](/rock5/rock5c/hardware-design/hardware-interface), please connect the power supply port and the adapter with Type-C cable.

## Reference Documentation

</TabItem>

<TabItem value="emmc" label="Installing the system to eMMC">

### Preparation

### Prepare installation media

- USB connector cable (A-A)
- 1x eMMC module
- 5V power adapter (Recommended [Radxa Power PD30W](../../accessories/pd-30w))

### Download the image

Please go to [Resource Download Summary](../../download) to download the corresponding image file.

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

<TabItem value="linux/mac" label="Linux/mac">

#### Linux/Mac systems are written using rkdeveloptool

[rkdeveloptool](../../low-level-dev/rkdeveloptool)

</TabItem>

<TabItem value="windows" label="Windows">

#### Windows systems write with rkdevetool

[rkdevtool](/rock5/rock5c/low-level-dev/rkdevtool)

</TabItem>

</Tabs>

## System startup

### Starting the ROCK 5C

1. Power up the ROCK 5C via the adapter.
2. The ROCK 5C will start up with the blue power LED on.

</TabItem>

</Tabs>
