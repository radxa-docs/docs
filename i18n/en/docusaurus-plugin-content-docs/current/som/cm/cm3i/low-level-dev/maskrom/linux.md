---
sidebar_position: 1
description: "Flash via Maskrom under Linux"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_rkdeveloptoolV3.mdx
---

import Rkdeveloptool from "../../../../../common/dev/\_rkdeveloptoolV3.mdx";

# Linux Host

## File Download

Please download the system image and Loader refer to [Summary of resource downloads](../../download).

<Rkdeveloptool>

<ol>
    <li>Remove the MicroSD card from the base Board</li>
    <li>Simultaneously press and hold the Maskrom Button (SPI Flash) and Maskrom Button (eMMC) on the CM3I.</li>
    <li>Connect a PC host from the OTG port using a USB-A to USB-A cable</li>
    <li>Connect the power supply, you can enter the MASKROM mode</li>
</ol>

<img src="/img/cm3i/cm3i-overview.webp" alt="cm3i module" style={{ width: "80%" }} />
<img src="/img/cm3i/cm3i-io-otg-connection.webp" alt="cm3i module" style={{ width: "80%" }} />

</Rkdeveloptool>
