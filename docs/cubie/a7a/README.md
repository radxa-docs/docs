---
sidebar_position: 2
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

## 包装清单

| 数量 | 部件            |
| ---- | --------------- |
| 1    | Cubie A7A 主板  |
| 1    | Wi-Fi/蓝牙 天线 |

## 产品规格

| 类别     | 规格                                                                                                                                                                                                                                  |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 处理器   | 系统级芯片 (SoC)： 全志 A733 <br/> 中央处理器 (CPU)： 2 核 Cortex-A76 + 6 核 Cortex-A55 <br/> 图形处理器 (GPU)： Imagination BXM-4-64 MC1; 支持 OpenGL ES 3.2、Vulkan 1.3、OpenCL 3.0 <br/> 神经网络加速器 (NPU)： 3 TOPS AI 加速引擎 |
| 内存     | LPDDR5，可选：2GB / 4GB / 6GB / 8GB / 12GB / 16GB                                                                                                                                                                                     |
| 存储     | 启动存储： 板载 8MB SPI NOR Flash <br/> 系统存储： 支持 MicroSD 卡 / eMMC 模块 / UFS 模块                                                                                                                                             |
| 网络     | 有线连接： 1 个千兆以太网口（支持 PoE，需外接 PoE HAT） <br/> 无线连接： Wi-Fi 6、蓝牙 5.4，外接天线接口                                                                                                                              |
| 视频输出 | HDMI： 1 个 HDMI 接口，最高支持 4K@60fps <br/> MIPI DSI： 1 个 4 通道 MIPI DSI                                                                                                                                                        |
| 摄像头   | 1 个 4 通道 MIPI CSI 或 2 个 2 通道 MIPI CSI                                                                                                                                                                                          |
| 音频     | 音频接口： 3.5mm 四段耳机插孔，支持麦克风输入 <br/> 音频输出： 支持立体声输出，可直接驱动 32Ω 耳机                                                                                                                                    |
| USB      | USB 3.1： 1× Type-A HOST <br/> USB 2.0： 3× Type-A HOST, 1× Type-C OTG / Power                                                                                                                                                        |
| 拓展     | 40 Pin GPIO 排针： 支持 UART、SPI、I2C 等 <br/> PCIe 插槽： 通过 PCIe 3.0 FPC 接口提供 1 个单通道 PCIe 3.0 <br/> 风扇接口： 1× 2-pin 1.25mm <br/> RTC 接口： 1× 2-pin 1.25mm                                                          |
| 供电方式 | 支持 USB Type-C 5V 供电 <br/> 支持 PoE 供电(需外接 PoE HAT) <br/> 支持 GPIO 引脚5V 供电（引脚 2 与 4）                                                                                                                                |
| 操作系统 | 支持 Debian Linux、Android 13 系统                                                                                                                                                                                                    |

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a7a/a7a-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                                                      | 序号 | 说明                                                           | 序号 | 说明                                                              |
| ---- | --------------------------------------------------------- | ---- | -------------------------------------------------------------- | ---- | ----------------------------------------------------------------- |
| ①    | [USB Type-C 接口](/cubie/a7a/hardware-use/usb-type-c)     | ⑧    | [USB Type-A 接口](/cubie/a7a/hardware-use/usb-type-a)          | ⑮    | [天线接口](/cubie/a7a/hardware-use/ante)                          |
| ②    | [HDMI 接口](/cubie/a7a/hardware-use/hdmi)                 | ⑨    | LPDDR5 内存                                                    | ⑯    | [PCIe 3.0 FPC 接口](/cubie/a7a/hardware-use/fpc)                  |
| ③    | [风扇接口](/cubie/a7a/hardware-use/fan)                   | ⑩    | [千兆以太网接口（支持 PoE）](/cubie/a7a/hardware-use/ethernet) | ⑰    | Allwinner A733                                                    |
| ④    | [耳机插孔](/cubie/a7a/hardware-use/headphone)             | ⑪    | [PoE 接口](/cubie/a7a/hardware-use/ethernet)                   | ⑱    | [电源按键](/cubie/a7a/hardware-use/power-key)                     |
| ⑤    | [UBOOT 按键](/cubie/a7a/hardware-use/uboot-key)           | ⑫    | WiFi6 和 蓝牙5.4                                               | ⑲    | [eMMC / UFS 模块二合一接口](/cubie/a7a/hardware-use/emmc-ufs-com) |
| ⑥    | [USB 2.0 Type-A 接口](/cubie/a7a/hardware-use/usb-type-a) | ⑬    | [40 Pin GPIO 排针](/cubie/a7a/hardware-use/pin-gpio)           | ⑳    | [MIPI CSI 接口](/cubie/a7a/hardware-use/mipi-csi)                 |
| ⑦    | [RTC 接口](/cubie/a7a/hardware-use/rtc)                   | ⑭    | [MIPI DSI 接口](/cubie/a7a/hardware-use/mipi-dsi)              | ㉑   | [MicroSD 卡槽](/cubie/a7a/hardware-use/microsd)                   |

- 电源指示灯

Cubie A7A 正常供电，电源指示灯绿色亮起；断电或关机时，电源指示灯熄灭。

- 状态指示灯

系统正常启动时，状态指示灯蓝色闪烁；系统异常时，状态指示灯熄灭。

- LPDDR5 内存

LPDDR5 内存可选：2GB / 4GB / 6GB / 8GB / 12GB / 16GB。

## 应用场景

### Linux 初学者

作为一款基于 Linux 的单板计算机，Cubie A7A 可以用于 Linux 入门学习、进阶底层和应用层开发。

### 机器人开发

作为机器人开发的主控，提供优秀的性能和丰富的硬件接口，方便用户开发机器人应用。

### 嵌入式开发

引出丰富的 GPIO 接口，支持UART、SPI、I2C等通讯方式，方便用户驱动各种硬件。

### AI 视觉开发

提供 3 TOPS NPU，支持 AI 视觉开发，加速 AI 推理和训练。

## 系统平台

Cubie A7A 基于全志 A733 SoC，支持多种操作系统：

- Debian Linux
- Buildroot
- Tina Linux
- Android 13
