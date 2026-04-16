---
sidebar_position: 1
---

import UseRKDevTool from '../../../../common/radxa-os/rkdevtool/\_use.mdx';
import EMMC from '../../../../common/radxa-os/rkdevtool/\_emmc.mdx';
import Maskrom from '../../../../common/radxa-os/rkdevtool/\_maskrom.mdx';

# Quick Start

This guide will help you quickly get started with the Radxa NX5 Development Kit and quickly validate the features of Radxa NX5.

## Product Image

The Radxa NX5 Development Kit consists of the Radxa NX5 compute module and Radxa NX5 IO Board, providing a complete hardware development platform for quick validation of compute module functionality, performance evaluation, and prototype system building to help users efficiently complete development and solution verification.

Note: The Radxa NX5 IO Board needs to be purchased separately by the user.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-dev-kit-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

You need to prepare the following hardware in advance:

- Radxa NX5 Development Kit
- Power supply: DC 5525 power adapter (5V input)
- System boot media: Onboard eMMC
- Data cable: Micro USB data cable (for flashing system to eMMC)
- Display device: HDMI cable and monitor
- Input devices: Keyboard and mouse (for GUI operation)

:::tip Recommended Accessories

- It is recommended to use a 5V/3A or higher DC power adapter for power supply.

:::

## Install the System

:::tip System Note

If you need to install the system to a microSD card, please refer to [Install System to microSD Card](./install-system/microsd-system.md)

If both microSD card and onboard eMMC have systems installed, the system will boot from the microSD card first.

:::

The quick start guide mainly introduces installing the system to the onboard eMMC of Radxa NX5.

:::warning Important Reminder

**Installing the system will completely format the eMMC. All data will be permanently deleted!**

Please confirm before proceeding:

- There is no important data on the eMMC, or you have completed a backup.
  :::

### Install RKDevTool

<UseRKDevTool />

### Enter Maskrom Mode

<Maskrom model="nx5"/>

### Install System to eMMC

<EMMC download_page="../download"/>

## Boot the System

After the system installation is complete, connect the HDMI display, then re-plug the power adapter to boot the system.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-emmc-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

①: Connect the display and the board using an HDMI or DP cable

②: Connect a mouse or keyboard using the USB-A interface

③: Power the board using a 5V DC power adapter

If the board is powered normally, the Radxa NX5 system indicator LED and the Radxa NX5 IO Board power indicator LED will light up green. If the system boots normally, the Radxa NX5 system indicator LED will blink green, and the Radxa NX5 IO Board status indicator LED will blink blue.

## Log In

When you first boot the system, you need to log in using the default username and password.

The default credentials for Radxa OS are:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Use the System

After successfully logging in, you can configure the system and develop on the Radxa NX5 Development Kit.
