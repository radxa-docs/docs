---
sidebar_position: 2
---

# Quick Start

This tutorial is designed to help you quickly get started with the Android system on the Radxa ROCK 4D.

## Product Overview

<div style={{textAlign: 'center'}}>
   ROCK 4D Front View
   <img src="/en/img/rock4/4d/rock4d-top.webp" style={{width: '50%', maxWidth: '1200px'}} />
   ROCK 4D Back View
    <img src="/en/img/rock4/4d/rock4d-bottom.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

## Prerequisites

You will need the following hardware:

- Board: Radxa ROCK 4D
- Boot media: MicroSD card
- Power supply: 5V Type-C power adapter
- Display: Monitor and HDMI cable
- Input devices: Keyboard and mouse (for GUI operation)
- Debugging tool: USB-to-TTL serial cable (for serial console access)

:::tip Recommended Accessories

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard Type-C power adapter (5V input, PD protocol supported, recommended current ≥3A)
  :::

## System Installation

This section explains how to install the system on a MicroSD card.

:::warning Important Notice

**Installing the system will completely format your MicroSD card, and all data will be permanently deleted!**

Before proceeding, please ensure:

- There is no important data on the MicroSD card or you have backed up all important data
- You have selected the correct storage device to avoid formatting the wrong disk

:::

### Hardware Connection

Insert the MicroSD card into a card reader, then connect the card reader to your computer.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/sd-reader.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### Download System Image

Visit the [Downloads](../../download) page to download the **system image**.

:::tip Software Usage

The downloaded file is in `.img.xz` compressed format. You need to extract it first to get the `.img` image file before use.

:::

### Write System Image

Use Balena Etcher to write the system image to the MicroSD card.

:::tip Balena Etcher

For installation and usage of Balena Etcher, please refer to the [Etcher Guide](/common/radxa-os/install-system/balena-etcher).

:::

#### Select System Image

Click the `Flash from file` button and select the downloaded and extracted system image file.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-select-image.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### Select Storage Device

Click `Select target` and choose your MicroSD card.

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
  After successfully installing the system image, close the Etcher software!
  <img
    src="/en/img/common/radxa-os/install-system/etcher-completed.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Booting the System

After completing the system write, insert the MicroSD card into the ROCK 4D's MicroSD card slot, then power on the ROCK 4D using a 5V Type-C power adapter to boot the system.
