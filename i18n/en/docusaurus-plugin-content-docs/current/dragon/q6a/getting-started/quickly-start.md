---
sidebar_position: 1
---

# Quick Start

This guide will help you get started with the Radxa Dragon Q6A board.

## Product Overview

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/dragon-q6a-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. |       View       | No. |    Side View    | No. |    Back View    |
| :-: | :--------------: | :-: | :-------------: | :-: | :-------------: |
|  ①  | Dragon Q6A Front |  ②  | Dragon Q6A Side |  ③  | Dragon Q6A Back |

## Prerequisites

Before you begin, please prepare the following hardware:

- Board: Radxa Dragon Q6A
- Power Supply: 12V Type-C Power Adapter (PD compatible)
- Boot Media: MicroSD Card (for system installation and booting)
- Display: HDMI cable and monitor
- Input Devices: Keyboard and mouse (for GUI operation)
- Debug Tool (Optional): USB to UART cable (for serial console access)

:::tip Recommended Accessories

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard 12V Type-C power adapter, 2A or higher recommended

:::

## System Installation

This section explains how to install the system on a MicroSD card.

:::warning Important Notice

**Installing the system will completely format your MicroSD card, and all data will be permanently deleted!**

Before proceeding, please confirm:

- There is no important data on the MicroSD card, or you have backed up all important data
- You have selected the correct storage device to avoid formatting other disks

:::

## Hardware Connection

Insert the MicroSD card into a card reader, then connect the card reader to your computer.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/sd-reader.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### Download System Image

Visit the [Resource Downloads](../download) page to download the **system image**.

:::tip Software Usage

The downloaded file is in `.img.xz` compressed format. You need to extract it to get the `.img` file before use.

:::

### Install System Image

Use Balena Etcher software to write the system image to the MicroSD card.

:::tip Balena Etcher

For Balena Etcher installation and usage instructions, please refer to the [Etcher Guide](/common/radxa-os/install-system/balena-etcher).

:::

#### Select System Image

Click the `Flash from file` button and select the extracted system image file.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-select-image.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### Select Storage Device

Click the `Select target` button and choose your MicroSD card device.

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

Click the `Flash!` button to begin writing the system image to the MicroSD card.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-flash.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  Waiting for system installation to complete
  <img
    src="/en/img/common/radxa-os/install-system/etcher-flashing.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  Waiting for system verification
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

## Booting the System

After completing the system installation, insert the MicroSD card into the Dragon Q6A's MicroSD card slot, then power on the Dragon Q6A using the 12V Type-C power adapter to boot the system.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/dragon-q6a-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Insert the MicroSD card

② : Connect the monitor to the board using an HDMI cable

③ : Power on the Dragon Q6A using the 12V Type-C power adapter

When the system boots normally, the power indicator will light up green and the status LED will blink blue.

## System Login

When you first start the system, you'll need to log in using the default credentials.

The default credentials for Radxa OS are as follows:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Using the System

After successfully booting the system, you can start using the Radxa system on your Dragon Q6A. For basic usage instructions, please refer to the [Using the System](./use-system.md) guide.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/dragon-q6a-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip Alternative Boot Methods
For users who want to boot the system using other methods (such as eMMC, UFS, or NVMe SSD), please refer to the following guides for installing the system on different boot media:

- [Install System to MicroSD Card](./install-system/sd-system.md)
- [Install System to USB Drive](./install-system/udisk-system.md)
- [Install System to UFS](./install-system/ufs-system/)
- [Install System to eMMC](./install-system/emmc-system/)
- [Install System to NVMe SSD](./install-system/nvme-system/)

Boot priority: USB > MicroSD > NVMe SSD > eMMC Module > UFS Module

:::
