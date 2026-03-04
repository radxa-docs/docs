---
sidebar_position: 1
description: "Windows 下通过 USB 刷机"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/dev/_rkdevtoolV3.mdx
  - docs/rock2/rock2a/_image.mdx
  - docs/rock2/rock2a/getting-started/install-os/maskrom/_maskrom.mdx
---

import Rkdevtool from "../../../../../common/dev/\_rkdevtoolV3.mdx";
import Images from "../../../\_image.mdx"
import Maskrom from "./\_maskrom.mdx"

# Windows 主机

## 文件下载

请到 [资源下载页面汇总](../../../download) 下载对应的 Loader 和 镜像文件

<Rkdevtool rkdevtool_emmc_img="/img/rkdevtool/emmc-path.webp" loader_name="rk3528_spl_loader_v1.07.104.bin" emmc={false} pcie={false} sata={false} >
<Maskrom/>
</Rkdevtool>
