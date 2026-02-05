---
sidebar_position: 150
---

# 资源汇总下载

## 系统镜像

:::tip 新手入门推荐
我们强烈建议新手用户下载 GPT 格式的 Radxa OS 官方切换分支，并使用 [Balena Etcher](./getting-started/install-system/sd-system.md) 工具将其安装到 MicroSD 卡中。这是最简单、最快捷的上手方式。

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

#### GPT 系统镜像（推荐）

:::tip A733 统一系统镜像

- [最新系统镜像发布页面](https://github.com/radxa-build/radxa-a733/releases)获取最新镜像

适合所有 A733 SoC 产品，如 Cubie A7Z、Cubie A7A 等，测试版本以 `t` 开头，正式版本以 `r` 开头。

:::

目前支持 MicroSD 卡/ eMMC 模块 / UFS 模块启动系统，NVMe/SSD 启动需要刷写 SPI Nor Flash 固件

- [Radxa Cubie A7A Debian 11 KDE R2](https://github.com/radxa-build/radxa-a733/releases/download/rsdk-r2/radxa-a733_bullseye_kde_r2.output_512.img.xz) （SD / eMMC）

- [Radxa Cubie A7A Debian 11 KDE R2](https://github.com/radxa-build/radxa-a733/releases/download/rsdk-r2/radxa-a733_bullseye_kde_r2.output_4096.img.xz) （UFS）

:::tip Cubie A7A 旧版镜像

- [Radxa Cubie A7A](https://github.com/radxa-build/radxa-cubie-a7a/releases)

该页面是 Cubie A7A 的旧版系统镜像，该页面目前已不再更新。

:::

### Android

适用于 MicroSD 卡/ eMMC 模块 / UFS 模块。

#### FEL 系统镜像

- [Radxa Cubie A7A Android 13](https://github.com/radxa/allwinner-android-manifests/releases/download/A733-Android13-20250814/a733_android13_radxa_a7a_20250814_uart0.zip)

## 刷机工具

SD卡启动盘制作工具：

[PhoenixCard](https://dl.radxa.com/tools/windows/PhoenixCard_V4.3.1.zip)

系统烧录工具：

[PhoenixSuit](https://dl.radxa.com/tools/windows/PhoenixSuit_V2.0.4.zip) (Windows)

[LiveSuit](https://dl.radxa.com/tools/linux/LiveSuit_Linux_V3.0.8.zip) (Linux)

## 硬件设计

- [原理图 V1.10](https://dl.radxa.com/cubie/a7a/docs/hw/radxa_cubie_a7a_v1.10_schematic.pdf)
- [位号图 V1.10](https://dl.radxa.com/cubie/a7a/docs/hw/radxa_cubie_a7a_v1.10_Components_Placement_map.pdf)

## 参考资料

### [Tina5.0 AIoT 文档](https://gitlab.com/tina5.0_aiot/product/docs/)

:::tip

[Tina5.0 AIoT 文档](https://gitlab.com/tina5.0_aiot/product/docs/) 以中文版本为主！

:::

该文档是全志 A 系列（A527、A733 等）与 T 系列（T527 等）芯片的配套技术支持文档体系，与 Tina5.0 AIoT 文档深度联动，覆盖芯片从 “硬件设计 → 软件开发 → 工具适配 → 量产落地” 的全生命周期，其核心目标用户包括：

1. 硬件工程师：支撑硬件方案设计与落地

2. Linux/AIoT 软件开发者：适配 Tina5.0 SDK 的驱动与应用开发

3. 产线技术人员：解决量产环节的实操问题

4. 合规采购人员：获取物料兼容性与环保认证信息

#### 硬件类文档

- 硬件物料清单

明确芯片兼容的核心物料范围，含 Camera 模组、LCD/eDP 屏幕、Wi-Fi/BT 模块、Input Sensor、DRAM、eMMC/NAND 存储等的支持列表与选型指导，确保选型准确性。

- 硬件设计资源

提供可直接复用的设计模板与规范，包括标案原理图、开发板 / 原型机原理图、PCB 参考模板、设计指南及硬件 Checklist，同时配套 IBIS 模型、PMIC 选型说明，直接支撑硬件落地开发。

- 芯片手册

提供芯片核心技术参数，含技术规格书（Datasheet）、引脚定义表（PINOUT）、用户操作手册（User Manual）、产品简介（Brief），部分芯片补充配套 PMIC 手册等。

#### 软件类文档

- SDK 模块开发指南

聚焦硬件接口驱动开发，包含 20 + 核心模块文档，如显示、音视频、存储与通信、高性能模块及系统基础，帮助开发者快速完成驱动适配。

- 基础组件开发指南

降低应用与系统配置门槛，涵盖系统部署、多媒体与图形、测试与工具、安全与异构，适配 AIoT 场景多样化需求。

#### 工具类文档

围绕 “提升开发效率、降低量产门槛”，提供工具生态与实操指南。

#### 量产类文档

针对产线实际痛点，提供全流程问题解决方案。

- 量产前验证指南：含物料验证流程、试量产稳定性 Checklist，帮助用户前置规避物料兼容、方案稳定性风险。

- 产线问题排查指南：覆盖启动烧写、MMC/eMMC 存储、IO 接口、显示、安全等核心场景的故障定位步骤，附典型问题案例与解决方案，提升产线问题解决效率。

- 量产流程规范：提供全志 T 系列芯片生产指南、ESD（静电防护）操作规范、不良品分析流程，明确生产各环节的标准操作与合规要求，保障量产过程的一致性与产品良率。
