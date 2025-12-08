---
sidebar_position: 10
---

# Orion O6N

## Product Overview

The Radxa Orion O6N is a high-performance Nano-ITX (120mm x 120mm) motherboard based on the CIX P1 SoC, featuring a powerful 12-core CPU architecture, Arm Immortals™ G720 MC10 GPU, and a 30 TOPS NPU.

This product supports up to 64GB LPDDR5 memory and multiple storage expansion options, providing rich video input/output interfaces, high-speed network connectivity, and comprehensive expansion capabilities.

The O6N is specifically designed for high-performance applications such as AI inference, graphics processing, video codec, and multi-display, making it an ideal choice for edge computing, smart devices, and multimedia applications.

## Product Appearance

| No. |            View            | No. |           View            | No. |           View            |
| :-: | :------------------------: | :-: | :-----------------------: | :-: | :-----------------------: |
|  ①  | Radxa Orion O6N Front View |  ②  | Radxa Orion O6N Side View |  ③  | Radxa Orion O6N Rear View |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Package Contents

- Radxa Orion O6N Motherboard
- Radxa 8420B Heatsink
- Radxa DC12 60W Power Adapter

Note: The actual package contents are subject to the purchase platform's specifications.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-package-list.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Product Specifications

| Category                       | Specifications                                                                                                                                                                                                        |
| :----------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| System on Chip (SoC)           | CIX P1                                                                                                                                                                                                                |
| Central Processing Unit (CPU)  | 4x Big Cores Cortex®-A720, up to 2.6 GHz<br/>4x Middle Cores Cortex®-A720, up to 2.4 GHz<br/>4x Small Cores Cortex®-A520, up to 1.8 GHz<br/>System Cache: 12MB L3 cache shared across all cores                    |
| Graphics Processing Unit (GPU) | Arm® Immortals™ G720 MC10<br/>- Hardware-accelerated ray tracing<br/>- OpenGL ES 3.2 support<br/>- Vulkan 1.3 support<br/>- OpenCL 2.2 support<br/>- DirectX 12 support                                             |
| Neural Processing Unit (NPU)   | 30 TOPS computing power<br/>- Supports INT4 / INT8 / INT16 / FP16 / BF16 / TF32 precisions                                                                                                                            |
| Video Codec                    | Decoding:<br/>- Supports AV1 / H.265 / H.264 / VP9 / VP8 / H.263 / MPEG-4 / MPEG-2 formats<br/>- Up to 8K@60fps decoding<br/>Encoding:<br/>- Supports H.265 / H.264 / VP9 / VP8 formats<br/>- Up to 8K@30fps encoding |
| Memory                         | LPDDR5<br/>- 128-bit data bus width<br/>- Transfer speed: 5000 MT/s or 6000 MT/s options<br/>- Capacity options: 8GB / 16GB / 24GB / 32GB / 48GB / 64GB                                                               |
| Storage                        | 1x UFS module interface for Radxa UFS module expansion<br/>2x M.2 M Key 2280 slots (PCIe Gen4 x4) for M.2 NVMe SSD expansion                                                                                          |
| Video Output                   | Supports up to 3 simultaneous displays<br/>- 1x USB Type-C with DP Alt Mode, up to 4Kp60<br/>- 1x HDMI port, up to 4Kp60<br/>- 1x DP port with Multi-Stream Transport, up to 4Kp120                                   |
| Video Input                    | 2x 4-lane MIPI CSI interfaces                                                                                                                                                                                         |
| USB Ports                      | 1x USB 3.2 HOST Type-C<br/>2x USB 3.2 HOST Type-A<br/>3x USB 2.0 HOST Type-A                                                                                                                                          |
| Networking                     | 2x 2.5G Ethernet<br/>1x M.2 E Key 2230 for Wi-Fi and Bluetooth<br/>1x M.2 B Key 3042 for mobile network (4G)<br/>1x Nano SIM card slot for mobile network (4G)                                                        |
| Power Supply                   | 12V DC power input or 12V pin power input                                                                                                                                                                             |
| Cooling                        | 4-Pin fan header with PWM speed control and tachometer<br/>4x heatsink mounting points<br/>- Mounting holes: M3.5<br/>- Dimensions: 75mm x 75mm                                                                       |
| Other Interfaces               | 1x Power button<br/>1x 40-Pin GPIO header<br/>1x RTC battery holder (CR1220 compatible)<br/>1x 4-Pin power interface:<br/>- 12V supports input/output<br/>- 5V supports output only                                   |
| Recommended Power Supply       | ≥ 65W                                                                                                                                                                                                                 |
| Dimensions                     | Nano-ITX: 120mm x 120mm                                                                                                                                                                                               |

## Interface Specifications

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6n/orion-o6n-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description                                       | No. | Description               | No. | Description           |
| --- | ------------------------------------------------- | --- | ------------------------- | --- | --------------------- |
| 1   | USB Type-C Port (Supports DP Video Output)        | 9   | 12V DC Power Input (5525) | 17  | M.2 B Key 3042 Slot   |
| 2   | 4-Pin Fan Header (PWM Speed Control & Tachometer) | 10  | Standard DP Port          | 18  | Nano SIM Card Slot    |
| 3   | 40-Pin GPIO Header                                | 11  | Standard HDMI Port        | 19  | CIX P1 SoC            |
| 4   | MIPI CSI Interface (4-lane)                       | 12  | 2x USB 3.0 Type-A         | 20  | SPI Nor Flash (BIOS)  |
| 5   | LPDDR5                                            | 13  | USB 2.0 Type-A            | 21  | UFS Module Interface  |
| 6   | M.2 E Key 2230 Slot                               | 14  | Power Button              | 22  | RTC Battery Connector |
| 7   | MIPI CSI Interface (4-lane)                       | 15  | 5V / 12V Power Port       | 23  | 2x 2.5G Ethernet      |
| 8   | M.2 M Key 2280 Slot                               | 16  | M.2 M Key 2280 Slot       | 24  | 2x USB 2.0 Type-A     |

## Application Scenarios

### AI Inference and Machine Learning

- **Intelligent Visual Analysis**: Leverage 30 TOPS NPU computing power for real-time image recognition, object detection, and behavior analysis
- **Natural Language Processing**: Support localized AI model deployment, providing efficient speech recognition and natural language understanding capabilities
- **Edge AI Computing**: Run complex machine learning models on edge devices, reducing cloud dependency

### Education and Research

- **AI Teaching Platform**: Provide students with a practical environment for local AI model training and inference
- **Scientific Computing**: Support deep learning research, computer vision algorithm development, and data analysis
- **Prototype Validation**: Quickly validate AI algorithms and models to accelerate research outcomes

### Robotics Development

- **Autonomous Navigation**: Combine visual processing and AI inference to achieve environmental perception and path planning for robots
- **Robotic Arm Control**: Utilize real-time computing capabilities to support precise robotic motion control and visual servoing
- **Human-Robot Interaction**: Enable natural human-robot interaction through speech recognition and visual analysis

### Multimedia Processing

- **8K Video Processing**: Support 8K@60fps decoding and 8K@30fps encoding, suitable for professional video editing and streaming applications
- **Multi-Display System**: Support for three simultaneous displays up to 4Kp120, ideal for digital signage, monitoring centers, and multimedia displays
- **Graphics Rendering**: Arm Immortals™ G720 GPU with hardware-accelerated ray tracing, suitable for 3D rendering and game development

### Industrial and Commercial Applications

- **Industrial Automation**: Connect industrial cameras via MIPI CSI interfaces for quality inspection and production monitoring
- **Smart Retail**: Integrated AI vision analysis supports customer flow statistics, product recognition, and intelligent recommendations
- **Digital Signage**: Multi-display capability is ideal for advertising, information display, and interactive kiosks

### Networking and Communication

- **Gateway Devices**: Dual 2.5G Ethernet ports and 4G network support make it suitable as an industrial gateway or router
- **Remote Monitoring**: Combine video processing and network capabilities to build remote monitoring and video conferencing systems
- **IoT Edge Node**: Rich interfaces and powerful processing capabilities make it ideal as an IoT data aggregation and processing node

## Software Support

- Debian / Ubuntu Linux distributions
- Full UEFI support (via EDKII implementation)
- Hardware adaptation package (BSP) and software development kit (SDK) provided
