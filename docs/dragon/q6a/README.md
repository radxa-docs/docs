---
sidebar_position: 2
---

# 瑞莎 Dragon Q6A

## 产品概述

瑞莎 Dragon Q6A 是一款基于高通® QCS6490 处理器的高性能、低功耗嵌入式计算平台，专为工业物联网、边缘人工智能和智能终端设计。

Dragon Q6A 搭载高通 QCS6490 SoC，采用 “1+3+4” 三丛集设计（1× Kryo Prime @ 2.7GHz3× Kryo Gold @ 2.4GHz4× Kryo Silver @ 1.9GHz ），兼顾高性能与低功耗；集成 Qualcomm® Adreno 643 GPU 、VPU 以及 AI 加速器，具备先进 AI 加速能力和多媒体处理能力。

## 产品外观

<div style={{textAlign: 'center'}}>
   Dragon Q6A 正面
   <img src="/img/dragon/q6a/q6a_top.webp" style={{width: '80%', maxWidth: '1200px'}} />
   Dragon Q6A 背面
    <img src="/img/dragon/q6a/q6a_bottom.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

## 产品规格

| 类别     | 规格描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| :------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 核心平台 | 系统级芯片（SoC）：Qualcomm QCS6490 <br/> 中央处理器（CPU）：1x Kryo Gold Plus @2.7GHz + 3x Kryo Gold @2.4GHz + 4x Kryo Silver @1.9GHz <br/> 图形处理器（GPU）：Qualcomm® Adreno 643，支持OpenGL ES 3.2、Vulkan 1.3、OpenCL 2.2、DirectX 12 <br/> AI 加速器（AI Accelerator）：Hexagon DSP + Hexagon Tensor Accelerator，联合AI算力最高可达 12 TOPS <br/> 视频处理单元（VPU）：支持最高4K60帧解码（H.264/H.265/VP9格式）和4K30帧编码（H.264/H.265格式），并具备HDR10/HDR10+播放功能 |
| 内存     | LPDDR5，可选：4GB / 6GB / 8GB / 12 GB / 16GB                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 存储     | 启动存储：板载 32MB QSPI Nor Flash <br/> 拓展存储：支持 MicroSD 卡 / eMMC 模块 / UFS 模块 / M.2 M Key 2230 NVMe SSD                                                                                                                                                                                                                                                                                                                                                                  |
| 网络     | 有线连接：1 个千兆以太网口（支持 PoE，需外接 PoE HAT）<br/> 无线连接：Wi-Fi 6、蓝牙 5.4，需外接天线                                                                                                                                                                                                                                                                                                                                                                                  |
| 视频输出 | HDMI：1 个 HDMI 接口，最高支持 4K@60Hz <br/> MIPI DSI：1 个 4 通道 MIPI DSI                                                                                                                                                                                                                                                                                                                                                                                                          |
| 摄像头   | 1 个 4 通道 MIPI CSI <br/> 2 个 2 通道 MIPI CSI                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 音频     | 音频接口：3.5mm 四段耳机插孔，支持麦克风输入<br/> 音频输出：支持立体声输出，可直接驱动 32Ω 耳机                                                                                                                                                                                                                                                                                                                                                                                      |
| USB      | USB 3.1：1× Type-A HOST / OTG<br/> USB 2.0：3× Type-A HOST                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 拓展     | 40 Pin GPIO 排针：支持 UART、SPI、I2C 等<br/> 风扇接口：1× 2-pin 1.25mm <br/> 按键：Power 按键、EDL 按键                                                                                                                                                                                                                                                                                                                                                                             |
| 供电方式 | 支持 USB Type-C 12V 供电 <br/> 支持外部 12V 引脚供电 <br/> 支持 PoE 供电（需外接 PoE HAT）                                                                                                                                                                                                                                                                                                                                                                                           |
| 支持系统 | Ubuntu Linux <br/> Qualcomm Linux（基于 Yocto 开发） <br/> Android 15 (CS) 或 Android 16 (ES) 系统                                                                                                                                                                                                                                                                                                                                                                                   |

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_interface.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明             | 序号 | 说明                                                         | 序号 | 说明                      |
| :--: | :--------------- | :--: | :----------------------------------------------------------- | :--: | :------------------------ |
|  ①   | USB Type-C 接口  |  ⑨   | PoE 接口                                                     |  ⑰   | 12 V 电源输入接口         |
|  ②   | LPDDR5 内存      |  ⑩   | 千兆以太网接口（支持 PoE）                                   |  ⑱   | 麦克风输入接口            |
|  ③   | Power 按键       |  ⑪   | QSPI Nor Flash                                               |  ⑲   | eMMC / UFS 模块二合一接口 |
|  ④   | 天线接口         |  ⑫   | 2x USB 2.0 Type-A 接口                                       |  ⑳   | RTC 接口                  |
|  ⑤   | WiFi 6 / BT 5.4  |  ⑬   | USB 2.0 Type-A 接口（上层）<br/> USB 3.1 Type-A 接口（下层） |  ㉑  | 2x MIPI CSI 2-Lane 接口   |
|  ⑥   | M.2 M Key 接口   |  ⑭   | EDL 按键                                                     |  ㉒  | MIPI DSI 4-Lane 接口      |
|  ⑦   | 40 Pin GPIO 排针 |  ⑮   | 耳机插孔                                                     |  ㉓  | MicroSD 卡槽              |
|  ⑧   | Qualcomm QCS6490 |  ⑯   | HDMI 接口                                                    |  ㉔  | MIPI CSI 4-Lane 接口      |

## 应用场景

### Linux 初学者

作为一款基于 Linux 的单板计算机，可以用于 Linux 入门学习、进阶底层和应用层开发。

### 机器人开发

作为机器人开发的主控，提供优秀的性能和丰富的硬件接口，方便用户开发机器人应用。

### 嵌入式开发

引出丰富的 GPIO 接口，支持UART、SPI、I2C等通讯方式，方便用户驱动各种硬件。

### AI 开发

内置 Hexagon DSP + Hexagon Tensor Accelerator，联合AI算力最高可达 12 TOPS，加速 AI 开发。

## 系统平台

基于高通 QCS6490 SoC，支持多种操作系统：

- Ubuntu Linux
- Qualcomm Linux（基于 Yocto 开发）
- Android 15 (CS) 或 Android 16 (ES) 系统
