---
sidebar_position: 4
---

# 瑞莎 CM5

## 产品介绍

Radxa CM5 是基于 Rockchip RK3588S 片上系统 (SoC) 的系统模块 (SoM)。Radxa CM5 集成了中央处理器 (CPU)、图形处理器 (GPU)、神经处理单元 (NPU)、电源管理单元 (PMU)、LPDDR4X DRAM Memory 和板载 eMMC 存储器，外形小巧，仅为 55mm x 40mm。RadxaCM5 为多种用途的应用提供了开箱即用的高性能解决方案，加速了客户的产品开发。

<Tabs queryString="target">
  <TabItem value="cm5" label="CM5 核心板">

#### 实物照片

- Radxa CM5
  ![Radxa CM5](/img/cm5/cm5-overview.webp)

#### 特性

| 类别                | 规格                                                                                                                                                                      |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 系统级芯片(SoC)     | Rockchip RK3588S2                                                                                                                                                         |
| 中央处理器(CPU)     | 四核 Cortex®‑A76 @ 2.2~2.4GHz 和四核 Cortex®‑A55 @ 1.8GHz<br/>基于 Arm® DynamIQ™ 配置                                                                                    |
| 图形处理器(GPU)     | Arm Mali™ G610MP4 GPU ‑ OpenGL® ES1.1、ES2.0 和 ES3.2 ‑ OpenCL®<br/>1.1、1.2 和 2.2 ‑ Vulkan® 1.1 和 1.2 ‑ 嵌入式高性能 2D<br/>图像加速模块                              |
| 神经网络处理器(NPU) | NPU 支持 INT4 / INT8 / INT16 / FP16 / BF16 和 TF32 加速，<br/>算力高达 6TOPs                                                                                            |
| 内存                | 1GB、2GB、4GB、8GB 或 16GB LPDDR4X（视 SKU 而定）                                                                                                                         |
| 存储                | 可选 4GB / 8GB / 16GB / 32GB，最高 512GB 板载 eMMC，兼容 eMMC 5.1<br />支持 SDMMC 接口用于数据存储和<br />通过 SD 卡启动操作系统                                          |

</TabItem>

<TabItem value="cm5-io-board" label="CM5 底板">

#### 实物照片

- Radxa CM5 + CM5-IO
  ![Radxa CM5 IO](/img/cm5/cm5-io-board-overview.webp)

#### 外设概述

- 1x USB3.0 Host
- 2x USB2.0 Host
- 1x Type-C
- 2x MIPI DSI
- 2x MIPI CSI
- 1x M.2 E Key
- 1x TF Card Slot
- 1x HDMI
- 1x Gigabit Ethernet
- 1x 40 PIN IO
- 1x Fan Header
- 2x LED Light
- 1x Power Input

</TabItem>

</Tabs>

### 供电

Radxa CM5 模块输入电压（VCC_SYSIN）范围为 3.6V-5.2V，在 4V 时效率最高。若输入电压达到或超过 5V，电压调节电路可能产生可闻的嗡鸣声。

典型工作电流为 2A。设计载板供电电路时，推荐使用 4V 3A 电源。

:::note
Rockchip 官方推荐为 RK806 PMU 提供 4V 电源，以确保最佳效率和峰值性能。使用 5V 电源可能降低效率，并可能导致 DC-DC 啸叫问题。
:::

### 芯片框图

![RK3588s block diagram](/img/cm5/rk3588s-block-diagram.webp)

### 系统框图

![Radxa CM5 block diagram](/img/cm5/cm5-block-diagram.webp)

## 文档使用指引

### [快速上手](/compute-module/cm5/getting-started)

介绍系统烧录，系统登录，配件使用等内容让用户能快速的上手使用。

### [Radxa OS](/compute-module/cm5/radxa-os)

瑞莎系统 (Radxa OS) 是 Radxa 基于Debian OS 定制的一套操作系统，这里主要介绍 系统登录，网络连接等内容，
方便用户快速的熟悉并使用系统。

### [Android](/compute-module/cm5/android)

主要介绍如何烧录、使用以及编译安卓系统。

### [硬件开发](/compute-module/cm5/hardware)

介绍硬件信息，例如硬件接口，支持的配件等。

### [配件](/compute-module/cm5/accessories)

介绍支持的配件型号及使用说明。
