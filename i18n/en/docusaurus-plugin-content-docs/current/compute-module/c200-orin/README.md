---
sidebar_position: 20
---

# Radxa C200 Orin Development Kit

## Product Introduction

The Radxa C200 Orin Development Kit, consisting of the Radxa C200 IO board and NVIDIA Jetson Orin NX 8GB module, is an advanced edge AI and robotics development platform that powers the future of embedded edge AI.

Equipped with a 6-core Arm® Cortex®-A78AE processor clocked at up to 2GHz and integrated with NVIDIA Ampere architecture GPU, it supports up to 117 TOPS of AI computing power (Super mode), making it an ideal choice for industrial automation, robotics, intelligent security, and other fields.

## Product Appearance

<Tabs queryString="board model">

<TabItem value="Radxa C200 Orin Development Kit">

|             Product             | No. |   View   | No. |   View    | No. |   View    |
| :-----------------------------: | :-: | :------: | :-: | :-------: | :-: | :-------: |
| Radxa C200 Orin Development Kit |  ①  | Top View |  ②  | Side View |  ③  | Rear View |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/c200/radxa-c200-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Radxa C200 IO Board">

|       Product       | No. |   View   | No. |   View    |
| :-----------------: | :-: | :------: | :-: | :-------: |
| Radxa C200 IO Board |  ①  | Top View |  ②  | Rear View |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/c200/radxa-c200-io-board-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## Package list

- Radxa C200 IO Board
- NVIDIA Jetson Orin NX 8GB Module

## Specifications

| Model            | Radxa C200 Orin Development Kit                                                                                                                                                                                                                                                                                          |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| CPU              | 6-core Arm® Cortex®-A78AE v8.2 64-bit @ 2 GHz                                                                                                                                                                                                                                                                          |
| GPU              | Ampere GPU<br/> • End-to-end lossless compression<br/> • 1024 NVIDIA CUDA cores + 32 Tensor cores<br/>• Supports OpenGL 4.6, OpenGL ES 3.2, Vulkan 1.2, and CUDA 11.4+                                                                                                                                                   |
| AI Performance   | Normal Mode<br/>• AI Computing Power: 70 TOPS@INT8 (Sparse)<br/>• GPU Frequency: 765 MHz<br/>Super Mode <br/>• AI Computing Power: 117 TOPS@INT8 (Sparse)<br/>• 34.7% GPU Frequency Increase (765 -> 1173 MHz) <br/>• 67.1% AI Computing Power Increase (70 -> 117 TOPS)                                                 |
| Video Codec      | **Decoding:**<br/>• Supports H.265 (HEVC) / H.264 / VP9 / VP8 / AV1 / MPEG-4 / MPEG-2 / VC-1 formats<br/>• 1x 8K30 / 2x 4K60 / 4x 4K30 / 9x 1080p60 / 18x 1080p30 (H.265)<br/>**Encoding:**<br/>• Supports H.265 (HEVC) / H.264 / AV1 formats<br/>• 1x 4K60 / 3x 4K30 (H.265) / 6x 1080p60 (H.265) / 12x 1080p30 (H.265) |
| Memory           | 8GB 128-bit LPDDR5@6400MT/s                                                                                                                                                                                                                                                                                              |
| Storage          | 1x M.2 M Key 2280 slot (PCIe 4.0 x4) <br/> 1x M.2 M Key 2230 slot (PCIe 4.0 x2)                                                                                                                                                                                                                                          |
| Display          | 1x Standard DP output interface                                                                                                                                                                                                                                                                                          |
| Wired Network    | 1x RJ45 Gigabit Ethernet port                                                                                                                                                                                                                                                                                            |
| Wireless         | 1x M.2 E Key 2230 slot (PCIe 4.0 x1)                                                                                                                                                                                                                                                                                     |
| USB Ports        | 4x USB 3.2 Type-A<br/>1x USB 3.2 Type-C                                                                                                                                                                                                                                                                                  |
| Power Supply     | DC (5.5x2.5mm) power jack (9 - 20V)                                                                                                                                                                                                                                                                                      |
| Other Interfaces | 1x PoE port<br/>1x CAN bus interface<br/>1x PWM fan header<br/>1x RTC battery connector<br/>1x 40-Pin GPIO header<br/> - Supports GPIO / UART / I2C / SPI / CAN / PWM functions                                                                                                                                          |
| OS Support       | Ubuntu 20.04 / 22.04 LTS                                                                                                                                                                                                                                                                                                 |
| Dimensions       | 100 x 79 mm                                                                                                                                                                                                                                                                                                              |
| Cooling          | Pre-installed PWM cooling fan                                                                                                                                                                                                                                                                                            |

## Interface Overview

<Tabs queryString="board model">

<TabItem value="Radxa C200 Orin Development Kit">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/c200/radxa-c200-kits.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| No. | Description                       | No. | Description                       | No. | Description                       |
| :-: | :-------------------------------- | :-: | :-------------------------------- | :-: | :-------------------------------- |
|  1  | MIPI Camera (2 channels)          |  2  | MIPI Camera (2 or 4 channels)     |  3  | DC5525 Power Jack (9V-20V)        |
|  4  | PoE Power Delivery                |  5  | DP Output                         |  6  | 4x USB 3.2 Type-A                 |
|  7  | SODIMM Interface                  |  8  | RJ45 Gigabit Ethernet             |  9  | PoE Port                          |
| 10  | USB 3.2 Type-C                    | 11  | Power LED                         | 12  | 40-Pin GPIO Header                |
| 13  | M.2 M Key 2230 Slot (PCIe 4.0 x2) | 14  | M.2 M Key 2280 Slot (PCIe 4.0 x4) | 15  | M.2 E Key 2230 Slot (PCIe 4.0 x1) |
| 16  | RTC Battery Connector             | 17  | PWM Fan Header                    |     |                                   |

</TabItem>

<TabItem value="Radxa C200 IO Board">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/c200/radxa-c200-io-board.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| No. | Description                       | No. | Description                       | No. | Description                       |
| :-: | :-------------------------------- | :-: | :-------------------------------- | :-: | :-------------------------------- |
|  1  | MIPI Camera (2 channels)          |  2  | MIPI Camera (2 or 4 channels)     |  3  | DC5525 Power Jack (9V-20V)        |
|  4  | PoE Power Delivery                |  5  | DP Output                         |  6  | Button Interface                  |
|  7  | 4x USB 3.2 Type-A                 |  8  | SODIMM Interface                  |  9  | CAN Bus Interface                 |
| 10  | RJ45 Gigabit Ethernet             | 11  | USB 3.2 Type-C                    | 12  | Power LED                         |
| 13  | 40-Pin GPIO Header                | 14  | M.2 M Key 2230 Slot (PCIe 4.0 x2) | 15  | M.2 M Key 2280 Slot (PCIe 4.0 x4) |
| 16  | M.2 E Key 2230 Slot (PCIe 4.0 x1) | 17  | RTC Battery Connector             | 18  | PoE Port                          |
| 19  | PWM Fan Header                    |     |                                   |     |                                   |

</TabItem>

</Tabs>

## System Block Diagram

<div style={{textAlign: 'center'}}>
**Radxa C200 Orin Development Kit System Block Diagram**
</div>

<div style={{textAlign: 'center'}}>
   <img src="/en/img/c200/radxa-c200-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Application Scenarios

The Radxa C200 Orin Development Kit, with its powerful AI computing capabilities and rich interfaces, can be widely used in the following fields:

### Edge AI and Machine Learning

- Run complex AI model inference in real-time at the edge
- Support TensorRT acceleration for low-latency AI inference
- Suitable for intelligent applications requiring real-time response
- Support deployment of various AI frameworks such as TensorFlow, PyTorch, etc.

### Machine Vision

- Support for multiple HD camera inputs
- Real-time image recognition and object detection
- Support for OpenCV, DeepStream, and other vision processing frameworks
- Suitable for intelligent surveillance, quality inspection, and other scenarios

### Industrial/Educational Robotics

- Support for ROS/ROS2 robot operating system
- Rich I/O interfaces for connecting various sensors and actuators
- Motion control and path planning with high real-time requirements
