---
sidebar_position: 2
---

# Using Radxa eMMC/UFS Combo Module Reader

This guide explains how to use the Radxa eMMC/UFS combo module reader to install the system onto an eMMC module.

:::warning
Installing the system will format the eMMC module. Please back up any important data in advance!
:::

## Hardware Requirements

Prepare the following hardware in advance:

- Boot media: eMMC module
- Card reader: eMMC/UFS combo module reader

:::tip Recommended Accessories

- [Radxa eMMC Module](https://radxa.com/products/accessories/emmc-module)
- [Radxa eMMC/UFS Combo Module Reader](https://radxa.com/products/accessories/emmc-ufs-module-reader)
  :::

## Hardware Connection

Install the eMMC module into the reader, then connect the reader to a USB port on your PC.

:::caution

### eMMC Module Installation Steps:

1. Ensure the notch on the eMMC module aligns with the notch on the reader
2. Align the bottom edge connector of the eMMC module with the reader's interface
3. Gently press down on one end of the eMMC module until you hear a "click" sound, then repeat the process for the other end to ensure the module is properly seated.
   :::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-emmc-reader.webp" style={{width: '100%', maxWidth: '1200px'}} alt="eMMC module installation with reader" />
</div>

## Software Preparation

Use the open-source image flashing tool Etcher to write the system image to the eMMC module.

### Download System Image

Go to the [Downloads](../../../download) page to download and extract the system image file to your PC.

### Download Etcher

Download the appropriate version of Balena Etcher for your operating system from the official website: [balenaEtcher](https://etcher.balena.io).

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Balena Etcher download page" />
</div>

Download the software package that matches your system platform and architecture.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Etcher download options" />
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

When using our provided system image for the first time, you'll need to log in with the following default credentials:

- **Username**: radxa
- **Password**: radxa
