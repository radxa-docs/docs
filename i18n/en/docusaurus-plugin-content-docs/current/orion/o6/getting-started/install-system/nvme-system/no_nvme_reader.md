---
sidebar_position: 2
---

import InstallSystem from '../../../../../common/radxa-os/install-system/\_use_dd_nvme.mdx';

# Boot from USB and Install System to NVMe SSD

<InstallSystem boot_device="U drive" board="orion-o6" download_page="../../../../download" download_url="https://github.com/radxa-build/orion-o6/releases/download/rsdk-t2/orion-o6_bookworm_gnome_t2.output_512.img.xz" path_to_image_unxz="orion-o6_bookworm_gnome_t2.output_512.img.xz" path_to_image="orion-o6_bookworm_gnome_t2.output_512.img" />

## Booting the System

After completing the system installation, remove the USB drive, ensure the NVMe SSD is properly installed in the Radxa Orion O6's NVMe SSD slot, and then power on the Radxa Orion O6 using a 20V Type-C power adapter.

Detailed steps:

1. Confirm the NVMe SSD is installed

2. Connect the monitor to the motherboard using an HDMI/DP cable

3. Power on the Radxa Orion O6 with a 20V Type-C power adapter

When the system boots normally, the power indicator will light up green and the status indicator will flash blue.

## Logging into the System

When you start the system for the first time, you need to log in using the default username and password.

The default credentials for Radxa OS are as follows:

| Item     | Content |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Using the System

After successfully logging in, you can proceed with system configuration and development on your Radxa Orion O6.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
