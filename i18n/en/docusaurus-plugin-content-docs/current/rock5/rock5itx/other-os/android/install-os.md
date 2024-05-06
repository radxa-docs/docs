---
sidebar_position: 2
title: Install OS
---

import Etcher from '../../../../common/general/\_etcher.mdx'

This document describes how to install an Android image to the ROCK 5 ITX.

ROCK 5 ITX can be booted from microSD card , EMMC and SPI+NVME, depending on the boot method, the system will be installed on different media.

# Install the operating system

Before starting ROCK 5 ITX using microSD card/eMMC, it is necessary to erase the SPI as follows:

1. Go to [Resource Download Summary](rock5/rock5itx/getting-started/download.md) to download the Loader file locally

2. Enter maskrom mode

- Disconnect the board from the power supply.
- Remove the SD card and insert the eMMC module.
- Connect the USB3.0 port of the Radxa ROCK 5 ITX to the PC side with USB cable.
- Press and hold the Maskrom key，Power up the board.
- Remove the right yellow jumper cap and keep the left yellow jumper cap.

- Check for USB devices
  - Linux/macOS: Check if "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company" is displayed after running lsusb.
  - Windows: Open RKDevTool and you will see the device in "maskrom mode".

3. Erase SPI as follows

<Tabs queryString="target">

<TabItem value="windows" label="Windows">

Windows use [rkdeveloptool](/rock5/rock5itx/low-level-dev/rkdeveloptool)
![ROCK 5 ITX erase SPI](/img/rock5itx/rock5itx_erase_spi_en.webp)

</TabItem>

<TabItem value="linux/mac" label="Linux/Mac">

Linux/Mac use [rkdevtool](/rock5/rock5itx/low-level-dev/rkdevtool)

```bash
dd if=/dev/zero of=zero.img bs=16M count=1
rkdeveloptool db rk3588_spl_loader_v1.08.111.bin (select the loader file downloaded in step 1)
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

Please go to [Resource Download Summary](/rock5/rock5itx/getting-started/download.md) to download the corresponding image file.

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

Please go to [Resource Download Summary](/rock5/rock5itx/getting-started/download.md) to download the corresponding image file.

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

<TabItem value="windows" label="Windows">

#### Windows systems write with rkdevetool

[rkdeveloptool](../../low-level-dev/rkdeveloptool)

</TabItem>

<TabItem value="linux/mac" label="Linux/mac">

#### Linux/Mac systems are written using rkdeveloptool

[rkdevtool](../../low-level-dev/rkdevtool)

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

Please go to [Resource Download Summary](/rock5/rock5itx/getting-started/download.md) to download the corresponding image file.

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

<TabItem value="windows" label="Windows">

#### Windows systems write with rkdevetool

[rkdeveloptool](../../low-level-dev/rkdeveloptool)

</TabItem>

<TabItem value="linux/mac" label="Linux/mac">

#### Linux/Mac systems are written using rkdeveloptool

[rkdevtool](../../low-level-dev/rkdevtool)

</TabItem>

## Boot the system

- Using a 12V power supply to power the ROCK 5 ITX

## Reference Documentation

</TabItem>

</Tabs>
