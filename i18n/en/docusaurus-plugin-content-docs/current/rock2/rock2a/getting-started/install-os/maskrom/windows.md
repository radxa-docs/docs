---
sidebar_position: 1
description: "Flashing via USB on Windows"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_rkdevtoolV3.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/rock2/rock2a/_image.mdx
  - i18n/en/docusaurus-plugin-content-docs/current/rock2/rock2a/getting-started/install-os/maskrom/_maskrom.mdx
---

import Rkdevtool from "../../../../../common/dev/\_rkdevtoolV3.mdx";
import Images from "../../../\_image.mdx"
import Maskrom from "./\_maskrom.mdx"

# Windows Host

## File Download

Please go to [Download page](../../../download) to download loader and system image.

<Rkdevtool rkdevtool_emmc_img="/img/rkdevtool/emmc-path.webp" loader_name="rk3528_spl_loader_v1.07.104.bin" emmc={false} pcie={false} sata={false} >
<Maskrom/>
</Rkdevtool>
