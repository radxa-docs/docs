---
sidebar_position: 1
description: "Flash via Maskrom under Linux"
---

import Rkdeveloptool from "../../../../../common/dev/\_rkdeveloptoolV2.mdx";

# Linux Host

## File Download

Please download the related System Images and Loader refer to [Summary of resource downloads](../../download)

<Rkdeveloptool model="radxa-cm3-io" release_num="27" desktop="xfce" platform="linux" loader="rk356x_spl_loader_v1.15.113.bin">

<ol>
    <li>Install the CM3 core board onto the CM3 IO Board</li>
    <li>Remove MicroSD Card</li>
    <li>Press and hold the SPI Disable button</li>
    <li>Connect the USB-A to Micro USB cable by plugging the Micro USB end into the Radxa CM3 IO OTG port (Micro USB port), and then plug the other USB-A end into your computer</li>
    <li>Plug in the power cable to power on the board. If the power LED is steadily illuminated, that indicates the board has successfully entered Maskrom mode</li>
</ol>

<img src="/img/cm3/cm3-button.webp" alt="cm3 core button" style={{ width: "40%" }} />
<img src="/img/cm3/cm3-with-io.webp" alt="cm3 io with cm3" style={{ width: "40%" }} />

</Rkdeveloptool>
