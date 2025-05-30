---
sidebar_position: 1
---

# Installing System to MicroSD Card

This tutorial explains how to install the system on a MicroSD card.

## Hardware Requirements

You'll need to prepare the following hardware devices to complete the system installation and boot process.

#### For System Installation

- Card reader: MicroSD card reader
- Boot media: MicroSD card (32GB or larger recommended)

#### For System Booting

- Development board: Radxa ROCK 4D
- Power adapter: Type-C power adapter (PD protocol supported, 5V input, 2A or higher current recommended)

:::tip
The Radxa ROCK 4D motherboard only supports 5V power input. A current of 2A or higher is recommended to ensure stable operation of all peripherals.

Recommended power supplies:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard Type-C power adapter (5V input, PD protocol supported, 2A or higher current recommended)
  :::

## System Installation

Installing the system will format the MicroSD card. Please back up any important data in advance.

### Download System Image

Visit the [Resource Downloads](../../download) page on your PC and locate the system image for the MicroSD card.

After downloading, extract the system image file. The resulting `*.img` file is the system image that will be written to the MicroSD card.

:::tip
The downloaded system image is a compressed file that must be extracted before it can be written to the SD card using the image writing software. Writing the compressed file directly to the SD card may result in installation failure or boot issues.
:::

### Hardware Connection

Insert the MicroSD card into the card reader, then connect the card reader to a USB port on your PC.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Installing the System Image

Use the open-source image writing tool Etcher to write the system image to the MicroSD card.

#### Downloading Etcher

Go to the official Balena Etcher website and download the software for your platform: balenaEtcher.

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

The downloaded file is an `*.exe` installer. Double-click to run the program.

- Linux

It's recommended to download the `*.zip` archive. After extraction, double-click to run the program.

- macOS

Download the appropriate `*.dmg` file for your system architecture. After opening, drag the application to the Applications folder to install. Then double-click the application icon to run it.

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Installing the System Image

1. Select Image File

Click the `Flash from file` option and select the system image file you downloaded and extracted earlier.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. Select Target Device

Click the `Select target` option and choose the storage device where you want to install the system image.

:::danger
Be careful not to select the wrong storage device, as Etcher will format the selected device, potentially causing data loss!

You can unplug and replug your storage device to observe changes in the available devices and help identify the correct one.
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Select the storage device for the system image

② : Click `Select 1` to confirm device selection

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. Flash the System Image

Click the `Flash` option and wait for the software to automatically install and verify the system image.

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

When using our provided system image, you'll need to log in with the following default credentials on first boot:

Debian Linux
Username: radxa

Password: radxa

## Booting the System

After completing the system image installation, remove the MicroSD card from the card reader, insert it into the MicroSD card slot on the motherboard, and power on the system using a 5V Type-C power adapter.

When the system boots, both the blue and green LEDs will light up simultaneously. After a few seconds, the green LED will stay lit while the blue LED will blink, indicating that the system has successfully booted.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-sd.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
