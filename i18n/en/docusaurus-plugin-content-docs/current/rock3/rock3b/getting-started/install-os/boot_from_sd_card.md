---
sidebar_position: 1
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install the system on the MicroSD card

## File download

<Images loader={false} system_img={true} spi_img={false} />

## MicroSD card preparation

Insert the MicroSD card into the SD card reader, and then insert the card reader into the USB port of your PC.

## Image burning

<Etcher/>

## Boot the system

After successfully burning the MicroSD Card according to the above steps, insert the MicroSD Card into the MicroSD Card slot (as shown in the picture below), then power on the system, the system will start booting and HDMI will display the desktop.

<img
src="/img/rock3/3b/rock3b-sd-slot.webp"
alt="sd slot"
style={{ width: "60%"}}
/>

## Logging in to the system

After the system boots up, log in using the radxa account with the password radxa.

:::tip
The whole process lasts about 40 seconds from powering on the system to booting it up, and then entering the system desktop.
:::
