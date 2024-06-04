---
sidebar_position: 1
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install the system on the EMMC Module

## File download

<Images loader={false} system_img={true} spi_img={false} />

## EMMC Module Preparation

Insert [EMMC Module](../../../../accessories/emmc_module.md) into [EMMC Reader](../../../../accessories/emmc_reader.md), and then Insert Reader into PC's USB Port

## Flash the image

<Etcher/>

## Boot System

Once the System has been successfully installed in according to the above steps, insert the EMMC Module into the EMMC Module slot (as shown in the following figure), and then power on the system, the system will start booting up and the HDMI will display the desktop.

<img
src="/img/rock5a/rock5a_with_emmc_module.webp"
alt="emmc slot"
style={{ width: "60%"}}
/>

## Login System

After system boots, you can login the system with the username (radxa) and password (radxa)

:::tip
The entire process lasts about 40 seconds from powering up the system to booting it to the system desktop.
:::
