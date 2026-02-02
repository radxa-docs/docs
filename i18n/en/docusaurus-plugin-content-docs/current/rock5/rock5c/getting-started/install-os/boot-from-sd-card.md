---
sidebar_position: 1
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcher.mdx';

# Install the system on the MicroSD card

## File download

<Images loader={false} system_img={true} spi_img={false} />

## MicroSD Preparation

Insert MicroSD Card into SDCard Reader，then input Reader into PC's USB Port.

## Burn the image

<Etcher />

## Boot up the system

After successfully burning the microSD card system following the above steps, insert the microSD card into the microSD card slot (as shown in the figure below), then power on, the system will start, and the HDMI connected monitor will display the desktop.

<img
src="/img/rock5c/rock-5c-sd-slot.webp"
alt="microSD slot"
style={{ width: "60%"}}
/>

## Log in to the System

After the system boots, log in using the radxa account with the password radxa.

:::tip
The entire process lasts about 40 seconds from powering up the system to booting it to the system desktop.
:::
