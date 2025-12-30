---
sidebar_position: 3
description: "Flash via Maskrom under Windows"
---

import Rkdevtool from "../../../../../common/dev/\_rkdevtoolV2.mdx";

# Windows Host

## File Download

Please download the related System Images and Loader refer to [Summary of resource downloads](../../download)

<Rkdevtool rkdevtool_emmc_img="/img/common/rkdevtool/rkdevtool_genenal_maskrom_flash.webp" loader_name="rk356x_spl_loader_ddr1056_v1.10.111.bin" emmc={false} pcie={false} sata={false} >

<ol>
    <li>Install the CM3 onto the CM3 IO board</li>
    <li>Remove (unplug) the MicroSD card from the CM3 IO board</li>
    <li>Before powering on, press and hold the SPI Disable button, and keep it pressed</li>
    <li>Connect a USB-A to Micro-USB cable to the OTG port (Micro-USB port) on the CM3 IO board, and the other end to the computer</li>
    <li>Connect the DC 12V power supply to power the CM3 IO board; if the green power LED stays on, it has successfully entered Maskrom mode (you can release the button at this point)</li>
</ol>

<img src="/img/cm3/cm3-button.webp" alt="cm3 core button" style={{ width: "40%" }} />
<img src="/img/cm3/cm3-with-io.webp" alt="cm3 io with cm3" style={{ width: "40%" }} />

</Rkdevtool>
