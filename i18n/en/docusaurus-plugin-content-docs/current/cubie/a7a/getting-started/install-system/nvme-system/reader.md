---
sidebar_position: 2
---

# Using an M.2 NVMe SSD Enclosure

This guide explains how to use an M.2 NVMe SSD with an external SSD enclosure to install the system on the M.2 NVMe SSD.

:::warning
Installing the system will format the M.2 NVMe SSD. Please back up any important data before proceeding!

Booting from an M.2 NVMe SSD requires using it with a PCIe to M.2 M Key HAT expansion board.
:::

## Hardware Requirements

Prepare the following hardware in advance:

- Boot media: M.2 NVMe SSD
- SSD enclosure: M.2 NVMe SSD enclosure
- Expansion board: PCIe to M.2 M Key HAT

## Hardware Connection

Install the M.2 NVMe SSD into the SSD enclosure, then connect the enclosure to your PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/write-nvme.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Software Preparation

Use the open-source image flashing tool Etcher to write the system image to the M.2 NVMe SSD.

### Download System Image

Go to the [Downloads](../../../download) page to download and extract the system image file to your PC.

### Download Etcher

Download the appropriate version of Etcher for your operating system from the [balenaEtcher](https://etcher.balena.io) website.

<div style={{textAlign: 'center'}}>
<img src="/en/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Download the correct software package for your system platform and architecture.

<div style={{textAlign: 'center'}}>
<img src="/en/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Using Etcher

After downloading, double-click to open the Etcher application.

:::tip

- **Windows**
  The downloaded file is an `*.exe` installer. Double-click to run the program.

- **Linux**
  Download the `*.zip` archive, extract it, then double-click the program to run it.

- **macOS**
  Download the appropriate `*.dmg` file for your system architecture. After opening, drag the application to your Applications folder to install. Then double-click the app icon to run it.

:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Installing the System Image

1. **Select the system image**: Click the `Flash from file` button and choose the system image file you downloaded and extracted earlier.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. **Select the target device**: Click `Select target` and choose the disk device corresponding to your connected SSD enclosure.

:::danger
Be extremely careful to select the correct disk! Selecting the wrong disk will result in data loss as Etcher will format the selected disk.
:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Select the disk device where you want to install the system image

② : Click `Select 1` to confirm your device selection

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. **Start writing the system image**: Click the `Flash` button and wait for the software to automatically write and verify the system image.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
  Writing system image, please wait...
  <img src="/en/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
  Verifying system image, please wait...
  <img src="/en/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

4. After successfully writing the system image, close the Etcher software!

## System Information

When using our provided system image for the first time, you'll need to log in with the following default credentials:

- **Username**: radxa
- **Password**: radxa
