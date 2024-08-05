---
sidebar_position: 2
---

# Download

## Loader

[rk3528_spl_loader_v1.07.104.bin](https://dl.radxa.com/rock2/images/loader/rk3528_spl_loader_v1.07.104.bin)

## System Image

debian xfce:

[https://github.com/radxa-build/rock-2/releases/download/b1/rock-2_bullseye_xfce_b1.output.img.xz](https://github.com/radxa-build/rock-2/releases/download/b1/rock-2_bullseye_xfce_b1.output.img.xz)

:::tip
This image is fully compatible with E20C, ROCK 2A, and ROCK 2F devices, all incorporating the RK3528 chip. To ensure compatibility:

- Each of these three products employs distinct pull-down resistors on a shared ADC pin.
- Each device comes with a predefined ADC range value.
- During the u-boot initialization phase, the appropriate device tree is dynamically selected based on the read ADC value, thereby achieving seamless compatibility across these platforms.
  :::

## Hardware

Radxa ROCK 2F V1.0

[Schematic v1.0 pdf](https://dl.radxa.com/rock2/2f/radxa_rock2f_v1.01_schematic.pdf)  
[Components Placement Map v1.0 pdf](https://dl.radxa.com/rock2/2f/radxa_rock2f_v1.01_components_placement_map.pdf)

## Quality Certification

## Reference
