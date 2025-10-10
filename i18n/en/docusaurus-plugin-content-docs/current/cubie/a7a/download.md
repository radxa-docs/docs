---
sidebar_position: 8
---

# Resource Summary Download

## System Images

:::tip System Image Notes
Please select the appropriate system image for your system boot medium:

- Phoenix system images require entering FEL mode and using the Phoenix tool to write the system image.
- Generic system images can be written using the Balena Etcher tool or the `dd` command.
  :::

### Debian Linux

#### Generic System Image

Currently, only MicroSD cards, eMMC modules and UFS modules are supported for system boot. NVMe SSDs are under development!

- [Radxa Cubie A7A Debian 11](https://github.com/radxa-build/radxa-cubie-a7a/releases/download/rsdk-b1/radxa-cubie-a7a_bullseye_kde_b1.output_512.img.xz)

### Android

Suitable for MicroSD cards, eMMC modules and UFS modules.

#### Phoenix System Image

- [Radxa Cubie A7A Android 13](https://github.com/radxa/allwinner-android-manifests/releases/download/A733-Android13-20250814/a733_android13_radxa_a7a_20250814_uart0.zip)

## Flashing Tools

SD Card Boot Disk Creation Tool:

[PhoenixCard](https://dl.radxa.com/tools/windows/PhoenixCard_V4.3.1.zip)

System Flashing Tools:

[PhoenixSuit](https://dl.radxa.com/tools/windows/PhoenixSuit_V2.0.4.zip) (Windows)

[LiveSuit](https://dl.radxa.com/tools/linux/LiveSuit_Linux_V3.0.8.zip) (Linux)

## Hardware Design

- [Schematic V1.10](https://dl.radxa.com/cubie/a7a/docs/hw/radxa_cubie_a7a_v1.10_schematic.pdf)
- [Component Placement Map V1.10](https://dl.radxa.com/cubie/a7a/docs/hw/radxa_cubie_a7a_v1.10_Components_Placement_map.pdf)

## Reference Documentation

- [Tina5.0 AIoT Documentation](https://gitlab.com/tina5.0_aiot/product/docs/)

This document primarily introduces the hardware, software, tools, and mass production documentation for Tina5.0 AIoT based on Linux systems, serving as an important reference for development and mass production.
