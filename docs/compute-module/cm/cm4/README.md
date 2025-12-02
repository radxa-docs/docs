---
sidebar_position: 4
---

# 瑞莎 CM4

## 产品概述

瑞莎 CM4 是一款基于 Rockchip RK3576(J) SoC 的高性能系统模组（SoM），专为嵌入式应用和边缘计算场景设计。

瑞莎 CM4 搭载 Rockchip RK3576(J) SoC，使用八核 CPU（配备四核 Cortex-A72 + 四核 Cortex-A53的 CPU，频率最高2.2GHz）、Mali G52 GPU 和 高达 6TOPS 算力的 NPU，为用户提供强大的计算能力和 AI 加速能力。

瑞莎 CM4 提供两个产品版本：其核心在于 SoC 和工作环境的差异

- 商业级版本: 基于 Rockchip RK3576 SoC
- 工业级版本: 基于 Rockchip RK3576J SoC

## 产品外观

<Tabs queryString="product">
<TabItem value="CM4">

<div style={{textAlign: 'center'}}>
   CM4 正面
   <img src="/img/cm4/cm4_comb_top.webp" style={{width: '100%', maxWidth: '1200px'}} />
   CM4 背面
   <img src="/img/cm4/cm4_core_bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="CM4 IO 板">

<div style={{textAlign: 'center'}}>
   CM4 IO 板 正面
   <img src="/img/cm4/cm4_base_top.webp" style={{width: '100%', maxWidth: '1200px'}} />
   CM4 IO 板 背面
   <img src="/img/cm4/cm4_base_bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>
</Tabs>

## 产品规格

<Tabs queryString="product">
<TabItem value="CM4">

| 类别                | 规格                                                                                                                                                                                                            |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 系统级芯片(SoC)     | Rockchip RK3576(J)                                                                                                                                                                                              |
| 中央处理器(CPU)     | 四核 Cortex-A72 + 四核 Cortex-A53，最高频率可达 2.2GHz                                                                                                                                                          |
| 图形处理器(GPU)     | ARM Mali G52 MC3 <br /> - 支持 OpenGL ES 1.1, 2.0 and 3.2, OpenCL 2.1, Vulkan 1.2                                                                                                                               |
| 神经网络处理器(NPU) | 高达 6 TOPS@INT8 算力 <br /> - 支持 INT4/INT8/INT16/FP16/TF32 <br /> - 支持 TensorFlow, ONNX, PyTorch, Caffe 等主流 AI 框架                                                                                     |
| 存储                | 内存：LPDDR4X，最大可选容量 16 GB <br /> 存储：板载 eMMC，最大可选容量 128GB <br /> 支持 SDMMC 接口: 支持数据存储或启动操作系统                                                                                 |
| 网络                | 有线连接： 1 个千兆以太网口<br /> 无线连接(可选)： Wi-Fi 6、蓝牙 5.4，外置天线接口                                                                                                                              |
| USB                 | - 3x USB 2.0 Type A HOST<br /> - 1x USB 3.0 Type A HOST<br /> - 1x USB 3.0 Type C OTG/HOST                                                                                                                      |
| 音频接口            | 支持 SPDIF、I2S、PDM 等接口                                                                                                                                                                                     |
| 视频输出            | 支持视频输出接口： <br /> - 1 个 HDMI <br /> - 1 个 eDP <br /> - 1 个 DP <br /> - 1 路 4 通道MIPI DSI 输出                                                                                                      |
| 视频输入            | MIPI 接口：支持 4 路 2 通道 MIPI CSI 或 2 路 4 通道 MIPI CSI 摄像头                                                                                                                                             |
| 视频编解码          | - 解码：支持H.264/H.265/VP9/AV2/AVS2格式，最高支持 8K@30fps<br /> - 编码：支持H.264/H.265格式，最高支持 4K@60fps                                                                                                |
| 拓展接口            | 2 路 1 通道 PCIe 2.1 接口: <br /> - 1 路 1 通道 PCIe 2.1 / SATA3 复合接口 <br /> - 1 路 1 通道 PCIe 2.1 / SATA3 / USB3.0 复合接口 <br /> 拓展引脚: 支持 UART、I2C、SPI、PWM等功能 <br /> 按键功能：Maskrom 按键 |
| 连接接口            | 3x 100 Pin B2B 接口                                                                                                                                                                                             |
| 软件支持            | 操作系统 <br /> - Debian Linux <br /> - Android <br /> - Buildroot <br /> - Yocto                                                                                                                               |
| 工作温度（推荐）    | - 商业级版本: 0°C ~ 70°C <br /> - 工业级版本: -40°C ~ 85°C                                                                                                                                                      |

</TabItem>

<TabItem value="CM4 IO 板">

CM4 IO 板参数是 CM4 + CM4 IO 板参数的组合，CM4 IO 板为 CM4 提供丰富的接口。

| 类别                | 规格                                                                                                                          |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| 系统级芯片(SoC)     | Rockchip RK3576(J)                                                                                                            |
| 中央处理器(CPU)     | 四核 Cortex-A72 + 四核 Cortex-A53，最高频率可达 2.2GHz                                                                        |
| 图形处理器(GPU)     | ARM Mali G52 MC3 <br /> - 支持 OpenGL ES 1.1, 2.0 and 3.2, OpenCL 2.1, Vulkan 1.2                                             |
| 神经网络处理器(NPU) | 高达 6 TOPS@INT8 算力 <br /> - 支持 INT4/INT8/INT16/FP16/TF32 <br /> - 支持 TensorFlow, ONNX, PyTorch, Caffe 等主流 AI 框架   |
| 存储                | 内存：LPDDR4X，最大可选容量 16 GB <br /> 存储：支持板载 eMMC、MicroSD 卡、UFS 模块、M.2 M Key NVMe SSD 进行数据存储或启动系统 |
| 网络                | 有线连接： 1 个千兆以太网口(支持 PoE，需外接 HAT)<br /> 无线连接(可选)： Wi-Fi 6、蓝牙 5.4，外置天线接口                      |
| USB                 | - 2x USB 2.0 Type A HOST<br /> - 1x USB 3.0 Type A HOST<br /> - 1x USB 3.0 Type C OTG/HOST                                    |
| 音频接口            | 音频接口 ： 3.5mm 四段耳机插孔，支持麦克风输入 <br /> 音频输出 ： 支持立体声输出，可直接驱动 32Ω 耳机                         |
| 视频输出            | 支持视频输出接口： <br /> - 1 个 HDMI <br /> - 1 路 4 通道 MIPI DSI 输出                                                      |
| 视频输入            | MIPI 接口： <br /> - 2 路 2 通道 MIPI CSI <br /> - 1 路 4 通道 MIPI CSI 摄像头                                                |
| 视频编解码          | - 解码：支持H.264/H.265/VP9/AV2/AVS2格式，最高支持 8K@30fps<br /> - 编码：支持H.264/H.265格式，最高支持 4K@60fps              |
| 拓展接口            | 拓展引脚： <br /> - 40 Pin GPIO：支持 UART、I2C、SPI、PWM 等功能 <br /> - RTC、风扇等接口 <br /> 按键功能：Maskrom 按键       |
| 软件支持            | 操作系统 <br /> - Debian Linux <br /> - Android <br /> - Buildroot <br /> - Yocto                                             |
| 电源接口            | DC 12V 输入，标准 DC-5525 接口                                                                                                |
| 工作温度（推荐）    | - 商业级版本: 0°C ~ 50°C <br /> - 工业级版本: -40°C ~ 85°C                                                                    |

</TabItem>
</Tabs>

## 接口说明

<Tabs queryString="product">
<TabItem value="CM4">

<div style={{textAlign: 'center'}}>
   <img src="/img/cm4/cm4_core_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明         | 序号 | 说明                   | 序号 | 说明         | 序号 | 说明                  |
| ---- | ------------ | ---- | ---------------------- | ---- | ------------ | ---- | --------------------- |
| ①    | LPDDR4X 内存 | ③    | SoC:Rockchip RK3576(J) | ⑤    | 天线接口     | ⑦    | 板载 eMMC             |
| ②    | Maskrom 按键 | ④    | SPI Flash              | ⑥    | WiFi/BT 芯片 | ⑧    | 3x 100 Pin B2B 连接器 |

</TabItem>

<TabItem value="CM4 IO 板">

<div style={{textAlign: 'center'}}>
   <img src="/img/cm4/cm4_base_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                         | 序号 | 说明                    | 序号 | 说明                 |
| ---- | ---------------------------- | ---- | ----------------------- | ---- | -------------------- |
| ①    | DC 12V 输入                  | ⑧    | 2x USB 2.0 Type-A 接口  | ⑮    | 14 Pin GPIO 接口     |
| ②    | 功能引脚（可触发关机、重启） | ⑨    | 千兆以太网口（支持PoE） | ⑯    | RTC 接口             |
| ③    | 电源输出                     | ⑩    | USB 3.0 Type-A 接口     | ⑰    | UFS 模块接口         |
| ④    | 风扇接口                     | ⑪    | HDMI 接口               | ⑱    | 4 通道 MIPI CSI 接口 |
| ⑤    | MicroSD 卡槽                 | ⑫    | 2x 2 通道 MIPI CSI 接口 | ⑲    | 4 通道 MIPI DSI 接口 |
| ⑥    | 耳机插孔                     | ⑬    | PoE 接口                | ⑳    | M.2 M Key 2280 接口  |
| ⑦    | USB 3.0 Type-C 接口          | ⑭    | 40 Pin GPIO 接口        | ㉑   | 3x 100 Pin B2B 接口  |

</TabItem>
</Tabs>

## 系统平台

瑞莎 CM4 支持多种操作系统：

- Debian Linux
- Android
- Buildroot
- Yocto
