---
sidebar_position: 1
---

# Quick Start

This tutorial helps you get up and running with the Cubie A7Z Android system as quickly as possible.

# Hardware Overview

<div style={{textAlign: 'center'}}>
   Cubie A7Z front
   <img src="/en/img/cubie/a7z/a7z-bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
   Cubie A7Z back
   <img src="/en/img/cubie/a7z/a7z-top.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Requirements

Prepare the following hardware:

- Board: Radxa Cubie A7Z
- Boot media: MicroSD card
- Card reader: MicroSD card reader
- Power adapter: 5 V Type‑C adapter

:::tip Recommended accessory

- [Radxa 30 W PD Power Adapter (recommended)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## Hardware Setup

Insert the MicroSD card into the reader, then plug the reader into the PC’s USB port.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Software Preparation

Use Allwinner’s Phoenix tool to flash the Android image to the MicroSD card. Download it from the [Resources download page](../../download).

**PhoenixCard**: Windows utility for creating bootable MicroSD cards.

## Install the System

Unzip PhoenixCard, open the directory, and run `PhoenixCard.exe` as Administrator.

1. Click **Image** and select the extracted firmware file.

2. Choose **Start up** to build a bootable card.

3. Select the drive letter of the MicroSD card.

4. Click **Burn** to write the image.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-phoenixcard-windows.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After the burn completes, close PhoenixCard and insert the MicroSD card into the Cubie A7Z to boot Android.

## Boot the System

After flashing, insert the MicroSD card into the Cubie A7Z slot and connect a 5 V USB‑C power adapter to boot Android.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a7z/a7z-microsd-boot.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
