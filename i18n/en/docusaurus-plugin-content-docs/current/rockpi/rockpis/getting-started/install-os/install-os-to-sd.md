---
sidebar_position: 1
---

# Installing OS to MicroSD Card

This guide explains how to install an operating system to a MicroSD card.

## Hardware Requirements

Prepare the following hardware to complete the system installation and boot process.

#### For Installation

- Card Reader: MicroSD card reader
- Boot Media: MicroSD card (32GB or larger recommended)

#### For Booting

- Development Board: Radxa ROCK Pi S
- Power Supply: Type-C power adapter or Type-C to Type-A cable connected to a PC

:::tip
The ROCK Pi S board only supports 5V power input. A minimum current of 1A is recommended to ensure stable operation of all peripherals.
:::

## Installing the OS

Installing the OS will format the MicroSD card. Please back up any important data before proceeding.

### Download System Image

On your PC, visit the [Downloads](../../download) page to find the official operating system image.

After downloading, extract the system image file. The resulting `*.img` file is the system image to be flashed to the MicroSD card.

:::tip
The downloaded system image is a compressed file that must be extracted before it can be written to the SD card using image writing software. Writing the compressed file directly to the SD card may result in installation failure or boot issues.
:::

### Hardware Connection

Insert the MicroSD card into the card reader, then connect the card reader to a USB port on your PC.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Install System Image

Use the open-source image burning tool Etcher to burn the system image file to the MicroSD card.

#### Download Etcher

Visit the Balena Etcher official website to download the software for your operating system: balenaEtcher.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Download the appropriate software package for your system platform and architecture.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Using Etcher

After downloading, double-click to open the Etcher application.

:::tip

- Windows

The downloaded file is an `*.exe` installer - simply double-click to run it.

- Linux

Download the `*.zip` archive, extract it, then double-click the program to run.

- MacOS

Download the appropriate `*.dmg` file for your system architecture. After opening, drag the application to your Applications folder to install, then double-click the app icon to run.

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Install System Image

1. Select Image File

Click the `Flash from file` option and select the system image file you downloaded and extracted earlier.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. Select Storage Device

Click the `Select target` option and choose the storage device where you want to install the system image.

:::danger
Be extremely careful when selecting the storage device! Selecting the wrong device will cause Etcher to format it, resulting in permanent data loss!

You can unplug and reconnect the storage device to observe changes in the available devices list to help identify the correct one.
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Select the storage device for the system image installation

② : Click the `Select 1` button to confirm your device selection

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. Install System Image

Click the `Flash` button and wait for the software to automatically install and verify the system image.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system installation to complete
  <img src="/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system verification to complete
  <img src="/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
  After successfully installing the system image, close the Etcher software!
</div>

## System Information

When using our provided system image for the first time, log in with the following default credentials:

Debian Linux

Username: radxa

Password: radxa

## Booting the System

After completing the system image installation:

1. Remove the MicroSD card from the card reader
2. Insert the card into the MicroSD card slot on the mainboard
3. Power on the system using either:
   - A 5V Type-C power adapter, or
   - A Type-C to Type-A cable connected to a PC

<Tabs queryString="version">

<TabItem value=" ROCK Pi S V1.3 ">

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/rock-pi-s-v13-sd.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value=" ROCK Pi S V1.5 ">

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/rock-pi-s-v15-sd.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

After the system boots up, the power indicator will stay lit, and the status (user) LED will blink.
