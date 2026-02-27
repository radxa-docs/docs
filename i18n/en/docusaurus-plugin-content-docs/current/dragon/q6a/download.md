---
sidebar_position: 150
---

# Resource Downloads

## System Image

:::info Latest system image releases

- [Dragon Q6A](https://github.com/radxa-build/radxa-dragon-q6a/releases)

This page hosts the latest official and test system images. Test releases begin with `t`, and official releases begin with `r`.

:::

- Radxa OS

**Note**: When using R1 or higher version system images, please use SPI boot firmware version 20251230 or newer.

- [radxa-dragon-q6a_noble_gnome_r1.output_512.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-r1/radxa-dragon-q6a_noble_gnome_r1.output_512.img.xz): For booting from MicroSD card / USB drive / eMMC / NVMe
- [radxa-dragon-q6a_noble_gnome_r1.output_4096.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-r1/radxa-dragon-q6a_noble_gnome_r1.output_4096.img.xz): For booting from UFS

- [radxa-dragon-q6a_noble_gnome_r2.output_512.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-r2/radxa-dragon-q6a_noble_gnome_r2.output_512.img.xz): For booting from MicroSD card / USB drive / eMMC / NVMe
- [radxa-dragon-q6a_noble_gnome_r2.output_4096.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-r2/radxa-dragon-q6a_noble_gnome_r2.output_4096.img.xz): For booting from UFS

:::tip Firmware Information

You can determine the system SPI firmware version using the following methods:

1. Command Query

If the system can boot normally, you can use the following command to check the SPI boot firmware version:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo dmidecode -s bios-version
```

</NewCodeBlock>

The terminal will output something like the following. The `260120` portion indicates the SPI boot firmware date/version.

```text

6.0.260120.BOOT.MXF.1.0.1-00549-KODIAKWP-1

```

2. System Boot Issues

If the system fails to boot properly, you can try re-flashing the latest SPI boot firmware.

:::

## Boot Firmware

The Dragon Q6A comes with the SPI boot firmware pre-flashed by default. Under normal circumstances, it is not necessary to re-flash the boot firmware. If the system fails to boot properly, you can try re-flashing the SPI boot firmware.

For detailed steps on flashing the SPI boot firmware, please refer to the [Flashing SPI Boot Firmware](../q6a/low-level-dev/spi-fw/) tutorial.

- Qualcomm device driver

  - [Qualcomm device driver](https://dl.radxa.com/dragon/q6a/images/QUD_CustomInst_1.00.91.7.zip)

- EDL Tools

  - [EDL-NG](https://dl.radxa.com/q6a/images/edl-ng-dist.zip)

- SPI Boot Firmware

  - [flat_build_260120](https://dl.radxa.com/dragon/q6a/images/dragon-q6a_flat_build_wp_260120.zip)

## Hardware Design

- [Component Placement Diagram V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_components_placement_map_v1.21.pdf)

- [Schematic V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_schematic_v1.21.pdf)

- [2D Dimensions Diagram V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dimensions_v1.21.pdf)

- [2D DXF File V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dxf_v1.21.zip)

- [3D STEP File V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_3d_stp_v1.21.zip)
