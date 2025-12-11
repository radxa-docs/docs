---
sidebar_position: 2
---

import InstallSystem from '../../../../../../common/radxa-os/install-system/\_use_dd_nvme.mdx';

# Install System from SD Card to NVMe

<InstallSystem tag="pcie_fpc" board="cubie-a7z" download_url="https://github.com/radxa-build/radxa-cubie-a7z/releases/download/rsdk-b1/radxa-cubie-a7z_bullseye_kde_b1.output_512.img.xz" path_to_image_unxz="radxa-cubie-a7z_bullseye_kde_b1.output_512.img.xz" path_to_image="radxa-cubie-a7z_bullseye_kde_b1.output_512.img" />

## Boot System

After completing the system installation, shut down the board, disconnect the power supply, and follow these steps to boot the system:

① : Remove the MicroSD card from the board

② : Install the NVMe SSD to the board through the PCIe FPC interface with an M.2 M Key HAT

③ : Connect the monitor and board using an HDMI cable

④ : Connect mouse or keyboard using USB-A port: If you have a USB-A hub, you can connect mouse and keyboard through the hub

⑤ : Power the board using a 5V Type-C power adapter

If the board is powered normally, the board power indicator will light up green; if the system boots normally, the status indicator will flash blue.

After successfully booting the system, the monitor will display the system desktop.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-debian11-succ.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## System Information

When using the system image we provided, you need to use the username and password we set to log in to the system for the first time.

- radxa

User account: radxa

User password: radxa

## Login to System

Log in and use the system according to the system information.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-debian11-desktop.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Using the System

After successfully booting the system, you can officially use the Radxa system on Cubie A7Z. For basic usage of the Radxa system, please refer to the [System Usage](../../../../system-config) tutorial.
