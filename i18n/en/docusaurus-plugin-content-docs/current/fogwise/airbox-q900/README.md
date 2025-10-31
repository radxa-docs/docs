---
sidebar_position: 10
---

# Fogwise® AIRbox Q900

## Product Introduction

Fogwise® AIRbox Q900 is an embedded AI micro-server that supports up to 200 TOPS@INT8 sparse computing power, multiple precisions (INT8, FP16, FP32), deployment of various mainstream AI models such as private GPT and text-to-image, and features a heat-dissipating aluminum alloy enclosure for deployment in harsh environments.

## Product Image

|     Product Image     | No. |   View   | No. |    View     | No. |    View     |
| :-------------------: | :-: | :------: | :-: | :---------: | :-: | :---------: |
| Fogwise® AIRbox Q900 |  ①  | Top View |  ②  | Side View 1 |  ③  | Side View 2 |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/airbox-q900-product.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Product Specifications

| Model                 | Fogwise® AIRbox Q900                                                                                                                                                                                                                                                                                                                                                |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CPU                   | Octa-core Kryo 6th Gen (Cortex-A78C based) architecture @2.36 GHz                                                                                                                                                                                                                                                                                                    |
| GPU                   | Adreno 663 Graphics Processor<br/> • Supports secure general-purpose GPU computing, 1.2 TFLOPS FP32 computing power<br/>• Supports Vulkan 1.2, OpenGL ES 3.2, OpenCL 2.0 FP<br/>• Supports Adreno NN Direct                                                                                                                                                          |
| MCU                   | Independent quad-core Cortex-R52 @ 1.85GHz                                                                                                                                                                                                                                                                                                                           |
| NPU                   | Integrated Hexagon Tensor Processor (HTP): Includes quad-vector extensions (HVX) and dual-matrix coprocessors (HMX)<br/>AI Computing Power: 200 TOPS@INT8 (sparse computing power)                                                                                                                                                                                   |
| Video Codec           | Adreno VPU 765<br/> **Decoding:**<br/>• Supports AV1 / HEVC / H.264 / H.265 / VP9 / MPEG2 formats<br/>• 1x 8Kp60 / 2x 8Kp30 / 4x 4Kp60 / 8x 4Kp30 / 16x 1080p60 / 32x 1080p30<br/>**Encoding:**<br/>• Supports H.264 / H.265 / HEIF / HEIC formats<br/>• 2x 4Kp60 / 4x 4Kp30 / 8x 1080p60 / 16x 1080p30<br/>Can simultaneously run 2x 4Kp60 decode + 2x 4Kp60 encode |
| Memory                | 36GB 96-bit LPDDR5@6400MT/s (with ECC support)                                                                                                                                                                                                                                                                                                                       |
| Storage               | 1x Onboard 32MB SPI Flash<br/>1x UFS/eMMC module interface<br/>1x Onboard 128GB UFS3.1 (Gear4 2-Lane)<br/>1x M.2 M Key slot (PCIe Gen4 4-Lane)                                                                                                                                                                                                                       |
| Display               | 1x Standard HDMI 2.0 (supports up to 4K@60fps)                                                                                                                                                                                                                                                                                                                       |
| Wired Network         | 2 x RJ45 2.5G Ethernet ports (with TSN real-time Ethernet support)                                                                                                                                                                                                                                                                                                   |
| Wireless Network      | 1x Mini PCIe slot<br/>• Supports Wi-Fi 6 / BT 5.4<br/>• Supports 4G/5G Mini PCIe module for 4G/5G mobile network support<br/>1x Nano SIM card slot<br/>Supports up to 3 external antennas                                                                                                                                                                            |
| USB Ports             | 1x USB 3.1 Gen2 HOST Type-A port<br/>1x USB 3.1 Gen2 OTG Type-A port<br/>1x Type-C console                                                                                                                                                                                                                                                                           |
| Power Supply          | DC 12V/5.4A (5.5x2.5mm) power connector                                                                                                                                                                                                                                                                                                                              |
| Other Interfaces      | 1x PWM fan connector<br/>1x RTC battery connector<br/>1x Emergency Download (EDL) button<br/>1x Power button                                                                                                                                                                                                                                                         |
| Operating System      | Supports Ubuntu, Yocto, and other operating systems                                                                                                                                                                                                                                                                                                                  |
| Dimensions            | 104 x 84 x 45 mm                                                                                                                                                                                                                                                                                                                                                     |
| Operating Temperature | 0℃ ~ 60℃                                                                                                                                                                                                                                                                                                                                                             |
| Cooling               | Aluminum alloy enclosure with built-in PWM speed control fan                                                                                                                                                                                                                                                                                                         |

## Interface Overview

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/airbox-q900-ports.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| No. | Description                                                                 | No. | Description        | No. | Description                     |
| :-: | :-------------------------------------------------------------------------- | :-: | :----------------- | :-: | :------------------------------ |
|  1  | 12V DC Power Input                                                          |  4  | USB Type-C Console |  7  | 3x External Antenna Connectors  |
|  2  | Top: USB 3.1 Gen2 HOST Type-A port<br/>Bottom: USB 3.1 Gen2 OTG Type-A port |  5  | Nano SIM Card Slot |  8  | Emergency Download (EDL) Button |
|  3  | 2x 2.5G RJ45 Ethernet Ports                                                 |  6  | Standard HDMI 2.0  |  9  | Power Button                    |

## Chip Block Diagram

<div style={{textAlign: 'center'}}>
**IQ-9075 Chip Block Diagram**
</div>

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/iq-9075-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## System Block Diagram

<div style={{textAlign: 'center'}}>
**Fogwise® AIRbox Q900 Hardware System Block Diagram**
</div>

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/airbox-q900-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
