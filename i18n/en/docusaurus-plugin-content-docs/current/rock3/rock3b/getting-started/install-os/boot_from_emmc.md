---
sidebar_position: 1
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install the system to the EMMC Module

## File Download

<Images loader={false} system_img={true} spi_img={false} />

## EMMC Module preparation

Insert [EMMC Module](../../../../accessories/emmc_module) into [EMMC Reader](accessories/emmc_reader), and then insert the reader into the USB port of your PC.

## Image burning

<Etcher/>

## Boot the system

After successfully burning the EMMC Module according to the above steps, insert the EMMC Module into the EMMC Module slot (as shown in the picture below), then power on the system, the system will start booting and HDMI will display the desktop.

<img
src="/img/rock3/3b/rock3b_with_emmc_module.webp"
alt="emmc slot"
style={{ width: "60%"}}
/>

## Logging in to the system

After the system boots up, log in using the radxa account with the password radxa.

:::tip
The whole process lasts about 40 seconds from powering on the system to booting it up, and then entering the system desktop.
:::
