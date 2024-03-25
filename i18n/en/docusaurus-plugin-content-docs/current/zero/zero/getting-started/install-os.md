---
sidebar_position: 2
---

import Etcher from '../../../common/general/\_etcher.mdx'

# Install OS

## Preparations

- ZERO

- Mass storage device:

  - microSD, greater than 8GB, (for booting from SD)

- Card Reader

  - microSD card reader (for booting from SD)

- Power supply

  - The ZERO is powered by a Type-C connector with an input voltage of 5V, recommended to use a power adapter with a rated maximum current greater than 2A.
  - The official [Radxa Power PD 30W](../accessories/pd-30w) is recommended. <img src="/img/accessories/pd-30w.webp" alt="Radxa Power PD 30W" width="300" />

- USB Keyboard and Mouse

  - ZERO comes with two Type-C ports for a full-size keyboard and mouse via USB Hub.

- Monitor and HDMI cable

  - The ZERO is equipped with a micro HDMI connector. It is recommended to use a monitor that supports HDMI.

- USB to TTL Serial Cable

  - ZERO outputs a dedicated serial console for the CPU to access low level debug messages.
  - Recommended Radxa USB to TTL Cable <img src="/img/accessories/usb-ttl.webp" alt="USB to TTL Cable" width="300" />.

## Image download

Please go to [Download Summary](./download) to download the corresponding image file.

## Installation system

<Etcher model="zero" />

## Booting the System

- After successfully flashing the microSD card according to the above steps, insert the microSD card into the microSD slot of the ZERO.
- The power supply interface of ZERO is [USB OTG](../hardware-design/hardware-interface), please use a Type-C cable to connect the power port and the adapter.

:::tip
The ZERO power supply supports 5V, recommended to use a power adapter with a rated maximum current greater than 2A. radxa recommends using the [Radxa Power PD30W](../accessories/pd-30w).
:::.

## Reference Documentation

- [Install OS image to eMMC from USB OTG port](../low-level-dev/install-os-on-emmc)
