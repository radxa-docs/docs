---
sidebar_position: 150
---

# 资源汇总下载

## 系统镜像

:::info 最新系统镜像发布页面

- [Dragon Q8B](https://github.com/radxa-build/radxa-dragon-midstream/releases)

该页面会发布最新的正式版本和测试版本的系统镜像，测试版本以 `t` 开头，正式版本以 `r` 开头。

:::

### Radxa OS

- [radxa-dragon-midstream_resolute_gnome_r5.output_512.img.xz](https://github.com/radxa-build/radxa-dragon-midstream/releases/download/rsdk-r5/radxa-dragon-midstream_resolute_gnome_r5.output_512.img.xz)：适用于 microSD 卡 / NVMe SSD 启动
- [radxa-dragon-midstream_resolute_gnome_r5.output_4096.img.xz](https://github.com/radxa-build/radxa-dragon-midstream/releases/download/rsdk-r5/radxa-dragon-midstream_resolute_gnome_r5.output_4096.img.xz)：适用于 UFS 启动

## 启动固件

Dragon Q8B 出厂默认烧录 SPI 启动固件，正常情况下无需烧录启动固件，若系统启动异常，可以尝试重新烧录 SPI 启动固件。

- 高通设备驱动
  - [高通设备驱动](https://dl.radxa.com/dragon/q6a/images/QUD_CustomInst_1.00.91.7.zip)

- EDL 工具

  :::info 最新 EDL 工具发布页面

  - [EDL-NG](https://github.com/strongtz/edl-ng/releases)

  该页面会发布最新版本的 EDL-NG 工具。

  :::

  - [EDL-NG v1.6.0（GitHub）](https://github.com/strongtz/edl-ng/releases/tag/v1.6.0)
  - [EDL-NG v1.6.0（dl.radxa.com）](https://dl.radxa.com/q6a/images/edl-ng-dist-v1.6.0.zip)

- SPI 启动固件（BIOS）

  :::info 最新 SPI 启动固件发布页面

  - [SPI 启动固件（BIOS）](https://dl.radxa.com/dragon/q8b/images/)

  该页面会发布最新版本的 SPI 启动固件，更新日志请查看 [SPI 启动固件更新日志](https://dl.radxa.com/dragon/q8b/images/dragon-q8b-bios-changelog.md)。

  :::

  - [启动固件（BIOS）](https://dl.radxa.com/dragon/q8b/images/dragon-q8b_flat_build_wp_260821.zip)

## Windows 驱动

- [Dragon Q8B Windows 驱动包 v1.0.0](https://dl.radxa.com/dragon/q8b/driver/dragon-q8b_win_driver_pack_v1.0.0.7z)：适用于在 Q8B 上安装 Windows 11 (ARM64)，具体安装步骤请参考 [Windows 11 (ARM64)](other-system/windows-11)

## 硬件设计

- [位号图 V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_components_placement_map_v1.30.pdf)

- [原理图 V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_schematic_v1.30.pdf)

- [尺寸标注图 V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_2d_dimensions_v1.30.pdf)

- [2D DXF 文件 V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_2d_dxf_v1.30.zip)

- [3D STEP 文件 V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_3d_stp_v1.30.zip)
