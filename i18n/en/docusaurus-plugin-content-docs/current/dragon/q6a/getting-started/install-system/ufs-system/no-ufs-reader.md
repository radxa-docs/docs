---
sidebar_position: 4
---

import InstallSystem from '../../../../../common/radxa-os/install-system/\_use_dd_ufs.mdx';

# Boot from MicroSD Card and Install System to UFS

<InstallSystem tag="ufs_module" board="dragon-q6a" download_page="../../../download" download_url="https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-t4/radxa-dragon-q6a_noble_kde_t4.output_4096.img.xz" path_to_image_unxz="radxa-dragon-q6a_noble_kde_t4.output_4096.img.xz" path_to_image="radxa-dragon-q6a_noble_kde_t4.output_4096.img" />

## Booting the System

After completing the system installation, remove the MicroSD card, ensure the UFS module is properly installed in the UFS module interface of the Dragon Q6A, then power on the Dragon Q6A using the 12V Type-C power adapter.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/dragon-q6a-boot-system-ufs.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Ensure the UFS module is installed

② : Connect the monitor to the board using an HDMI cable

③ : Power on the Dragon Q6A using the 12V Type-C power adapter

When the system boots normally, the power indicator will light up green and the status LED will blink blue.

## System Login

When you first start the system, you'll need to log in using the default username and password.

The default credentials for Radxa OS are as follows:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Using the System

After successfully booting the system, you can start using the Radxa system on your Dragon Q6A. For basic usage instructions, please refer to the [Using the System](../../use-system.md) guide.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/dragon-q6a-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
