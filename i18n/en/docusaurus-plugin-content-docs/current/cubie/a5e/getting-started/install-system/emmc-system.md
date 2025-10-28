---
sidebar_position: 2
---

import DDUse from '../../../../common/radxa-os/install-system/\_use_dd_emmc.mdx';

# Install System to eMMC

:::note Note
This tutorial is for users with the Cubie A5E onboard eMMC version.
:::

<DDUse tag="emmc_board" board="cubie-a5e" download_url="https://github.com/radxa-build/radxa-cubie-a5e/releases/download/rsdk-b1/radxa-cubie-a5e_bullseye_kde_b1.output_512.img.xz" path_to_image_unxz="radxa-cubie-a5e_bullseye_kde_b1.output_512.img.xz" path_to_image="radxa-cubie-a5e_bullseye_kde_b1.output_512.img"  />

## Boot the System

After completing the system installation, power off the board and disconnect the power supply. Follow these steps to boot the system:

① Remove the MicroSD card from the board

② Connect the monitor to the board using an HDMI cable

③ Connect a mouse or keyboard to the USB-A port: If you have a USB-A hub, you can connect the mouse and keyboard through the hub

④ Power the board using a 5V Type-C power adapter

If the board is powered on normally, the power indicator will light up green; if the system boots normally, the status indicator will flash blue.

After successfully booting the system, the system desktop will be displayed on the monitor. You can log in and use the system according to the system information.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-debian11-succ.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## System Information

When using the official system image, please use the following default login credentials:

| Item     | Content |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Login to the System

Log in and use the system according to the system information.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-debian11-desktop.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Using the System

After successfully booting the system, you can officially use the Radxa system on Cubie A5E. For basic usage of the Radxa system, please refer to the [System Usage](../../system-config) tutorial.
