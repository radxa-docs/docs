---
sidebar_position: 3
description: "Flash via Maskrom under  Windows"
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";
import Images from "../../\_image.mdx"

# Windows Host

## File Download

<Images loader={true} system_img={true} spi_img={true} />

<Rkdevtool rkdevtool_emmc_img="/img/rock5b/rock5bp-rkdevtool-maskrom-flash-system.webp" loader_name="rk3588_spl_loader_v1.08.111.bin" emmc={false} pcie={false} sata={false} >

<ol>
    <li>Remove the microSD card and power cord</li>
    <li>Hold Maskrom button</li>
    <li>Plug the USB A-C cable into the Type-C port of the ROCK 5B and the other end into your computer, which will normally enter the Maskrom state.</li>
</ol>
<img src="/img/rock5b/rock-5b-typec-maskrom-400px.webp" alt="rock 5b maskrom wire" width="500" />

</Rkdevtool>
