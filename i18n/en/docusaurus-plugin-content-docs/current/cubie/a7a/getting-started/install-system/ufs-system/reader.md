---
sidebar_position: 2
---

# Using Radxa eMMC/UFS Combo Module Reader

This guide explains how to use the Radxa eMMC/UFS Combo Module Reader to install the system onto a UFS module.

:::warning
Installing the system will format the UFS module. Please back up any important data before proceeding!
:::

## Hardware Requirements

Prepare the following hardware in advance:

- Boot media: UFS module
- Card reader: eMMC/UFS combo module reader

:::tip Recommended Accessories

- [Radxa UFS Module](https://radxa.com/products/accessories/ufs-module)
- [Radxa eMMC/UFS Combo Module Reader](https://radxa.com/products/accessories/emmc-ufs-module-reader)
  :::

## Hardware Connection

Install the UFS module into the reader, then connect the reader to a USB port on your PC.

:::caution

### UFS Module Installation Steps:

1. Ensure the notch on the UFS module aligns with the notch on the reader
2. Align the bottom edge connector of the UFS module with the reader's interface
3. Gently press down on one end of the UFS module until you hear a "click" sound, then repeat the process for the other end to ensure the module is properly seated.
   :::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-ufs-reader.webp" style={{width: '100%', maxWidth: '1200px'}} alt="UFS module installation with reader" />
</div>

## Software Preparation

Use the open-source image flashing tool Etcher to write the system image to the UFS module.

### Download System Image

Go to the [Downloads](../../../download) page to download and extract the system image file to your PC.

### Download Etcher

Download Etcher for your operating system from the official Balena Etcher website: [balenaEtcher](https://etcher.balena.io).

<div style={{textAlign: 'center'}}>
<img src="/en/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Balena Etcher download page" />
</div>

Download the appropriate software package for your system platform and architecture.

<div style={{textAlign: 'center'}}>
<img src="/en/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Balena Etcher download options" />
</div>

### Using Etcher

After downloading, double-click to open the Etcher application.

:::tip

- **Windows**
  The downloaded file is an `*.exe` installer. Double-click to run the program.

- **Linux**
  Download the `*.zip` archive, extract it, and run the program by double-clicking.

- **macOS**
  Download the appropriate `*.dmg` file for your system architecture. After opening, drag the application to your Applications folder to install. Then double-click the app icon to run it.

:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Balena Etcher interface" />
</div>

### Installing the System Image

1. **Select the system image**: Click the `Flash from file` button and choose the downloaded and extracted system image file.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Selecting system image in Etcher" />
</div>

2. **Select the target device**: Click `Select target` and choose the disk device corresponding to your connected reader.

:::danger
Be extremely careful to select the correct disk! Selecting the wrong disk will result in data loss as Etcher will format the selected disk.
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Selecting target disk in Etcher" />
</div>

① : Select the disk device where you want to install the system image

② : Click `Select 1` to confirm your device selection

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Confirming device selection in Etcher" />
</div>

3. **Start writing the system image**: Click the `Flash` button and wait for the software to automatically write and verify the system image.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Starting flash process in Etcher" />
</div>

<div style={{textAlign: 'center'}}>
  Writing system image...
  <img src="/en/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Writing system image progress" />
</div>

<div style={{textAlign: 'center'}}>
  Verifying system image...
  <img src="/en/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Verifying system image progress" />
</div>

4. After successfully writing the system image, close the Etcher software!

## System Information

When using our provided system image for the first time, you'll need to log in with the following default credentials:

- **Username**: radxa
- **Password**: radxa
