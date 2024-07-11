---
sidebar_position: 2
description: "Flash via Maskrom under MacOS"
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV2.mdx";
import Images from "../../\_image.mdx"

# Mac OS Host

## File Download

<Images loader={true} system_img={true} spi_img={false} />

<Rkdeveloptool model="cm3i-io" release_num="4" desktop="xfce" platform="macos" loader="rk356x_spl_loader_ddr1056_v1.10.111.bin">

<ol>
    <li>Remove the MicroSD card from the base Board</li>
    <li>Simultaneously press and hold the Maskrom Button (SPI Flash) and Maskrom Button (eMMC) on the CM3I.</li>
    <li>Connect a PC host from the OTG port using a USB-A to USB-A cable</li>
    <li>Connect the power supply, you can enter the MASKROM mode</li>
</ol>

<img src="/img/cm3i/cm3i-overview.webp" alt="cm3i module" style={{ width: "80%" }} />
<img src="/img/cm3i/cm3i-io-otg-connection.webp" alt="cm3i module" style={{ width: "80%" }} />

</Rkdeveloptool>
