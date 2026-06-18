---
sidebar_position: 0

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/ai/qualcomm/_fastrpc_setup.mdx
---

# Enable NPU on Board

import FASTRPCSETUP from '../../../common/ai/qualcomm/\_fastrpc_setup.mdx';

:::caution Prerequisites

The `fastrpc` package on this page is provided through the Radxa APT repository, so you should first flash and boot an official **RadxaOS** image.
If the current system is not an official RadxaOS image, `apt install fastrpc` may fail because the package cannot be found or dependencies are not satisfied.

- Official image download: [`Fogwise® AIRbox Q900` Resource Downloads](../download)
- Installation guide: [Install System to Onboard UFS](../getting-started/install-system/onboard-ufs)

:::

<FASTRPCSETUP tag="qcs9075" />
