---
sidebar_position: 1
---

# Using an M.2 M Key NVMe Solid State Drive Enclosure

This section mainly describes how to use an M.2 M Key NVMe solid state drive enclosure to burn a system image to an M.2 M Key 2230 NVMe SSD.

:::warning
Installing the system will format the NVMe SSD. Please back up any important data in advance!
:::

## Prerequisites

You need to prepare the following hardware devices in advance:

- M.2 M Key NVMe solid state drive enclosure
- System boot media: M.2 M Key 2230 NVMe SSD

## Download the system image

You can access the [Resource Download](../../../download) page on your PC to download the system image file.

## Unzip the system image

The downloaded system image file is a compressed package and needs to be unzipped before use.

## Installing the System Image

Balena Etcher is an open-source image burning tool that is easy to use and powerful, supporting Windows, Mac, and Linux systems.

### Download Balena Etcher

Visit the Balena Etcher website (https://www.balena.io/etcher/) to download Balena Etcher.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Please download the software installation package corresponding to your system platform and architecture.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Installing Balena Etcher

Once the download is complete, you can install it according to your system platform and architecture.

:::tip

- Windows

The downloaded file is an installation package in `*.exe` format. Double-click the program to run it.

- Linux

We recommend downloading the compressed package in `*.zip` format. After unzipping, double-click the program to run it.

- MacOS

Download the corresponding `*.dmg` file based on your system architecture. After double-clicking to open it, drag the software to the Applications folder to install it. After installation, double-click the application icon to run it.

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Using Balena Etcher

Use Balena Etcher to install the system image file onto a MicroSD card.

#### Hardware Connection

Install the M.2 M Key NVMe SSD into the M.2 M Key NVMe SSD enclosure, then connect the M.2 M Key NVMe SSD enclosure to the PC.

#### Select System Image

Click the `Flash from file` option and select the system image file you have previously downloaded and extracted.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Select storage device

Click the `Select target` option and select the storage device corresponding to the system image you want to install.

:::danger
Please do not select the wrong storage device, otherwise Etcher will format the selected storage device, causing important data loss!

You can plug and unplug storage devices to observe changes in the available storage devices, thereby further determining the storage device to be installed.
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Select the storage device on which you want to install the system image.

② : Click the `Select 1` option to confirm your device selection.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Install the system image

Click the `Flash` option and wait for the software to automatically install and verify the system image.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Wait for the system to finish writing
  <img src="/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system verification to complete
  <img src="/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After successfully writing the system image, close the Etcher software!

## Modify grub settings

:::tip

Refer to the NVMe boot section in [Modify system boot disk boot options](../boot_option)

:::

## Power on and boot
