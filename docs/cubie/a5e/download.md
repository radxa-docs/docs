---
sidebar_position: 8
---

# 资源汇总下载

## 系统镜像

:::tip 新手入门推荐
我们强烈建议新手用户下载 GPT 格式的 Radxa OS 官方切换分支，并使用 [Balena Etcher](./getting-started/quickly-started#安装系统镜像) 工具将其安装到 MicroSD 卡中。这是最简单、最快捷的上手方式。

**镜像类型说明**

- GPT 系统镜像（推荐新手）：

  - 适用于 MicroSD 卡或 NVMe SSD
  - 使用 Balena Etcher 图形化工具，操作简单
  - 支持 `dd` 命令行烧录
  - 瑞莎推荐的镜像类型，兼容性最佳

- FEL 系统镜像：
  - 通过 FEL 模式和 Phoenix 工具进行烧录
  - 主要用于板载 eMMC 存储安装
  - 适用于设备修复和批量生产
  - 需要一定技术基础

:::

### Debian Linux

#### GPT 系统镜像 (推荐)

- [Radxa OS - Debian 11 Bullseye KDE](https://github.com/radxa-build/radxa-cubie-a5e/releases/download/rsdk-b1/radxa-cubie-a5e_bullseye_kde_b1.output_512.img.xz)
- [Tina Linux - Debian 11 Bullseye XFCE](https://mega.nz/file/g7AWVBZJ#xkDOIJYHvgUngdKUgW7D_aSaVPifyYZDOG0fUOtgAMk)

#### FEL 系统镜像

- [Tina Linux - Debian 11 XFCE](https://mega.nz/file/g7AWVBZJ#xkDOIJYHvgUngdKUgW7D_aSaVPifyYZDOG0fUOtgAMk)

### Android

#### FEL 系统镜像

- [Android 13](https://mega.nz/file/NjxmXBbT#EaY4bTCNCKTWp8e9r9q2da9EijEovJdlJx_7_xXP-akk)

## 刷机工具

- **[Balena Etcher](https://etcher.balena.io/)** (Windows / Linux / macOS)

  - 适用于 GPT 系统镜像
  - 界面友好，操作简单
  - 自动校验镜像完整性
  - 最适合将系统安装到 MicroSD 卡或 NVMe SSD

- **[PhoenixSuit (Windows)](https://dl.radxa.com/tools/windows/PhoenixSuit_V2.0.4.zip)** / **[LiveSuit (Linux)](https://dl.radxa.com/tools/linux/LiveSuit_Linux_V3.0.8.zip)**

  - 适用于 FEL 系统镜像
  - 通过 USB-C 数据线连接主板
  - 可直接烧录到 eMMC 存储
  - 需要一定技术基础

- **[PhoenixCard](https://dl.radxa.com/tools/windows/PhoenixCard_V4.3.1.zip)** (Windows)
  - 支持 FEL 固件制作可启动 MicroSD 卡
  - 可用于批量生产场景

## 硬件设计

- [原理图 V1.20](https://dl.radxa.com/cubie/a5e/docs/hw/v1.2/radxa_cubie_a5e_schematic_v1.2_20250113.pdf)
- [位号图 V1.20](https://dl.radxa.com/cubie/a5e/docs/hw/v1.2/radxa_cubie_a5e_components_placement_map_v1.2_20250113.pdf)
- [3D 文件 V1.20](https://dl.radxa.com/cubie/a5e/docs/hw/v1.2/radxa_cubie_a5e_pcba_3d_v1.2_stp_20250224.zip)

## 参考资料

- [Tina5.0 AIoT 文档](https://gitlab.com/tina5.0_aiot/product/docs/)

该文档主要介绍 Tina5.0 AIoT 领域基于 Linux 系统的相关硬件、软件、工具以及量产文档，是开发和量产的重要参考。
