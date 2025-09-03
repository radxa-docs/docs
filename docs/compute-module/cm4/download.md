---
sidebar_position: 10
---

# 资源汇总下载

## Loader 文件

USB 刷机使用，Loader 文件用于 USB 下载初始化。

- [rk3576_spl_loader.bin](https://dl.radxa.com/rock4/4d/images/rk3576_spl_loader.bin)

## 系统镜像

- Debian Linux

适用于 MicroSD 卡、板载 eMMC、NVMe SSD 启动系统。

[Radxa Debian12 Linux Debian KDE](https://github.com/radxa-build/radxa-rk3576/releases/download/rsdk-b3/radxa-rk3576_bookworm_kde_b3.output_512.img.xz)

:::caution

1. 请根据自己的系统启动介质下载对应系统镜像文件，下载错误的镜像会导致无法启动系统。
2. 下载的系统镜像是经过压缩的，请务必解压后再写入到系统启动介质。
   :::

## 硬件设计

### 瑞莎 CM4

- [原理图 V1.20](https://dl.radxa.com/cm4/docs/hw/radxa_cm4_schematic_v1.20.pdf)
- [位号图 V1.20](https://dl.radxa.com/cm4/docs/hw/radxa_cm4_components_placement_map_v1.20.pdf)
- [引脚定义表 V1.20](https://dl.radxa.com/cm4/docs/hw/radxa_cm4_pinout_v1.20.xlsx)
- [2D DXF 文件 V1.20](https://dl.radxa.com/cm4/docs/hw/radxa_cm4_2d_dxf_v1.20.zip)
- [3D STP 文件 V1.20](https://dl.radxa.com/cm4/docs/hw/radxa_cm4_3d_stp_v1.20.zip)

### 瑞莎 CM4 IO 板

- [原理图 V1.10](https://dl.radxa.com/cm4/cm4-io-board/docs/hw/radxa_cm4_io_schematic_v1.10.pdf)
- [位号图 V1.10](https://dl.radxa.com/cm4/cm4-io-board/docs/hw/radxa_cm4_io_components_placement_map_v1.10.pdf)
- [2D DXF 文件 V1.10](https://dl.radxa.com/cm4/cm4-io-board/docs/hw/radxa_cm4_io_2d_dxf_v1.10.zip)
- [3D STP 文件 V1.10](https://dl.radxa.com/cm4/cm4-io-board/docs/hw/radxa_cm4_io_3d_stp_v1.10.zip)

- [CM4 IO 板设计资料](https://github.com/radxa/radxa-cm-projects/tree/main/cm4/radxa-cm4-io-board)

## 刷机工具

- [Balena Etcher](https://etcher.balena.io/)

- [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

- [RKDevTool](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96-20221121.rar)
