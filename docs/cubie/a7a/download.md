---
sidebar_position: 8
---

# 资源汇总下载

## 系统镜像

:::tip 系统镜像说明
请根据自己的系统启动介质选择对应的系统镜像下载

- Phoenix 系统镜像需要进入 FEL 模式和使用 Phoenix 工具写入系统镜像
- 原始系统镜像可以通过 Balena Etcher 工具或者 `dd` 命令写入系统镜像
  :::

### Debian Linux

#### 原始系统镜像

目前仅支持 MicroSD 卡/ eMMC 模块启动系统，UFS 模块和 NVMe SSD 目前正在适配中！

- [Radxa Cubie A7A Debian 11](radxa-cubie-a7z_bullseye_kde_t5.output_512.img.xz)

### Android

适用于 MicroSD 卡/ eMMC 模块 / UFS 模块 / NVMe 固态硬盘。

#### Phoenix 系统镜像

- [Radxa Cubie A7A Android 13](https://github.com/radxa/manifests/releases/download/a733-radxa_a7a-v1.0/a733_android13_radxa_a7a_20250814_uart0.zip)

## 刷机工具

SD卡启动盘制作工具：

[PhoenixCard](https://dl.radxa.com/tools/windows/PhoenixCard_V4.3.1.zip)

系统烧录工具：

[PhoenixSuit](https://dl.radxa.com/tools/windows/PhoenixSuit_V2.0.4.zip) (Window)

[LiveSuit](https://dl.radxa.com/tools/linux/LiveSuit_Linux_V3.0.8.zip) (Linux)

## 硬件设计

- [原理图 V1.10](https://dl.radxa.com/cubie/a7a/docs/hw/radxa_cubie_a7a_v1.10_schematic.pdf)
- [位号图 V1.10](https://dl.radxa.com/cubie/a7a/docs/hw/radxa_cubie_a7a_v1.10_Components_Placement_map.pdf)
