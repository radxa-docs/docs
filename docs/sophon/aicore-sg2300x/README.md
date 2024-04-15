---
sidebar_position: 4
---

# 瑞莎 AICore SG2300X 核心板

<Tabs queryString="target">
  <TabItem value="AICore SG2300X" label="瑞莎 AICore SG2300X 核心板">

## 产品介绍

Radxa AICore SG2300X 是一款采用先进的 SOPHON AI 处理器 SG2300X 的核心板，可提供强大的性能。它最高可配备 16GB 内存，支持 128GB eMMC 存储。它拥有令人印象深刻的 32TOPS INT8 计算能力，在各种任务中表现出色，并完全支持主流深度学习框架。

通过使用开放式 SDK 和全面的一体化人工智能开发包以及用户友好型工具链，您可以轻松部署和迁移算法，简化复杂的人工智能开发流程。这种多功能性跨越了安防、交通、零售和工业等领域，为您的项目提供了令人兴奋的可能性。

Radxa AICore SG2300X 即可在 SOC 模式下工作 也可在 PCIe 模式下工作，即 Radxa AICore SG2300X 可用作 PCIe 从设备。

#### 实物照片

![AICore SG2300X Overview](/img/aicore-sg2300x/mark_aicore_sg2300x.webp)

#### 特性

|  Specification   | AICore SG2300X                                                                                                                                                                                                                                                                        |
| :--------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|     **尺寸**     | 55 mm × 60 mm                                                                                                                                                                                                                                                                         |
|    **处理器**    | SOPHON SG2300X SoC，八核 Arm® Cortex®-A53 (ARMv8) @ 2.3GHz                                                                                                                                                                                                                          |
| **张量处理单元** | 张量处理单元计算能力：最高32TOPS (INT8)，16TFLOPS (FP16/BF16) 和2TFLOPS (FP32)<br/>支持主流深度学习框架，包括 TensorFlow、Caffe、PyTorch、Paddle、ONNX、MXNet、Tengine 和 DarkNet                                                                                                     |
|     **内存**     | 支持16GB LPDDR4X 内存选项                                                                                                                                                                                                                                                             |
|     **储存**     | 支持32GB、64GB 和 128GB 的 eMMC 储存选项<br/>内置16MB SPI 闪存<br/>支持使用 SD 卡进行数据存储和操作系统引导的 SDMMC 接口                                                                                                                                                              |
|    **多媒体**    | 支持解码32路 H.265/H.264 1080p@25fps 视频 <br/>完全处理32路高清1080P@25fps视频，包括解码和AI分析<br/> 支持编码12路 H.265/H.264 1080p@25fps 视频<br/>JPEG: 1080P@600fps，最大支持32768 x 32768 <br/>支持视频后处理，包括图像 CSC、调整大小、裁剪、填充、边框、字体、对比度和亮度调整。 |
|    **连接性**    | 2个内置千兆以太网 PHY <br/> 1个 PCIe3.0 X4 RC<br/> 1个 PCIe3.0 X4 EP <br/>最多3个 UART <br/> 最多2个 PWM <br/> 最多3个 I2C <br/> 最多32个 GPIO                                                                                                                                        |
| **板对板连接器** | 144P 0.5mm 间距 B2B 连接器                                                                                                                                                                                                                                                            |
|   **工作温度**   | -20°C 到 60°C                                                                                                                                                                                                                                                                         |

### 芯片框图

![SG2300X Block Diagram](/img/aicore-sg2300x/sg2300x-block-diagram.webp)

</TabItem>

<TabItem value="Radxa Fogwise BM168M" label="瑞莎 Fogwise BM168M">

## 产品介绍

Radxa Fogwise BM168M 是一款基于 **AICore SG2300X核心板** 的嵌入式人工智能微型服务器，算力高达 32TOPS@INT8，支持多种精度（INT8、FP16/BF16、FP32），支持私有 GPT、文本到图像等多种主流人工智能模型部署，并配备铝合金外壳，可在恶劣环境中部署。

**这个介绍 Fogwise BM168M 是为了方便介绍 AICore SG2300X 的功能。**

#### 特性

|       模块       | Radxa Fogwise BM168M                                                                                                                                                                                                                                                              |
| :--------------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|     **尺寸**     | 104 mm × 84 mm × 50.2 mm                                                                                                                                                                                                                                                          |
|    **处理器**    | SOPHON SG2300X SoC，八核 Arm® Cortex®-A53 (ARMv8) @ 2.3GHz                                                                                                                                                                                                                      |
| **张量处理单元** | 张量处理单元，计算能力：最高32TOPS (INT8)，16TFLOPS (FP16/BF16) 和2TFLOPS (FP32)<br/>支持主流深度学习框架，包括 TensorFlow、Caffe、PyTorch、Paddle、ONNX、MXNet、Tengine 和 DarkNet                                                                                               |
|     **内存**     | 16GB LPDDR4X                                                                                                                                                                                                                                                                      |
|     **储存**     | 64GB eMMC<br/>16MB SPI 闪存<br/>提供高速 SD 卡插槽                                                                                                                                                                                                                                |
|    **多媒体**    | 支持解码32路 H.265/H.264 1080p@25fps 视频<br/>完全处理32路高清1080P@25fps视频，包括解码和AI分析<br/>支持编码12路 H.265/H.264 1080p@25fps 视频 <br/>JPEG: 1080P@600fps，最大支持32768 x 32768<br/>支持视频后处理，包括图像 CSC、调整大小、裁剪、填充、边框、字体、对比度和亮度调整 |
|     **接口**     | 2个千兆以太网端口 (RJ45)<br/>1个 M.2 M 键插槽用于 NVMe SSD                                                                                                                                                                                                                        |
|   **工作温度**   | 0°C 到 40°C                                                                                                                                                                                                                                                                       |
|     **外壳**     | 耐腐蚀的铝合金外壳                                                                                                                                                                                                                                                                |
|     **散热**     | PWM速度控制风扇，带有定制散热器                                                                                                                                                                                                                                                   |

#### 实物照片

![Fogwise BM168M Overview](/img/bm168m/radxa_fogwise_bm168m.webp)

### 芯片框图

![SG2300X Block Diagram](/img/aicore-sg2300x/sg2300x-block-diagram.webp)

</TabItem>

</Tabs>
