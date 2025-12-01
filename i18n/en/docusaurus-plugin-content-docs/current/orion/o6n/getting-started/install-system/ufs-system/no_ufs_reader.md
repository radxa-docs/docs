---
sidebar_position: 4
---

import InstallSystem from '../../../../../common/radxa-os/install-system/\_use_dd_ufs.mdx';

# Boot from USB and Install System to UFS

This tutorial is only applicable to Radxa Orion O6N. The Radxa Orion O6 does not have a UFS module connector.

<InstallSystem boot_device="USB drive" tag="ufs_module" board="orion-o6n" download_page="../../../../download" download_url="https://github.com/radxa-build/orion-o6/releases/download/rsdk-t2/orion-o6_bookworm_gnome_t2.output_4096.img.xz" path_to_image_unxz="orion-o6_bookworm_gnome_t2.output_4096.img.xz" path_to_image="orion-o6_bookworm_gnome_t2.output_4096.img" />

## Boot the System

After completing the system installation, remove the USB drive, ensure the UFS module is properly installed in the Radxa Orion O6N's UFS module interface, and then power on the Radxa Orion O6N using a 12V DC power adapter.

Detailed steps:

1. Confirm the UFS module is installed

2. Connect the monitor to the motherboard using an HDMI/DP cable

3. Power on the Radxa Orion O6N using a 12V DC power adapter

When the system boots normally, the power indicator will light up green, and the status indicator will flash blue.

## Login to the System

When you first start the system, you need to log in with the default username and password.

The default credentials for Radxa OS are as follows:

| Item     | Content |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Using the System

After successfully logging in, you can proceed with system configuration and development on your Radxa Orion O6N.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
