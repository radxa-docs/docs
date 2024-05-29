---
sidebar_position: 3
description: "Flash via Maskrom under Linux"
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";
import Images from "../../\_image.mdx"

# Windows Host

## File Download

<Images loader={true} system_img={true} spi_img={true} />

<Rkdevtool rkdevtool_emmc_img="/img/rkdevtool/emmc-path.webp" loader_name="rk3588_spl_loader_v1.15.113.bin" emmc={false} pcie={false} sata={false} >
<ol>
    <li>Remove the microSD card and power cable</li>
    <li>Press and hold the Maskrom button</li>
    <li>Connect the USB of the PC host via USB-A to USB-C cable, and if a device is detected on the PC side, it will enter into Maskrom mode (the OTG interface of Radxa ROCK 5 ITX is TYPE-C, so you can connect the host to the motherboard that enters into Maskrom through the USB-C to USB-A cable for communication).</li>
</ol>
<img src="/img/rock5itx/rock5itx-maskrom-new.webp" alt="maskrom new version" width="500" />
</Rkdevtool>
