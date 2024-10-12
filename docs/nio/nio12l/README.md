---
label: "NIO 12L"
description: "瑞莎 NIO 12L 单板机"
sidebar_position: 2
slug: /nio/12l
---

# NIO 12L

瑞莎 NIO 12L 是一款紧凑型、低功耗且高性能的单板计算机，尺寸相当于一部手机。它以联发科 MT8395（代号 Genio 1200）八核处理器为核心开发平台，集成 Mali-G57 MC5 GPU 和独立 AI 处理模块。这款单板计算机能够为用户提供流畅的桌面体验和卓越的 AI 计算能力。它的丰富外设接口支持多种复杂应用场景，从而拓展了其应用的可能性。

NIO 12L 的设计理念在于结合高性能处理能力与低能耗优势，使其成为适用于各种先进应用的理想选择，包括但不限于高级多媒体处理、复杂的 AI 和物联网（IoT）解决方案。

## 实物照片

![NIO 12L Overview](/img/nio/nio12l/nio-12l-v131-overview.webp)

## 芯片框图

![Genio 1200 Block Diagram](/img/nio/nio12l/hw_soc_g1200_block.svg)

## 特性

| 型号       | 瑞莎 NIO 12L 单板机                                                                                                                                 |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| 片上系统   | 联发科 MT8395 (Genio 1200)                                                                                                                          |
| 中央处理器 | 四大核 Cortex-A78 2.2Ghz + 四小核 Cortex-A55 2.0Ghz                                                                                                 |
| 图形处理器 | Arm Mali™-G57 MC5 3D Graphics Accelerator (GPU) with Vulkan® 1.1, OpenGL ES 3.2 and OpenCL™ 2.2                                                  |
| AI 处理器  | Dual-core AI Processor Unit(APU) Cadence® Tensilica® VP6 processor with AI Accelerator (AIA)                                                      |
| 内存       | 4GB/8GB/16GB LPDDR4X 4266MT/s                                                                                                                       |
| 存储       | 板载 64/128/256/512GB UFS 2.0 <br/> 一个 microSD 存储卡卡槽，支持高速模式 <br/> 一个板载 eMMC 预留，默认不焊                                        |
| 显示       | 一路 HDMI 2.0b 输出最高分辨率4KP60 <br/> 一路 Type-C DP 1.4 输出最高分辨率: 4KP60 <br/> 一路 MIPI LCD 四通道显示输出 <br/> 最多支持任意两屏同时工作 |
| 以太网     | 10/100/1000兆自适应以太网                                                                                                                           |
| 无线通讯   | Wi-Fi 6 (802.11 b/g/n/ac/ax) BT 5.2 支持 BLE，三个独立外置天线                                                                                      |
| USB        | 一个 USB 3.0 Type-C OTG（支持 DP 显示输出） <br/> 四个 USB 3.0 Type-A HOST                                                                          |
| 视频输入   | 一路 HDMI 2.0b 输入最高分辨率 4KP60 <br/> 两路 4 通道 MIPI CSI 最高支持单 48MP 像素摄像头或者双 16MP 像素摄像头                                     |
| 音频       | 一个 3.5mm 耳机接口，支持耳机录音                                                                                                                   |
| 其他       | 一个 40针扩展座 <br/> 一个电源按键 <br/> 一个用户按键 <br/> 一个强制下载按键 <br/> 一个双色 LED 灯                                                  |
| 电源       | 一个 Type-C 电源输入 5V / 3A                                                                                                                        |

## 硬件框图

![NIO12L Block Diagram](/img/nio/nio12l/NIO12L_Block_Diagram.svg)
