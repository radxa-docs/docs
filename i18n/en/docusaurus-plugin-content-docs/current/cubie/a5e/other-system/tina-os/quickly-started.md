---
sidebar_position: 2
---

# Quick Start

This tutorial is designed to help you quickly get started with the Tina Linux system on the Cubie A5E.

## Product Overview

| No. |      View       | No. |      View      | No. |      View      |
| :-: | :-------------: | :-: | :------------: | :-: | :------------: |
|  ①  | Cubie A5E Front |  ②  | Cubie A5E Back |  ③  | Cubie A5E Side |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a5e/cubie_a5e_view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

### Hardware Requirements

You will need to prepare the following hardware devices in advance:

- Board: Radxa Cubie A5E
- Power Supply: 5V Type-C Power Adapter
- System Boot Media: MicroSD Card (for system installation and booting)
- Display: HDMI Cable and Monitor (for graphical interface)
- Input Devices: Keyboard and Mouse (for GUI operation)
- Debugging Tools (Optional): USB-to-Serial Cable (for serial login) and USB-A Hub (for expanding USB peripherals)

It is recommended to use the Cubie A5E with a monitor, keyboard, and mouse.

:::tip Recommended Accessories
The Cubie A5E board is compatible with PD protocol 5V Type-C power input. A power supply of 3A or higher is recommended to ensure stable operation of all peripherals.

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## Get System Image

Please visit the [Resource Downloads](../../download#tina-linux) page to get the Tina Linux system image.

**Image Type Selection**

- **GPT Image (Recommended for beginners)**: Suitable for MicroSD cards and NVMe SSDs, installed using Balena Etcher tool
- **FEL Image (Advanced)**: Suitable for eMMC installation, flashed using Phoenix tools

## Install System

You can refer to the following general installation tutorials:

**GPT Image Installation**

- [Install System to MicroSD Card](../../getting-started/quickly-started#install-system) (Recommended for new users)
- [Install System to NVMe SSD](../../getting-started/install-system/nvme-system)

**FEL Image Installation**

- [Install System to eMMC](../../getting-started/install-system/emmc-system)

## Booting the System

① : Insert the MicroSD card into the MicroSD card slot

② : Connect the monitor to the board using an HDMI cable

③ : Connect a mouse or keyboard using a USB-A port: If you have a USB-A hub, you can connect the mouse and keyboard through the hub

④ : Power on the board using a 5V Type-C power adapter

If the board is powered on correctly, the power indicator will light up green; if the system boots normally, the status indicator will blink blue.

Once the system has successfully booted, the system desktop will be displayed on the monitor.

## First Login

When using the official Tina Linux system image, please use the default login credentials:

| Item     | Content                         |
| :------- | :------------------------------ |
| Username | `root`                          |
| Password | `No password (press Enter key)` |
