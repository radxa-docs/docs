---
sidebar_position: 10
---

# 星睿 O6 / O6N

## 产品概述

<Tabs queryString="board-model">

<TabItem value="星睿 O6">

瑞莎星睿 O6 是一款基于此芯 P1 SoC 的高性能 Mini-ITX（170mm x 170mm） 主板，集成了强大的 12 核 CPU 架构、Arm Immortals™ G720 MC10 GPU 和 30 TOPS 算力的 NPU。

该产品具备丰富的 I/O 接口，包括四路显示输出、双 5GbE 网络 和 PCIe Gen4 扩展，专为 AI 推理、图形处理、视频编解码和多屏显示等高性能应用场景设计，是 AI 开发工作站、边缘计算节点和高性能个人计算应用的理想选择。

</TabItem>

<TabItem value="星睿 O6N">

瑞莎星睿 O6N 是一款基于此芯 P1 SoC 的高性能 Nano-ITX（120mm x 120mm） 主板，集成了强大的 12 核 CPU 架构、Arm Immortals™ G720 MC10 GPU 和 30 TOPS 算力的 NPU。

该产品支持高达 64GB 的 LPDDR5 内存和多种存储扩展选项，提供了丰富的视频输入输出接口、高速网络连接和全面的扩展能力。

O6N 专为 AI 推理、图形处理、视频编解码和多屏显示等高性能应用场景设计，是边缘计算、智能设备和多媒体应用的理想选择。

</TabItem>

</Tabs>

## 产品外观

<Tabs queryString="board-model">

<TabItem value="星睿 O6">

| 序号 |        视图        | 序号 |        视图        | 序号 |        视图        |
| :--: | :----------------: | :--: | :----------------: | :--: | :----------------: |
|  ①   | 瑞莎星睿 O6 正视图 |  ②   | 瑞莎星睿 O6 侧视图 |  ③   | 瑞莎星睿 O6 背视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/orion-o6-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="星睿 O6N">

| 序号 |        视图         | 序号 |        视图         | 序号 |        视图         |
| :--: | :-----------------: | :--: | :-----------------: | :--: | :-----------------: |
|  ①   | 瑞莎星睿 O6N 正视图 |  ②   | 瑞莎星睿 O6N 侧视图 |  ③   | 瑞莎星睿 O6N 背视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6n/orion-o6n-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## 包装清单

<Tabs queryString="board-model">

<TabItem value="星睿 O6">

- 瑞莎星睿 O6 主板
- 瑞莎 8420B 主动散热器
- 亚克力外壳
- I/O 挡板

说明：亚克力外壳、主动散热器会预装到主板上。

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/orion-o6-package-list.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="星睿 O6N">

- 瑞莎星睿 O6N 主板
- 瑞莎 8420B 主动散热器
- 瑞莎 DC12 60W 电源适配器

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6n/orion-o6n-package-list.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## 产品规格

<Tabs queryString="board-model">

<TabItem value="星睿 O6">

| 类别                  | 规格描述                                                                                                                                                                                              |
| :-------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 系统级芯片（SoC）     | 此芯 P1                                                                                                                                                                                               |
| 中央处理器（CPU）     | 4 核大核 Cortex®-A720，最高主频 2.6 GHz<br/>4 核中核 Cortex®-A720，最高主频 2.4 GHz<br/>4 核小核 Cortex®-A520，最高主频 1.8 GHz<br/>系统缓存：所有核心共享 12MB 三级缓存                           |
| 图形处理器（GPU）     | Arm® Immortals™ G720 MC10<br/>- 支持硬件光线追踪<br/>- 支持 OpenGL ES 3.2<br/>- 支持 Vulkan 1.3<br/>- 支持 OpenCL 2.2<br/>- 支持 DirectX 12                                                         |
| 神经网络处理器（NPU） | 30 TOPS 算力<br/>- 支持 INT4 / INT8 / INT16 / FP16 / BF16 / TF32 等计算精度                                                                                                                           |
| 视频编解码            | 解码：<br/>- 支持 AV1 / H.265 / H.264 / VP9 / VP8 / H.263 / MPEG-4 / MPEG-2 格式；<br/>- 最高支持 8K@60fps 解码；<br/>编码：<br/>- 支持 H.265 / H.264 / VP9 / VP8 格式；<br/>- 最高支持 8K@30fps 编码 |
| 内存                  | LPDDR5<br/>- 128 位数据总线宽度<br/>- 传输速度：5500 MT/S<br/>- 可选容量：8GB / 12GB / 16GB / 24GB / 32GB / 64GB                                                                                      |
| 存储                  | 1x M.2 M Key 插槽（PCIe Gen4 x4），可用于连接 M.2 NVMe SSD 拓展存储                                                                                                                                   |
| 视频输出              | 1x USB Type-C 接口，支持 DP Alt 模式，最高支持 4Kp60<br/>1x HDMI 接口，最高支持 4Kp60<br/>1x DP 接口，支持 2 路 MST 功能，最高可达 4Kp120<br/>1x eDP 接口，最高支持 4Kp60                             |
| 视频输入              | 2x 4 通道 MIPI CSI 接口                                                                                                                                                                               |
| USB 接口              | 2x USB 3.2 Type-A（后置）<br/>2x USB 2.0 Type-A（后置）<br/>2x USB 2.0 Type-A（前置）<br/>2x USB 3.2 Type-C（后置），其中一个支持 DP 视频输出                                                         |
| 网络                  | 2x 5G 以太网<br/>1x M.2 E Key 2230，用于支持 Wi-Fi 和蓝牙                                                                                                                                             |
| 供电方式              | 20V USB Type-C 电源输入，支持 PD 协议<br/> ATX 24P 电源接口                                                                                                                                           |
| PCIe 插槽             | 1x PCIe x16 插槽（PCIe Gen4 x8），可用于连接 PCIe 设备拓展功能                                                                                                                                        |
| 散热方式              | 4-Pin 风扇接口，支持 PWM 动态调速与测速<br/>4x 散热器安装<br/>- 固定孔位：M3.5<br/>- 尺寸：75mm x 75mm                                                                                                |
| 其他接口              | 1x 电源按键<br/>1x 重启按键<br/>1x 40-Pin GPIO 排针<br/>1x 2-Pin 1.25mm RTC 电池接口<br/>1x 3.5 mm 耳机插孔（支持麦克风）<br/>1x 前置面板音频接口                                                     |
| 推荐电源              | ≥ 65W                                                                                                                                                                                                 |
| 尺寸                  | Mini ITX：170mm x 170mm                                                                                                                                                                               |

</TabItem>

<TabItem value="星睿 O6N">

| 类别                  | 规格描述                                                                                                                                                                                              |
| :-------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 系统级芯片（SoC）     | 此芯 P1                                                                                                                                                                                               |
| 中央处理器（CPU）     | 4 核大核 Cortex®-A720，最高主频 2.6 GHz<br/>4 核中核 Cortex®-A720，最高主频 2.4 GHz<br/>4 核小核 Cortex®-A520，最高主频 1.8 GHz<br/>系统缓存：所有核心共享 12MB 三级缓存                           |
| 图形处理器（GPU）     | Arm® Immortals™ G720 MC10<br/>- 支持硬件光线追踪<br/>- 支持 OpenGL ES 3.2<br/>- 支持 Vulkan 1.3<br/>- 支持 OpenCL 2.2<br/>- 支持 DirectX 12                                                         |
| 神经网络处理器（NPU） | 30 TOPS 算力<br/>- 支持 INT4 / INT8 / INT16 / FP16 / BF16 / TF32 等计算精度                                                                                                                           |
| 视频编解码            | 解码：<br/>- 支持 AV1 / H.265 / H.264 / VP9 / VP8 / H.263 / MPEG-4 / MPEG-2 格式；<br/>- 最高支持 8K@60fps 解码；<br/>编码：<br/>- 支持 H.265 / H.264 / VP9 / VP8 格式；<br/>- 最高支持 8K@30fps 编码 |
| 内存                  | LPDDR5<br/>- 128 位数据总线宽度<br/>- 传输速度：5500 MT/S<br/>- 可选容量：8GB / 16GB / 24GB / 32GB / 48GB / 64GB                                                                                      |
| 存储                  | 1x UFS 模块接口，可用于连接瑞莎 UFS 模块拓展存储<br/>2x M.2 M Key 2280 插槽（PCIe Gen4 x4），可用于连接 M.2 NVMe SSD 拓展存储                                                                         |
| 视频输出              | 最高支持 3 屏同显<br/>- 1x USB Type-C 接口，支持 DP Alt 模式，最高支持 4Kp60<br/>- 1x HDMI 接口，最高支持 4Kp60<br/>- 1x DP 接口，支持多流传输功能，最高可达 4Kp120                                   |
| 视频输入              | 2x 4 通道 MIPI CSI 接口                                                                                                                                                                               |
| USB 接口              | 1x USB 3.2 HOST Type-C<br/>2x USB 3.2 HOST Type-A<br/>3x USB 2.0 HOST Type-A                                                                                                                          |
| 网络                  | 2x 2.5G 以太网<br/>1x M.2 E Key 2230，用于支持 Wi-Fi 和蓝牙<br/>1x M.2 B Key 3042，用于支持移动网络（4G）<br/>1x Nano SIM 卡槽，用于支持移动网络（4G）                                                |
| 供电方式              | 12V DC 供电或 12V 引脚电源输入                                                                                                                                                                        |
| 散热方式              | 4-Pin 风扇接口，支持 PWM 动态调速与测速<br/>4x 散热器安装<br/>- 固定孔位：M3.5<br/>- 尺寸：75mm x 75mm                                                                                                |
| 其他接口              | 1x 电源按键<br/>1x 40-Pin GPIO 排针<br/>1x RTC 电池座（支持 CR1220 电池）<br/>1x 4-Pin 电源接口：<br/>- 12V 支持输入/输出 <br/>- 5V 仅支持输出                                                        |
| 推荐电源              | ≥ 65W                                                                                                                                                                                                 |
| 尺寸                  | Nano-ITX：120mm x 120mm                                                                                                                                                                               |

</TabItem>

</Tabs>

## 接口说明

<Tabs queryString="board-model">

<TabItem value="星睿 O6">

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6/orion-o6-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                                                      | 序号 | 说明                                                                     | 序号 | 说明                                     |
| ---- | --------------------------------------------------------- | ---- | ------------------------------------------------------------------------ | ---- | ---------------------------------------- |
| 1    | USB 2.0 接口（前置面板）                                  | 11   | 2x 扬声器接口                                                            | 21   | 电源按键                                 |
| 2    | 音频接口（前置面板）                                      | 12   | 状态指示灯                                                               | 22   | 4-Pin 风扇接口<br/>- 支持 PWM 调速与测速 |
| 3    | 触摸面板接口                                              | 13   | 复位按键                                                                 | 23   | BIOS 闪存座                              |
| 4    | 多功能接口（前置面板）<br/>- 支持电源 / 指示灯 / 重启功能 | 14   | 3.5 mm 耳机插孔                                                          | 24   | 此芯 P1 SoC                              |
| 5    | UART 接口                                                 | 15   | 2x 5G 以太网                                                             | 25   | 40-Pin GPIO 排针                         |
| 6    | eDP 接口                                                  | 16   | DP 接口                                                                  | 26   | LPDDR5                                   |
| 7    | RTC 电池座                                                | 17   | HDMI 接口                                                                | 27   | ATX 电源接口                             |
| 8    | PCIe x16 插槽（PCIe Gen x4）                              | 18   | 2x USB 3.2 Type-A                                                        | 28   | 2x MIPI CSI 4-lane                       |
| 9    | M.2 M Key 插槽                                            | 19   | 2x USB 2.0 Type-A                                                        | 29   | TPM (Unsoldered)                         |
| 10   | M.2 E Key 2230 插槽                                       | 20   | 2x USB Type-C<br/>- 20V Type-C 供电，支持 PD 协议<br/>- 支持 DP 视频输出 |      |                                          |

</TabItem>

<TabItem value="星睿 O6N">

<div style={{textAlign: 'center'}}>
   <img src="/img/orion/o6n/orion-o6n-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                                  | 序号 | 说明                | 序号 | 说明                |
| ---- | ------------------------------------- | ---- | ------------------- | ---- | ------------------- |
| 1    | USB Type-C 接口（支持 DP 视频输出）   | 9    | 12V DC 供电（5525） | 17   | M.2 B Key 3042 插槽 |
| 2    | 4-Pin 风扇接口（支持 PWM 调速与测速） | 10   | 标准 DP 接口        | 18   | Nano SIM 卡槽       |
| 3    | 40-Pin GPIO 排针                      | 11   | 标准 HDMI 接口      | 19   | 此芯 P1 SoC         |
| 4    | MIPI CSI 接口（4-lane）               | 12   | 2x USB 3.0 Type-A   | 20   | UFS 模块接口        |
| 5    | LPDDR5                                | 13   | USB 2.0 Type-A      | 21   | RTC 电池接口        |
| 6    | M.2 E Key 2230 插槽                   | 14   | 电源按键            | 22   | 2x 2.5G 以太网      |
| 7    | MIPI CSI 接口（4-lane）               | 15   | 5V / 12V 电源接口   | 23   | 2x USB 2.0 Type-A   |
| 8    | M.2 M Key 2280 插槽                   | 16   | M.2 M Key 2280 插槽 |      |                     |

</TabItem>

</Tabs>

## 应用场景

### AI 推理与机器学习

- **智能视觉分析**：利用 30 TOPS NPU 算力，实现实时图像识别、目标检测和行为分析
- **自然语言处理**：支持本地化 AI 模型部署，提供高效的语音识别和自然语言理解能力
- **边缘 AI 计算**：在边缘设备上运行复杂的机器学习模型，减少云端依赖

### 教育科研

- **AI 教学平台**：为学生提供本地 AI 模型训练和推理的实践环境
- **科研计算**：支持深度学习研究、计算机视觉算法开发和数据分析
- **原型验证**：快速验证 AI 算法和模型，加速科研成果转化

### 机器人开发

- **自主导航**：结合视觉处理和 AI 推理，实现机器人的环境感知和路径规划
- **机械臂控制**：利用实时计算能力，支持精密的机器人运动控制和视觉伺服
- **人机交互**：通过语音识别和视觉分析，实现自然的人机交互体验

### 多媒体处理

- **8K 视频处理**：支持 8K@60fps 解码和 8K@30fps 编码，适用于专业视频编辑和流媒体应用
- **多屏显示系统**：支持三屏同显，最高可达 4Kp120，适合数字标牌、监控中心和多媒体展示
- **图形渲染**：Arm Immortals™ G720 GPU 支持硬件光线追踪，适用于 3D 渲染和游戏开发

### 工业与商业应用

- **工业自动化**：通过 MIPI CSI 接口连接工业相机，实现质量检测和生产监控
- **智能零售**：集成 AI 视觉分析，支持客流统计、商品识别和智能推荐
- **数字标牌**：多屏显示能力适用于广告播放、信息发布和交互式展示

### 网络与通信

- **网关设备**：双 2.5G 以太网口和 4G 网络支持，适合作为工业网关或路由器
- **远程监控**：结合视频处理和网络能力，构建远程监控和视频会议系统
- **IoT 边缘节点**：丰富的接口和强大的处理能力，适合作为 IoT 数据汇聚和处理节点

## 软件支持

- Debian / Ubuntu Linux 发行版
- 完整的 UEFI 支持（通过 EDKII 实现）
- 提供硬件适配包（BSP）和软件开发工具（SDK）
