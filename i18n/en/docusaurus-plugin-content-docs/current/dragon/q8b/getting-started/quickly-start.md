---
sidebar_position: 1
---

# Quick Start

This guide helps you quickly get started with the Radxa Dragon Q8B.

## Product Overview

| No. |       View       | No. |      View       | No. |      View       |
| :-: | :--------------: | :-: | :-------------: | :-: | :-------------: |
|  ①  | Dragon Q8B Front |  ②  | Dragon Q8B Side |  ③  | Dragon Q8B Rear |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q8b/dragon-q8b-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

Prepare the following hardware before use:

- Board: Radxa Dragon Q8B
- Power: 20V Type-C power adapter (PD compatible)
- System boot media: microSD card (for installing and booting the system)
- Display device: HDMI or dual-ended USB-C cable and monitor
- Input devices: keyboard and mouse (for GUI operation)
- Debug tool (optional): USB-to-serial cable (for serial login)

:::tip Recommended Accessories

- [Radxa PD 65W Power Adapter (recommended)](https://radxa.com/products/accessories/power-pd-65w)
- Standard 20V Type-C power adapter; 3A or higher is recommended

:::

## System Installation

This section mainly introduces how to install the system to a microSD card.

:::warning Important Notice

**Installing the system completely formats the microSD card, and all data will be permanently deleted!**

Before proceeding, confirm that:

- There is no important data on the microSD card, or the data has been backed up
- The correct storage device is selected to avoid formatting another disk

:::

## Hardware Connection

Insert the microSD card into a microSD card reader, then connect the card reader to your computer.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/sd-reader.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### Download System Image

Visit the [Resource Downloads](../download) page and download a **system image**.

:::tip Software Usage

The image file is a compressed `.img.xz` archive. After downloading it, extract it first to obtain a `.img` image file.

:::

### Install System Image

Use Balena Etcher to install the system image to the microSD card.

:::tip Balena Etcher

For Balena Etcher installation and usage, refer to [Etcher Usage](/common/radxa-os/install-system/balena-etcher) guide.

:::

#### Select the System Image

Click `Flash from file` and select the system image file that you downloaded and extracted.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-select-image.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### Select the Storage Device

Click `Select target` and select the microSD card device.

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

Click `Flash!` to start flashing the system image to the microSD card.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-flash.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  Wait for the system installation to complete
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
  After the system image is installed successfully, close Etcher!
  <img
    src="/en/img/common/radxa-os/install-system/etcher-completed.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Booting the System

After installing the system, insert the microSD card into the Dragon Q8B microSD card slot, then power the Dragon Q8B with a 20V Type-C power adapter to boot the system.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q8b/dragon-q8b-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

1. Install the microSD card

2. Connect the monitor and board using HDMI or a dual-ended USB-C cable

3. Power the Dragon Q8B with a 20V Type-C power adapter

After the system boots normally, the power LED turns green and the status LED blinks blue.

## System Login

When you boot the system for the first time, log in with the default username and password.

The default credentials for Radxa OS are:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Using the System

After the system boots successfully, you can start using Radxa OS on the Dragon Q8B. For basic Radxa OS usage, refer to [Using the System](./use-system.md) guide.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q8b/dragon-q8b-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip Other Boot Methods
For users who want to boot the system from other media, such as eMMC, UFS, or NVMe SSD, refer to the guides below to install the system to the corresponding boot media:

- [Install System to MicroSD Card](./install-system/sd-system.md)
- [Install System to USB Drive](./install-system/udisk-system.md)
- [Install System to UFS](./install-system/ufs-system/)
- [Install System to NVMe SSD](./install-system/nvme-system/)

System boot priority: USB > microSD > NVMe SSD > UFS module

:::

## Update the System

We recommend using the `Rsetup` tool to update the system.

:::tip
Using the `Rsetup` tool is a safer way to update the system.

Using `sudo apt update && sudo apt upgrade` to upgrade the system may result in incomplete updates or system issues.

For `Rsetup` usage, refer to:

- [Rsetup Tool](../system-config/rsetup.md)
  :::

### Rsetup Tool

Open a terminal and run `sudo rsetup` to open the `Rsetup` tool:

<NewCodeBlock tip={`radxa@${props?.board ?? 'device'}$`} type="device">

```bash
sudo rsetup
```

</NewCodeBlock>

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/rsetup-system.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### Update the System

After entering the `Rsetup` tool, select `System` -> `System Update`, then follow the prompts to complete the system update.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/rsetup-system-update.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>
