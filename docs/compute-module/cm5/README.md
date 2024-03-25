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

| Features | Description                                                                                                                                                                   |
| -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SoC      | Rockchip RK3588S                                                                                                                                                              |
| CPU      | Quad Cortex®‑A76 @ 2.2~2.4GHz and a quad Cortex®‑A55 @ 1.8GHz<br/>based on Arm® DynamIQ™ configuration                                                                    |
| GPU      | Arm Mali™ G610MP4 GPU ‑ OpenGL® ES1.1, ES2.0, and ES3.2 ‑ OpenCL®<br/>1.1, 1.2 and 2.2 ‑ Vulkan® 1.1 and 1.2 ‑ Embedded high performance 2D<br/>image acceleration module |
| NPU      | NPU supporting INT4 / INT8 / INT16 / FP16 / BF16 and TF32 acceleration<br/>and computing power is up to 6TOPs                                                                 |
| Memory   | 1GB, 2GB, 4GB, 8GB or 16GB LPDDR4X (depending on SKU)                                                                                                                         |
| Storage  | Optional 4GB / 8GB / 16GB / 32GB, up to 512GB Onboard eMMC Compatible with eMMC 5.1<br />Supports SDMMC interface for data storage and OS booting using<br />SD cards         |

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
