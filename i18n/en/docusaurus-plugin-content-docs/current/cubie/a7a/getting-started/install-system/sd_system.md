---
sidebar_position: 1
---

# Install System to MicroSD Card

This guide explains how to install the operating system onto a MicroSD card.

:::warning
Installing the system will format the MicroSD card. Please back up any important data in advance!
:::

## Hardware Requirements

Prepare the following hardware in advance:

- Boot media: MicroSD card
- Card reader: MicroSD card reader

## Hardware Connection

1. Insert the MicroSD card into the card reader
2. Connect the card reader to a USB port on your PC

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Software Preparation

Use the open-source image flashing tool Etcher to write the system image to the MicroSD card.

### Download System Image

Go to the [Downloads](../../download) page to download and extract the system image file to your PC.

### Download Etcher

Download the appropriate version of Balena Etcher for your operating system from the official website: [balenaEtcher](https://etcher.balena.io).

<div style={{textAlign: 'center'}}>
<img src="/en/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Using Etcher

<div style={{textAlign: 'center'}}>
<img src="/en/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Using Etcher

After downloading, double-click to open the Etcher application.

:::tip

- **Windows**

  - The downloaded file will be an `*.exe` installer. Double-click to run the program.

- **Linux**

  - It's recommended to download the `*.zip` archive. After extraction, double-click the program to run it.

- **macOS**
  - Download the appropriate `*.dmg` file for your system architecture. After opening, drag the application to your Applications folder to install. Then double-click the app icon to run it.

:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Etcher installation instructions" />
</div>

## Installing the System Image

1. **Select the system image**
   - Click the `Flash from file` button
   - Choose the downloaded and extracted system image file

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Selecting system image in Etcher" />
</div>

2. **Select the target device**
   - Click the `Select target` button
   - Choose the disk device corresponding to your connected card reader

:::danger
Be extremely careful to select the correct disk! Etcher will format the selected disk, which could result in permanent data loss if you choose the wrong one!
:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Selecting target disk in Etcher" />
</div>

① Select the disk device where you want to install the system image

② Click `Select 1` to confirm your device selection

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Confirming disk selection in Etcher" />
</div>

3. **Write the system image**
   - Click the `Flash!` button
   - Wait for the software to write and verify the system image

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Starting the flash process in Etcher" />
</div>

<div style={{textAlign: 'center'}}>
  Writing system image...
  <img src="/en/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Writing system image progress" />
</div>

<div style={{textAlign: 'center'}}>
  Verifying system image...
  <img src="/en/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Verification in progress" />
</div>

4. After successfully writing the system image, close the Etcher application.

## System Information

When using our provided system image for the first time, you'll need to log in with the default credentials:

- **Username**: radxa
- **Password**: radxa
