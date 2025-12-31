---
sidebar_position: 1
---

import UseRKDevTool from '../../../../common/radxa-os/rkdevtool/\_use.mdx';
import EMMC from '../../../../common/radxa-os/rkdevtool/\_emmc.mdx';
import Maskrom from '../../../../common/radxa-os/rkdevtool/\_maskrom.mdx';

# Quick Start

This guide helps you get started with Radxa NX4 quickly. When used with the Radxa NX4 IO Board, it enables quick validation of Radxa NX4 features.

## Product images

The Radxa NX4 Development Kit consists of Radxa NX4 and the Radxa NX4 IO Board, and can be used to quickly validate compute module functionality.

|          Product          | No. |   View   | No. |   View    | No. |    View     |
| :-----------------------: | :-: | :------: | :-: | :-------: | :-: | :---------: |
| Radxa NX4 Development Kit |  ①  | Top view |  ②  | Side view |  ③  | Bottom view |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx4/radxa-nx4-dev-kit-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

Prepare the following hardware in advance:

- Radxa NX4 Development Kit
- Power supply: DC5525 power adapter (9 - 20V)
- Boot media: onboard eMMC
- Display: HDMI cable and a monitor
- Input devices: keyboard and mouse (for GUI operation)

:::tip Recommended accessories

- [Radxa DC 60W Power Adapter (recommended)](https://radxa.com/products/accessories/power-dc12-60w)
- Any DC power adapter that supports 9-20V can be used. A power rating of 40W or above is recommended.

:::

## Install the system

This section mainly describes how to install a system image to the onboard eMMC of Radxa NX4.

:::warning Important

**Installing the system will completely format the eMMC. All data will be permanently erased!**

Before proceeding, confirm that:

- There is no important data on the eMMC, or you have completed a backup.
  :::

### Install RKDevTool

<UseRKDevTool />

### Enter Maskrom mode

<Maskrom model="nx4"/>

### Install the system to eMMC

<EMMC download_page="../download"/>

## Boot the system

After the installation completes, connect an HDMI display, then re-plug the power adapter to boot the system.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx4/radxa-nx4-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

①: Connect the monitor and the board with an HDMI cable.

②: Power the Radxa NX4 Development Kit with a power adapter.

After the system boots normally, the power LED on the Radxa NX4 IO Board lights up green, and the status LED on Radxa NX4 blinks blue.

## Log in

When you boot the system for the first time, log in using the default username and password.

The default credentials for Radxa OS are:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Use the system

After logging in successfully, you can start configuring the system and developing on the Radxa NX4 Development Kit.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx4/radxa-nx4-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
