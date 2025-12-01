---
sidebar_position: 10
---

# Orion O6

## Product Overview

Radxa Orion O6 is a high-performance Mini-ITX (170mm x 170mm) motherboard based on the CIX P1 SoC, integrating a powerful 12-core CPU architecture, Arm Immortals™ G720 MC10 GPU, and a 30 TOPS NPU.

This product features rich I/O interfaces, including quad-display output, dual 5GbE networking, and PCIe Gen4 expansion. It is specifically designed for high-performance applications such as AI inference, graphics processing, video codecs, and multi-display setups, making it an ideal choice for AI development workstations, edge computing nodes, and high-performance personal computing applications.

## Product Appearance

| No. |           View            | No. |           View           | No. |           View           |
| :-: | :-----------------------: | :-: | :----------------------: | :-: | :----------------------: |
|  ①  | Radxa Orion O6 Front View |  ②  | Radxa Orion O6 Side View |  ③  | Radxa Orion O6 Rear View |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6/orion-o6-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Package Contents

- Radxa Orion O6 Motherboard
- Radxa 8420B Heatsink
- Acrylic Case
- I/O Shield

Note: The actual contents may vary depending on the purchase platform. The acrylic case and heatsink are pre-installed on the motherboard.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6/orion-o6-package-list.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Specifications

| Category         | Description                                                                                                                                                                                                           |
| :--------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SoC              | CIX P1                                                                                                                                                                                                                |
| CPU              | 4x Performance Cores: Cortex®-A720, up to 2.6 GHz<br/>4x Balanced Cores: Cortex®-A720, up to 2.4 GHz<br/>4x Efficiency Cores: Cortex®-A520, up to 1.8 GHz<br/>System Cache: 12MB L3 cache shared across all cores  |
| GPU              | Arm® Immortals™ G720 MC10<br/>- Hardware-accelerated ray tracing<br/>- OpenGL ES 3.2 support<br/>- Vulkan 1.3 support<br/>- OpenCL 2.2 support<br/>- DirectX 12 support                                             |
| NPU              | 30 TOPS computing power<br/>- Supports INT4 / INT8 / INT16 / FP16 / BF16 / TF32 precision                                                                                                                             |
| Video Codec      | Decoding:<br/>- Supports AV1 / H.265 / H.264 / VP9 / VP8 / H.263 / MPEG-4 / MPEG-2 formats<br/>- Up to 8K@60fps decoding<br/>Encoding:<br/>- Supports H.265 / H.264 / VP9 / VP8 formats<br/>- Up to 8K@30fps encoding |
| Memory           | LPDDR5<br/>- 128-bit bus width<br/>- Transfer rate: 5500 MT/s<br/>- Configurable capacity: 8GB / 12GB / 16GB / 24GB / 32GB / 64GB                                                                                     |
| Storage          | 1x M.2 M Key slot (PCIe Gen4 x4) for M.2 NVMe SSD expansion                                                                                                                                                           |
| Video Output     | 1x USB Type-C with DP Alt Mode, up to 4Kp60<br/>1x HDMI, up to 4Kp60<br/>1x DisplayPort with 2-way MST, up to 4Kp120<br/>1x eDP, up to 4Kp60                                                                          |
| Video Input      | 2x 4-lane MIPI CSI interfaces                                                                                                                                                                                         |
| USB Ports        | 2x USB 3.2 Type-A (rear)<br/>2x USB 2.0 Type-A (rear)<br/>2x USB 2.0 Type-A (front)<br/>2x USB 3.2 Type-C (rear), one with DP video output                                                                            |
| Networking       | 2x 5G Ethernet<br/>1x M.2 E Key 2230 for Wi-Fi and Bluetooth                                                                                                                                                          |
| Power Supply     | 20V USB Type-C input with PD support<br/>ATX 24-pin power connector                                                                                                                                                   |
| PCIe Slot        | 1x PCIe x16 slot (PCIe Gen4 x8) for expansion cards                                                                                                                                                                   |
| Cooling          | 4-pin fan header with PWM speed control<br/>4x heatsink mounting points<br/>- Mounting holes: M3.5<br/>- Size: 75mm x 75mm                                                                                            |
| Other Interfaces | 1x Power button<br/>1x Reset button<br/>1x 40-pin GPIO header<br/>1x 2-pin 1.25mm RTC battery connector<br/>1x 3.5mm audio jack (with microphone support)<br/>1x Front panel audio header                             |
| Recommended PSU  | ≥ 65W                                                                                                                                                                                                                 |
| Dimensions       | Mini ITX: 170mm x 170mm                                                                                                                                                                                               |

## Interface Description

<div style={{textAlign: 'center'}}>
   <img src="/en/img/orion/o6/orion-o6-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description                                                             | No. | Description                                                   | No. | Description                              |
| --- | ----------------------------------------------------------------------- | --- | ------------------------------------------------------------- | --- | ---------------------------------------- |
| 1   | USB 2.0 (Front Panel)                                                   | 11  | 2x Speaker Connectors                                         | 21  | Power Button                             |
| 2   | Audio Header (Front Panel)                                              | 12  | Status LEDs                                                   | 22  | 4-pin Fan Header<br/>- PWM Speed Control |
| 3   | Touch Panel Interface                                                   | 13  | Reset Button                                                  | 23  | BIOS Flash Socket                        |
| 4   | Multi-function Header (Front Panel)<br/>- Power / LED / Reset Functions | 14  | 3.5mm Audio Jack                                              | 24  | CIX P1 SoC                               |
| 5   | UART Interface                                                          | 15  | 2x 5G Ethernet                                                | 25  | 40-pin GPIO Header                       |
| 6   | eDP Interface                                                           | 16  | DisplayPort                                                   | 26  | LPDDR5                                   |
| 7   | RTC Battery Holder                                                      | 17  | HDMI Port                                                     | 27  | ATX Power Connector                      |
| 8   | PCIe x16 Slot (PCIe Gen4 x8)                                            | 18  | 2x USB 3.2 Type-A                                             | 28  | 2x MIPI CSI 4-lane                       |
| 9   | M.2 M Key Slot                                                          | 19  | 2x USB 2.0 Type-A                                             | 29  | TPM (Unsoldered)                         |
| 10  | M.2 E Key 2230 Slot                                                     | 20  | 2x USB Type-C<br/>- 20V Type-C PD Input<br/>- DP Video Output |     |                                          |

## Application Scenarios

### AI Inference & Machine Learning

- **Smart Vision Analysis**: Leverage 30 TOPS NPU for real-time image recognition, object detection, and behavior analysis
- **Natural Language Processing**: Support for localized AI model deployment, providing efficient speech recognition and natural language understanding
- **Edge AI Computing**: Run complex machine learning models on edge devices, reducing cloud dependency

### Education & Research

- **AI Education Platform**: Provide students with hands-on experience in AI model training and inference
- **Scientific Computing**: Support deep learning research, computer vision algorithm development, and data analysis
- **Prototype Validation**: Quickly validate AI algorithms and models, accelerating research outcomes

### Robotics Development

- **Autonomous Navigation**: Combine visual processing and AI inference for environmental awareness and path planning
- **Robotic Arm Control**: Utilize real-time computing for precise motion control and visual servoing
- **Human-Machine Interaction**: Enable natural interaction through speech recognition and visual analysis

### Multimedia Processing

- **8K Video Processing**: Support 8K@60fps decoding and 8K@30fps encoding for professional video editing and streaming
- **Multi-display Systems**: Support triple display up to 4Kp120, ideal for digital signage, control rooms, and multimedia displays
- **Graphics Rendering**: Arm Immortals™ G720 GPU with hardware-accelerated ray tracing for 3D rendering and game development

### Industrial & Commercial Applications

- **Industrial Automation**: Connect industrial cameras via MIPI CSI for quality inspection and production monitoring
- **Smart Retail**: Integrated AI vision analytics for customer flow analysis, product recognition, and smart recommendations
- **Digital Signage**: Multi-display capabilities for advertising, information display, and interactive kiosks

### Networking & Communication

- **Gateway Devices**: Dual 2.5G Ethernet and 4G support for industrial gateways and routers
- **Remote Monitoring**: Combine video processing and networking for surveillance and video conferencing systems
- **IoT Edge Nodes**: Rich I/O and powerful processing for IoT data aggregation and processing

## Software Support

- Debian / Ubuntu Linux distributions
- Full UEFI support (via EDKII)
- Hardware adaptation packages (BSP) and software development kits (SDK)
