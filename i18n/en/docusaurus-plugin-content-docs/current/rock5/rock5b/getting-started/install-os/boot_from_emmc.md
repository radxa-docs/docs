---
sidebar_position: 2
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install the system on the EMMC Module

## File download

<Images loader={false} rock5b_system_img={true} rock5bp_system_img={true} spi_img={false} />

## eMMC Module Preparation

Insert [eMMC Module](../../../../accessories/emmc_module) into [eMMC Reader](../../../../accessories/emmc_reader), and then Insert Reader into PC's USB Port

:::tip

For on-board eMMC, please refer to [USB Flashing section](../../low-level-dev/maskrom/)

:::

## Flash the image

<Etcher/>

## Boot System

After successfully burning the eMMC Module according to the above steps, insert the eMMC Module into the eMMC Module slot (as shown in the following figure), and then power on the system, the system will start to boot up and HDMI will display the desktop.

<img
src="/img/rock5b/rock5b-interface-3.webp"
alt="eMMC slot"
style={{ width: "60%"}}
/>

## Login System

After the system boots up, log in using the radxa account with the password radxa.

:::tip
The entire process lasts about 40 seconds from powering on the system to booting it up and then to the system desktop.
:::
