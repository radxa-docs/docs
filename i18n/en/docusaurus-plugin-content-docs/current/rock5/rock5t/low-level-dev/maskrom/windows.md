---
sidebar_position: 3
description: "Flash via Maskrom under Windows"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_rkdevtoolV2.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/rock5/rock5t/_image.mdx
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";
import Images from "../../\_image.mdx"

# Windows Host

## File Download

<Images loader={true} rock5t_system_img_61={true} spi_img={false} />

<Rkdevtool rkdevtool_emmc_img="/img/rock5t/rock-5t-rkdevtool-maskrom-flash-system.webp" loader_name="rk3588_spl_loader_v1.08.111.bin" emmc={false} pcie={false} sata={false} >

<TabItem value="ROCK 5T">
        <ol>
            <li>Remove the microSD card and power cable.</li>
            <li>Press and hold the Maskrom button.</li>
            <li>Insert the USB A-C cable into the Type-C port of ROCK 5T, with the other end plugged into the computer. Power on the ROCK 5T; this should normally put it into Maskrom mode.</li>
        </ol>
        <img src="/img/rock5t/rock-5t-typec-maskrom.webp" alt="rock 5t maskrom wire" width="500" />
</TabItem>

</Rkdevtool>
