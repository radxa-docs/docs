---
sidebar_position: 1
description: "Install System to MicroSD Card"
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install System to MicroSD Card

## File Download

<Images loader={false} system_img={true} spi_img={false} />

## Prepare MicroSD Card

Insert the MicroSD card into an SD card reader, then plug the reader into a USB port on your PC.

## Image Burning

<Etcher/>

## Start the System

After successfully burning the MicroSD card following the steps above, insert the MicroSD card into the MicroSD card slot (as shown below), power on, and the system will start with the desktop displayed on HDMI.

<img
src="/img/cm3/cm3-io-sd-slot.webp"
alt="sd slot"
style={{ width: "60%"}}
/>

## Log In to the System

After the system boots up, log in using the username 'radxa' and password 'radxa'.

:::tip
The entire process from powering on to booting into the desktop takes approximately 40 seconds.
:::
