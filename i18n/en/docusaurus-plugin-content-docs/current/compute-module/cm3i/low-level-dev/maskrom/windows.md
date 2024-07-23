---
sidebar_position: 3
description: "Flash via Maskrom under  Windows"
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";

# Windows Host

## File Download

Please download the system image refer to [Summary of resource downloads](../../download).

<Rkdevtool rkdevtool_emmc_img="/img/cm3i/cm3i-io-rkdevtool-maskrom-flash-system.webp" loader_name="rk356x_spl_loader__v1.15.113.bin" emmc={false} pcie={false} sata={false} >

<ol>
    <li>Remove the MicroSD card from the base Board</li>
    <li>Simultaneously press and hold the Maskrom Button (SPI Flash) and Maskrom Button (eMMC) on the CM3I.</li>
    <li>Connect a PC host from the OTG port using a USB-A to USB-A cable</li>
    <li>Connect the power supply, you can enter the MASKROM mode</li>
</ol>

<img src="/img/cm3i/cm3i-overview.webp" alt="cm3i module" style={{ width: "80%" }} />
<img src="/img/cm3i/cm3i-io-otg-connection.webp" alt="cm3i module" style={{ width: "80%" }} />

</Rkdevtool>
