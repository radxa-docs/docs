---
sidebar_position: 1
---

# Installing the Operating System to a MicroSD Card

## Download the System Image

Go to the [Downloads Summary](../../download) page to download the corresponding operating system image archive. After downloading, extract the archive to get the `*.img` file needed for system installation.

:::tip
The downloaded system image is a compressed file that needs to be extracted before it can be written to the SD card using imaging software.
:::

## Hardware Connection

Insert the MicroSD card into a card reader, then connect the card reader to your PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-sd-insert.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## Image Flashing Tool

We recommend using Etcher, an open-source image flashing tool developed by Balena, Radxa's partner. This software is user-friendly, powerful, and supports Windows, Linux, and macOS.

### Using Etcher

Download the software for your operating system from the official website: [balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

On the download page, select the appropriate platform to download the Etcher software.

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

:::tip
For Windows and Linux, simply run the downloaded executable—no installation required!
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-down-etcher-00.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

### Installing the System Image

- Select the system image corresponding to your board

Click on the `Flash from file` option and select the system image file you downloaded and extracted earlier.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Select the target MicroSD card

Click on the `Select target` option and choose the disk device corresponding to your card reader connected to the PC.

:::danger
Be careful not to select the wrong disk, as Etcher will format the selected disk, potentially causing data loss!
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

①: Select the disk device where you want to install the system image

②: Click the `Select 1` option to confirm your device selection

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Start writing the system image

Click the `Flash` option and wait for the software to automatically write and verify the system image.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-04.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system image to finish writing
  <img src="/img/e/e24c/etcher-05.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for verification to complete
  <img src="/img/e/e24c/etcher-07.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

After successfully writing the system image, close the Etcher software!

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-06.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## Booting the System

After completing the system image writing to the MicroSD card, you can insert the MicroSD card from the card reader into the Radxa E24C's MicroSD card slot, then power on the system using a 12V DC power adapter.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-insert-sd.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## System Information

We provide two major operating systems: Debian Linux and OpenWrt. Users should use the corresponding username and password to log in based on their system.

- Debian Linux

Username: radxa

Password: radxa

- OpenWrt

Username: root

Password: password
