---
sidebar_position: 2

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/radxa-os/install-system/_use_dd_ufs.mdx
---

import DDUse from '../../../../../../common/radxa-os/install-system/\_use_dd_ufs.mdx';

# Install System to UFS Module from microSD Card or Onboard eMMC

<DDUse boot_device="microSD card or onboard eMMC" tag="ufs_module" download_page="../../../download" download_url="https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-r5/radxa-rk3576_bookworm_kde_r5.output_4096.img.xz" path_to_image_unxz="radxa-rk3576_bookworm_kde_r5.output_4096.img" path_to_image="radxa-rk3576_bookworm_kde_r5.output_4096.img" device_target="/dev/sda" board="cm4" />

Note: To boot from UFS, you need to short the UFS BOOT pins using a jumper cap or DuPont wire (after shorting, the system cannot boot from eMMC). For the connector location, refer to the [Other Interfaces](../../../hardware-use/other.md) document.
