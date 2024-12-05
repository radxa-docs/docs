---
sidebar_position: 2
title: Install OS
---

import Etcher from '../../../../common/general/\_etcherV2.mdx'

This document introduces how to install Android image to Rock 3a.

Rock 3a can boot from microSD card or eMMC, so install os on microSD card or eMMC based on your choose.

<Tabs queryString="target">

<TabItem value="microsd " label="Install OS on microSD card">

# Install the operating system

## Preparation

- 1x microSD card (capacity >=8GB)
- 1x microSD card reader
- 5V power adapter (recommended [Radxa Power PD30W] (/accessories/pd-30w))

## Image Download

Please go to [Resource Download](./download) to download the corresponding image file.

## Install the system

<Etcher model="rock3a" />

## Start the system

- After successfully burning the microSD card as described above, insert the microSD card into the microSD slot of the Radxa ROCK 3A.
- The power supply interface of Radxa ROCK 3A is [USB 2.0 OTG Type C port](../../hardware-design/hardware-interface), please use Type-C cable to connect the power supply port and the adapter.

:::tip
Radxa ROCK 3A supports QC 3.0/2.0 adapter, 9V/2A, 12V/1.5A. Radxa recommends using the [Radxa Power PD30W](../../accessories/pd-30w).
:::

</TabItem>

<TabItem value="emmc" label="Install OS on eMMC ">

## Preparation

### Prepare the installation media

- micro usb to typea usb interface cable

### Prepare the image file

Please go to [Download Summary](../../getting-started/download) to download image.

## System installation

1. Connect the micro usb cable to the host computer.

2. Enter Maskrom mode.

- Disconnect power to the board
- Remove the SD card and insert the eMMC module.
- Connect the USB3.0 port of the Radxa ROCK 3A to the PC with USB A-A.
- Short the following pins
- Power up the board.
- Remove the right yellow jumper cap, keep the left yellow jumper cap.

<Tabs queryString="target">

<TabItem value="linux/mac" label="Linux/Mac">

#### Linux/Mac systems use rkdeveloptool to write to

&emsp;[rkdeveloptool](../../low-level-dev/rkdeveloptool)

</TabItem>

<TabItem value="windows" label="Windows">

#### Windows system write with rkdevtool

&emsp;[rkdevtool](../../low-level-dev/rkdevtool)

</TabItem>

</Tabs>

## System startup

### Rock 3a

- Power on the Rock 3a via the DC adapter.
- The Rock 3a will boot up with the green power LED on.

:::tip
Radxa ROCK 3A supports `5V/12V` power supply. Radxa recommends using [Radxa Power PD30W](../../accessories/pd-30w).
:::

</TabItem>

</Tabs>

## Frequently Asked Questions

## Reference
