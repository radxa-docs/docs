---
sidebar_position: 4
---

# 瑞莎 Cubie A7S

## 产品概述

瑞莎 Cubie A7S 是一款面向边缘 AI 与嵌入式场景的口袋级高性能单板计算机。

基于全志 A733，在 51 × 51 mm 的超紧凑尺寸内集成 8 核 CPU、3 TOPS NPU、LPDDR5 与 PCIe NVMe 扩展，在性能、功耗与体积之间实现出色平衡。

采用 2× Cortex‑A76 + 6× Cortex‑A55 异构八核（最高 2.0 GHz），配合 3 TOPS@INT8 NPU，可高效运行端侧 AI 推理。支持 USB‑C DisplayPort 4K 输出、4K 编解码与多媒体/视觉处理，适用于 AI 视觉、智能终端与人机交互等场景。

连接性方面，提供千兆以太网、Wi‑Fi 6 与 Bluetooth 5.4，并通过 PCIe 3.0 x1 扩展 NVMe SSD，实现高速且可扩展的存储能力。

## 产品外观

| 位置 |       视图       | 位置 |       视图       | 位置 |       视图       |
| :--: | :--------------: | :--: | :--------------: | :--: | :--------------: |
|  左  | Cubie A7S 正视图 |  中  | Cubie A7S 背视图 |  右  | Cubie A7S 侧视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7s/cubie-a7s-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 包装清单

| 数量 | 部件            |
| :--: | :-------------- |
|  1   | 瑞莎 Cubie A7S  |
|  1   | WiFi / 蓝牙天线 |

## 产品规格

| 类别           | 规格                                                                                                                                                             |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 主控           | 全志 A733                                                                                                                                                        |
| 中央处理器     | 2 核 Cortex-A76 + 6 核 Cortex-A55，最高 2.0 GHz                                                                                                                  |
| 图形处理器     | Imagination PowerVR BXM-4-64 MC1<br />- 支持 OpenGL ES 1.1, 2.0 and 3.x, OpenCL 3.0, Vulkan 1.3                                                                  |
| 神经网络处理器 | 3 TOPS@INT8<br />- 支持 INT4 / INT8 / INT16 / FP16 / BF16 等计算精度<br />- 支持 TensorFlow, Caffe, Tflite, Pytorch, Onnx, Darknet 等深度学习框架                |
| 微控制器       | RISC-V 玄铁 E902，最高 200 MHz                                                                                                                                   |
| 内存           | LPDDR5<br />- 最高可选 16 GB                                                                                                                                     |
| 视频编解码     | 视频编码<br />- H.264 / H.265 编码，最高支持 4K@30fps<br />视频解码<br />- H.265 / VP9 / AVS2 解码，最高支持 4K@60fps<br />- H.264 解码，最高支持 4K@30fps       |
| 存储           | 可选 eMMC<br />- 最大可选 256GB<br />1X MicroSD 卡槽                                                                                                             |
| 网络           | 1X 千兆以太网<br />板载 Wi‑Fi 6 & BT5.4 模组<br />- 1X 天线接口                                                                                                  |
| 显示           | 1X USB‑C 接口，支持 DisplayPort Alt 模式，最高 4Kp60                                                                                                             |
| 摄像头         | 1X MIPI 摄像头（4 通道）                                                                                                                                         |
| USB            | 1X USB Type-C (USB 3.2, 支持 DisplayPort Alt 模式和 OTG 功能)<br />1X USB Type-C (USB 2.0, 支持 5V 供电和 OTG 功能)<br />1X USB Type-A (USB 2.0, 支持 HOST 模式) |
| PCIe           | 1X FPC 接口 (PCIe 3.0 x1)<br />- 支持拓展 NVMe 固态硬盘                                                                                                          |
| 其他接口       | 1X 风扇接口<br />1X USB BOOT 按键 <br />15-Pin 和 30-Pin GPIO 排针<br />- 支持 UART, I2C, I2S, PWM, GPIOs 等功能                                                 |
| 供电方式       | USB Type-C (5V 电源输入)                                                                                                                                         |
| 操作系统       | 支持 Debian, Android 13                                                                                                                                          |
| 机械尺寸       | 51 毫米 x 51 毫米                                                                                                                                                |
| 工作温度       | 0 - 60°C                                                                                                                                                         |

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7s/cubie-a7s-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                                   | 序号 | 说明             | 序号 | 说明                                                |
| ---- | -------------------------------------- | ---- | ---------------- | ---- | --------------------------------------------------- |
| 1    | 千兆以太网                             | 2    | 15-Pin GPIO 排针 | 3    | Wi‑Fi 6 & BT5.4 模组                                |
| 4    | 天线座                                 | 5    | USB 2.0 Type-A   | 6    | FPC 接口<br />- PCIe 3.0 x1, 支持拓展 NVMe 固态硬盘 |
| 7    | USB BOOT 按键                          | 8    | 30-Pin GPIO 排针 | 9    | 板载 eMMC                                           |
| 10   | MIPI CSI 摄像头接口                    | 11   | 风扇接口         | 12   | microSD 卡槽                                        |
| 13   | 全志 A733                              | 14   | LPDDR5           | 15   | USB-C 2<br />- USB 3.2, 支持 DP Alt 模式和 OTG 功能 |
| 16   | USB-C 1<br />- 支持 5V 供电和 OTG 功能 |      |                  |      |                                                     |

:::tip 板载 eMMC
若您购买的 Cubie A7S 型号为无板载 eMMC 版本，则主板板载 eMMC 位置预留，无任何元器件。
:::

## 应用场景

瑞莎 Cubie A7S 适合用于边缘 AI 应用，如图像识别、智能视觉、语音处理、机器人和智能物联网设备。

### 边缘 AI 应用

可用于实时图像识别与处理，语音识别与处理等边缘 AI 应用。

### 嵌入式开发

板载的 15-Pin GPIO 排针和 30-Pin GPIO 排针支持 PWM、UART、SPI、I2C 等功能，可以用于连接丰富的外设。

### 机器人开发

作为机器人开发的主控，瑞莎 Cubie A7S 提供优秀的性能和丰富的接口助力机器人开发。

### 开发者套件

可作为嵌入式爱好者、机器人开发者的入门级主板，提供开源硬件设计、丰富的技术文档和开发资源。

## 系统平台

Cubie A7S 基于全志 A733 SoC，支持多种操作系统：

- Debian Linux
- Buildroot
- Tina Linux
- Android 13
