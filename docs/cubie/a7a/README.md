---
sidebar_position: 11
sidebar_label: Cubie A7A
---

# 瑞莎 Cubie A7A

## 产品概述

瑞莎 Cubie A7A 是一款超紧凑且功能丰富的单板计算机（SBC），专为空间受限环境提供强劲性能而设计。

Cubie A7A 搭载全志 A733 SoC，采用混合八核高性能 CPU（双核 Arm Cortex-A76 + 六核 Arm Cortex-A55 大小核架构，最高主频 2.0GHz），并集成 3 TOPS NPU 及 Imagination BXM-4-64 MC1 GPU，可提供强大的 AI 和多媒体处理能力。

## 产品外观

<div style={{textAlign: 'center'}}>
   Cubie A7A 正面
   <img src="/img/cubie/a7a/a7a-bottom.webp" style={{width: '50%', maxWidth: '1200px'}} />
   Cubie A7A 背面
    <img src="/img/cubie/a7a/a7a-top.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

## 产品规格

| 参数类别        | 详细规格                                                             |
| :-------------- | :------------------------------------------------------------------- |
| **处理器**      |                                                                      |
| SoC             | 全志 A733                                                            |
| CPU             | 2 个 Cortex-A76（最高 2.0GHz） + 6 个 Cortex-A53（最高 1.8GHz）      |
| GPU             | Imagination BXM-4-64 MC1; 支持 OpenGL ES 3.2、Vulkan 1.3、OpenCL 3.0 |
| NPU             | 3 TOPS AI 加速引擎                                                   |
| **内存与存储**  |                                                                      |
| 内存            | LPDDR5，可选：2GB / 4GB / 6GB / 8GB / 16GB                           |
| eMMC/UFS 模块   | 支持 eMMC 5.1（8GB ~ 128GB）与 UFS 3.1 双通道（64GB ~ 1TB）          |
| SPI Flash       | 板载 8MB                                                             |
| **网络与无线**  |                                                                      |
| WiFi            | 802.11 a/b/g/n/ac/ax（Wi-Fi 6）                                      |
| 以太网          | 1 个千兆以太网口，支持 PoE（需 PoE HAT）                             |
| 蓝牙            | 蓝牙 5.4，支持 BLE                                                   |
| **显示**        |                                                                      |
| HDMI            | 1 个 HDMI 2.0，最高支持 4K@60fps                                     |
| MIPI DSI        | 1 个 4 通道 MIPI DSI                                                 |
| **摄像头**      |                                                                      |
| MIPI CSI        | 1 个 4 通道或 2× 2 通道 MIPI CSI                                     |
| **USB**         |                                                                      |
| USB 接口        | 1 个 USB 3.0 Type-A OTG; 3 个 USB 2.0 Type-A HOST                    |
| **PCIe**        |                                                                      |
| PCIe 接口       | 1 个 PCIe 3.0（通过 FPC 接口）                                       |
| **GPIO**        |                                                                      |
| 40 Pin GPIO     | UART、SPI、I2C、PWM、5V、3.3V 电源                                   |
| **音频**        |                                                                      |
| 音频接口        | 3.5mm 音频接口，支持麦克风                                           |
| **按键功能**    |                                                                      |
| 电源按键        | 1 个 Power 按键                                                      |
| 功能按键        | 1 个 UBOOT 按键                                                      |
| **供电方式**    |                                                                      |
| USB Type-C 供电 | 支持 USB Type-C 输入 5V 进行供电                                     |
| PoE 供电        | 支持通过 PoE HAT 进行供电                                            |
| GPIO 供电       | 支持通过 GPIO（引脚 2 与 4）供电                                     |
| **物理规格**    |                                                                      |
| 尺寸            | 85mm × 56mm                                                          |
| **软件支持**    |                                                                      |
| 操作系统        | 支持 Debian Linux 和 Android 14 操作系统                             |
| 启动方式        | 支持 MicroSD 卡、eMMC 模块或 UFS 模块启动系统                        |

## 接口说明

对于可以外接设备的接口，点击接口说明可以参考使用教程。
