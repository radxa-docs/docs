---
sidebar_position: 2
---

import Images from "./\_image.mdx"

# Summary of Resource Downloads

## Loader file

[rk3528_spl_loader_v1.07.104.bin](https://dl.radxa.com/rock2/images/loader/rk3528_spl_loader_v1.07.104.bin) (for debian)

[rock2a_android13_box_20240619_MiniLoader](https://github.com/radxa/manifests/releases/download/radxa-rock2a-20240726/rock2a_android13_box_20240619_MiniLoader.bin) (for Android)

## Operating System Image

Radxa OS:

[radxa-rk3528_bookworm_kde_r3.output_512.img.xz](https://github.com/radxa-build/radxa-rk3528/releases/download/rsdk-r3/radxa-rk3528_bookworm_kde_r3.output_512.img.xz)

Android13:

[rock2a_android13_box_20241230_gpt.img](https://github.com/radxa/manifests/releases/download/radxa-rock2a-20241230/ROCK2A_Android13_box_20241230_gpt.zip) (used to start from SD-Card)

[rock2a_android13_box_20241230_update.img](https://github.com/radxa/manifests/releases/download/radxa-rock2a-20241230/ROCK2A_Android13_box_20241230_update.zip) (used to start from EMMC)

:::tip
These image is fully compatible with E20C, ROCK 2A, and ROCK 2F devices, all incorporating the RK3528 chip. The compatible method is as follow:

- Each of these three products employs distinct pull-down resistors on a shared ADC pin.
- Each device comes with a predefined ADC range value.
- During the u-boot initialization phase, the appropriate device tree is dynamically selected based on the read ADC value, thereby achieving seamless compatibility across these platforms.
  :::

## Hardware Design

Radxa ROCK 2A V1.2 Version

[v1.2 2D pdf](https://dl.radxa.com/rock2/2a/v1.2/radxa_rock2a_v1.2_2d_dimension.zip)  
[v1.2 Schematic Diagram pdf](https://dl.radxa.com/rock2/2a/v1.2/radxa_rock_2a_v1.2_schematic.pdf)  
[v1.2 Component Placement Diagram pdf](https://dl.radxa.com/rock2/2a/v1.2/radxa_rock_2a_v1.2_components_placement_map.pdf)

## Quality Certification

## Reference Documents
