---
sidebar_position: 2
---

import Images from "./\_image.mdx"

# Summary of Resource Downloads

## Loader file

[rk3528_spl_loader_v1.07.104.bin](https://dl.radxa.com/rock2/images/loader/rk3528_spl_loader_v1.07.104.bin)

## Operating System Image

debian xfce:

[https://github.com/radxa-build/rock-2/releases/download/b1/rock-2_bullseye_xfce_b1.output.img.xz](https://github.com/radxa-build/rock-2/releases/download/b1/rock-2_bullseye_xfce_b1.output.img.xz)

:::tip
This image is fully compatible with E20C, ROCK 2A, and ROCK 2F devices, all incorporating the RK3528 chip. To ensure compatibility:

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
