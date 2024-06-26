---
sidebar_position: 1
description: "Install OS on EMMC Via USB"
---

import Rkdevtool from "../../../../../common/dev/\_rkdevtoolV3.mdx";
import Images from "../../../\_image.mdx"
import Maskrom from "./\_maskrom.mdx"

# Windows Host

## File Download

<Images loader={true} system_img={true} spi_img={true} />

<Rkdevtool rkdevtool_emmc_img="/img/rkdevtool/emmc-path.webp" loader_name="rk3528_spl_loader_v1.07.104.bin" emmc={false} pcie={false} sata={false} >
<Maskrom/>
</Rkdevtool>
