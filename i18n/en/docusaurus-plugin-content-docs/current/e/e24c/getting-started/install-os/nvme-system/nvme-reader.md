---
sidebar_position: 5
---

import BalenaEtcherUse from '../../../../../common/radxa-os/install-system/\_use_etcher_nvme.mdx';

# Install the system using an NVMe SSD enclosure

<BalenaEtcherUse download_page={"../../../download"}/>

## Boot the system

:::tip NVMe boot

To boot the system from an NVMe SSD, you must flash the SPI boot firmware first. If you have not flashed the SPI boot firmware yet, please refer to the [Erase / Flash SPI Flash](./spi-flash.md) guide.

:::

After the system installation is complete, install the NVMe SSD into the NVMe SSD slot on the Radxa E24C, then power the board with a 12V DC power adapter to boot the system.

Detailed steps:

1. Install the NVMe SSD

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
