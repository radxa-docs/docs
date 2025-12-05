---
sidebar_position: 5
---

# Resource download summary

## Hardware design

### 1.3 (Final prototype version)

- [v1.3 schematic pdf](https://dl.radxa.com/zero/docs/hw/RADAX_ZERO_V13_SCH_20210309.pdf) - Download Schematic for Radxa ZERO v1.3
- [v1.3 SMD pdf](https://dl.radxa.com/zero/docs/hw/RADAX_ZERO_V13_SMD_20210309.pdf) - Download Points Chart for Radxa ZERO v1.3

### 1.4 (First production version)

- [v1.4 schematic pdf](https://dl.radxa.com/zero/docs/hw/radxa_zero_v1400_schematic.pdf) - Download Schematic for Radxa ZERO v1.4
- [v1.4 SMD pdf](https://dl.radxa.com/zero/docs/hw/radxa_zero_v1400_smd.pdf) - Download Points Chart for Radxa ZERO v1.4
- [2D dxf for top and bottom](https://dl.radxa.com/zero/docs/hw/radxa_zero_v1400_2d.zip) - Download 2D CAD file for Radxa ZERO v1.4

- Corrected footprint for TYPE-C connectors
- Reduced footprint of ESD0402
- Separated 1L2 and 1L4 to reduce the possibility of circuit shorting
- Replaced FUSB340 with CH482
- Power LED can now be controlled by GPIOAO_8, therefore pin 35 (GPIOAO_8) is not connected to the 40-pin header

### 1.5 (Fine tune)

- Switch to other USB configuration channel controllers due to chip shortage

### 1.51 (Fine tune)

- [v1.51 schematic pdf](https://dl.radxa.com/zero/docs/hw/v1510/radxa_zero_v1.51_schematic.pdf) - Download Schematic for Radxa ZERO v1.51
- [v1.51 SMD pdf](https://dl.radxa.com/zero/docs/hw/v1510/radxa_zero_v1.51_components_placement_map.pdf) - Download Points Chart for Radxa ZERO v1.51
- [2D dxf for top and bottom](https://dl.radxa.com/zero/docs/hw/v1510/radxa_zero_v1.51_2d_dxf.zip) - Download 2D CAD file for Radxa ZERO v1.51

- Power LED can now be controlled by GPIOAO_10, therefore pin 35 (GPIOAO_8) is now connected to the 40-pin header, pin 38 (GPIOAO_10) is now not connected to the 40-pin header

## Flash Tools

- [Zagdig](https://zadig.akeo.ie/): Windows Maskrom Driver.
- [RZ USB Boot Helper](https://dl.radxa.com/zero/tools/windows/RZ_USB_Boot_Helper_V1.0.0.zip): Windows bootloader Load Tool.
- [factory-loader.img](https://dl.radxa.com/zero/images/loader/factory-loader.img): Used to erase eMMC on Windows. not recommended.
- [radxa-zero-erase-emmc.bin](https://dl.radxa.com/zero/images/loader/radxa-zero-erase-emmc.bin): Automatically erases the eMMC and then displays the eMMC as a USB storage device. This is the recommended method for burning Linux images.
- [rz-fastboot-loader.bin](https://dl.radxa.com/zero/images/loader/rz-fastboot-loader.bin): Enables fastboot mode, but cannot be used to install our official Android system.
- [android-bootloader.img](https://dl.radxa.com/zero/images/loader/android-bootloader.img): Same as bootloader.img in our official Android image. Some distributions use this bootloader.
- [rz-udisk-loader.bin](https://dl.radxa.com/zero/images/loader/rz-udisk-loader.bin): Embedded eMMC as a USB mass storage device.

## OS image

- [Radxa ZERO Debian Build 23](https://github.com/radxa-build/radxa-zero/releases/download/b23/radxa-zero_debian_bullseye_kde_b23.img.xz)

:::caution
Except for the above image which has been fully tested by the officials, the other images have not been rigorously tested and may have unknown issues and are for evaluation use only.
:::

For more images, check out: [third-party system images](../other-os/3rd-images)

### Third-Party Operating System images

- [Radxa ZERO Armbian](https://www.armbian.com/radxa-zero/)

Default Armbian credentials:

| Item     | Value  |
| :------- | :----- |
| Username | `root` |
| Password | `1234` |

- [Radxa ZERO DietPi](https://dietpi.com/downloads/images/DietPi_RadxaZero-ARMv8-Bookworm.img.xz)

## Quality certification

- [CE RED - EU](https://dl.radxa.com/zero/docs/compliance/radxa_zero_ce_red_report.zip)
- [FCC ID - US](https://fccid.io/2A3PA-RADXA-ZERO)
