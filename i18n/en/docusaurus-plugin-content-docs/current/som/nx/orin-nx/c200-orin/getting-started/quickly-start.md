---
sidebar_position: 1
---

# Quick Start

This tutorial is designed to help you get started quickly with the Radxa C200 Orin Development Kit.

:::tip Note

The Radxa C200 Orin Development Kit comes pre-installed with Radxa's BIOS firmware, supporting system boot from USB drives or NVMe SSDs.

This quick start guide only covers installing the system to a USB drive. For other boot media or installation methods, please refer to the [System Installation](./install-system/) tutorial.
:::

## Product Overview

|             Product             | No. |   View   | No. |   View    | No. |   View    |
| :-----------------------------: | :-: | :------: | :-: | :-------: | :-: | :-------: |
| Radxa C200 Orin Development Kit |  ①  | Top View |  ②  | Side View |  ③  | Rear View |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/c200/radxa-c200-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

You will need to prepare the following hardware in advance:

- Radxa C200 Orin Development Kit
- Power supply: Power adapter
- System boot media: USB drive (minimum 16GB capacity for system installation and booting)
- Display: DP cable and monitor
- Input devices: Keyboard and mouse (for GUI operation)

:::tip Recommended Accessories

- [Radxa DC 60W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-dc12-60w)
- DC power adapter supporting 9-20V input, recommended power 40W or above

:::

## System Installation

This section mainly introduces how to install the system to a USB drive.

:::warning Important Notice

**Installing the system will completely format the USB drive, and all data will be permanently deleted!**

Before proceeding, please confirm:

- The USB drive contains no important data or you have backed up all data
- You have selected the correct storage device to avoid formatting the wrong disk

:::

### Hardware Connection

Insert the USB drive into your computer's USB port.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/u-disk.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### Download System Image

Visit the [Resource Downloads](../download) page to download the **System Image**.

:::tip Software Usage

The image file is in `.img.xz` compressed format. After downloading, you need to extract it to get the `.img` format image file before use.

:::

### Install System Image

Use Balena Etcher software to write the system image to the USB drive.

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

Click the `Select target` option and choose your USB drive.

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

Click the `Flash!` option to start writing the system image to the USB drive.

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

After completing the system installation, insert the USB drive into the USB port of the Radxa C200 Orin Development Kit, then power on the device using the power adapter to boot the system.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/c200/hardware-connection-boot.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Insert the USB drive

② : Connect the monitor to the board using a DP cable

③ : Power on the Radxa C200 Orin Development Kit using the power adapter

After the system boots successfully, the power indicator will light up green.

## System Login

After booting the system, you need to complete the initial system configuration following the on-screen prompts.

## Using the System

After successfully logging in, you can proceed with system configuration and development on the Radxa C200 Orin Development Kit.
