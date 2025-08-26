---
sidebar_position: 1
---

# Quick Start

This tutorial is designed to help you get started quickly with the Cubie A7Z motherboard.

## Product Overview

<div style={{textAlign: 'center'}}>
   Cubie A7Z Front View
   <img src="/en/img/cubie/a7z/a7z-bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
   Cubie A7Z Rear View
   <img src="/en/img/cubie/a7z/a7z-top.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

You will need to prepare the following hardware:

- Motherboard: Radxa Cubie A7Z
- System Boot Media: MicroSD Card (Recommended)
- Power Adapter: 5V USB-C Power Adapter

:::tip Recommended Accessories

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## Installing the System

Based on your system boot media and available hardware, please refer to the following tutorials for system installation:

- [Install System to MicroSD Card](./install-system/microsd)
- [Install System to Onboard UFS](./install-system/ufs)

## Booting the System

After completing the system installation, you need to install the corresponding system boot media on the Cubie A7Z.

<Tabs queryString="system boot">
<TabItem value="MicroSD Card">

Insert the MicroSD card into the Cubie A7Z's MicroSD card slot, then connect the Cubie A7Z to a 5V USB-C power adapter to boot the system.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a7z/a7z-microsd-boot.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Onboard UFS">

If your motherboard has onboard UFS, simply connect it to a 5V USB-C power adapter to boot the system without any additional installation.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a7z/a7z-ufs-boot.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>
</Tabs>

## System Information

When using our provided system image, you'll need to log in with the following default credentials:

- Radxa OS

Username: radxa

Password: radxa

## Using the System

### With Display

For users with a monitor, you can connect to the display using a USB-C to HDMI/DP cable and operate the system with a mouse and keyboard.

### Without Display

For users without a monitor, you can access the system in the following ways:

1. Connect to your computer using a USB-to-serial cable to view system logs and log in through the serial console.

2. Modify the system configuration file to automatically connect to a wireless network, then check the IP address in your router's admin interface and log in via SSH.
