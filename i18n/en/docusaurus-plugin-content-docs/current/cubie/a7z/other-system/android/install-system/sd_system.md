---
sidebar_position: 1
---

# Install System to MicroSD Card

This section explains how to deploy the Android system onto a MicroSD card.

:::warning
Flashing the image will format the MicroSD card. Back up any important data in advance!
:::

## Hardware Checklist

Prepare the following items:

- Board: Radxa Cubie A7Z
- Boot media: MicroSD card
- Card reader: MicroSD card reader
- Power supply: 5 V USB Type‑C adapter

:::tip Recommended accessory

- [Radxa 30 W PD Power Adapter (recommended)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## Power Notes

Cubie A7Z accepts PD-compliant 5 V input; use an adapter capable of at least 3 A to keep peripherals stable.

- **Power adapter**: Once the image has been written to the MicroSD card, power the board via a USB‑C adapter to avoid power shortages during development.

## Connect the Hardware

Insert the MicroSD card into the reader, then plug the reader into your PC.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Software Preparation

You need Allwinner’s Phoenix utilities to flash the Phoenix-format Android image to the MicroSD card. Download them from the [Resources download page](../../../download).

**PhoenixCard**: Windows utility for creating bootable MicroSD cards.

## Flash the System

Unzip PhoenixCard, open the directory, and run `PhoenixCard.exe` as Administrator.

1. Choose **Image** and select the decompressed system image file.
2. Set the card type to **Start up** to build a bootable card.
3. Tick the drive letter that corresponds to your MicroSD card.
4. Click **Burn** to start writing.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-phoenixcard-windows.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Wait for PhoenixCard to finish, then close the tool.
