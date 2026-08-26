---
sidebar_position: 3
---

# 瑞莎 VMARC-Q9075

## 产品介绍

瑞莎 VMARC-Q9075 是一款基于高通跃龙 IQ-9075 处理器的高性能 AI 计算核心模组，采用 314-Pin MXM 3.0 连接器，尺寸为 82 毫米 × 80 毫米，适合空间受限且对计算性能、AI 推理和多媒体处理能力要求较高的嵌入式应用。

该核心模组集成 8 核 Kryo Gen 6 CPU、4 核 Cortex-R52 MCU、高通 Adreno 663 GPU 和 Hexagon Tensor Processor（HTP），可提供 100 Dense / 200 Sparse TOPS@INT8 AI 算力。模组配备 36GB LPDDR5 内存和 128GB UFS 3.1 存储，支持多路高清摄像头、显示输出、2.5GbE、USB 3.2 Gen 2、PCIe Gen4 及 CAN、UART、SPI、I2C、GPIO 等扩展信号。

瑞莎 VMARC-Q9075 开发套件由核心模组和配套载板组成，提供双 2.5GbE 网口、M.2 NVMe SSD、Wi-Fi / 蓝牙及 4G / 5G 扩展能力，并集成多路 USB、CAN、RS-232、RS-485、显示和摄像头接口，可用于快速完成性能评估、接口验证、AI 应用开发与产品原型搭建。

## 产品实物

<Tabs queryString="board model">

<TabItem value="瑞莎 VMARC-Q9075">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="瑞莎 VMARC-Q9075 载板">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-io-board-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="瑞莎 VMARC-Q9075 开发套件">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-dev-kit-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## 产品规格

<Tabs queryString="board model">

<TabItem value="瑞莎 VMARC-Q9075">

| 类别       | 规格                                                                                                                                                                                                                                                                                                                                                 |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 处理器     | 高通跃龙 IQ-9075                                                                                                                                                                                                                                                                                                                                     |
| 中央处理器 | 8 核 Kryo Gen 6，最高主频可达 2.36GHz                                                                                                                                                                                                                                                                                                                |
| 微控制器   | 4 核 Cortex-R52，最高主频可达 1.85GHz                                                                                                                                                                                                                                                                                                                |
| 图形处理器 | 高通 Adreno 663<br/>- 支持安全通用 GPU 计算，1.2 TFLOPS FP32 算力<br/>- 支持 Vulkan 1.2、OpenGL ES 3.2、OpenCL 2.0 FP<br/>- 支持 Adreno NN Direct                                                                                                                                                                                                    |
| AI 性能    | 100 Dense / 200 Sparse TOPS@INT8<br/>- 采用 Hexagon Tensor Processor（HTP），集成四路 HVX 与双路 HMX<br/>- 支持主流深度学习框架：TensorFlow、PyTorch、ONNX、Paddle、Caffe、DarkNet 等                                                                                                                                                                |
| 视频编解码 | Adreno VPU 765<br/>视频解码：<br/>- 支持 AV1、HEVC、H.264、H.265、VP9、MPEG2 视频格式<br/>- 性能：1 路 8K@60fps / 2 路 8K@30fps / 4 路 4K@60fps / 8 路 4K@30fps / 16 路 1080p@60fps / 32 路 1080p@30fps<br/>视频编码：<br/>- 支持 H.264、H.265、HEIF、HEIC 视频格式<br/>- 性能：2 路 4K@60fps / 4 路 4K@30fps / 8 路 1080p@60fps / 16 路 1080p@30fps |
| 内存       | LPDDR5<br/>- 容量：36GB<br/>- 内存位宽：96 位<br/>- 最高速率：6400 MT/s                                                                                                                                                                                                                                                                              |
| 存储       | 1× 板载 32MB SPI Flash<br/>1× 板载 128GB UFS 3.1（Gear4 x2）                                                                                                                                                                                                                                                                                         |
| 显示       | 1× MIPI DSI 显示信号<br/>1× eDP 显示信号<br/>1× HDMI TX 信号（DP 转 HDMI 信号）<br/>1× DP TX 信号                                                                                                                                                                                                                                                    |
| 摄像头     | 1× MIPI CSI 摄像头信号（4 通道）<br/>1× MIPI CSI 摄像头信号（2 通道）                                                                                                                                                                                                                                                                                |
| 网络       | 2× 2.5GbE PHY                                                                                                                                                                                                                                                                                                                                        |
| USB        | 2× USB 3.2 Gen 2 信号（10Gbps）<br/>4× USB 2.0 信号                                                                                                                                                                                                                                                                                                  |
| PCIe       | 2× PCIe Gen4 x2                                                                                                                                                                                                                                                                                                                                      |
| GPIO       | 2× CAN<br/>2× I2S<br/>4× UART<br/>2× SPI<br/>5× I2C<br/>14× GPIO                                                                                                                                                                                                                                                                                     |
| 供电       | DC 输入（12 V）                                                                                                                                                                                                                                                                                                                                      |
| 连接器     | 314-Pin MXM 3.0 连接器                                                                                                                                                                                                                                                                                                                               |
| 机械尺寸   | 82 毫米 x 80 毫米                                                                                                                                                                                                                                                                                                                                    |

</TabItem>

<TabItem value="瑞莎 VMARC-Q9075 载板">

| 类别         | 规格                                                                                                                                                                                                 |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 兼容核心模组 | VMARC-Q9075                                                                                                                                                                                          |
| 存储         | 1× M.2 M Key 2280 插槽（NVMe 固态硬盘）                                                                                                                                                              |
| 网络         | 2× 2.5GbE RJ45 网口<br/>1× M.2 E Key 2230 插槽（Wi-Fi / 蓝牙模组）<br/>1× M.2 B Key 3042 插槽（4G / 5G 蜂窝模组）<br/>1× Nano SIM 卡槽                                                               |
| 显示         | 1× MIPI DSI 显示接口（4 通道，39-pin）<br/>1× eDP 接口<br/>1× HDMI 标准接口（Type-A）<br/>1× DP 接口（DisplayPort）                                                                                  |
| 摄像头       | 1× MIPI CSI 摄像头接口（4 通道，31-pin）<br/>1× MIPI CSI 摄像头接口（2 通道，15-pin）                                                                                                                |
| USB          | 4× USB 3.1 Type-A <br/>1× USB 3.2 Gen 2 接口<br/>3× USB 2.0 接口<br/>1× USB Type-C 调试接口                                                                                                          |
| 其它接口     | 1× 电源按键 <br/>1× EDL 按键 <br/>1× 状态指示灯<br/>1× 风扇接口 <br/>1× RTC 电池接口<br/>4× CAN 总线接口<br/>2× RS-232 接口<br/>1× RS-485 接口<br/>1× 40-Pin GPIO 排针（UART / SPI / PWM / GPIO 等） |
| 供电         | DC5525 电源插孔或 XT60 供电接口（19–24V 输入）                                                                                                                                                       |
| 核心模组接口 | 314-Pin MXM 3.0 连接器                                                                                                                                                                               |
| 机械尺寸     | 120 毫米 x 120 毫米                                                                                                                                                                                  |

</TabItem>

<TabItem value="瑞莎 VMARC-Q9075 开发套件">

| 类别       | 规格                                                                                                                                                                                                                                                                                                                                 |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 核心模组   | 瑞莎 VMARC-Q9075                                                                                                                                                                                                                                                                                                                     |
| 载板       | 瑞莎 VMARC-Q9075 载板                                                                                                                                                                                                                                                                                                                |
| 中央处理器 | 8 核 Kryo Gen 6，最高主频可达 2.36GHz                                                                                                                                                                                                                                                                                                |
| 微控制器   | 4 核 Cortex-R52，最高主频可达 1.85GHz                                                                                                                                                                                                                                                                                                |
| 图形处理器 | 高通 Adreno 663<br/>- 支持安全通用 GPU 计算，1.2 TFLOPS FP32 算力<br/>- 支持 Vulkan 1.2、OpenGL ES 3.2、OpenCL 2.0 FP<br/>- 支持 Adreno NN Direct                                                                                                                                                                                    |
| AI 性能    | 100 Dense / 200 Sparse TOPS@INT8<br/>- 采用 Hexagon Tensor Processor（HTP），集成四路 HVX 与双路 HMX<br/>- 支持主流深度学习框架：TensorFlow、PyTorch、ONNX、Paddle、Caffe、DarkNet 等                                                                                                                                                |
| 视频编解码 | Adreno VPU 765<br/>视频解码：<br/>- 支持 AV1、HEVC、H.264、H.265、VP9、MPEG2 视频格式<br/>- 性能：1 路 8K@60fps/2 路 8K@30fps/4 路 4K@60fps/8 路 4K@30fps/16 路 1080p@60fps/32 路 1080p@30fps<br/>视频编码：<br/>- 支持 H.264、H.265、HEIF、HEIC 视频格式<br/>- 性能：2 路 4K@60fps/4 路 4K@30fps/8 路 1080p@60fps/16 路 1080p@30fps |
| 内存       | LPDDR5<br/>- 容量：36GB<br/>- 内存位宽：96 位<br/>- 最高速率：6400 MT/s                                                                                                                                                                                                                                                              |
| 存储       | 1× 板载 32MB SPI Flash<br/>1× 板载 128GB UFS 3.1（Gear4 x2）<br/>1× M.2 M Key 2280 插槽（NVMe 固态硬盘）                                                                                                                                                                                                                             |
| 显示       | 1× MIPI DSI 显示接口（4 通道，39-pin）<br/>1× eDP 接口<br/>1× HDMI 标准接口（Type-A）<br/>1× DP 接口                                                                                                                                                                                                                                 |
| 摄像头     | 1× MIPI CSI 摄像头接口（4 通道，31-pin）<br/>1× MIPI CSI 摄像头接口（2 通道，15-pin）                                                                                                                                                                                                                                                |
| 网络       | 2× 2.5GbE RJ45 网口<br/>1× M.2 E 2230 Key 插槽（Wi-Fi / 蓝牙模组）<br/>1× M.2 B Key 3042 插槽（4G / 5G 蜂窝模组）<br/>1× Nano SIM 卡槽                                                                                                                                                                                               |
| USB        | 4× USB 3.2 Gen 2 Type-A（10Gbps）<br/>1× USB 3.2 Gen 2 接口（10Gbps）<br/>3× USB 2.0 接口<br/>1× USB Type-C 调试接口                                                                                                                                                                                                                 |
| 其它接口   | 1× 电源按键 <br/>1× EDL 按键 <br/>1× 状态指示灯<br/>1× 风扇接口 <br/>1× RTC 电池接口<br/>4× CAN 总线接口<br/>2× RS-232 接口<br/>1× RS-485 接口<br/>1× 40-Pin GPIO 排针（UART / SPI / PWM / GPIO 等）                                                                                                                                 |
| 供电       | DC5525 电源插孔或 XT60 供电接口（19–24V 输入）                                                                                                                                                                                                                                                                                       |
| 连接器     | 314-Pin MXM 3.0 连接器                                                                                                                                                                                                                                                                                                               |
| 机械尺寸   | 120 x 120 毫米                                                                                                                                                                                                                                                                                                                       |

</TabItem>

</Tabs>

## 系统框图

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/block_diagram_radxa_vmarc_q9075.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口说明

<Tabs queryString="board interface">

<TabItem value="瑞莎 VMARC-Q9075">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明          | 序号 | 说明             | 序号 | 说明                   |
| :--: | :------------ | :--: | :--------------- | :--: | :--------------------- |
|  1   | LPDDR5        |  2   | 高通跃龙 IQ-9075 |  3   | 314-Pin MXM 3.0 连接器 |
|  4   | SPI NOR Flash |  5   | 高通 QCA8081     |  6   | 板载 UFS               |

</TabItem>

<TabItem value="瑞莎 VMARC-Q9075 载板">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-io-board-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                   | 序号 | 说明                   | 序号 | 说明                    |
| :--: | :--------------------- | :--: | :--------------------- | :--: | :---------------------- |
|  1   | 风扇接口               |  2   | 40-Pin GPIO 排针       |  3   | 4× CAN 总线接口         |
|  4   | 2× RS-232 接口         |  5   | RS-485 接口            |  6   | XT60 供电接口           |
|  7   | 314-Pin MXM 3.0 连接器 |  8   | DP 接口                |  9   | 4× USB 3.2 Gen 2 Type-A |
|  10  | Nano SIM 卡槽          |  11  | eDP 接口               |  12  | 1× 4 通道 MIPI CSI      |
|  13  | 1× 2 通道 MIPI CSI     |  14  | 1× M.2 M Key 2280 插槽 |  15  | USB Type-C 调试接口     |
|  16  | 电源按键               |  17  | USB 3.2 Gen 2 接口     |  18  | 3× USB 2.0 接口         |
|  19  | RTC 电池接口           |  20  | EDL 按键               |  21  | DC5525 电源插孔         |
|  22  | HDMI 接口              |  23  | 2× 2.5GbE RJ45 网口    |  24  | 1× 4 通道 MIPI DSI      |
|  25  | 1× M.2 B Key 3042 插槽 |  26  | 1× M.2 E Key 2230 插槽 |      |                         |

</TabItem>

<TabItem value="瑞莎 VMARC-Q9075 开发套件">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-dev-kit-interface.webp" alt="开发套件接口图" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                   | 序号 | 说明                   | 序号 | 说明                    |
| :--: | :--------------------- | :--: | :--------------------- | :--: | :---------------------- |
|  1   | 风扇接口               |  2   | 40-Pin GPIO 排针       |  3   | 4× CAN 总线接口         |
|  4   | 2× RS-232 接口         |  5   | RS-485 接口            |  6   | XT60 供电接口           |
|  7   | 314-Pin MXM 3.0 连接器 |  8   | DP 接口                |  9   | 4× USB 3.2 Gen 2 Type-A |
|  10  | Nano SIM 卡槽          |  11  | eDP 接口               |  12  | 1× 4 通道 MIPI CSI      |
|  13  | 1× 2 通道 MIPI CSI     |  14  | 1× M.2 M Key 2280 插槽 |  15  | USB Type-C 调试接口     |
|  16  | 电源按键               |  17  | USB 3.2 Gen 2 接口     |  18  | 3× USB 2.0 接口         |
|  19  | RTC 电池接口           |  20  | EDL 按键               |  21  | DC5525 电源插孔         |
|  22  | HDMI 接口              |  23  | 2× 2.5GbE RJ45 网口    |  24  | 1× 4 通道 MIPI DSI      |
|  25  | 1× M.2 B Key 3042 插槽 |  26  | 1× M.2 E Key 2230 插槽 |      |                         |

</TabItem>

</Tabs>

## 应用场景

### 边缘 AI 计算与智能网关

依托 100 Dense / 200 Sparse TOPS@INT8 AI 算力、双 2.5GbE 网口以及 Wi-Fi、蓝牙和 4G / 5G 扩展能力，可在边缘侧完成数据汇聚、AI 推理和实时决策，适用于工业网关、边缘服务器及多协议数据采集设备。

### 机器视觉与视频分析

支持 4 通道和 2 通道 MIPI CSI 摄像头输入，以及多路 8K、4K 和 1080p 视频编解码，可用于视觉检测、目标识别、行为分析、多路视频汇聚和智能安防等应用。

### 工业自动化与设备控制

4 核 Cortex-R52 MCU 配合 CAN、RS-232、RS-485、UART、SPI、I2C 和 GPIO 等接口，可连接传感器、执行器及工业控制设备，适用于自动化产线、机器状态监测、质量检测和设备控制系统。

### 机器人与自主设备

多核 CPU、GPU 和高性能 AI 加速能力可协同处理环境感知、目标检测和路径规划任务；丰富的摄像头、网络和控制接口便于扩展传感器与运动控制模块，可用于移动机器人、服务机器人、巡检设备及其他自主系统。

### 智能显示与交互终端

通过 MIPI DSI、eDP、HDMI 和 DP 显示能力，可搭建高分辨率、多屏或嵌入式显示方案，适用于数字标牌、智慧零售、自助终端、信息发布和智能交互设备。
