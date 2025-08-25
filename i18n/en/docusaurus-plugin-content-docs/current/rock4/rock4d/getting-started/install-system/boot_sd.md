---
sidebar_position: 1
---

# Installing System to MicroSD Card

This tutorial explains how to install the system on a MicroSD card.

## Hardware Preparation

You will need the following hardware to complete the system installation and boot process.

#### For System Installation

- Card reader: MicroSD card reader
- Boot medium: MicroSD card (32GB or larger recommended)

#### For System Boot

- Development board: Radxa ROCK 4D
- Power adapter: Type-C power adapter (with PD protocol support, 5V input, 3A or higher recommended)

:::tip
The ROCK 4D mainboard only supports 5V power input. A minimum of 3A is recommended to ensure stable operation of all peripherals.

Recommended power supplies:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)

- Standard Type-C power adapter (5V input, with PD protocol support, 3A or higher recommended)
  :::

## Installing the System

Installing the system will format the MicroSD card. Please back up any important data before proceeding.

### Download System Image

On your PC, visit the [Downloads Summary](../../download) page and locate the system image for MicroSD card.

After downloading, extract the system image file. The resulting `*.img` file is the system image that will be written to the MicroSD card.

:::tip
The downloaded system image is a compressed file that must be extracted before it can be written to the SD card using the image flashing software. If you try to flash the compressed file directly to the SD card without extracting it first, the system installation or boot process may fail.
:::

### Hardware Connection

Insert the MicroSD card into the card reader, then connect the card reader to your PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Installing the System Image

Use the open-source image flashing tool Etcher to write the system image to the MicroSD card.

#### Downloading Etcher

Visit the official Balena Etcher website to download the software for your platform: [balenaEtcher](https://www.balena.io/etcher/).

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Download the appropriate software package for your system platform and architecture.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Using Etcher

After downloading, double-click to open the Etcher application.

:::tip

- **Windows**

  The downloaded file is an `*.exe` installer. Double-click to run the program.

- **Linux**

  It's recommended to download the `*.zip` archive. After extraction, double-click the program to run it.

- **macOS**

  Download the `*.dmg` file that matches your system architecture. After opening, drag the application to your Applications folder to install. Then double-click the application icon to run it.

:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Flashing the System Image

1. **Select the Image File**

   Click the `Flash from file` button and select the system image file you downloaded and extracted earlier.

   <div style={{textAlign: 'center'}}>
     <img src="/en/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
   </div>

2. **Select the Target Device**

   Click the `Select target` button and choose the storage device where you want to install the system image.

   :::danger
   Be very careful to select the correct storage device! Etcher will format the selected device, which could result in data loss!

   You can unplug and replug your storage device to see which device appears/disappears from the list to help identify the correct one.
   :::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Select the storage device where you want to install the system image

② : Click `Select 1` to confirm your device selection

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. **Flash the System Image**

   Click the `Flash!` button and wait for the software to automatically write and verify the system image.

   <div style={{textAlign: 'center'}}>
     <img src="/en/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
   </div>

   <div style={{textAlign: 'center'}}>
     Waiting for system image to be written...
     <img src="/en/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
   </div>

   <div style={{textAlign: 'center'}}>
     Verifying the system image...
     <img src="/en/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
     After successfully writing the system image, close the Etcher software!
   </div>

## System Information

When using our provided system image for the first time, you'll need to log in with the default username and password we've set up.

- Debian Linux

Username: `radxa`

Password: `radxa`

## Booting the System

After completing the system image installation:

1. Remove the MicroSD card from the card reader
2. Insert the card into the MicroSD card slot on the ROCK 4D motherboard
3. Power on the system using a 5V Type-C power adapter

When the system boots, both the blue and green LED indicators will light up. After a few seconds, the green LED will stay solid and the blue LED will blink, indicating that the system has successfully booted.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/boot-sd.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
