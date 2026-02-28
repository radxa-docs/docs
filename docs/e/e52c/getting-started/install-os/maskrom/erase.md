---
sidebar_position: 4
description: "通过 Maskrom 清除 eMMC"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/dev/_erase-emmc.mdx
  - docs/e/e52c/getting-started/install-os/maskrom/_maskrom.mdx
---

import ERASE from "../../../../../common/dev/\_erase-emmc.mdx";
import Maskrom from "./\_maskrom.mdx"

# 清除 eMMC

<ERASE loader="https://dl.radxa.com/e/e52c/images/rk3588_spl_loader_v1.15.113.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp">

<Maskrom/>
</ERASE>
