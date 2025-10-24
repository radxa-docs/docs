---
sidebar_position: 8
---

# Resource Downloads

## System Image

- Ubuntu System Images
  - [radxa-dragon-q6a_noble_kde_t2.output_512.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-t2/radxa-dragon-q6a_noble_kde_t2.output_512.img.xz): For booting from MicroSD card / USB drive / eMMC / NVMe
  - [radxa-dragon-q6a_noble_kde_t2.output_4096.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-t2/radxa-dragon-q6a_noble_kde_t2.output_4096.img.xz): For booting from UFS

:::tip Latest System Image Releases

- [Dragon Q6A](https://github.com/radxa-build/radxa-dragon-q6a/releases)

This page publishes the latest stable and beta system images. Beta versions start with `t`, and stable versions start with `b`.

:::

## Boot Firmware

The Dragon Q6A comes with the SPI boot firmware pre-flashed by default. Under normal circumstances, it is not necessary to re-flash the boot firmware. If the system fails to boot properly, you can try re-flashing the SPI boot firmware.

For detailed steps on flashing the SPI boot firmware, please refer to the [Flashing SPI Boot Firmware](../q6a/low-dev/spi_fw/) tutorial.

- EDL Driver

  - [EDL Driver](https://dl.radxa.com/dragon/q6a/images/QUD_CustomInst_1.00.91.7.zip)

- EDL Tools

  - [EDL-NG](https://dl.radxa.com/q6a/images/edl-ng-dist.zip)

- SPI Boot Firmware

  - [flat_build_251013](https://dl.radxa.com/dragon/q6a/images/dragon-q6a_flat_build_251013.zip)

:::tip Firmware update description

1. Support eMMC boot
2. Add default boot device order: USB > SD > NVMe > eMMC > UFS > USB
3. Add boot device selection
4. Accelerate boot speed

:::

## Hardware Design

- [Component Placement Diagram V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_components_placement_map_v1.21.pdf)

- [Schematic V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_schematic_v1.21.pdf)

- [2D Dimensions Diagram V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dimensions_v1.21.pdf)

- [2D DXF File V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dxf_v1.21.zip)

- [3D STEP File V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_3d_stp_v1.21.zip)
