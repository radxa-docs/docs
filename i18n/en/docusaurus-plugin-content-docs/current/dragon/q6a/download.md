---
sidebar_position: 8
---

# Resource Downloads

## System Image

- Radxa OS
  - [radxa-dragon-q6a_noble_kde_t4.output_512.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-t4/radxa-dragon-q6a_noble_kde_t4.output_512.img.xz): For booting from MicroSD card / USB drive / eMMC / NVMe
  - [radxa-dragon-q6a_noble_kde_t4.output_4096.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-t4/radxa-dragon-q6a_noble_kde_t4.output_4096.img.xz): For booting from UFS

:::tip T4 Image and SPI Boot Firmware Notes

- **SPI Boot Firmware**

T4 and the latest system images require the latest SPI boot firmware.

1. If purchased before October 2025, you need to flash the latest [SPI boot firmware](../q6a/low-dev/spi_fw.md).

2. Use the command below to check the system BIOS version:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```
dmidecode -s bios-version
```

</NewCodeBlock>

The terminal will output something like the following. The `251013` portion indicates the SPI boot firmware date/version.

```
6.0.251013.BOOT.MXF.1.0.c1-00364-KODIAKLA-1
```

- **T4 Image Notes**

After successfully booting the system following the Quick Start guide, run the commands below to update packages and install the required Qualcomm platform toolchain and boot configuration components:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```
sudo apt update
sudo apt install -y task-qualcomm embloader sdboot-is-embloader
```

</NewCodeBlock>

:::

:::info Latest system image releases

- [Dragon Q6A](https://github.com/radxa-build/radxa-dragon-q6a/releases)

This page hosts the latest official and test system images. Test releases begin with `t`, and official releases begin with `r`.

:::

## Boot Firmware

The Dragon Q6A comes with the SPI boot firmware pre-flashed by default. Under normal circumstances, it is not necessary to re-flash the boot firmware. If the system fails to boot properly, you can try re-flashing the SPI boot firmware.

For detailed steps on flashing the SPI boot firmware, please refer to the [Flashing SPI Boot Firmware](../q6a/low-dev/spi_fw/) tutorial.

- Qualcomm device driver

  - [Qualcomm device driver](https://dl.radxa.com/dragon/q6a/images/QUD_CustomInst_1.00.91.7.zip)

- EDL Tools

  - [EDL-NG](https://dl.radxa.com/q6a/images/edl-ng-dist.zip)

- SPI Boot Firmware

  - [flat_build_251013](https://dl.radxa.com/dragon/q6a/images/dragon-q6a_flat_build_251013.zip)

:::tip Firmware update description

1. Support eMMC boot
2. Add default boot device order: USB > SD > NVMe > eMMC > UFS
3. Add boot device selection
4. Accelerate boot speed

:::

## Hardware Design

- [Component Placement Diagram V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_components_placement_map_v1.21.pdf)

- [Schematic V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_schematic_v1.21.pdf)

- [2D Dimensions Diagram V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dimensions_v1.21.pdf)

- [2D DXF File V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dxf_v1.21.zip)

- [3D STEP File V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_3d_stp_v1.21.zip)
