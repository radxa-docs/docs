---
sidebar_position: 2
---

# Radxa Dragon Q6A

## Product Overview

The Radxa Dragon Q6A is a high-performance, low-power embedded computing platform based on the Qualcomm® QCS6490 processor, designed specifically for industrial IoT, edge AI, and smart devices.

The Dragon Q6A is equipped with the Qualcomm QCS6490 SoC, featuring a “1+3+4” tri-cluster design (1× Kryo Prime @ 2.7GHz, 3× Kryo Gold @ 2.4GHz, 4× Kryo Silver @ 1.9GHz), balancing high performance with low power consumption; It integrates the Qualcomm® Adreno 643 GPU, VPU, and AI accelerator, offering advanced AI acceleration capabilities and multimedia processing capabilities.

## Product Appearance

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/dragon-q6a-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. |       View       | No. |    Side View    | No. |    Back View    |
| :-: | :--------------: | :-: | :-------------: | :-: | :-------------: |
|  ①  | Dragon Q6A Front |  ②  | Dragon Q6A Side |  ③  | Dragon Q6A Back |

## Product Specifications

| Category      | Specification Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| :------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Core Platform | System-on-Chip (SoC): Qualcomm QCS6490 <br/> Central Processing Unit (CPU): 1x Kryo Gold Plus @2.7GHz + 3x Kryo Gold @2.4GHz + 4x Kryo Silver @1.9GHz <br/> Graphics Processing Unit (GPU): Qualcomm® Adreno 643, supporting OpenGL ES 3.2, Vulkan 1.3, OpenCL 2.2, DirectX 12 <br/> AI Accelerator: Hexagon DSP + Hexagon Tensor Accelerator, with a combined AI computing power of up to 12 TOPS <br/> Video Processing Unit (VPU): Supports up to 4K@60fps decoding (H.264/H.265/VP9) and 4K@30fps encoding (H.264/H.265), with HDR10/HDR10+ playback capability |
| Memory        | LPDDR5, Options: 4GB / 6GB / 8GB / 12GB / 16GB                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Storage       | Boot Storage: Onboard 32MB QSPI Nor Flash <br/> Expandable Storage: Supports MicroSD card / eMMC module / UFS module / M.2 M Key 2230 NVMe SSD                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Networking    | Wired Connection: 1x Gigabit Ethernet port (PoE support requires an external PoE HAT) <br/> Wireless Connection: Wi-Fi 6, Bluetooth 5.4 (requires external antenna)                                                                                                                                                                                                                                                                                                                                                                                                  |
| Video Output  | HDMI: 1x HDMI port, supporting up to 4K@60Hz <br/> MIPI DSI: 1x 4-lane MIPI DSI                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| Camera        | 1x 4-lane MIPI CSI <br/> 2x 2-lane MIPI CSI                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Audio         | Audio Interface: 3.5mm 4-segment headphone jack, supporting microphone input <br/> Audio Output: Supports stereo output and can directly drive 32Ω headphones                                                                                                                                                                                                                                                                                                                                                                                                        |
| USB           | USB 3.1：1× Type-A HOST / OTG<br/> USB 2.0：3× Type-A HOST                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Expansion     | 40-Pin GPIO Header: Supports UART, SPI, I2C, etc. <br/> Fan Connector: 1× 2-pin 1.25mm <br/> Buttons: Power button, EDL button                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Power Supply  | Supports USB Type-C 12V power input <br/> Supports external 12V pin power input <br/> Supports PoE power supply (requires an external PoE HAT)                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Supported OS  | Ubuntu Linux <br/> Qualcomm Linux（Based on Yocto Development） <br/> Android 15 (CS) or Android 16 (ES) System                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

## Interface Description

<div style={{textAlign: 'center'}}>
   <img src="/en/img/dragon/q6a/q6a_interface.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

| No. | Description        | No. | Description                                                     | No. | Description             |
| :-: | :----------------- | :-: | :-------------------------------------------------------------- | :-: | :---------------------- |
|  1  | Qualcomm QCS6490   |  9  | Power input Header                                              | 17  | 2x USB 2.0 Type-A ports |
|  2  | 40 Pin GPIO Header | 10  | MIPI CSI (4 Lane)                                               | 18  | EDL button              |
|  3  | M.2 M Key slot     | 11  | MicroSD card slot                                               | 19  | Headphone jack          |
|  4  | WiFi 6 / BT 5.4    | 12  | MIPI DSI (4 Lane)                                               | 20  | Standard HDMI           |
|  5  | Antenna connector  | 13  | PoE Header                                                      | 21  | eMMC & UFS module       |
|  6  | Power button       | 14  | Gigabit Ethernet                                                | 22  | RTC battery connector   |
|  7  | LPDDR5 memory      | 15  | QSPI Nor Flash                                                  | 23  | 2x MIPI CSI (2 Lane)    |
|  8  | USB 2.0 Type-C     | 16  | USB 2.0 Type-A port (upper)<br/>USB 3.1 OTG Type-A port (lower) |     |                         |

## Application Scenarios

### Linux Beginners

As a Linux-based single-board computer, it can be used for learning Linux basics, advanced low-level and application-level development.

### Robot Development

As the main controller for robot development, it offers excellent performance and a wide range of hardware interfaces, making it easy for users to develop robot applications.

### Embedded Development

Provides a rich set of GPIO interfaces, supporting communication protocols such as UART, SPI, and I2C, making it easy for users to drive various hardware devices.

### AI Development

Built-in Hexagon DSP + Hexagon Tensor Accelerator, with a combined AI computing power of up to 12 TOPS, accelerating AI development.

## System Platform

Based on Qualcomm QCS6490 SoC, supports multiple operating systems:

- Ubuntu Linux
- Qualcomm Linux (Based on Yocto development)
- Android 15 (CS) or Android 16 (ES) System
