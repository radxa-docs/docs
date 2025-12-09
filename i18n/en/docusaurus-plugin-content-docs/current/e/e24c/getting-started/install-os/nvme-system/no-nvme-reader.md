---
sidebar_position: 10
---

import InstallSystem from '../../../../../common/radxa-os/install-system/\_use_dd_nvme.mdx';

# Boot from MicroSD card and install the system to NVMe SSD

<InstallSystem boot_device="MicroSD card" board="e24c" download_page="../../../download" download_url="https://github.com/radxa-build/radxa-rk3528/releases/download/rsdk-t2/radxa-rk3528_bookworm_kde_t2.output.img.xz" path_to_image_unxz="radxa-rk3528_bookworm_kde_t2.output.img.xz" path_to_image="radxa-rk3528_bookworm_kde_t2.output.img" />

## Boot the system

:::tip NVMe boot

To boot the system from an NVMe SSD, you must flash the SPI boot firmware first. If you have not flashed the SPI boot firmware yet, please refer to the [Erase / Flash SPI Flash](./spi-flash.md) guide.

:::

After the system installation is complete, remove the MicroSD card, make sure the NVMe SSD is installed in the NVMe SSD slot on the Radxa E24C, and then power the Radxa E24C with a 12V DC power adapter.

Detailed steps:

1. Make sure the NVMe SSD is installed

2. Connect the display and the board using an HDMI / DP cable

3. Power the Radxa E24C with a 12V DC power adapter

## Log in to the system

When you boot the system for the first time, you need to log in with the default username and password.

The default credentials for Radxa OS are as follows:

| Item     | Value   |
| :------- | :------ |
| Username | `radxa` |
| Password | `radxa` |

## Use the system

After logging in successfully, you can configure the system and start development on the Radxa E24C.
