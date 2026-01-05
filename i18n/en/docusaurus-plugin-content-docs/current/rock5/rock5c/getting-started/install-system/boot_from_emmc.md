---
sidebar_position: 2
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install the system on the eMMC Module

## File download

<Images loader={false} system_img={true} spi_img={false} />

## eMMC Module Preparation

Insert the [eMMC Module](../../../../accessories/emmc_module) into the [eMMC Reader](../../../../accessories/emmc_reader), and then insert the Reader into the USB port of the PC.

## Burn the image

<Etcher/>

## Boot up the system

After successfully burning the eMMC Module according to the above steps, insert the eMMC Module into the eMMC Module slot (as shown in the following figure), and then power on the system, the system will start booting and HDMI will display the desktop.

<img
src="/img/rock5c/rock5c_with_emmc_module.webp"
alt="emmc slot"
style={{ width: "60%"}}
/>

## Log in to the System

After the system boots, log in using the radxa account with the password radxa.

:::tip
The entire process lasts about 40 seconds from powering up the system to booting it to the system desktop.
:::
