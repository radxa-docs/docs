---
sidebar_position: 2
---

# Installing the system to a USB flash drive

This section mainly introduces how to install the system to a USB flash drive.

:::warning
The system installation will format the USB flash drive. Please back up any important data in advance!
:::

## Prerequisites

You need to prepare the following hardware devices in advance:

- USB flash drive

## Download the system image

You can visit the [Resource Download](../../download) page on your PC to download the system image file.

## Unzip the system image

The downloaded system image file is a compressed package and needs to be unzipped before use.

## Installing the System Image

Balena Etcher is an open-source image burning tool that is easy to use and powerful, supporting Windows, Mac, and Linux systems.

### Download Balena Etcher

Visit the Balena Etcher website (https://www.balena.io/etcher/) to download Balena Etcher.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Please download the appropriate software installation package based on your system platform and architecture.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Installing Balena Etcher

Once the download is complete, you can install it according to your system platform and architecture.

:::tip

- Windows

The downloaded file is an installation package in `*.exe` format. Double-click the program to run it.

- Linux

We recommend downloading the compressed file in `*.zip` format. After unzipping, double-click the program to run it.

- MacOS

Download the corresponding `*.dmg` file based on your system architecture. Double-click to open it, then drag the software to the Applications folder to install it. Once the installation is complete, double-click the application icon to run it.

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Using Balena Etcher

Use Balena Etcher to install the system image file onto a USB flash drive.

#### Hardware Connection

Insert the USB flash drive into the card reader, then connect the card reader to your PC.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Select the system image

Click the `Flash from file` option and select the system image file that you downloaded and unzipped in advance.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Select storage device

Click the `Select target` option and select the storage device corresponding to the system image you want to install.

:::danger
Please do not select the wrong storage device, otherwise Etcher will format the selected storage device, resulting in the loss of important data!

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
Wait for the system to finish writing.
  <img src="/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system verification to complete
  <img src="/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After successfully writing the system image, close the Etcher software!

## Modify grub settings

:::tip

Refer to the USB flash drive startup section in [Modify system startup disk boot options] (./boot_option).

:::

## Power on and start up
