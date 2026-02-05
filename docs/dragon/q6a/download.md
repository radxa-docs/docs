---
sidebar_position: 150
---

# 资源汇总下载

## 系统镜像

:::info 最新系统镜像发布页面

- [Dragon Q6A](https://github.com/radxa-build/radxa-dragon-q6a/releases)

该页面会发布最新的正式版本和测试版本的系统镜像，测试版本以 `t` 开头，正式版本以 `r` 开头。

:::

- Radxa OS

**说明**：R1 正式版系统镜像需要使用 20251013 或更新版本的 SPI 启动固件。

- [radxa-dragon-q6a_noble_gnome_r1.output_512.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-r1/radxa-dragon-q6a_noble_gnome_r1.output_512.img.xz)：适用于 MicroSD 卡 / U 盘 / eMMC / NVMe 启动系统
- [radxa-dragon-q6a_noble_gnome_r1.output_4096.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-r1/radxa-dragon-q6a_noble_gnome_r1.output_4096.img.xz)：适用于 UFS 启动系统

:::tip 固件信息

可以根据以下方式判断系统 SPI 固件版本信息：

1. 购买时间

若是 2026 年购买的产品，出厂为 20251230 版本的启动固件，无需烧录更新 SPI 启动固件。

2. 命令查询

若系统可以正常启动，可以使用以下命令查询 SPI 启动固件版本信息：

<NewCodeBlock tip="radxa@dragon-q6a$" type="device">

```
dmidecode -s bios-version
```

</NewCodeBlock>

终端会输出类似信息：其中 251013 表示 SPI 启动固件的版本日期。

```

6.0.251013.BOOT.MXF.1.0.c1-00364-KODIAKLA-1

```

3. 系统启动异常

若系统无法正常启动，可以尝试重新烧录最新 SPI 启动固件。

:::

## 启动固件

Dragon Q6A 出厂默认烧录 SPI 启动固件，正常情况下无需烧录启动固件，若系统启动异常，可以尝试重新烧录 SPI 启动固件。

烧录 SPI 启动固件的详细步骤参考 [烧录 SPI 启动固件](../q6a/low-level-dev/spi-fw/) 教程。

- 高通设备驱动

  - [高通设备驱动](https://dl.radxa.com/dragon/q6a/images/QUD_CustomInst_1.00.91.7.zip)

- EDL 工具

  - [EDL-NG](https://dl.radxa.com/q6a/images/edl-ng-dist.zip)

- SPI 启动固件

  - [flat_build_260120](https://dl.radxa.com/dragon/q6a/images/dragon-q6a_flat_build_wp_260120.zip)

## 硬件设计

- [位号图 V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_components_placement_map_v1.21.pdf)

- [原理图 V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_schematic_v1.21.pdf)

- [尺寸标注图 V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dimensions_v1.21.pdf)

- [2D DXF 文件 V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dxf_v1.21.zip)

- [3D STEP 文件 V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_3d_stp_v1.21.zip)
