---
sidebar_position: 150
---

# Resource Downloads

## System Image

:::info Latest system image releases

- [Dragon Q6A](https://github.com/radxa-build/radxa-dragon-q6a/releases)

This page hosts the latest official and test system images. Test releases begin with `t`, and official releases begin with `r`.

:::

### Radxa OS

**Note**: When using R1 or higher version system images, please use [BIOS firmware](#boot-firmware) version 20251230 or newer.

- [radxa-dragon-q6a_noble_gnome_r2.output_512.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-r2/radxa-dragon-q6a_noble_gnome_r2.output_512.img.xz): For booting from microSD card / USB drive / eMMC / NVMe
- [radxa-dragon-q6a_noble_gnome_r2.output_4096.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-r2/radxa-dragon-q6a_noble_gnome_r2.output_4096.img.xz): For booting from UFS

:::note Usage note

The files above are compressed `.img.xz` system images. If your flashing tool cannot write `.xz` archives directly, extract the archive first to get the `.img` file, then flash that `.img` file.

For the complete procedure, see [Quick Start](./getting-started/quickly-start) or [Install System](./getting-started/install-system/).

:::

:::tip Firmware Information

You can determine the system BIOS firmware version using the following methods:

1. Command Query

If the system can boot normally, you can use the following command to check the BIOS firmware version:

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```bash
sudo dmidecode -s bios-version
```

</NewCodeBlock>

The terminal will output something like the following. The `260120` portion indicates the BIOS firmware date/version.

```text

6.0.260120.BOOT.MXF.1.0.1-00549-KODIAKWP-1

```

2. System Boot Issues

If the system fails to boot properly, you can try re-flashing the latest BIOS firmware.

:::

### Baidu Netdisk Download

:::tip
The Baidu Netdisk share link is regularly updated with the latest image files. It is recommended to download the latest images from Baidu Netdisk.

**Version Notes:**

- **R Version**: Tested stable version, recommended
- **T Version**: Test version (for evaluation only)
  :::

- [Baidu Netdisk Download (radxa-dragon-q6a)](https://pan.baidu.com/s/56vG8RCxe-5T_27AWQcREGA#list/path=%2Fsharelink3108273493-988411983016443%2Fimage-release%2Fradxa-dragon-q6a&parentPath=%2Fsharelink3108273493-988411983016443)

## Android 15

Android 15 currently only supports booting with BIOS firmware combined with eMMC module or UFS module.

Note: The BIOS firmware and system image are in the same compressed package. After downloading and extracting, you will get the system image file and BIOS firmware file.

### eMMC System Image

- [Android_15_eMMC_20260630-b1.7z](https://dl.radxa.com/q6a/images/android/Q6A-Android15-spi-emmc-boot-20260630-b1.7z)

### UFS System Image

Compared with the eMMC system image, flashing the UFS system image requires additionally flashing the UFS configuration file.

- [provision_ufs31.xml](https://dl.radxa.com/q6a/images/android/provision_ufs31.xml)
- [Android_15_UFS_20260630-b1.7z](https://dl.radxa.com/q6a/images/android/Q6A-Android15-spi-ufs-boot-20260630-b1.7z)

## Boot Firmware

The Dragon Q6A comes with the BIOS firmware pre-flashed by default. Under normal circumstances, it is not necessary to re-flash the boot firmware. If the system fails to boot properly, you can try re-flashing the BIOS firmware.

For detailed steps on flashing the BIOS firmware, please refer to the [Flashing BIOS Firmware](../q6a/low-level-dev/spi-fw/) tutorial.

- Qualcomm device driver

  - [Qualcomm device driver](https://dl.radxa.com/dragon/q6a/images/QUD_CustomInst_1.00.91.7.zip)

- EDL Tools

  :::info Latest EDL Tool Release Page

  - [EDL-NG](https://github.com/strongtz/edl-ng/releases)

  This page releases the latest versions of the EDL-NG tool.

  :::

  - [EDL-NG v1.6.0 (GitHub)](https://github.com/strongtz/edl-ng/releases/tag/v1.6.0)
  - [EDL-NG v1.6.0 (dl.radxa.com)](https://dl.radxa.com/q6a/images/edl-ng-dist-v1.6.0.zip)

- BIOS Firmware

  - [flat_build_260120](https://dl.radxa.com/dragon/q6a/images/dragon-q6a_flat_build_wp_260120.zip)

## Hardware Design

- [Component Placement Diagram V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_components_placement_map_v1.21.pdf)

- [Schematic V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_schematic_v1.21.pdf)

- [2D Dimensions Diagram V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dimensions_v1.21.pdf)

- [2D DXF File V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dxf_v1.21.zip)

- [3D STEP File V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_3d_stp_v1.21.zip)
