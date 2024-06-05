---
sidebar_position: 2
description: "Flash via Maskrom under Mac OS"
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV2.mdx";
import Images from "../../\_image.mdx"

# Mac OS Host

## File Download

<Images loader={true} system_img={true} spi_img={false} />

<Rkdeveloptool model="rock-5c" release_num="b2" desktop="kde" platform="macos" loader="rk3588_spl_loader_v1.08.111.bin">

<ol>
    <li>Remove the microSD card and power cord</li>
    <li>Install the eMMC </li>
    <li>Short the Maskrom pin hole with DuPont wire</li>
    <li>Connect the USB of the PC host via the USB-A to USB-A cable, and if a device is detected on the PC side, it will enter the Maskrom mode (the OTG connector of the Radxa ROCK 5A is the USB 3.0 port located on the top, which can be connected to the host via the USB-A to USB-A cable to communicate with the host board that enters the Maskrom)</li>
</ol>
<img src="/img/rock5c/rock-5c-maskrom.webp" alt="rock 5c maskrom wire" width="500" />

</Rkdeveloptool>
