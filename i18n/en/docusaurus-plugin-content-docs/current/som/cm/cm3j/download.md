---
sidebar_position: 99
---

# Resource Download

## Official Bootloader and System Image

### SPL Loader

- [Loader: rk356x_spl_loader_ddr1056_v1.12.109_no_check_todly.bin](https://dl.radxa.com/cm3j/images/rk356x_spl_loader_ddr1056_v1.12.109_no_check_todly.bin)

### SPI Images

- [radxa-cm3j-spi-image](https://dl.radxa.com/cm3j/images/radxa-cm3j-rpi-cm4-io_spi.img)

- [zero image](https://dl.radxa.com/cm3j/images/zero.img)

### System Images

Debian OS:

- System Image: [Debian 12 (Bookworm) KDE](https://github.com/radxa-build/radxa-cm3j-rpi-cm4-io/releases/download/rsdk-r3/radxa-cm3j-rpi-cm4-io_bookworm_kde_r3.output_512.img.xz)

- System Image: [Debian b2](https://github.com/radxa-build/radxa-cm3j-rpi-cm4-io/releases/download/rsdk-b2/radxa-cm3j-rpi-cm4-io_bullseye_xfce_b2.output.img.xz)

## Software Tools

- [RKISP Tuner](https://dl.radxa.com/tools/windows/RKISP_Tuner_v2.3.7_Release.rar): Rockchip RK356X ISP tuning tool for camera debugging on RK3566 / RK3568 series products.

:::tip
When debugging RKISP effects on an RK356X platform with a Debian12 system, you need to manually update the [camera_engine_rkaiq](https://dl.radxa.com/tools/windows/camera_engine_rkaiq_rk3568_rkaiq_v6.9.0_arm64.deb) package in the system.
:::

## Hardware Design

- Datasheet

  [Raspberry CM4 IO Board Datasheet](https://datasheets.raspberrypi.com/cm4io/cm4io-datasheet.pdf)

- Schmatic

  [Radxa CM3J V1.2 Schematic](https://dl.radxa.com/cm3j/docs/hw/radxa_cm3j_schematic_v1.2_20250115.pdf)

- Bit Map

  [Radxa CM3J V1.2 Placement Map](https://dl.radxa.com/cm3j/docs/hw/radxa_cm3j_components_placement_map_v1.2_20250110.pdf)

- 3D File

  [radxa_cm3j_pcba_3d_v1_2_20250115](https://dl.radxa.com/cm3j/docs/hw/radxa_cm3j_pcba_3d_v1_2_20250115.stp)

- 2D File

  [radxa_cm3j_v1.2_2d_dxf](https://dl.radxa.com/cm3j/docs/hw/radxa_cm3j_v1.2_2d_dxf.zip)

- Core Board Connector PINOUT

  [Radxa CM3J V1.2 PinOut](https://dl.radxa.com/cm3j/docs/hw/radxa_cm3j_pinout_v1.2.xlsx)
