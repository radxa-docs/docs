---
sidebar_position: 2
---

import InstallSystem from '../../../../../common/radxa-os/install-system/\_use_dd_nvme.mdx';

# Booting from MicroSD Card and Installing System to NVMe SSD

<InstallSystem tag="m2_2280" board="dragon-q8b" download_page="../../../download" download_url="https://github.com/radxa-build/radxa-dragon-midstream/releases/download/rsdk-t2/radxa-dragon-midstream_noble_gnome_t2.output_512. img.xz" path_to_image_unxz="radxa-dragon-midstream_noble_gnome_t2.output_512. img.xz" path_to_image="radxa-dragon-midstream_noble_gnome_t2.output_512. img" />

## Booting the System

After installing the system, remove the microSD card, confirm that the NVMe SSD is installed in the Dragon Q8B NVMe SSD slot, then power the Dragon Q8B with a 20V Type-C power adapter.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q8b/dragon-q8b-boot-system-nvme.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

1. Confirm that the NVMe SSD is installed

2. Connect the monitor and board using HDMI or a dual-ended USB-C cable

3. Power the Dragon Q8B with a 20V Type-C power adapter

After the system boots normally, the power LED turns green and the status LED blinks blue.

## Logging into the System

When you boot the system for the first time, log in with the default username and password.

The default credentials for Radxa OS are:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Using the System

After the system boots successfully, you can start using Radxa OS on the Dragon Q8B. For basic Radxa OS usage, refer to [Use the System](../../use-system.md) guide.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q8b/dragon-q8b-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
