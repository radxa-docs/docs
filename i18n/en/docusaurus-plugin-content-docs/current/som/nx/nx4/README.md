---
sidebar_position: 3
---

# Radxa NX4

## Product Overview

Radxa NX4 is a high-performance AI compute module based on the Rockchip RK3576(J). It uses a 260-pin SO-DIMM form factor and measures only 69.6 mm × 45 mm.

It integrates a 4-core Cortex-A72 + 4-core Cortex-A53 CPU, an ARM Mali G52 MC3 GPU, and a 6 TOPS@INT8 NPU, and supports mainstream deep learning frameworks. With rich I/O and expansion capabilities, it is suitable for edge computing, machine vision, and smart terminal applications.

Radxa NX4 is designed for fast feature validation and prototyping, helping you quickly complete bring-up, interface evaluation, and application development.

## Product Images

<Tabs queryString="board model">

<TabItem value="Radxa NX4">

|  Product  | No. |   View   | No. |    View     |
| :-------: | :-: | :------: | :-: | :---------: |
| Radxa NX4 |  ①  | Top view |  ②  | Bottom view |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx4/radxa-nx4-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Radxa NX4 IO Board">

The Radxa NX4 IO Board is used for quick validation of Radxa NX4 features and helps you get started faster.

|      Product       | No. |   View   | No. |    View     |
| :----------------: | :-: | :------: | :-: | :---------: |
| Radxa NX4 IO Board |  ①  | Top view |  ②  | Bottom view |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx4/radxa-nx4-io-board-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Radxa NX4 Development Kit">

The Radxa NX4 Development Kit consists of Radxa NX4 and the Radxa NX4 IO Board. It can be used to quickly validate compute module functionality, evaluate performance, and build a prototype system to speed up development and solution verification.

|          Product          | No. |   View   | No. |   View    | No. |    View     |
| :-----------------------: | :-: | :------: | :-: | :-------: | :-: | :---------: |
| Radxa NX4 Development Kit |  ①  | Top view |  ②  | Side view |  ③  | Bottom view |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx4/radxa-nx4-dev-kit-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## Specifications

| Model                 | Radxa NX4                                                                                                                                                                                                                     |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SoC                   | Rockchip RK3576(J)                                                                                                                                                                                                            |
| CPU                   | 4-core Cortex-A72 + 4-core Cortex-A53                                                                                                                                                                                         |
| GPU                   | ARM Mali G52 MC3<br/>- Supports OpenGL ES 1.1, 2.0 and 3.2, OpenCL 2.1, Vulkan 1.2                                                                                                                                            |
| NPU                   | 6 TOPS@INT8<br/>- Supports INT4 / INT8 / INT16 / FP16 / BF16 / TF32 compute precision<br/>- Supports TensorFlow, Caffe, Tflite, Pytorch, Onnx NN, Android NN and other deep learning frameworks                               |
| Memory                | LPDDR5<br/>- Capacity: up to 16GB<br/>- Memory bus width: 32-bit (dual-channel, 16-bit per channel)<br/>- Data rate: up to 5500 MT/s                                                                                          |
| Video codec           | Video encoding<br/>- Up to multi-stream H.265 encoding at 4K@60fps<br/>Video decoding<br/>- Up to multi-stream AV1 / AVS2 / VP9 / H.265 decoding at 8K@30fps or 4K@120fps<br/>- Up to multi-stream H.264 decoding at 4K@60fps |
| Storage               | Optional eMMC or UFS<br/>- eMMC 5.1, up to 256GB<br/>- UFS 2.0, up to 1TB<br/>Onboard SPI Flash (optional)<br/>1x SDMMC                                                                                                       |
| Networking            | 1x Gigabit Ethernet<br/>Onboard WiFi 6 & BT 5.4<br/>- Onboard antenna connector                                                                                                                                               |
| Display               | 1x HDMI 2.1<br/>- Up to 4K@120Hz                                                                                                                                                                                              |
| Camera                | 2x MIPI camera (4-lane)                                                                                                                                                                                                       |
| USB                   | USB 3.2<br/>USB 2.0                                                                                                                                                                                                           |
| PCIe                  | 1x PCIe 2.0 x1                                                                                                                                                                                                                |
| Other interfaces      | Supports UART, I2C, I2S, CAN, PWM, GPIOs and more                                                                                                                                                                             |
| Connector             | 260-pin SO-DIMM connector                                                                                                                                                                                                     |
| OS                    | Supports Debian, Yocto, Buildroot, Android 14                                                                                                                                                                                 |
| Dimensions            | 69.6 mm x 45 mm                                                                                                                                                                                                               |
| Operating temperature | 0 to 60°C (commercial)<br/>-40°C to 85°C (industrial)                                                                                                                                                                         |

## Interface Description

<Tabs queryString="board interface">

<TabItem value="Radxa NX4">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx4/radxa-nx4-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| No. | Description              | No. | Description       | No. | Description               |
| :-: | :----------------------- | :-: | :---------------- | :-: | :------------------------ |
|  1  | WiFi 6 & BT 5.4 module   |  2  | Antenna connector |  3  | SPI Flash (unsoldered)    |
|  4  | Rockchip RK3576          |  5  | Status LED        |  6  | LPDDR5                    |
|  7  | Maskrom button           |  8  | Onboard eMMC      |  9  | 260-pin SO-DIMM connector |
| 10  | Onboard UFS (unsoldered) |     |                   |     |                           |

</TabItem>

<TabItem value="Radxa NX4 IO Board">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx4/radxa-nx4-io-board-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| No. | Description                       | No. | Description                                       | No. | Description                                       |
| :-: | :-------------------------------- | :-: | :------------------------------------------------ | :-: | :------------------------------------------------ |
|  1  | MIPI CSI(4-lane)                  |  2  | MIPI CSI(4-lane)                                  |  3  | DC Power Jack(9-20V)                              |
|  4  | PoE Backpower Header              |  5  | HDMI                                              |  6  | Button Header                                     |
|  7  | 4x USB 3.2 Type-A                 |  8  | SO-DIMM Connector                                 |  9  | CAN Bus Header                                    |
| 10  | RJ45 Gigabit Ethernet port        | 11  | USB Type-C                                        | 12  | Power LED                                         |
| 13  | 40-Pin GPIO Header                | 14  | M.2 M Key 2230 Slot<br /> Currently not available | 15  | M.2 M Key 2280 Slot<br /> Currently not available |
| 16  | M.2 E Key 2230 Slot (PCIe 2.0 x1) | 17  | RTC Battery Connector                             | 18  | PoE Header                                        |
| 19  | Fan Header                        |     |                                                   |     |                                                   |

:::note Interface Notes

When Radxa NX4 is used with the Radxa NX4 IO Board, the M.2 M Key 2230 and M.2 E Key 2230 slots are not available.

The reserved M.2 M Key 2230 and M.2 E Key 2230 slots will be removed in the next hardware revision.

:::

</TabItem>

</Tabs>

## System Block Diagram

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx4/radxa-nx4-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Use Cases

### Edge Computing and Smart Gateways

With a 6 TOPS NPU, Gigabit Ethernet, and WiFi 6, it can perform AI inference tasks such as video analytics, object detection, and face recognition locally without relying on the cloud. This enables edge-side decision making and data pre-processing, significantly reducing bandwidth usage and cloud compute requirements.

### Machine Vision and Industrial Automation

It can be used for machine vision tasks such as inspection, recognition, and measurement. Combined with fieldbuses and industrial control equipment, it helps build flexible production lines, automated inspection stations, and smart devices.

### Service and Mobile Robots

With a multi-core CPU + NPU combination, along with IMU and various sensor expansion options plus wired/wireless networking, it can serve as a main controller platform for mobile or collaborative robots for path planning, perception, target tracking, and remote operations and status monitoring.

### Interactive Terminals and Smart Displays

Suitable for digital signage, information kiosks, self-service devices, and smart retail terminals. High-resolution display output and on-device intelligence enable richer interactive experiences.

### Education, Training, and R&D Validation

It can be used as an embedded and AI teaching/practice platform for universities and training institutions, and also as a hardware foundation for enterprise prototyping and functional validation—accelerating the path from concept to product.
