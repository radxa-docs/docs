---
sidebar_position: 4
description: "通过 Maskrom 清除 eMMC"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/dev/_erase-emmc.mdx
  - docs/rock2/rock2f/getting-started/install-os/maskrom/_maskrom.mdx
---

import ERASE from "../../../../../common/dev/\_erase-emmc.mdx";
import Maskrom from "./\_maskrom.mdx"

# 清除 eMMC

<ERASE loader="https://dl.radxa.com/rock2/images/loader/rk3528_spl_loader_v1.07.104.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp">

<Maskrom/>
</ERASE>
