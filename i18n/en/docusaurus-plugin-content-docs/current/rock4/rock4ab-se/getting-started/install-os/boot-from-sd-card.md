---
sidebar_position: 2
---

import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install OS to MicroSD Card

This article explains how to install the operating system to a MicroSD card and boot the system from it on ROCK 4A/4B/4A+/4B+/4SE.

## File Download

Download the [ROCK 4A/4B/4A+/4B+/4SE system image](../../download) from the resource download page.

## Prepare MicroSD Card

Insert the MicroSD card into an SD card reader, then connect the reader to your PC's USB port.

## Write the Image

<Etcher/>

## Boot the System

After successfully writing the image to the MicroSD card, insert it into the MicroSD card slot (as shown below), then power on the device. The system will start booting, and the desktop will be displayed on the HDMI monitor.

<img
src="/img/rock4/rock4-sd-slot.webp"
alt="sd slot"
style={{ width: "60%"}}
/>

## Login to the System

After the system boots, log in with the following credentials:

- Username: `radxa`
- Password: `radxa`

:::tip
The entire boot process from power-on to desktop takes about 40 seconds.
:::
