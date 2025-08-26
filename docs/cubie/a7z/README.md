---
sidebar_position: 3
sidebar_label: Cubie A7Z
---

# 瑞莎 Cubie A7Z

## 产品概述

瑞莎 Cubie A7Z 是一款极致紧凑的超微型单板计算机，尺寸仅为 65 x 30mm，在有限空间内提供强大的计算性能与丰富的拓展接口，完美适配多种应用场景。

Cubie A7Z 搭载全志 A733 SoC，内置混合架构高性能八核 CPU（双核 Arm® Cortex®-A76 与六核 Arm Cortex-A55）、Imagination PowerVR BXM-4-64 MC1 GPU 以及 3 TOPS@INT8 NPU。

凭借小巧体积与强悍性能，它能够高效处理复杂任务，特别适合边缘 AI 应用，如图像识别、智能视觉、语音处理、机器人和智能物联网设备。

## 产品外观

<div style={{textAlign: 'center'}}>
   Cubie A7Z 正面
   <img src="/img/cubie/a7z/a7z-bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
   Cubie A7Z 背面
   <img src="/img/cubie/a7z/a7z-top.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 包装清单

| 数量 | 部件                |
| ---- | ------------------- |
| 1    | 瑞莎 Cubie A7Z 主板 |
| 1    | Wi-Fi / 蓝牙 天线   |

## 产品规格

| 类别     | 规格                                                                                                                                                                                                                                       |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 处理器   | 系统级芯片 (SoC)： 全志 A733 <br/> 中央处理器 (CPU)： 2 核 Cortex-A76 + 6 核 Cortex-A55 <br/> 图形处理器 (GPU)： Imagination BXM-4-64 MC1, 支持 OpenGL ES 3.2、Vulkan 1.3、OpenCL 3.0 <br/> 神经网络加速器 (NPU)： 3 TOPS@INT8 AI 加速引擎 |
| 内存     | LPDDR4/4x，可选：1GB / 2GB / 4GB / 8GB / 16GB                                                                                                                                                                                              |
| 存储     | 板载存储：可选板载 UFS 模块（最高可选 1TB） <br/> 拓展存储：MicroSD 卡槽                                                                                                                                                                   |
| 网络     | 板载 Wi-Fi 6、蓝牙 5.4 芯片，可外接天线增强信号                                                                                                                                                                                            |
| 视频输出 | 1 个 Micro HDMI 接口，最高支持 4K@60fps <br/> 1 个 USB-C 3.0 接口，兼容 DisplayPort Alt 模式.可外接高清显示屏                                                                                                                              |
| 摄像头   | 1 个 4-lane MIPI CSI（可拆分成 2 个 2-lane MIPI CSI）                                                                                                                                                                                      |
| USB      | 1 个 USB-C 2.0 OTG，支持供电和传输数据 <br/> 1 个 USB-C 3.0 HOST, 兼容 DisplayPort Alt 模式                                                                                                                                                |
| 拓展     | 标准 40 Pin GPIO 接口： 支持 PWM、UART、SPI、I2C 等功能 <br/> PCIe Gen3.0 FPC 接口： 1-lane PCIe 3.0，支持拓展 NVMe SSD、AI 加速卡等高速设备 <br/> 风扇接口： 1× 2-Pin 1.25mm 接口                                                         |
| 供电方式 | 支持 USB Type-C 5V 供电 <br/> 支持 GPIO 引脚5V 供电（引脚 2 与 4）                                                                                                                                                                         |
| 操作系统 | 支持 Debian Linux、Android 13 等系统                                                                                                                                                                                                       |
| 尺寸规格 | 65 x 30mm                                                                                                                                                                                                                                  |
| 工作温度 | 推荐 0°C ~ 50°C                                                                                                                                                                                                                            |

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7z/a7z-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                            | 序号 | 说明                 | 序号 | 说明              |
| ---- | ------------------------------- | ---- | -------------------- | ---- | ----------------- |
| ①    | USB-C 2.0 OTG & Power 接口      | ⑥    | 天线接口             | ⑪    | PCIe 3.0 FPC 接口 |
| ②    | USB-C 3.1 OTG & DP Alt 模式接口 | ⑦    | WiFi 6 / BT5 模组    | ⑫    | 40-Pin GPIO 接口  |
| ③    | Allwinner A733                  | ⑧    | 4-lane MIPI CSI 接口 | ⑬    | LPDDR4/4x RAM     |
| ④    | Micro HDMI 接口                 | ⑨    | 板载 UFS             | ⑭    | MicroSD 卡槽      |
| ⑤    | FAN 接口                        | ⑩    | UBOOT 按键           |      |                   |

- 电源指示灯

若 Cubie A7Z 供电正常，电源指示灯将显示为绿色。

- LPDDR4/4x

LPDDR4/4x 可选：1GB / 2GB / 4GB / 8GB / 16GB

- 板载 UFS

板载 UFS 模块最高可选 1TB 存储空间。

## 应用场景

瑞莎 Cubie A7Z 适合用于边缘 AI 应用，如图像识别、智能视觉、语音处理、机器人和智能物联网设备。

### 边缘 AI 应用

可用于实时图像识别与处理，语音识别与处理等边缘 AI 应用。

### 嵌入式开发

板载的标准 40-Pin GPIO 接口支持 PWM、UART、SPI、I2C 等功能，可以用于连接丰富的外设。

### 机器人开发

作为机器人开发的主控，瑞莎 Cubie A7Z 提供优秀的性能和丰富的接口助力机器人开发。

### 开发者套件

可作为嵌入式爱好者、机器人开发者的入门级主板，提供开源硬件设计、丰富的技术文档和开发资源。

## 系统平台

Cubie A7Z 基于全志 A733 SoC，支持多种操作系统：

- Debian Linux
- Buildroot
- Tina Linux
- Android 13
