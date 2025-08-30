---
sidebar_position: 1
---

import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install OS to eMMC Module

This article explains how to install the operating system to an eMMC Module and boot the system from it on ROCK 4A/4B/4SE.

## File Download

Download the [ROCK 4A/4B/4SE system image](../../download) from the resource download page.

## Prepare eMMC Module

Insert the [eMMC Module](../../../../accessories/emmc_module) into the [eMMC Reader](../../../../accessories/emmc_reader), then connect the reader to your PC's USB port.

## Write the Image

<Etcher/>

## Boot the System

After successfully writing the image to the eMMC Module, insert it into the eMMC Module slot (as shown below), then power on the device. The system will start booting, and the desktop will be displayed on the HDMI monitor.

<img
src="/img/rock4/rock4ab-se_with_emmc_module.webp"
alt="emmc slot"
style={{ width: "60%"}}
/>

## Login to the System

After the system boots, log in with the following credentials:

- Username: `radxa`
- Password: `radxa`

:::tip
The entire boot process from power-on to desktop takes about 40 seconds.
:::
