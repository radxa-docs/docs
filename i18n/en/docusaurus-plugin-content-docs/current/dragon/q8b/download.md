---
sidebar_position: 150
---

# Resource Downloads

## System Image

:::info Latest system image release page

- [Dragon Q8B](https://github.com/radxa-build/radxa-dragon-midstream/releases)

This page publishes the latest stable and test system images. Test releases start with `t`, and stable releases start with `r`.

:::

### Radxa OS

- [radxa-dragon-midstream_noble_gnome_t2.output_512. img.xz](https://github.com/radxa-build/radxa-dragon-midstream/releases/download/rsdk-t2/radxa-dragon-midstream_noble_gnome_t2.output_512.img.xz): Suitable for booting from a microSD card or NVMe SSD
- [radxa-dragon-midstream_noble_gnome_t2.output_4096.img.xz](https://github.com/radxa-build/radxa-dragon-midstream/releases/download/rsdk-t2/radxa-dragon-midstream_noble_gnome_t2.output_4096.img.xz): Suitable for booting from UFS

## Boot Firmware

Dragon Q8B ships with SPI boot firmware preinstalled. Normally you do not need to flash the boot firmware. If the system fails to boot properly, you can try reflashing the SPI boot firmware.

- Qualcomm Device Driver
  - [Qualcomm Device Driver](https://dl.radxa.com/dragon/q6a/images/QUD_CustomInst_1.00.91.7.zip)

- EDL Tool
  - [EDL-NG](https://dl.radxa.com/q6a/images/edl-ng-dist.zip)

- SPI Boot Firmware (BIOS)
  - [Boot Firmware (BIOS)](https://dl.radxa.com/dragon/q8b/images/)

## Hardware Design

- [Component Placement Diagram V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_components_placement_map_v1.30.pdf)

- [Schematic V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_schematic_v1.30.pdf)
