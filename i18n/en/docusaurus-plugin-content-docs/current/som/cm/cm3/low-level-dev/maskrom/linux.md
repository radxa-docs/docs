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
    <li>Install the CM3 onto the CM3 IO board</li>
    <li>Remove (unplug) the MicroSD card from the CM3 IO board</li>
    <li>Before powering on, press and hold the SPI Disable button, and keep it pressed</li>
    <li>Connect a USB-A to Micro-USB cable to the OTG port (Micro-USB port) on the CM3 IO board, and the other end to the computer</li>
    <li>Connect the DC 12V power supply to power the CM3 IO board; if the green power LED stays on, it has successfully entered Maskrom mode (you can release the button at this point)</li>
</ol>

<img src="/img/cm3/cm3-button.webp" alt="cm3 core button" style={{ width: "40%" }} />
<img src="/img/cm3/cm3-with-io.webp" alt="cm3 io with cm3" style={{ width: "40%" }} />

</Rkdeveloptool>
