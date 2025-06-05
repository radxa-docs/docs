---
sidebar_position: 15
---

# Resource Download

## Loader Download

For USB flashing, the Loader file is used for USB download initialization.

- Loader: [rk3576_spl_loader.bin](https://dl.radxa.com/rock4/4d/images/rk3576_spl_loader.bin)

## System Image Download

Linux system images that can be directly written to MicroSD card / UFS module / NVME to boot the system.

- System image for MicroSD card / NVME SSD / USB drive booting: [rk3576_bookworm_kde_512.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b1/radxa-rk3576_bookworm_kde_b1.output_512.img.xz)

- System image for UFS booting: [rk3576_bookworm_kde_4096.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b1/radxa-rk3576_bookworm_kde_b1.output_4096.img.xz)

:::caution

1. Please download the corresponding system image file based on your boot medium. Downloading the wrong image will prevent the system from booting. The main difference between UFS and regular images is that the UFS image has a block size of 4K bytes, while the regular image has a block size of 512 bytes.
2. The downloaded system image is compressed. Please decompress it before writing it to the MicroSD card/UFS module/NVME to boot the system.
   :::

## Hardware Design

- [Schematic](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SCH_V1.11.pdf)
- [Component Placement](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SMD_V1.11.pdf)
- [3D Model](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_3D_v1_11_20250328.stp)

## Reference Documents

- [Radxa ROCK 4D Feature Sheet](https://dl.radxa.com/rock4/4d/docs/ROCK4D_Quick_Features_EN.pdf)
- [Radxa ROCK 4D Product Brief](https://dl.radxa.com/rock4/4d/docs/radxa_rock4d_product_brief.pdf)
