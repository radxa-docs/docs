---
sidebar_position: 2
---

import Etcher from '../../../common/general/\_etcher.mdx'

# Installing the operating system

## Preparation

- ROCK 5B motherboard

- High-capacity memory card (either one or the other):

  - microSD, greater than 8GB (for booting from SD)
  - eMMC Module, greater than 8GB, Radxa eMMC Module recommended (for booting from eMMC Module)
    <img src="/img/accessories/emmc-module.webp" alt="Radxa eMMC Module" width="300" />.

- Card Reader (either one or the other)

  - microSD card reader (for booting from SD)
  - eMMC card reader (for booting from eMMC Module).

- Power Supply

  - The ROCK 5B is powered by a Type-C connector with a wide range of input voltages from 5V to 21V.
  - ROCK 5B supports USB Type-C PD 2.0 with 9V/2A, 12V/2A, 15V/2A and 20V/2A.
  - The Type-C cable you use needs to support data communication. We call it USB Type-C charging data cable.
  - We recommend using the official Radxa Power PD 30W 。<img src="/img/accessories/pd-30w.webp" alt="Radxa Power PD 30W" width="300" />

- USB Keyboard and Mouse

  - The ROCK 5B features four USB-A ports for a full-size keyboard and mouse.

- Monitor and HDMI Cable

  - The ROCK 5B is equipped with a full-size HDMI connector. HDMI-enabled monitors are recommended.
  - HDMI EDID is used to determine the optimal display resolution. On monitors and TVs that support 1080p (or 4K/8K), this resolution will be selected. If 1080p is not supported, EDID will find the next available resolution. This selected mode applies to most monitors/TVs, but not all.

- USB to TTL Serial Cable

  - The ROCK 5B outputs a dedicated serial console for the CPU to access low-level debug messages.
  - Recommended Radxa USB to TTL Cable <img src="/img/accessories/usb-ttl.webp" alt="USB to TTL Cable" width="300" />.

## Image Download

Please go to [Resource Download Summary](./download) to download the corresponding image file.

## Install the system

<Etcher model="rock5b" />

## Booting the system

- After successfully burning the microSD card/eMMC as described above, insert the microSD card/eMMC into the microSD/eMMC slot of the ROCK 5B.
- The power connector of ROCK 5B is [USB 2.0 OTG Type C port](../hardware-design/hardware-interface), please use a Type-C cable to connect the power supply port and the adapter.

:::tip
The ROCK 5B supports USB Type-C PD 2.0 with 9V/2A, 12V/2A, 15V/2A and 20V/2A. Radxa recommends using the [Radxa Power PD30W](../accessories/pd-30W).
:::.

## Reference Documentation

- [Install OS image to eMMC from USB OTG](../low-level-dev/install-os-on-emmc-from-usb-otg)
- [Install OS image to NVME SSD](../low-level-dev/install-os-on-nvme)
