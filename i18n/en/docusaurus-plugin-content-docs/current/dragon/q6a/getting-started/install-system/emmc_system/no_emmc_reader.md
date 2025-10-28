---
sidebar_position: 4
---

import InstallSystem from '../../../../../common/radxa-os/install-system/\_use_dd_emmc.mdx';

# Booting from MicroSD Card and Installing System to eMMC

<InstallSystem tag="emmc_module" board="dragon-q6a" download_page="../../../download" download_url="https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-t4/radxa-dragon-q6a_noble_kde_t4.output_512.img.xz" path_to_image_unxz="radxa-dragon-q6a_noble_kde_t4.output_512.img.xz" path_to_image="radxa-dragon-q6a_noble_kde_t4.output_512.img" />

## Booting the System

After completing the system installation, remove the MicroSD card, ensure the eMMC module is properly installed in the eMMC module interface of the Dragon Q6A, then power on the Dragon Q6A using a 12V Type-C power adapter.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/dragon-q6a-boot-system-emmc.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Verify the eMMC module is installed

② : Connect the monitor to the motherboard using an HDMI cable

③ : Power the Dragon Q6A using a 12V Type-C power adapter

When the system boots normally, the power indicator will light up green, and the status indicator will flash blue.

## Logging into the System

When you start the system for the first time, you need to log in using the default username and password.

The default credentials for Radxa OS are as follows:

| Item     | Content |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Using the System

After successfully booting the system, you can start using the Radxa OS on your Dragon Q6A. For basic usage of the Radxa OS, please refer to the [Using the System](../../use_system.md) tutorial.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/dragon-q6a-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
