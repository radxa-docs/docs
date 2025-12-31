---
sidebar_position: 3
---

# 瑞莎 NX4

## 产品介绍

瑞莎 NX4 是一款基于瑞芯微 RK3576(J) 的高性能 AI 计算核心板，采用 260-pin SO-DIMM 封装，尺寸仅 69.6mm × 45mm。

该核心板集成了 4 核 Cortex-A72 + 4 核 Cortex-A53 CPU、ARM Mali G52 MC3 GPU 和 6 TOPS@INT8 NPU，支持主流深度学习框架。提供丰富的接口和扩展能力，适用于边缘计算、机器视觉、智能终端等应用场景。

瑞莎 NX4 专为 Radxa NX4 打造，支持快速功能验证与原型搭建，方便用户在短时间内完成上电调试、接口评估及应用开发上手。

## 产品实物

<Tabs queryString="board model">

<TabItem value="瑞莎 NX4">

| 产品实物 | 序号 |  视图  | 序号 |  视图  |
| :------: | :--: | :----: | :--: | :----: |
| 瑞莎 NX4 |  ①   | 俯视图 |  ②   | 背视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="瑞莎 NX4 载板">

瑞莎 NX4 载板可用于快速验证瑞莎 NX4 功能，方便用户快速上手。

|   产品实物    | 序号 |  视图  | 序号 |  视图  |
| :-----------: | :--: | :----: | :--: | :----: |
| 瑞莎 NX4 载板 |  ①   | 俯视图 |  ②   | 背视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-io-board-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="瑞莎 NX4 开发套件">

由瑞莎 NX4 和瑞莎 NX4 载板组成，可用于快速验证核心板功能、评估性能并搭建原型系统，帮助用户高效完成开发与方案验证。

|     产品实物      | 序号 |  视图  | 序号 |  视图  | 序号 |  视图  |
| :---------------: | :--: | :----: | :--: | :----: | :--: | :----: |
| 瑞莎 NX4 开发套件 |  ①   | 俯视图 |  ②   | 侧视图 |  ③   | 背视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-dev-kit-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## 产品规格

| 产品型号              | 瑞莎 NX4                                                                                                                                                                                              |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SoC（主控）           | 瑞芯微 RK3576(J)                                                                                                                                                                                      |
| CPU（中央处理器）     | 4 核 Cortex-A72 + 4 核 Cortex-A53                                                                                                                                                                     |
| GPU（图形处理器）     | ARM Mali G52 MC3<br/>- 支持 OpenGL ES 1.1, 2.0 and 3.2, OpenCL 2.1, Vulkan 1.2                                                                                                                        |
| NPU（神经网络处理器） | 6 TOPS@INT8<br/>- 支持 INT4 / INT8 / INT16 / FP16 / BF16 / TF32 等计算精度<br/>- 支持 TensorFlow, Caffe, Tflite, Pytorch, Onnx NN, Android NN 等深度学习框架                                          |
| 内存                  | LPDDR5<br/>- 容量：最高 16GB<br/>- 内存总线宽度：32 位（双通道，每通道 16 位）<br/>- 数据传输速率：最高 5500 MT/s                                                                                     |
| 视频编解码            | 视频编码<br/>- 最高支持 4K@60fps 的 H.265 多路视频编码器<br/>视频解码<br/>- 最高支持 8K@30fps 或 4K@120fps 的 AV1 / AVS2 / VP9 / H.265 多路视频解码器<br/>- 最高支持 4K@60fps 的 H.264 多路视频解码器 |
| 存储                  | 可选 eMMC 或 UFS<br/>- eMMC 5.1, 最大可选 256GB<br/>- UFS 2.0, 最大可选 1TB<br/>板载 SPI Flash（可选）<br/>1x SDMMC                                                                                   |
| 网络                  | 1x 千兆以太网<br/>板载 WiFI 6 & BT5.4<br/>- 板载天线接口                                                                                                                                              |
| 显示                  | 1x HDMI 2.1<br/>- 最高支持 4K@120Hz                                                                                                                                                                   |
| 摄像头                | 2x MIPI 摄像头（4 通道）                                                                                                                                                                              |
| USB                   | USB 3.2<br/>USB 2.0                                                                                                                                                                                   |
| PCIe                  | 1x PCIe2.0 x1                                                                                                                                                                                         |
| 其它接口              | 支持 UART, I2C, I2S, CAN, PWM, GPIOs 等功能                                                                                                                                                           |
| 连接器                | 260-pin SO-DIMM 连接器                                                                                                                                                                                |
| 操作系统              | 支持 Debian, Yocto, Buildroot, Android 14                                                                                                                                                             |
| 机械尺寸              | 69.6 毫米 x 45 毫米                                                                                                                                                                                   |
| 工作温度              | 0 - 60°C（商业级）<br/>-40°C to 85°C（工业级）                                                                                                                                                        |

## 接口说明

<Tabs queryString="board interface">

<TabItem value="瑞莎 NX4">

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                 | 序号 | 说明       | 序号 | 说明                   |
| :--: | :------------------- | :--: | :--------- | :--: | :--------------------- |
|  1   | WiFi 6 & BT 5.4 模组 |  2   | 天线接口   |  3   | SPI Flash (未焊接)     |
|  4   | 瑞芯微 RK3576        |  5   | 状态指示灯 |  6   | LPDDR5                 |
|  7   | Maskrom 按键         |  8   | 板载 eMMC  |  9   | 260-pin SO-DIMM 连接器 |
|  10  | 板载 UFS (未焊接)    |      |            |      |                        |

</TabItem>

<TabItem value="瑞莎 NX4 载板">

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-io-board-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                               | 序号 | 说明                                       | 序号 | 说明                                       |
| :--: | :--------------------------------- | :--: | :----------------------------------------- | :--: | :----------------------------------------- |
|  1   | MIPI 摄像头（4 通道）              |  2   | MIPI 摄像头（4 通道）                      |  3   | DC5525 供电接口（9V-20V）                  |
|  4   | PoE 反向供电接口                   |  5   | HDMI 输出接口                              |  6   | 按键接口                                   |
|  7   | 4x USB 3.2 Type-A                  |  8   | 260-pin SO-DIMM 插槽                       |  9   | CAN 总线接口                               |
|  10  | RJ45 千兆以太网口                  |  11  | USB Type-C                                 |  12  | 电源指示灯                                 |
|  13  | 40-Pin GPIO 排针                   |  14  | M.2 M Key 2230 插槽<br /> 当前版本无法使用 |  15  | M.2 M Key 2280 插槽<br /> 当前版本无法使用 |
|  16  | M.2 E Key 2230 插槽（PCIe 2.0 x1） |  17  | RTC 电池接口                               |  18  | PoE 接口                                   |
|  19  | PWM 风扇接口                       |      |                                            |      |                                            |

:::note 接口说明

瑞莎 NX4 搭配瑞莎 NX4 载板使用，M.2 M Key 2230 和 M.2 E Key 2230 插槽无法使用。

预留的 M.2 M Key 2230 和 M.2 E Key 2230 插槽将在下一次硬件版本中移除。

:::

</TabItem>

</Tabs>

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 应用场景

### 边缘计算与智能网关

依托 6 TOPS NPU 与千兆以太网、WiFi 6，无需依赖云端即可在本地完成视频分析、目标检测、人脸识别等 AI 推理任务，实现边缘侧智能决策与数据预处理，大幅降低网络带宽与云端算力压力。

### 机器视觉与工业自动化

可用于视觉检测、识别与测量等机器视觉场景，并与现场总线、工业控制设备协同工作，构建柔性生产线、自动检测工站和智能设备。

### 服务与移动机器人

多核 CPU + NPU 组合，配合 IMU 与各类传感器扩展以及有线/无线网络能力，可作为移动机器人或协作机器人主控平台，用于路径规划、环境感知、目标跟踪以及远程运维与状态监控等应用。

### 交互式终端与智能显示

适用于智能广告机、信息查询终端、自助设备、智慧零售终端等应用，通过高分辨率显示与本地智能分析，实现更丰富的人机交互体验。

### 教育培训与研发验证

可用于高校与培训机构的嵌入式与 AI 教学实践平台，也适合作为企业方案原型开发与功能验证的基础硬件平台，加速从概念设计到产品落地的过程。
