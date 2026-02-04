---
sidebar_position: 2
---

import DDUse from '../../../../common/radxa-os/install-system/\_use_dd_emmc.mdx';

# Install the System to eMMC

:::note Note
This guide applies to Cubie A7S variants with onboard eMMC.
:::

<DDUse tag="emmc_board" board="cubie-a7s" download_url="https://github.com/radxa-build/radxa-a733/releases/download/rsdk-t2/radxa-a733_bullseye_kde_t2.output_512.img.xz" path_to_image_unxz="radxa-a733_bullseye_kde_t2.output_512.img.xz" path_to_image="radxa-a733_bullseye_kde_t2.output_512.img"  download_page="../../download"/>

## Boot the system

After installation, power off the board and disconnect power. Then follow the steps below to boot:

① Remove the microSD card from the board

② Connect a monitor using a USB‑C to HDMI/DP cable

③ Connect keyboard/mouse via USB‑A (use a USB hub if needed)

④ Power the board with a 5V USB‑C power adapter

If power is OK, the power LED turns green. If the system boots, the status LED blinks blue.

After booting successfully, you should see the desktop. Log in using the credentials below.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-debian11-succ.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Default credentials

For official system images:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Log in

Log in with the default credentials.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-debian11-desktop.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Use the system

After booting successfully, you can start using Radxa OS on Cubie A7S. See [System configuration](../../system-config) for basic usage.
