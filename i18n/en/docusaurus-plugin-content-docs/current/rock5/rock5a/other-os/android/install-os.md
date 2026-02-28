---
sidebar_position: 2
title: Install OS
---

import Etcher from '../../../../common/general/\_etcherV2.mdx'

# Install OS

This document describes how to install an Android image to the ROCK 5A.

ROCK 5A can be booted from microSD card or EMMC, depending on the boot method, the system will be installed on different media.

<Tabs queryString="target">

<TabItem value="microsd" label="Install system to microSD card">

#### Preparation

- 1x microSD card (capacity >=16GB, speed level >= class10)
- 1x microSD card reader
- 5V power adapter (Recommended [Radxa Power PD30W](../../accessories/power/pd_30w))

### Image Download

Please go to [Resource Download](../../download) to download the corresponding image file.

### Install the system

<Etcher model="rock5a" />

#### Boot the system

- After successfully burning the microSD card as described above, insert the microSD card into the microSD slot of ROCK 5A.
- The power supply interface of ROCK 5A is [Type C port](../../hardware-design/hardware-interface), please connect the power supply port and the adapter with Type-C cable.

</TabItem>

<TabItem value="emmc" label="Installing the system to eMMC">

#### Preparation

#### Prepare installation media

- USB connector cable (A-A)
- 1x eMMC module
- 5V power adapter (Recommended [Radxa Power PD30W](../../accessories/power/pd_30w))

#### Download the image

Please go to [Resource Download](../../download) to download the corresponding image file.

#### System Installation

Enter maskrom mode

- Disconnect the board from the power supply.
- Remove the SD card and insert the eMMC module.
- Connect the USB3.0 port of the Radxa ROCK 5A to the PC side with USB A-A.
- Short the Maskrom pins
- Power up the board.
- Remove the right yellow jumper cap and keep the left yellow jumper cap.

- Check for USB devices
  - Linux/macOS: Check if "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company" is displayed after running lsusb.
  - Windows: Open RKDevTool and you will see the device in "maskrom mode".

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

[rkdevtool](../../../rock5b/low-level-dev/maskrom/windows)

</TabItem>

</Tabs>

#### Starting the ROCK 5A

1. Power up the ROCK 5A via the adapter.
2. The ROCK 5A will start up with the green power LED on.

</TabItem>

</Tabs>
