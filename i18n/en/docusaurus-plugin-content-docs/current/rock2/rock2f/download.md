---
sidebar_position: 2
---

# Download

## Loader

[rk3528_spl_loader_v1.07.104.bin](https://dl.radxa.com/rock2/images/loader/rk3528_spl_loader_v1.07.104.bin)

## System Image

- Radxa OS

[radxa-rk3528_bookworm_kde_r3.output_512.img.xz](https://github.com/radxa-build/radxa-rk3528/releases/download/rsdk-r3/radxa-rk3528_bookworm_kde_r3.output_512.img.xz)

:::tip
This image is fully compatible with E20C, ROCK 2A, and ROCK 2F devices, all incorporating the RK3528 chip. The compatible method is as follow:

- Each of these three products employs distinct pull-down resistors on a shared ADC pin.
- Each device comes with a predefined ADC range value.
- During the u-boot initialization phase, the appropriate device tree is dynamically selected based on the read ADC value, thereby achieving seamless compatibility across these platforms.
  :::

- Android

[Radxa ROCK 2F Android 13 MicroSD and eMMC Image](https://github.com/radxa/manifests/releases/download/radxa-rock2a-20241230/ROCK2A_Android13_box_20241230_gpt.zip)：Suitable for booting from MicroSD card or onboard eMMC.

:::tip
ROCK 2A and ROCK 2F use the same Android image.
:::

Armbian:

[Armbian](https://www.armbian.com/rock-2a/) (Including Ubuntu and Debian systems)

## Hardware

Radxa ROCK 2F V1.0

[Schematic v1.0 pdf](https://dl.radxa.com/rock2/2f/radxa_rock2f_v1.01_schematic.pdf)

[Components Placement Map v1.0 pdf](https://dl.radxa.com/rock2/2f/radxa_rock2f_v1.01_components_placement_map.pdf)

[3D v1.0 stp](https://dl.radxa.com/rock2/2f/2F_pcba_20240401.zip)

## Quality Certification

## Reference
