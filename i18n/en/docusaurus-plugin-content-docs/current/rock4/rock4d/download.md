---
sidebar_position: 15
---

# Resource Downloads

## Loader File Downloads

Used for USB flashing. The Loader file is used for USB download initialization.

- Loader: [rk3576_spl_loader.bin](https://dl.radxa.com/rock4/4d/images/rk3576_spl_loader.bin)

## SPI File Downloads

The latest SPI image supports booting both Linux and Android systems.

:::tip

For erasing and flashing the SPI boot firmware, please refer to the [Erase/Flash SPI Boot Firmware](./low-level-dev/spi_flash) tutorial.

:::

- [spi.img](https://dl.radxa.com/rock4/4d/images/rock-4d-spi-flash-image.img)

## System Image Downloads

### Linux System Images

:::info Latest Image Release Page

- [ROCK 4D Linux System Images](https://github.com/radxa-build/radxa-rk3576/releases)

This page provides the latest stable and testing system images. Testing versions start with `t`, while stable releases start with `r`.

:::

If the SPI Flash has not been erased, you can directly write the system image to a MicroSD card / UFS module / NVMe / eMMC to boot the system.

- System image for booting from MicroSD card / NVMe SSD / USB drive / eMMC: [Linux-SD-NVME-UDisk.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b3/radxa-rk3576_bookworm_kde_b3.output_512.img.xz)

- System image for booting from UFS: [Linux-UFS.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b3/radxa-rk3576_bookworm_kde_b3.output_4096.img.xz)

:::caution

1. Please download the system image that matches your chosen boot media. Downloading the wrong image may result in the system failing to boot. The main difference between the UFS image and the normal image is that the UFS image uses a 4K byte block size, while the normal image uses a 512 byte block size.
2. The downloaded system images are compressed. Be sure to extract them before writing to the MicroSD card / UFS module / NVMe to boot the system.

:::

#### Android System Images

:::info Latest Image Release Page

- [ROCK 4D Android System Images](https://github.com/radxa/manifests/releases?q=4D&expanded=true)

:::

- System image for booting from MicroSD card: [Android-SD.zip](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20250528/Rock4d-Android14-rkr6-sd-20250527-gpt.zip)

- Update system image for booting from UFS module: [Android-UFS-update.zip](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20251014/Rock4d-Android14-rk6-gms-ufs-20251014-update.zip)

- GPT system image for booting from UFS module: [Android-UFS-gpt.zip](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20250528/Rock4d-Android14-rkr6-ufs-20250527-gpt.zip)

- System image for booting from NVMe: [Android-NVME.zip](https://github.com/radxa/manifests/releases/download/radxa-rock4d-20250528/Rock4d-Android14-rkr6-nvme-20250527-gpt.zip)

## Hardware Design

- [Schematic v1.11](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SCH_V1.11.pdf)
- [Schematic v1.12](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SCH_V1.12.pdf)
- [Component Placement v1.11](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SMD_V1.11.pdf)
- [Component Placement v1.12](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SMD_v1.12.pdf)
- [3D Model](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_3D_v1_11_20250328.stp)

## Reference Documents

- [Radxa ROCK 4D Feature Overview](https://dl.radxa.com/rock4/4d/docs/ROCK4D_Quick_Features_EN.pdf)
- [Radxa ROCK 4D Product Brief](https://dl.radxa.com/rock4/4d/docs/radxa_rock4d_product_brief.pdf)
