---
sidebar_position: 2
---

import Etcher from '../../../common/general/\_etcher.mdx'

# Installing the operating system

## Preparation

- Power Supply

  - The ROCK 5C is powered by a Type-C connector with 5v.
  - The Type-C cable you use needs to support data communication. We call it USB Type-C charging data cable.
  - We recommend using the official [Radxa Power PD 30W](../accessories/pd-30w)

- ROCK 5C motherboard

- High-capacity memory card (either one or the other):

  - microSD, greater than 8GB (for booting from SD)
  - eMMC Module, greater than 8GB, [Radxa eMMC Module](../accessories/emmc_module)recommended (for booting from eMMC Module)

- Card Reader (either one or the other)

  - microSD card reader (for booting from SD)
  - [eMMC card reader](../accessories/emmc_reader) (for booting from eMMC Module).

- USB Keyboard and Mouse

  - The ROCK 5C features four USB-A ports for a full-size keyboard and mouse.

- Monitor and HDMI Cable

  - The ROCK 5C is equipped with a full-size HDMI connector, using a monitor with an HDMI port.

## Image Download

Please go to [Resource Download Summary](../download) to download the corresponding image file.

## Install the system

<Etcher model="rock5c" />

## Booting the system

- After successfully burning the microSD card/eMMC as described above, insert the microSD card/eMMC into the microSD/eMMC slot of the ROCK 5C.
- The power connector of ROCK 5C is [USB Type C port](../hardware-design/hardware-interface), please use a Type-C cable to connect the power supply port and the adapter.

## Login System

The user accounts are created by default:

```bash
username: radxa
password: radxa
```

For more information, please refer to [Radxa OS](../radxa-os/)

## Reference Documentation

- [Install OS image to eMMC from USB OTG](../low-level-dev/install-os-via-usb-otg)
