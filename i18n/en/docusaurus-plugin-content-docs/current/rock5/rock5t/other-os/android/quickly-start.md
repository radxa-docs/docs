---
sidebar_position: 1
---

# Quick Start

This guide helps you get started quickly with Android on ROCK 5T.

## Prerequisites

Prepare the following hardware:

- Board: Radxa ROCK 5T
- Boot media: microSD card
- Power supply: DC 12V/2A power adapter (DC-5525)
- Display: monitor and HDMI cable
- Input devices: keyboard and mouse (for GUI operation)

:::tip Recommended accessories
Radxa ROCK 5T supports 12V power input. A power adapter rated at 2A or higher is recommended to ensure stable operation of all peripherals.

- [Radxa DC12 36W Power Adapter](https://radxa.com/products/accessories/power-dc12-36w) (recommended)
- [Radxa DC12 60W Power Adapter](https://radxa.com/products/accessories/power-dc12-60w)

:::

## Install the OS

This section describes how to flash the OS image to a microSD card.

:::warning Important

**Flashing the OS will completely format the microSD card and permanently erase all data on it.**

Before you begin, make sure:

- The microSD card contains no important data, or you have already backed it up
- You have selected the correct storage device to avoid formatting other disks

:::

### Hardware setup

Insert the microSD card into a card reader, then plug the card reader into your computer.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/sd-reader.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### Download the OS image

Go to the [Downloads](../../download) page and download the **Android OS image**.

:::tip Notes

The downloaded image is a compressed `.img.xz` file. You must extract it to obtain a `.img` file before flashing.

:::

### Flash the OS image

You can use Balena Etcher to flash the OS image to the microSD card.

:::tip Balena Etcher

For how to install and use Balena Etcher, refer to [Using Etcher](/common/radxa-os/install-system/balena-etcher).

:::

#### Select the image

Click `Flash from file` and select the OS image file you downloaded and extracted.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-select-image.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### Select the target device

Click `Select target` and choose the microSD card.

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

#### Start flashing

Click `Flash!` to start flashing the OS image to the microSD card.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/install-system/etcher-flash.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  Wait for flashing to complete
  <img
    src="/en/img/common/radxa-os/install-system/etcher-flashing.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  Wait for validation to complete
  <img
    src="/en/img/common/radxa-os/install-system/etcher-valid.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  After flashing succeeds, close Etcher.
  <img
    src="/en/img/common/radxa-os/install-system/etcher-completed.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Boot

After flashing, insert the microSD card into the ROCK 5T microSD card slot, then power the board with a 12V DC power adapter to boot the system.
