---
sidebar_position: 3
description: "Flash via Maskrom under Windows"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_rkdevtoolV2.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/rock5/rock5a/_image.mdx
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";
import Images from "../../\_image.mdx"

# Windows Host

## File Download

<Images loader={true} system_img={true} spi_img={true} />

<Rkdevtool rkdevtool_emmc_img="/img/rock5a/rock5a-rkdevtool-maskrom-flash-system.webp" loader_name="rk3588_spl_loader_v1.08.111.bin" emmc={false} pcie={false} sata={false} >

<ol>
    <li>Remove the microSD card and power cord</li>
    <li>Install the eMMC </li>
    <li>Short the Maskrom pin hole with DuPont wire</li>
    <li>Connect the USB of the PC host via the USB-A to USB-A cable, and if a device is detected on the PC side, it will enter the Maskrom mode (the OTG connector of the Radxa ROCK 5A is the USB 3.0 port located on the top, which can be connected to the host via the USB-A to USB-A cable to communicate with the host board that enters the Maskrom)</li>
</ol>
<img src="/img/rock5a/rock5a-maskrom-wire.webp" alt="rock 5a maskrom wire" width="500" />

</Rkdevtool>
