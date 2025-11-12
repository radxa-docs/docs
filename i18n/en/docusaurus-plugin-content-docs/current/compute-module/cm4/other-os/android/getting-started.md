---
sidebar_position: 2
---

# Getting Started

The purpose of this tutorial is to help everyone quickly get started with the Radxa CM4 Android system.

## Product Overview

We use CM4 with CM4 IO board for the quick start demonstration.

<div style={{textAlign: 'center'}}>
   CM4 with CM4 IO Board - Front
   <img src="/en/img/cm4/cm4_comb_top.webp" style={{width: '100%', maxWidth: '1200px'}} />
   CM4 with CM4 IO Board - Back
   <img src="/en/img/cm4/cm4_base_bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

You need to prepare the following hardware devices in advance:

- Board: Radxa CM4 with CM4 IO board
- System boot medium: MicroSD card
- Power supply: Standard DC 12V/2A power adapter (DC-5525 interface)
- Display device: Monitor and HDMI cable
- Input devices: Keyboard and mouse (for GUI operation)
- Debugging tool: USB serial data cable (for serial login)

:::tip Recommended Accessories
The Radxa CM4 IO board only supports 12V power input. It is recommended to use 2A or higher current to ensure stable operation of all peripherals.

- [Radxa DC12 36W Power Adapter](https://radxa.com/products/accessories/power-dc12-36w)(recommended)
- [Radxa DC12 60W Power Adapter](https://radxa.com/products/accessories/power-dc12-60w)
  :::

## Install System

Mainly introduces installing the system to MicroSD card.

:::warning Important Notice

**Installing the system will completely format the MicroSD card, and all data will be permanently deleted!**

Please confirm before operation:

- The MicroSD card contains no important data or data backup has been completed
- Select the correct storage device to avoid formatting other disks

:::

### Hardware Connection

Insert the MicroSD card into the MicroSD card reader, then insert the MicroSD card reader into the computer.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/sd-reader.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### Download System Image

Please visit the [Resources Download](../../download) page to download the **Android system image**.

:::tip Software Usage

The image file is a compressed package in `.img.xz` format. After downloading, it needs to be decompressed first to get the `.img` format image file before use.

:::

### Write System Image

Using Balena Etcher software, you can install the system image to the MicroSD card.

:::tip Balena Etcher

For the installation and use of Balena Etcher, you can refer to the [Etcher Usage](/common/radxa-os/install-system/balena-etcher) tutorial.

:::

#### Select System Image

Click the `Flash from file` option and select the system image file you downloaded and decompressed in advance.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-select-image.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### Select Storage Device

Click the `Select target` option and select the MicroSD card device.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-select-sd-01.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-select-sd-02.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### Start Flashing

Click the `Flash!` option to start flashing the system image to the MicroSD card.

<div style={{ textAlign: "center" }}>
  Wait for system installation to complete
  <img
    src="/en/img/common/radxa-os/install-system/etcher-flashing.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  Wait for system verification to complete
  <img
    src="/en/img/common/radxa-os/install-system/etcher-valid.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  After successfully installing the system image, close the Etcher software!
  <img
    src="/en/img/common/radxa-os/install-system/etcher-completed.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Boot System

After completing the system write, install the MicroSD card into the MicroSD card slot of the CM4 IO board, then use the 12V DC power adapter to power the CM4, and the system will start.
