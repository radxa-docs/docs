---
sidebar_position: 15
---

# Download Resources

## Loader Files

For USB flashing. The Loader file is used for USB download initialization.

- Loader: [rk3576_spl_loader.bin](https://dl.radxa.com/rock4/4d/images/rk3576_spl_loader.bin)

## System Images

Linux system images that can be directly written to a MicroSD card / UFS module / NVMe drive to boot the system.

- System image for MicroSD card / NVMe SSD / USB drive boot: [rk3576_bookworm_kde_512.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b1/radxa-rk3576_bookworm_kde_b1.output_512.img.xz)

- System image for UFS boot: [rk3576_bookworm_kde_4096.img.xz](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b1/radxa-rk3576_bookworm_kde_b1.output_4096.img.xz)

:::caution

1. Please download the appropriate system image file according to your system's boot medium. Using the wrong image will prevent the system from booting. The main difference between UFS images and regular images is that UFS images have a block size of 4K bytes, while regular images have a block size of 512 bytes.

2. The downloaded system images are compressed. Please make sure to extract them before writing to your MicroSD card / UFS module / NVMe drive.
   :::

## Hardware Design

- [Schematic](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SCH_V1.11.pdf)
- [Component Placement Map](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_SMD_V1.11.pdf)
- [3D Model](https://dl.radxa.com/rock4/4d/docs/hw/Radxa_ROCK_4D_3D_v1_11_20250328.stp)

## Reference Documents

- [Radxa ROCK 4D Feature Diagram](https://dl.radxa.com/rock4/4d/docs/ROCK4D_Quick_Features_EN.pdf)
- [Radxa ROCK 4D Product Brief](https://dl.radxa.com/rock4/4d/docs/radxa_rock4d_product_brief.pdf)
