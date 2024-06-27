---
sidebar_position: 1
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install the system on the MicroSD card

## File download

<Images loader={false} system_img={true} spi_img={false} />

## MicroSD Card Preparation

Insert the MicroSD card into the SD card reader, and then insert the card reader into the USB port of the PC

## Flash the image

<Etcher />

## 启动系统

After successfully burning the MicroSD Card according to the above steps, insert the MicroSD Card into the MicroSD Card slot (as shown in the following figure), and then power on the system, the system will start booting and the HDMI will display the desktop.

<img
src="/img/rock5b/rock5b-interface-2.webp"
alt="sd slot"
style={{ width: "60%"}}
/>

## Login System

After the system boots up, log in using the radxa account with the password radxa.

:::tip
The entire process lasts about 40 seconds from powering on the system to booting it up and then to the system desktop.
:::
