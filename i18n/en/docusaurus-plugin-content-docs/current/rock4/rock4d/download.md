---
sidebar_position: 15
---

# Resource Downloads

## Loader File Download

For USB flashing. The Loader file is used for USB download initialization.

- Loader: [rk3576_spl_loader.bin](https://dl.radxa.com/rock4/4d/images/rk3576_spl_loader.bin)

## SPI File Download

You can choose to download the corresponding `spi.img` file based on your system image and boot method.

:::tip
Linux System Image:

- The same `spi.img` file is used for booting from MicroSD card / NVMe SSD / USB drive / UFS module.

Android System Image:

- MicroSD card boot uses the same `spi.img` file as Linux
- UFS module boot requires erasing SPI Flash
- NVMe SSD boot requires flashing the Android-specific `spi.img` file to SPI Flash
  :::

#### Linux System Image

Radxa ROCK 4D comes with the Linux system's `spi.img` file pre-flashed to SPI Flash by default.

- spi.img

#### Android System Image

Note: Flashing the Android-specific `spi.img` file to SPI Flash is only required for NVMe SSD boot.

:::tip
For erasing and flashing SPI boot firmware, please refer to the [Erase/Flash SPI Boot Firmware](./low-level-dev/spi_flash) tutorial.
:::

- [spi.img](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20250528/Rock4D-Android14-nvme-spi.zip)

## System Image Downloads

#### Linux System Images

If you haven't cleared the SPI Flash, you can directly write the system image to a MicroSD card / UFS module / NVMe drive to boot the system.

- System image for MicroSD card / NVMe SSD / USB drive boot: [Linux-SD-NVME-UDisk.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b1/radxa-rk3576_bookworm_kde_b1.output_512.img.xz)

- System image for UFS boot: [Linux-UFS.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b1/radxa-rk3576_bookworm_kde_b1.output_4096.img.xz)

:::caution

1. Please download the appropriate system image file according to your system's boot medium. Using the wrong image will prevent the system from booting. The main difference between UFS images and regular images is that UFS images have a block size of 4K bytes, while regular images have a block size of 512 bytes.

2. The downloaded system images are compressed. Please make sure to extract them before writing to your MicroSD card / UFS module / NVMe drive.
   :::

#### Android System Images

- System image for MicroSD card boot: [Android-SD.zip](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20250528/Rock4d-Android14-rkr6-sd-20250527-gpt.zip)

- System image for UFS module boot: [Android-UFS.zip](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20250528/Rock4d-Android14-rkr6-ufs-20250527-gpt.zip)

- System image for NVMe boot: [Android-NVME.zip](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20250528/Rock4d-Android14-rkr6-nvme-20250527-gpt.zip)

## Hardware Design

- [Schematic](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SCH_V1.11.pdf)
- [Component Placement Diagram](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SMD_V1.11.pdf)
- [3D Model](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_3D_v1_11_20250328.stp)

## Reference Documents

- [Radxa ROCK 4D Feature Diagram](https://dl.radxa.com/rock4/4d/docs/ROCK4D_Quick_Features_EN.pdf)
- [Radxa ROCK 4D Product Brief](https://dl.radxa.com/rock4/4d/docs/radxa_rock4d_product_brief.pdf)
