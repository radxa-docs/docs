---
sidebar_position: 4
---

import InstallSystem from '../../../../../common/radxa-os/install-system/\_use_dd_emmc.mdx';

# Boot from MicroSD Card and Install System to eMMC

<InstallSystem tag="emmc_module" board="radxa-4d" download_page="../../../download" download_url="https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b3/radxa-rk3576_bookworm_kde_b3.output_512.img.xz" path_to_image_unxz="radxa-rk3576_bookworm_kde_b3.output_512.img.xz" path_to_image="radxa-rk3576_bookworm_kde_b3.output_512.img" />

## Boot System

After completing the system installation, remove the MicroSD card, confirm that the eMMC module is installed in the eMMC module interface of ROCK 4D, then power on the ROCK 4D using the power adapter to boot the system.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/rock4/4d/rock-4d-boot-system-emmc.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Install eMMC module

② : Connect display and motherboard using HDMI cable

③ : Power on ROCK 4D using power adapter

After the system boots successfully, the blue and green LED lights will light up simultaneously. After a few seconds, the green light will stay constant and the blue indicator light will flash.

## Login System

When you boot the system for the first time, you need to log in using the default username and password.

The default credentials for Radxa OS are as follows:

| Item     | Content |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |
