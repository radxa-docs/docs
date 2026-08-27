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

- [radxa-dragon-midstream_resolute_gnome_r5.output_512.img.xz](https://github.com/radxa-build/radxa-dragon-midstream/releases/download/rsdk-r5/radxa-dragon-midstream_resolute_gnome_r5.output_512.img.xz): Suitable for booting from a microSD card or NVMe SSD
- [radxa-dragon-midstream_resolute_gnome_r5.output_4096.img.xz](https://github.com/radxa-build/radxa-dragon-midstream/releases/download/rsdk-r5/radxa-dragon-midstream_resolute_gnome_r5.output_4096.img.xz): Suitable for booting from UFS

### Third-party OS Images

:::tip
To boot a third-party OS (such as Ubuntu, Fedora, or Debian), enable all the features in [Third-party OS Compatibility Settings](low-level-dev/bios#third-party-os-compatibility-settings) in the BIOS.
:::

## Boot Firmware

Dragon Q8B ships with SPI boot firmware preinstalled. Normally you do not need to flash the boot firmware. If the system fails to boot properly, you can try reflashing the SPI boot firmware.

- Qualcomm Device Driver
  - [Qualcomm Device Driver](https://dl.radxa.com/dragon/q6a/images/QUD_CustomInst_1.00.91.7.zip)

- EDL Tool

  :::info Latest EDL Tool Release Page

  - [EDL-NG](https://github.com/strongtz/edl-ng/releases)

  This page releases the latest versions of the EDL-NG tool.

  :::

  - [EDL-NG v1.6.0 (GitHub)](https://github.com/strongtz/edl-ng/releases/tag/v1.6.0)
  - [EDL-NG v1.6.0 (dl.radxa.com)](https://dl.radxa.com/q6a/images/edl-ng-dist-v1.6.0.zip)

- SPI Boot Firmware (BIOS)

  :::info Latest SPI Boot Firmware Release Page

  - [SPI Boot Firmware (BIOS)](https://dl.radxa.com/dragon/q8b/images/)

  This page releases the latest versions of the SPI boot firmware. For the changelog, see [SPI Boot Firmware Changelog](https://dl.radxa.com/dragon/q8b/images/dragon-q8b-bios-changelog.md).

  :::

  - [Boot Firmware (BIOS)](https://dl.radxa.com/dragon/q8b/images/dragon-q8b_flat_build_wp_260821.zip)

## Windows Driver

- [Dragon Q8B Windows Driver Pack v1.0.0](https://dl.radxa.com/dragon/q8b/driver/dragon-q8b_win_driver_pack_v1.0.0.7z): For installing Windows 11 (ARM64) on the Q8B. For installation steps, refer to [Windows 11 (ARM64)](other-system/windows-11)

## Hardware Design

- [Component Placement Diagram V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_components_placement_map_v1.30.pdf)

- [Schematic V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_schematic_v1.30.pdf)

- [2D Dimensions Diagram V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_2d_dimensions_v1.30.pdf)

- [2D DXF File V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_2d_dxf_v1.30.zip)

- [3D STEP File V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_3d_stp_v1.30.zip)
