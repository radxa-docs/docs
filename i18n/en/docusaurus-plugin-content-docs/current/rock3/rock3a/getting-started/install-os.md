---
sidebar_position: 2
---

import Etcher from '../../../common/general/\_etcher.mdx'

# Install the operating system

## Preparation

- 1x microSD card (capacity >=8GB)
- 1x microSD card reader
- 5V power adapter (recommended [Radxa Power PD30W](../accessories/pd-30w))

## Image Download

Please go to [Resource Download](/rock3/rock3a/getting-started/download) to download the corresponding image file.

## Install the system

<Etcher model="rock3a" />

## Start the system

- After successfully burning the microSD card as described above, insert the microSD card into the microSD slot of the Radxa ROCK 3A.
- The power supply interface of Radxa ROCK 3A is [USB 2.0 OTG Type C port](/rock3/rock3a/hardware-design/hardware-interface), please use Type-C cable to connect the power supply port and the adapter.

:::tip
Radxa ROCK 3A supports QC 3.0/2.0 adapter, 9V/2A, 12V/1.5A. Radxa recommends using the [Radxa Power PD30W](../accessories/pd-30w).
:::

## Reference Documentation

[Install OS image to eMMC](../low-level-dev/install-os-on-emmc)
