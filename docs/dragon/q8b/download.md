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

- [radxa-dragon-midstream_noble_gnome_t2.output_512.img.xz](https://github.com/radxa-build/radxa-dragon-midstream/releases/download/rsdk-t2/radxa-dragon-midstream_noble_gnome_t2.output_512.img.xz)：适用于 microSD 卡 / NVMe SSD 启动
- [radxa-dragon-midstream_noble_gnome_t2.output_4096.img.xz](https://github.com/radxa-build/radxa-dragon-midstream/releases/download/rsdk-t2/radxa-dragon-midstream_noble_gnome_t2.output_4096.img.xz)：适用于 UFS 启动

## 启动固件

Dragon Q8B 出厂默认烧录 SPI 启动固件，正常情况下无需烧录启动固件，若系统启动异常，可以尝试重新烧录 SPI 启动固件。

- 高通设备驱动
  - [高通设备驱动](https://dl.radxa.com/dragon/q6a/images/QUD_CustomInst_1.00.91.7.zip)

- EDL 工具
  - [EDL-NG](https://dl.radxa.com/q6a/images/edl-ng-dist.zip)

- SPI 启动固件（BIOS）
  - [启动固件（BIOS）](https://dl.radxa.com/dragon/q8b/images/)

## 硬件设计

- [位号图 V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_components_placement_map_v1.30.pdf)

- [原理图 V1.30](https://dl.radxa.com/dragon/q8b/hw/radxa_dragon_q8b_schematic_v1.30.pdf)
