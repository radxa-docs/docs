---
sidebar_position: 1
---

# Quick Start

This tutorial is designed to help you quickly get started with the Radxa Orion O6 product.

## Product Overview

| No. |           View            | No. |           View           | No. |           View           |
| :-: | :-----------------------: | :-: | :----------------------: | :-: | :----------------------: |
|  ①  | Radxa Orion O6 Front View |  ②  | Radxa Orion O6 Side View |  ③  | Radxa Orion O6 Rear View |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6/orion-o6-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

You will need the following hardware devices ready in advance:

- Mainboard: Radxa Orion O6
- Power Supply: 20V Type-C power adapter (recommended current 3A or higher)
- Boot Media: USB flash drive (for system installation and booting)
- Display: HDMI/DP cable and monitor
- Input Devices: Keyboard and mouse (for GUI operation)
- Debugging Tool (Optional): USB-to-Serial cable (for serial login)

:::tip Recommended Accessories

- [Radxa PD 65W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-65w)
- Standard 20V Type-C power adapter, 3A or higher current recommended
  :::

## Installing the System

This section mainly introduces how to install the system to a USB flash drive.

:::warning Important Notice

**Installing the system will completely format the USB drive, and all data will be permanently deleted!**

Please confirm before proceeding:

- There is no important data on the USB drive or you have backed up all data
- Select the correct storage device to avoid formatting other disks

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

Please visit the [Download Resources](../../download) page to download the **system image**.

:::tip Software Usage

The image file is in `.img.xz` compressed format. After downloading, you need to extract it to get the `.img` format image file before use.

:::

### Install System Image

Use Balena Etcher software to install the system image to the USB drive.

:::tip Balena Etcher
For installation and usage of Balena Etcher, please refer to the [Etcher Usage](/common/radxa-os/install-system/balena-etcher) tutorial.
:::

#### Select System Image

Click the `Flash from file` option and select the system image file you downloaded and extracted earlier.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-select-image-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### Select Storage Device

Click the `Select target` option and choose the USB drive device.

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

Click the `Flash!` option to start flashing the system image to the USB drive.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-flash-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  Waiting for system installation to complete
  <img
    src="/en/img/common/radxa-os/install-system/etcher-flashing-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  Waiting for system verification to complete
  <img
    src="/en/img/common/radxa-os/install-system/etcher-valid-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  After successfully installing the system image, close the Etcher software!
  <img
    src="/en/img/common/radxa-os/install-system/etcher-completed-udisk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Booting the System

After completing the system installation, insert the USB drive into the Radxa Orion O6's USB port, then power on the Radxa Orion O6 using the power adapter to boot the system.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6/orion-o6-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Insert USB drive

② : Connect the monitor to the mainboard using HDMI/DP cable

③ : Power on the Radxa Orion O6 with the power adapter

When the system boots normally, the power indicator will light up green and the status indicator will flash blue.

## Logging into the System

When you start the system for the first time, you need to log in using the default username and password.

The default credentials for Radxa OS are as follows:

| Item     | Content |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Using the System

After successfully logging in, you can proceed with system configuration and development on your Radxa Orion O6.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip Alternative Boot Methods
For users who want to boot the system in other ways (such as UFS, NVMe SSD), please refer to the following tutorials to complete the system installation on the corresponding boot media:

- [Install System to NVMe SSD](./install-system/nvme-system/)

:::
