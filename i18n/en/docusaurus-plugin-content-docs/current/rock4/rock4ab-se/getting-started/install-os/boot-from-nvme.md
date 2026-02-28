---
sidebar_position: 3

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_nvme.mdx
---

# Install OS to NVMe

:::tip
This tutorial is only applicable to systems with kernel >= 5.10
:::

import NVME from '../../../../common/dev/\_nvme.mdx';

<NVME model="rock-4b-plus" rsetup_path="../../radxa-os/rsetup" etcher_path="./boot-from-sd-card" download_path="../../download" pwr="12V/1.5A" />

:::tip
The entire boot process from power-on to desktop takes about 40 seconds.
:::
