---
sidebar_position: 8
---

# 资源汇总下载

## 系统镜像

- Ubuntu 系统镜像
  - [radxa-dragon-q6a_noble_kde_t2.output_512.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-t2/radxa-dragon-q6a_noble_kde_t2.output_512.img.xz)：适用于 MicroSD 卡 / U 盘 / eMMC / NVMe 启动系统
  - [radxa-dragon-q6a_noble_kde_t2.output_4096.img.xz](https://github.com/radxa-build/radxa-dragon-q6a/releases/download/rsdk-t2/radxa-dragon-q6a_noble_kde_t2.output_4096.img.xz)：适用于 UFS 启动系统

:::tip 最新系统镜像发布页面

- [Dragon Q6A](https://github.com/radxa-build/radxa-dragon-q6a/releases)

该页面会发布最新的正式版本和测试版本的系统镜像，测试版本以 `t` 开头，正式版本以 `b` 开头。

:::

## 启动固件

Dragon Q6A 出厂默认烧录 SPI 启动固件，正常情况下无需烧录启动固件，若系统启动异常，可以尝试重新烧录 SPI 启动固件。

烧录 SPI 启动固件的详细步骤参考 [烧录 SPI 启动固件](../q6a/low-dev/spi_fw/) 教程。

- EDL 驱动

  - [EDL 驱动](https://dl.radxa.com/dragon/q6a/images/QUD_CustomInst_1.00.91.7.zip)

- EDL 工具

  - [EDL-NG](https://dl.radxa.com/q6a/images/edl-ng-dist.zip)

- SPI 启动固件

  - [flat_build_251013](https://dl.radxa.com/dragon/q6a/images/dragon-q6a_flat_build_251013.zip)

:::tip 最新固件说明

1. 支持 eMMC 启动
2. 增加默认启动设备顺序：USB > SD > NVMe > eMMC > UFS
3. 增加启动设备选择
4. 加快启动速度

:::

## 硬件设计

- [位号图 V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_components_placement_map_v1.21.pdf)

- [原理图 V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_schematic_v1.21.pdf)

- [尺寸标注图 V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dimensions_v1.21.pdf)

- [2D DXF 文件 V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_2d_dxf_v1.21.zip)

- [3D STEP 文件 V1.21](https://dl.radxa.com/dragon/q6a/hw/radxa_dragon_q6a_3d_stp_v1.21.zip)
