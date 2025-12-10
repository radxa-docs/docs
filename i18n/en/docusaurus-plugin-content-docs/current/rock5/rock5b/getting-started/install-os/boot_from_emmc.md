---
sidebar_position: 2
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# Install the system on the EMMC Module (Only for ROCK 5B)

## File download

Please go to [download](../../download) to download system and loader file.

## eMMC Module Preparation

Insert [eMMC Module](../../../../accessories/emmc_module) into [eMMC Reader](../../../../accessories/emmc_reader), and then Insert Reader into PC's USB Port

:::tip

For on-board eMMC, please refer to [USB Flashing section](../../low-level-dev/install-os/rkdevtool_emmc.md)

:::

## Flash the image

<Etcher/>

## Boot System

After successfully flashing the eMMC Module using the previous steps, insert the eMMC Module into the eMMC Module slot (as shown in the image below). Then, power on the device. The power indicator light will display a solid green color, indicating the system has started booting up. Once the normal startup process completes, the indicator light will begin blinking. After a short period of time, the HDMI output will display the desktop.

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
