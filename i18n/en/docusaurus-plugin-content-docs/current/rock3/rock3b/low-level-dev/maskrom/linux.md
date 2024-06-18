---
sidebar_position: 1
description: "Flash via maksrom under Linux"
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV2.mdx";
import Images from "../../\_image.mdx"

# Linux Host

## File Download

<Images loader={true} system_img={true} spi_img={false} />

<Rkdeveloptool model="rock-3b" release_num="18" desktop="xfce" platform="linux" loader="rk356x_spl_loader__v1.15.113.bin">

<ol>
    <li>Remove MicroSD card, insert eMMC</li>
    <li>Set the dip switch below the USB 3.0 cradle to the device side.</li>
    <li>Short the Maskrom pin, which is located between the USB 3.0 cradle and the Ethernet.</li>
    <li>Connecting a PC host from the OTG port using a USB-A to USB-A cable</li>
    <li>Plug in the power cord and power up, if the green light of the power supply is always on, then it has successfully entered the Maskrom mode.</li>
</ol>
<img src="/img/rock3/3b/rock3b-otg.webp" alt="rock 3b otg" width="500" />
<img src="/img/rock3/3b/rock3b-maskrom.webp" alt="rock 3b maskrom wire" width="500" />

</Rkdeveloptool>
