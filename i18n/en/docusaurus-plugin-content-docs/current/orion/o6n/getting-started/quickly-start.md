---
sidebar_position: 1
---

# Quick Start

This tutorial is designed to help you quickly get started with the Radxa Orion O6N products.

## Product Overview

| No. |            View            | No. |           View            | No. |           View            |
| :-: | :------------------------: | :-: | :-----------------------: | :-: | :-----------------------: |
|  ①  | Radxa Orion O6N Front View |  ②  | Radxa Orion O6N Side View |  ③  | Radxa Orion O6N Rear View |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

You will need to prepare the following hardware devices in advance:

- Motherboard: Radxa Orion O6N
- Power Supply: Power adapter
- System Boot Media: USB flash drive (for OS installation and booting)
- Display: HDMI/DP cable and monitor
- Input Devices: Keyboard and mouse (for GUI operation)
- Debugging Tool (Optional): USB-to-Serial cable (for serial console login)

:::tip Recommended Accessories

- [Radxa DC 36W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-dc12-36w)
- [Radxa DC 60W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-dc12-60w)
- Standard 12V DC5525 power adapter, 3A or higher current recommended

:::

## Installing the Operating System

This section explains how to install the operating system to a USB flash drive.

:::warning Important Notice

**Installing the OS will completely format the USB drive, and all data will be permanently deleted!**

Before proceeding, please confirm:

- There is no important data on the USB drive or you have backed up all important data
- You have selected the correct storage device to avoid formatting other disks

:::

### Hardware Connection

Insert the USB flash drive into your computer's USB port.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/u-disk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### Download System Image

Please visit the [Downloads](../../download) page to download the **System Image**.

:::tip Software Usage

The image file is in `.img.xz` compressed format. After downloading, you need to extract it to get the `.img` image file before use.

:::

### Install System Image

You can use Balena Etcher software to install the system image to your USB flash drive.

:::tip Balena Etcher
For the installation and usage of Balena Etcher, you can refer to the [Etcher Usage](/common/radxa-os/install-system/balena-etcher) tutorial.
:::

#### Select System Image

Click the `Flash from file` option and select the system image file you have downloaded and extracted in advance.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-select-image-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### Select Storage Device

Click the `Select target` option and choose the USB flash drive device.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-select-udisk-01.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-select-udisk-02.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### Start Flashing

Click the `Flash!` button to begin installing the system image to the USB flash drive.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-flash-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  Installing system, please wait...
  <img
    src="/en/img/common/radxa-os/install-system/etcher-flashing-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  Verifying installation, please wait...
  <img
    src="/en/img/common/radxa-os/install-system/etcher-valid-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  System image has been successfully installed! Please close Etcher.
  <img
    src="/en/img/common/radxa-os/install-system/etcher-completed-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Booting the System

After completing the system installation, insert the USB flash drive into the Radxa Orion O6N's USB port, then power on the device using a 12V DC power adapter to boot the system.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Installation USB flash drive

② : Connect the monitor to the motherboard using an HDMI/DP cable

③ : Power on the Radxa Orion O6N using the power adapter

When the system boots normally, the power indicator will light up green, and the status indicator will flash blue.

## System Login

When you start the system for the first time, you'll need to log in using the default username and password.

Default credentials for Radxa OS:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Using the System

After successfully logging in, you can proceed with system configuration and development on your Radxa Orion O6N.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip Alternative Boot Methods
For users who want to boot the system using other methods (such as UFS or NVMe SSD), please refer to the following tutorials for installation:

- [Install System to UFS](./install-system/ufs-system/)
- [Install System to NVMe SSD](./install-system/nvme-system/)

:::
