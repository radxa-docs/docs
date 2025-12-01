---
sidebar_position: 20
---

# 瑞莎 C200 Orin 开发套件

## 产品介绍

瑞莎 C200 Orin 开发套件由瑞莎 C200 载板和英伟达 Jetson Orin NX 8GB 模组组成，是一款先进的边缘 AI 和机器人开发平台，助力嵌入式边缘 AI 的未来。

搭载 6 核 Arm® Cortex®-A78AE 处理器，主频高达 2GHz，集成 NVIDIA Ampere 架构 GPU，支持高达 117 TOPS 的 AI 算力（Super 模式），是工业自动化、机器人、智能安防等领域的理想选择。

## 产品实物

<Tabs queryString="board model">

<TabItem value="瑞莎 C200 Orin 开发套件">

|        产品实物         | 序号 |  视图  | 序号 |  视图  | 序号 |  视图  |
| :---------------------: | :--: | :----: | :--: | :----: | :--: | :----: |
| 瑞莎 C200 Orin 开发套件 |  ①   | 俯视图 |  ②   | 侧视图 |  ③   | 背视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/c200/radxa-c200-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="瑞莎 C200 载板">

|    产品实物    | 序号 |  视图  | 序号 |  视图  |
| :------------: | :--: | :----: | :--: | :----: |
| 瑞莎 C200 载板 |  ①   | 俯视图 |  ②   | 背视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/c200/radxa-c200-io-board-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## 包装清单

- 瑞莎 C200 载板
- 英伟达 Jetson Orin NX 8GB 模组

## 产品规格

| 产品型号   | 瑞莎 C200 Orin 开发套件                                                                                                                                                                                                                                                                              |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CPU        | 6 核 Arm® Cortex®-A78AE v8.2 64-bit @ 2 GHz                                                                                                                                                                                                                                                        |
| GPU        | Ampere GPU<br/> • 端对端无损压缩<br/> • 1024 个 NVIDIA CUDA 核心 + 32 个 Tensor 核心<br/>• 支持 OpenGL 4.6, OpenGL ES 3.2, Vulkan 1.2, and CUDA 11.4+                                                                                                                                                |
| AI 性能    | 正常模式<br/>• AI 算力：70 TOPS@INT8（稀疏算力）<br/>• GPU 频率：765 MHz<br/>升级 Super 模式 <br/>• AI 算力：117 TOPS@INT8（稀疏算力）<br/>• GPU 频率提升 34.7% (765 -> 1173 MHz) <br/>• AI 算力提升 67.1% (70 -> 117 TOPS)                                                                          |
| 视频编解码 | **解码：**<br/>• 支持 H.265 (HEVC) / H.264 / VP9 / VP8 / AV1 / MPEG-4 / MPEG-2 / VC-1 格式<br/>• 1x 8K30 / 2x 4K60 / 4x 4K30 / 9x 1080p60 / 18x 1080p30 (H.265)<br/>**编码：**<br/>• 支持 H.265 (HEVC) / H.264 / AV1 格式<br/>• 1x 4K60 / 3x 4K30 (H.265) / 6x 1080p60 (H.265) / 12x 1080p30 (H.265) |
| 内存       | 8GB 128-bit LPDDR5@6400MT/s                                                                                                                                                                                                                                                                          |
| 存储       | 1x M.2 M Key 2280 插槽 (PCIe 4.0 x4) <br/> 1x M.2 M Key 2230 插槽 (PCIe 4.0 x2)                                                                                                                                                                                                                      |
| 显示输出   | 1x 标准 DP 输出接口                                                                                                                                                                                                                                                                                  |
| 有线网络   | 1x RJ45 千兆以太网口                                                                                                                                                                                                                                                                                 |
| 无线网络   | 1x M.2 E Key 2230 插槽 (PCIe 4.0 x1)                                                                                                                                                                                                                                                                 |
| USB 接口   | 4x USB 3.2 Type-A<br/>1x USB 3.2 Type-C                                                                                                                                                                                                                                                              |
| 供电方式   | DC (5.5x2.5mm) 供电接口（9 - 20V）                                                                                                                                                                                                                                                                   |
| 其他接口   | 1x PoE 接口<br/>1x CAN 总线接口<br/>1x PWM 风扇接口<br/>1x RTC 电池接口<br/>1x 40-Pin GPIO 排针<br/> - 支持 GPIO / UART / I2C / SPI / CAN / PWM 等功能                                                                                                                                               |
| 操作系统   | 支持 Ubuntu 20.04 / 22.04 LTS                                                                                                                                                                                                                                                                        |
| 机械尺寸   | 100 x 79 mm                                                                                                                                                                                                                                                                                          |
| 散热方式   | 预装 PWM 调速风扇                                                                                                                                                                                                                                                                                    |

## 接口概览

<Tabs queryString="board model">

<TabItem value="瑞莎 C200 Orin 开发套件">

<div style={{textAlign: 'center'}}>
   <img src="/img/c200/radxa-c200-kits.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                               | 序号 | 说明                               | 序号 | 说明                               |
| :--: | :--------------------------------- | :--: | :--------------------------------- | :--: | :--------------------------------- |
|  1   | MIPI 摄像头（2 通道）              |  2   | MIPI 摄像头（2 或 4 通道）         |  3   | DC5525 供电接口（9V-20V）          |
|  4   | PoE 反向供电接口                   |  5   | DP 输出接口                        |  6   | 4x USB 3.2 Type-A                  |
|  7   | SODIMM 接口                        |  8   | RJ45 千兆以太网口                  |  9   | PoE 接口                           |
|  10  | USB 3.2 Type-C                     |  11  | 电源指示灯                         |  12  | 40-Pin GPIO 排针                   |
|  13  | M.2 M Key 2230 插槽（PCIe 4.0 x2） |  14  | M.2 M Key 2280 插槽（PCIe 4.0 x4） |  15  | M.2 E Key 2230 插槽（PCIe 4.0 x1） |
|  16  | RTC 电池接口                       |  17  | PWM 风扇接口                       |      |                                    |

</TabItem>

<TabItem value="瑞莎 C200 载板">

<div style={{textAlign: 'center'}}>
   <img src="/img/c200/radxa-c200-io-board.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                               | 序号 | 说明                               | 序号 | 说明                               |
| :--: | :--------------------------------- | :--: | :--------------------------------- | :--: | :--------------------------------- |
|  1   | MIPI 摄像头（2 通道）              |  2   | MIPI 摄像头（2 或 4 通道）         |  3   | DC5525 供电接口（9V-20V）          |
|  4   | PoE 反向供电接口                   |  5   | DP 输出接口                        |  6   | 按键接口                           |
|  7   | 4x USB 3.2 Type-A                  |  8   | SODIMM 接口                        |  9   | CAN 总线接口                       |
|  10  | RJ45 千兆以太网口                  |  11  | USB 3.2 Type-C                     |  12  | 电源指示灯                         |
|  13  | 40-Pin GPIO 排针                   |  14  | M.2 M Key 2230 插槽（PCIe 4.0 x2） |  15  | M.2 M Key 2280 插槽（PCIe 4.0 x4） |
|  16  | M.2 E Key 2230 插槽（PCIe 4.0 x1） |  17  | RTC 电池接口                       |  18  | PoE 接口                           |
|  19  | PWM 风扇接口                       |      |                                    |      |                                    |

</TabItem>

</Tabs>

## 系统框图

<div style={{textAlign: 'center'}}>
**瑞莎 C200 Orin 开发套件系统框图**
</div>

<div style={{textAlign: 'center'}}>
   <img src="/img/c200/radxa-c200-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 应用场景

瑞莎 C200 Orin 开发套件凭借其强大的 AI 算力和丰富的接口，可广泛应用于以下领域：

### 边缘 AI 和机器学习

- 在边缘端实时运行复杂的 AI 模型推理
- 支持 TensorRT 加速，实现低延迟的 AI 推理
- 适用于需要实时响应的智能应用场景
- 支持部署多种 AI 框架，如 TensorFlow、PyTorch 等

### 机器视觉

- 支持多路高清摄像头接入
- 实时图像识别与目标检测
- 支持 OpenCV、DeepStream 等视觉处理框架
- 适用于智能监控、质量检测等场景

### 工业/教育机器人

- 支持 ROS/ROS2 机器人操作系统
- 丰富的 I/O 接口，可连接各类传感器和执行器
- 实时性要求高的运动控制和路径规划
