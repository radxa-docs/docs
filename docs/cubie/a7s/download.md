---
sidebar_position: 8
---

# 资源汇总下载

## 系统镜像

:::tip 新手入门推荐
我们强烈建议新手用户下载 GPT 格式的 Radxa OS 官方切换分支，并使用 [Balena Etcher](./getting-started/install-system/microsd) 工具将其安装到 MicroSD 卡中。这是最简单、最快捷的上手方式。

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

:::info A733 SoC 系统镜像发布页面

- [Radxa Cubie A7S](https://github.com/radxa-build/radxa-a733/releases)

该页面会发布最新的正式版本和测试版本的系统镜像，测试版本以 `t` 开头，正式版本以 `r` 开头（旧版本的正式版本以 `b` 开头）。

:::

- Radxa OS

[radxa-a733-bullseye-kde-r2](https://github.com/radxa-build/radxa-a733/releases/download/rsdk-r2/radxa-a733_bullseye_kde_r2.output_512.img.xz)：支持 MicroSD 卡和板载 eMMC 启动系统。

- Radxa OS Lite

:::tip

Radxa OS Lite 系统镜像不包含图形桌面环境。

如果你需要显示器、窗口界面或图形应用，请选择 Radxa OS 系统镜像。

:::

[radxa-a733-bullseye-cli-r2](https://github.com/radxa-build/radxa-a733/releases/download/rsdk-r2/radxa-a733_bullseye_cli_r2.output_512.img.xz)：支持 MicroSD 卡和板载 eMMC 启动系统。

## 硬件设计

- [原理图 V1.10](https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_schematic_v1.10.pdf)
- [位号图 V1.10](https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_components_placement_map_v1.10.pdf)
- [2D 尺寸](https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_2d_dimensions_v1.10.pdf)
- [2D 文件](https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_2d_v1.10.zip)
- [3D 文件](https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_3d_stp_v1.10.zip)

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
