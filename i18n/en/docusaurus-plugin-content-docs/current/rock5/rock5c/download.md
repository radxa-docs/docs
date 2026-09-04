---
sidebar_position: 2
title: Resource Download
---

# Resource Download

import Images from "./\_image.mdx"

## Operating system images

### Official Operating System Image

<Images loader={true} system_img={true} lite_system_img={true} spi_img={false} android12_update={true} android12_gpt={true}  />

:::caution
Except for the above images which have been fully tested officially, the other images have not been rigorously tested and may have unknown issues and are for evaluation purposes only.
:::

:::note
Currently, only Android 12 is officially available for ROCK 5C.
:::

### Third-Party Operating System images

- [Radxa ROCK 5C Armbian](https://www.armbian.com/radxa-rock-5c/)

Default Armbian credentials:

| Item     | Value  |
| :------- | :----- |
| Username | `root` |
| Password | `1234` |

Kaihong OS Beta version firmware as follows:

- [Radxa ROCK 5C Kaihong OS for eMMC HDMI](https://github.com/radxa/KaihongOs/releases/download/kaihongos_v1.0_Beta/KHS_3588S_SBC-HDMI-EMMC-GPT-20260121-0329.zip): For booting from the eMMC module with HDMI display.
- [Radxa ROCK 5C Kaihong OS for eMMC MIPI](https://github.com/radxa/KaihongOs/releases/download/kaihongos_v1.0_Beta/KHS_3588S_SBC-MIPI-EMMC-GPT-20260121-0316.zip): For booting from the eMMC module with Radxa 8-inch display.
- [Radxa ROCK 5C Kaihong OS for microSD HDMI](https://github.com/radxa/KaihongOs/releases/download/kaihongos_v1.0_Beta/KHS_3588S_SBC-HDMI-SD-GPT-20260121-0346.zip): For booting from a microSD card with HDMI display.
- [Radxa ROCK 5C Kaihong OS for microSD MIPI](https://github.com/radxa/KaihongOs/releases/download/kaihongos_v1.0_Beta/KHS_3588S_SBC-MIPI-SD-GPT-20260121-0531.zip): For booting from a microSD card with Radxa 8-inch display.

## Software Tools

- [RK3588 Camera Tuner](https://dl.radxa.com/tools/windows/RK3588_Camera_Tuner_V2.10.zip): Rockchip RK3588 camera tuning tool for ISP parameter tuning on RK3588S2 series SoCs. Only applicable to ROCK 5C Standard Edition (RK3588S2); ROCK 5C Lite Edition (RK3582) should use a compatible tool.

## Hardware Design

### V2.1

- [Component Placement Map V2.10](https://dl.radxa.com/rock5/5c/docs/radxa_rock_5c_components_placement_map_v2.10.pdf)
- [Schematic V2.10](https://dl.radxa.com/rock5/5c/docs/radxa_rock_5c_schematic_v2.10.pdf)
- [2D Dimensions Diagram V2.10](https://dl.radxa.com/rock5/5c/docs/radxa_rock_5c_2d_dimensions_v2.10.pdf)
- [2D DXF Model File (Top) V2.10](https://dl.radxa.com/rock5/5c/docs/radxa_rock_5c_2d_top_v2.10.dxf.zip)
- [2D DXF Model File (Bottom) V2.10](https://dl.radxa.com/rock5/5c/docs/radxa_rock_5c_2d_bottom_v2.10.dxf.zip)
- [3D Model V2.10](https://dl.radxa.com/rock5/5c/docs/radxa_rock_5c_3d_stp_v2.10.stp.zip)

### V1.1

- [Component Placement Map V1.1](https://dl.radxa.com/rock5/5c/docs/hw/v1100/radxa_rock_5c_components_placement_map_v1100.pdf)
- [Schematic V1.1](https://dl.radxa.com/rock5/5c/docs/hw/v1100/radxa_rock_5c_schematic_v1100.pdf)
- [2D DXF Model File (Top & Bottom) V1.1](https://dl.radxa.com/rock5/5c/docs/hw/v1100/radxa_rock_5c_2d_dxf_v1100.zip)
- [3D Model V1.1](https://dl.radxa.com/rock5/5c/docs/hw/dimension/5c_pcba.stp.zip)
- [Bottom Dimensions Diagram V1.1](https://dl.radxa.com/rock5/5c/docs/hw/dimension/BOT_%5bRS131%5dRadxa%20ROCK%205C_V1.pdf)
- [Top Dimensions Diagram V1.1](https://dl.radxa.com/rock5/5c/docs/hw/dimension/TOP_%5bRS131%5dRadxa%20ROCK%205C_V1.pdf)
