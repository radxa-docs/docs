---
sidebar_position: 11
sidebar_label: ROCK 4D
---

# ROCK 4D - 工业级 AI 单板计算机

## 产品概述

瑞莎 ROCK 4D 是一款紧凑型单板计算机 (SBC)，拥有众多一流功能、特性和扩展选项。

ROCK 4D 搭载 Rockchip RK3576 或 RK3576J SoC，配备八核 CPU（4 个 Cortex-A72 + 4 个 Cortex-A53）、Mali-G52 GPU 和强大的 6 TOPS NPU，非常适合 AI 和多媒体任务。

对于创客、物联网爱好者、业余爱好者、游戏玩家、PC 用户、OEM 厂商、工业应用以及所有需要高性能和高可靠性的高性能平台的用户而言，ROCK 4D 都是理想之选。

ROCK 4D 提供两个版本：基于 RK3576 的商业级 ROCK 4D 和 基于 RK3576J 的工业级 ROCK 4D。

## 产品外观

<div style={{textAlign: 'center'}}>
   ROCK 4D 正面
   <img src="/img/rock4/4d/rock4d-top.webp" style={{width: '100%', maxWidth: '800px'}} />
   ROCK 4D 背面
    <img src="/img/rock4/4d/rock4d-bottom.webp" style={{width: '100%', maxWidth: '800px'}} />
</div>

## 产品规格

| 类别       | 规格                                                                                                                                                                                                                                 |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 处理器     | 系统级芯片 (SoC)： 瑞芯微 RK3576 / RK3576J <br/> 中央处理器 (CPU)： 4 核 Cortex-A72 + 4 核 Cortex-A53 <br/> 图形处理器 (GPU)： Arm Mali-G52 MC3 <br/> 神经网络加速器 (NPU)： 6 TOPS（支持 INT4 / INT8 / INT16 / FP16 / BF16 / TF32） |
| 内存 (RAM) | LPDDR5，可选：2GB / 4GB / 8GB / 16GB                                                                                                                                                                                                 |
| 存储       | 启动存储： 16MB SPI NOR Flash <br/> 拓展存储： eMMC / UFS 模块接口，MicroSD 卡槽                                                                                                                                                     |
| 网络       | 有线连接： 1 个千兆以太网口（支持 PoE，需外接 HAT） <br/> 无线连接： Wi-Fi 6、蓝牙 5.4，外接天线接口                                                                                                                                 |
| 视频输出   | HDMI 接口： 1× HDMI 2.1，最高支持 4K@120fps <br/> MIPI DSI 接口： 1× 4-lane MIPI DSI                                                                                                                                                 |
| 摄像头接口 | MIPI CSI 接口 : 1 路 4-lane（可分为 2 路 2-lane）+ 1 路 2-lane CSI                                                                                                                                                                   |
| 音频       | 音频接口 ： 3.5mm 四段耳机插孔，支持麦克风输入 <br/> 音频输出 ： 支持立体声输出，可直接驱动 32Ω 耳机                                                                                                                                 |
| USB 接口   | USB 3.0 ： 1× Type-A HOST，1× Type-A OTG/HOST <br/> USB 2.0 ： 2× Type-A HOST                                                                                                                                                        |
| 拓展接口   | GPIO 引脚排针 ： 支持 UART、SPI、I2C、I2S、PWM、CAN、ADC 等 <br/> PCIE 插槽 ： 通过 FPC 接口提供 PCIe 2.1 x1 通道 <br/> 风扇接口 ： 1× 2-pin 1.25mm PWM 控制风扇接口                                                                 |
| 电源接口   | 电源接口 ： 支持 USB Type-C 接口和 GPIO 引脚供电                                                                                                                                                                                     |
| 操作系统   | 操作系统 ： 支持 Debian Linux、Android 14、Yocto、Buildroot                                                                                                                                                                          |
| 工作温度   | 工作温度（商业级）： 0°C ~ 60°C（RK3576） <br/> 工作温度（工业级）： -40°C ~ 85°C（RK3576J）                                                                                                                                         |

## 接口说明

对于可以外接设备的接口，点击接口说明可以参考使用教程。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rock4d-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
| 序号 | 说明                       | 数量 | 序号 | 说明                         | 数量 | 序号 | 说明                         | 数量 |
|:----:|:---------------------------|:----:|:----:|:----------------------------|:----:|:----:|:----------------------------|:----:|
|  ①   | [USB Type-C 接口](/rock4/rock4d/hardware-use/usb-type-c) |  1   |  ⑩  | [PoE 接口](/rock4/rock4d/hardware-use/gigabit-ethernet) |  1   |  ⑲  | [MIPI CSI 接口](/rock4/rock4d/hardware-use/mipi-csi) |  1   |
|  ②   | 用户指示灯                 |  1   |  ⑪  | [Maskrom 按键](/rock4/rock4d/hardware-use/maskrom)                |  1   |  ⑳  | [HDMI 2.1 接口](/rock4/rock4d/hardware-use/hdmi)     |  1   |
|  ③   | 电源指示灯                 |  1   |  ⑫  | [USB 2.0 Type-A 接口](/rock4/rock4d/hardware-use/usb-type-a) |  2   |  ㉑  | [Recovery 引脚](/rock4/rock4d/hardware-use/recovery)             |  1   |
|  ④   | 电源按键                   |  1   |  ⑬  | Rockchip RK3576（J）        |  1   |  ㉒  | [UFS 模块接口](/rock4/rock4d/hardware-use/emmc-ufs-connector) |  1   |
|  ⑤   | [FPC 接口](/rock4/rock4d/hardware-use/fpc-connector)|  1   |  ⑭  | [USB 3.0 Type-A 接口](/rock4/rock4d/hardware-use/usb-type-a) |  2   |  ㉓  | [RTC 接口](/rock4/rock4d/hardware-use/rtc-connector)           |  1   |
|  ⑥   | [WiFi6 和 蓝牙 5.4](/rock4/rock4d/hardware-use/ante.md) |  1   |  ⑮  | SPI NOR Flash               |  1   |  ㉔  | [eMMC 模块接口](/rock4/rock4d/hardware-use/emmc-ufs-connector) |  1   |
|  ⑦   | [天线接口](/rock4/rock4d/hardware-use/ante)          |  1   |  ⑯  | [千兆以太网口（支持PoE）](/rock4/rock4d/hardware-use/gigabit-ethernet) |  1   |  ㉕  | [MIPI CSI 接口](/rock4/rock4d/hardware-use/mipi-csi) |  1   |
|  ⑧   | [40 Pin GPIO 接口](/rock4/rock4d/hardware-use/pin-gpio)|  1   |  ⑰  | [风扇接口](/rock4/rock4d/hardware-use/fan)            |  1   |  ㉖  | [MicroSD 卡槽](/rock4/rock4d/hardware-use/microsd)   |  1   |
|  ⑨   | LPDDR5 内存                |  1   |  ⑱  | [耳机插孔](/rock4/rock4d/hardware-use/headphone)      |  1   |  ㉗  | [MIPI DSI 接口](/rock4/rock4d/hardware-use/mipi-dsi) |  1   |

- 用户指示灯

系统正常启动时，用户指示灯会闪烁。

- 电源指示灯

系统正常启动时，电源指示灯会亮起。

- 电源按键

短按触发开机或者电源菜单选项，长按关机。

- LPDDR5 内存

LPDDR5 内存可选 2GB / 4GB / 8GB / 16GB 容量。

- Rockchip RK3576（J）

ROCK 4D 提供两个 SoC 版本：基于 RK3576 的商业级 ROCK 4D 和 基于 RK3576J 的工业级 ROCK 4D。

## 应用场景

### Linux 初学者

作为一款基于 Linux 的单板计算机，ROCK 4D 可以用于 Linux 入门学习、进阶底层和应用层开发。

### 机器人开发

作为机器人开发的主控，提供优秀的性能和丰富的硬件接口，方便用户开发机器人应用。

### 嵌入式开发

引出丰富的 GPIO 接口，支持UART、SPI、I2C、I2S等通讯方式，方便用户驱动各种硬件。

### AI 开发

具有高达 6 TOPS 的神经网络加速器，可用于 AI 推理和训练。

## 系统平台

ROCK 4D 基于 RK3576 或 RK3576J 芯片组，支持 ArmV8 指令集和多种操作系统。

- Debian Linux
- Yocto Linux
- Buildroot
- Android 14
