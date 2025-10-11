---
sidebar_position: 8
---

# 资源汇总下载

## 系统镜像

:::tip 系统镜像说明
请根据自己的系统启动介质选择对应的系统镜像下载

- Phoenix 系统镜像需要进入 FEL 模式和使用 Phoenix 工具写入系统镜像
- 通用系统镜像可以通过 Balena Etcher 工具或者 `dd` 命令写入系统镜像
  :::

### Debian Linux

#### 通用系统镜像

适用于 MicroSD 卡和板载 UFS。

- [Radxa Cubie A7Z Debian 11](https://github.com/radxa-build/radxa-cubie-a7z/releases/download/rsdk-b1/radxa-cubie-a7z_bullseye_kde_b1.output_512.img.xz)

### Android

适用于 MicroSD 卡 / UFS 模块。

#### Phoenix 系统镜像

- [Radxa Cubie A7Z Android 13](https://github.com/radxa/allwinner-android-manifests/releases/download/A733-Android13-20250917/a733_android13_radxa_a7z_20250917_uart0.zip)

## 刷机工具

SD卡启动盘制作工具：

[PhoenixCard](https://dl.radxa.com/tools/windows/PhoenixCard_V4.3.1.zip)

系统烧录工具：

[PhoenixSuit](https://dl.radxa.com/tools/windows/PhoenixSuit_V2.0.4.zip) (Window)

[LiveSuit](https://dl.radxa.com/tools/linux/LiveSuit_Linux_V3.0.8.zip) (Linux)

## 硬件设计

- [原理图 V1.10](https://dl.radxa.com/cubie/a7z/docs/hw/radxa_Cubie_A7Z_v1100__schematic.pdf)
- [位号图 V1.10](https://dl.radxa.com/cubie/a7z/docs/hw/radxa_Cubie_A7Z_v1100_Components_Placement_map.pdf)

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
