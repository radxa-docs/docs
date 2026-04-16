---
sidebar_position: 3
---

# 瑞莎 NX5

## 产品介绍

瑞莎 NX5 是一款基于瑞芯微 RK3588S 的高性能核心模组，集成了 4 核 Cortex-A76 + 4 核 Cortex-A55 CPU、ARM Mali-G610 MP4 GPU 和 6 TOPS@INT8 NPU，支持主流深度学习框架。提供丰富的接口和扩展能力，支持 8K 视频编解码，适用于边缘计算、机器视觉、智能终端、多媒体处理等应用场景。

瑞莎 NX5 可搭配官方载板快速实现功能验证与原型搭建，方便用户在短时间内完成上电调试、接口评估及应用开发。

## 产品实物

<Tabs queryString="board model">

<TabItem value="瑞莎 NX5">

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="瑞莎 NX5 载板">

瑞莎 NX5 载板集成了丰富的外部接口，可用于快速验证瑞莎 NX5 核心模组的功能，帮助用户轻松完成上电调试、接口评估及初步的应用开发评估。

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-io-board-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="瑞莎 NX5 开发套件">

瑞莎 NX5 开发套件由瑞莎 NX5 核心模组、瑞莎 NX5 载板组成，提供了完整的硬件开发平台，可用于快速验证核心板功能、评估性能并搭建原型系统，帮助用户高效完成开发与方案验证。

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-dev-kit-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## 产品规格

| 产品型号              | 瑞莎 NX5                                                                                                                                                     |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| SoC（主控）           | 瑞芯微 RK3588S                                                                                                                                               |
| CPU（中央处理器）     | 4 核 Cortex-A76 + 4 核 Cortex-A55                                                                                                                            |
| GPU（图形处理器）     | ARM Mali-G610 MP4<br/>- 支持 OpenGL ES 1.1, 2.0 and 3.2, OpenCL 1.1, 1.3 and 2.2, Vulkan 1.1 and 1.2<br/>- 内嵌高性能2D图像加速模块                          |
| NPU（神经网络处理器） | 6 TOPS@INT8<br/>- 支持 INT4 / INT8 / INT16 / FP16 / BF16 / TF32 等计算精度<br/>- 支持 TensorFlow, Caffe, Tflite, Pytorch, Onnx NN, Android NN 等深度学习框架 |
| 内存                  | LPDDR4X<br/>- 容量：最高可选 16GB                                                                                                                            |
| 视频编解码            | 视频编码<br/>- 最高支持 8K@30fps 的 H.265 / H.264 视频编码<br/>视频解码<br/>- 最高支持 8K@60fps 的 AV1 / AVS2 / VP9 / H.265 / H.264 视频解码                 |
| 存储                  | 可选板载 eMMC<br/>- eMMC 5.1, 最大可选 512GB<br/>板载 SPI Flash（可选）<br/>1x SDMMC                                                                         |
| 网络                  | 1x 千兆以太网                                                                                                                                                |
| 显示                  | 1x HDMI TX<br/>- 最高支持 8K@60Hz<br/>1x eDP TX<br/>- 最高支持 4K@60Hz<br/>1x DP TX<br/>- 最高支持 8K@30Hz<br/>1x MIPI DSI（2 通道）                         |
| 摄像头                | 2x MIPI CSI（2 通道）或 1x MIPI CSI（4 通道）<br/>1x MIPI CSI（4 通道）<br/>1x MIPI CSI（2 通道）                                                            |
| USB                   | USB 3.1 Gen1<br/> USB 2.0                                                                                                                                    |
| PCIe                  | PCIe2.0                                                                                                                                                      |
| 其它接口              | 支持 UART, I2C, I2S, CAN, PWM, GPIOs 等功能                                                                                                                  |
| 连接器                | 260-pin SO-DIMM 连接器                                                                                                                                       |
| 操作系统              | 支持 Debian, Yocto, Buildroot, Android 14                                                                                                                    |
| 机械尺寸              | 70 毫米 x 45 毫米                                                                                                                                            |

## 接口说明

<Tabs queryString="board interface">

<TabItem value="瑞莎 NX5">

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明            | 序号 | 说明           | 序号 | 说明      |
| :--: | :-------------- | :--: | :------------- | :--: | :-------- |
|  1   | LPDDR4X         |  2   | 瑞芯微 RK3588S |  3   | 板载 eMMC |
|  4   | 260-pin SO-DIMM |  5   | SPI Flash      |      |           |

</TabItem>

<TabItem value="瑞莎 NX5 载板">

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-io-board-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                   | 序号 | 说明                           | 序号 | 说明                       |
| :--: | :--------------------- | :--: | :----------------------------- | :--: | :------------------------- |
|  1   | 2x USB 3.1 Gen1 Type-A |  2   | 上：DP 输出 <br/>下：HDMI 输出 |  3   | DC5525 供电接口（5V 输入） |
|  4   | 风扇接口               |  5   | MIPI 摄像头接口                |  6   | MIPI 摄像头接口            |
|  7   | 电源按键               |  8   | Maskrom 按键                   |  9   | microSD 卡槽               |
|  10  | M.2 E Key 2230 插槽    |  11  | 40-Pin GPIO 排针               |  12  | 260-pin SO-DIMM 插槽       |
|  13  | micro USB 接口（OTG）  |  14  | 千兆以太网接口                 |  15  | 2x USB 3.1 Gen1 Type-A     |

</TabItem>

<TabItem value="瑞莎 NX5 开发套件">

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-devkit-interface.webp" alt="瑞莎 NX5 开发套件接口图" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明          | 序号 | 说明     |
| :--: | :------------ | :--: | :------- |
|  1   | 瑞莎 NX5 载板 |  2   | 瑞莎 NX5 |

</TabItem>

</Tabs>

## 应用场景

### 边缘计算与智能网关

依托 6 TOPS NPU 与千兆以太网，无需依赖云端即可在本地完成视频分析、目标检测、人脸识别等 AI 推理任务，实现边缘侧智能决策与数据预处理，大幅降低网络带宽与云端算力压力。

### 机器视觉与工业自动化

可用于视觉检测、识别与测量等机器视觉场景，支持 CAN 总线等工业接口，可与现场总线、工业控制设备协同工作，构建柔性生产线、自动检测工站和智能设备。

### 多媒体处理与智能显示

支持 8K@60fps 视频解码和 8K@30fps 视频编码，适用于数字标牌、视频监控、视频会议、智能广告机、信息查询终端、自助设备、智慧零售终端等多媒体应用，通过高分辨率显示与本地智能分析，实现更丰富的人机交互体验。

### 服务与移动机器人

8 核 CPU 配合 NPU 组合，具备各类传感器扩展接口以及有线网络能力，可作为移动机器人或协作机器人主控平台，用于路径规划、环境感知、目标跟踪以及远程运维与状态监控等应用。

### 教育培训与研发验证

适用于高校与培训机构的嵌入式与 AI 教学实践平台，也适合作为企业方案原型开发与功能验证的基础硬件平台，加速从概念设计到产品落地的过程。
