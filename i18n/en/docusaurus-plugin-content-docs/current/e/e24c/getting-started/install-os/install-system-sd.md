---
sidebar_position: 1
---

# Installing System to MicroSD Card

## 1. System Download

Go to the [Resource Download Summary](../../download) page to download the corresponding operating system image package. After downloading, extract the system image package. The `*.img` file is the image file needed for system installation.

:::tip
The downloaded system image is a compressed file that needs to be extracted before it can be written to the SD card using the image burning software.
:::

## 2. Hardware Connection

Insert the MicroSD card into the card reader, then plug the card reader into the PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-sd-insert.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## 3. Image Burning Tool

We recommend using the open-source Etcher image burning tool developed by Radxa's partner Balena. This software is simple to use, powerful, and supports Windows/Linux/macOS systems.

### 3.1 Using Etcher

Go to the official website to download the software for your system: [balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

After entering the download page, select the corresponding system platform to download the Etcher software.

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

:::tip
Windows and Linux users can just open the corresponding program to use it, no installation required!
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-down-etcher-00.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

### 3.2 Installing System Image

- Select System Image for Motherboard

Click the `Flash from file` option and select the system image file you downloaded and extracted earlier.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Select MicroSD Card Disk

Click the `Select target` option and select the disk device corresponding to the card reader connected to your PC.

:::danger
Do not select the wrong disk, otherwise Etcher will format the selected disk, causing important data loss!
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

①: Select the disk device for installing the system image

②: Click the `Select 1` option to confirm the device selection

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Start Writing System Image

Click the `Flash` option and wait for the software to automatically write and verify the system image.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-04.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system write to complete
  <img src="/img/e/e24c/etcher-05.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system verification to complete
  <img src="/img/e/e24c/etcher-07.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

After successfully writing the system image, close the Etcher software!

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-06.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## 4. Starting the System

After completing the system image write to the MicroSD card, insert the MicroSD card from the card reader into the MicroSD card slot of Radxa E24C, then start the system using the 12V DC power adapter.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-insert-sd.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## 5. System Information

We provide two major operating systems: Debian Linux and OpenWrt. Users should use the corresponding username and password for their chosen system.

- Debian Linux

Username: radxa

Password: radxa

- OpenWrt

Username: root

Password: password
