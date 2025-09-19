---
sidebar_position: 1
---

import InstallSystem from '../../../../../../common/radxa-os/install-system/\_use_etcher_nvme.mdx';

# Install System Using an External Enclosure

<InstallSystem />

## Boot the System

After completing the system installation, power off the board and disconnect the power supply. Follow these steps to boot the system:

① Remove the MicroSD card from the board

② Install the NVMe SSD onto the board

③ Connect the monitor to the board using an HDMI cable

④ Connect a mouse or keyboard to the USB-A port: If you have a USB-A hub, you can connect the mouse and keyboard through the hub

⑤ Power the board using a 5V Type-C power adapter

If the board is powered on normally, the power indicator will light up green; if the system boots normally, the status indicator will flash blue.

After successfully booting the system, the system desktop will be displayed on the monitor.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-debian11-succ.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## System Information

When using our provided system image for the first time, you need to log in with the username and password we have set.

- radxa

Username: radxa

Password: radxa

## Login to the System

Log in and use the system according to the system information.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-debian11-desktop.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## Using the System

After successfully booting the system, you can officially use the Radxa system on Cubie A5E. For basic usage of the Radxa system, please refer to the [System Usage](../../../../system-config) tutorial.
