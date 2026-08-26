---
sidebar_position: 3
---

# Radxa VMARC-Q9075

## Introduction

The Radxa VMARC-Q9075 is a high-performance AI computing module based on the Qualcomm Dragonwing IQ-9075 processor. It uses a 314-pin MXM 3.0 connector and measures 82 mm × 80 mm, making it suitable for space-constrained embedded applications that require high computing performance, AI inference, and multimedia processing capabilities.

The module integrates an 8-core Kryo Gen 6 CPU, a 4-core Cortex-R52 MCU, a Qualcomm Adreno 663 GPU, and a Hexagon Tensor Processor (HTP), delivering 100 Dense / 200 Sparse TOPS@INT8 of AI performance. It is equipped with 36GB LPDDR5 memory and 128GB UFS 3.1 storage and supports multiple high-resolution cameras, display outputs, 2.5GbE, USB 3.2 Gen 2, PCIe Gen4, and expansion signals including CAN, UART, SPI, I2C, and GPIO.

The Radxa VMARC-Q9075 Development Kit consists of the compute module and a matching IO board. It provides dual 2.5GbE ports, M.2 NVMe SSD, Wi-Fi / Bluetooth, and 4G / 5G expansion capabilities, as well as multiple USB, CAN, RS-232, RS-485, display, and camera interfaces. It can be used to quickly evaluate performance, validate interfaces, develop AI applications, and build product prototypes.

## Product Views

<Tabs queryString="board model">

<TabItem value="Radxa VMARC-Q9075">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Radxa VMARC-Q9075 IO Board">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-io-board-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Radxa VMARC-Q9075 Development Kit">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-dev-kit-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## Specifications

<Tabs queryString="board model">

<TabItem value="Radxa VMARC-Q9075">

| Category       | Specification                                                                                                                                                                                                                                                                                                                                          |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Processor      | Qualcomm Dragonwing IQ-9075                                                                                                                                                                                                                                                                                                                            |
| CPU            | 8-core Kryo Gen 6, up to 2.36GHz                                                                                                                                                                                                                                                                                                                       |
| MCU            | 4-core Cortex-R52, up to 1.85GHz                                                                                                                                                                                                                                                                                                                       |
| GPU            | Qualcomm Adreno 663<br/>- Supports secure general-purpose GPU computing with 1.2 TFLOPS FP32 performance<br/>- Supports Vulkan 1.2, OpenGL ES 3.2, and OpenCL 2.0 FP<br/>- Supports Adreno NN Direct                                                                                                                                                   |
| AI Performance | 100 Dense / 200 Sparse TOPS@INT8<br/>- Hexagon Tensor Processor (HTP) with four HVX units and two HMX units<br/>- Supports mainstream deep-learning frameworks including TensorFlow, PyTorch, ONNX, Paddle, Caffe, and DarkNet                                                                                                                         |
| Video Codec    | Adreno VPU 765<br/>Video decoding:<br/>- Supports AV1, HEVC, H.264, H.265, VP9, and MPEG2<br/>- Performance: 1× 8K@60fps / 2× 8K@30fps / 4× 4K@60fps / 8× 4K@30fps / 16× 1080p@60fps / 32× 1080p@30fps<br/>Video encoding:<br/>- Supports H.264, H.265, HEIF, and HEIC<br/>- Performance: 2× 4K@60fps / 4× 4K@30fps / 8× 1080p@60fps / 16× 1080p@30fps |
| Memory         | LPDDR5<br/>- Capacity: 36GB<br/>- Bus width: 96-bit<br/>- Maximum data rate: 6400 MT/s                                                                                                                                                                                                                                                                 |
| Storage        | 1× onboard 32MB SPI Flash<br/>1× onboard 128GB UFS 3.1 (Gear4 x2)                                                                                                                                                                                                                                                                                      |
| Display        | 1× MIPI DSI display signal<br/>1× eDP display signal<br/>1× HDMI TX signal (DP-to-HDMI signal)<br/>1× DP TX signal                                                                                                                                                                                                                                     |
| Camera         | 1× 4-lane MIPI CSI camera signal<br/>1× 2-lane MIPI CSI camera signal                                                                                                                                                                                                                                                                                  |
| Network        | 2× 2.5GbE PHY                                                                                                                                                                                                                                                                                                                                          |
| USB            | 2× USB 3.2 Gen 2 signals (10Gbps)<br/>4× USB 2.0 signals                                                                                                                                                                                                                                                                                               |
| PCIe           | 2× PCIe Gen4 x2                                                                                                                                                                                                                                                                                                                                        |
| GPIO           | 2× CAN<br/>2× I2S<br/>4× UART<br/>2× SPI<br/>5× I2C<br/>14× GPIO                                                                                                                                                                                                                                                                                       |
| Power          | 12V DC input                                                                                                                                                                                                                                                                                                                                           |
| Connector      | 314-pin MXM 3.0 connector                                                                                                                                                                                                                                                                                                                              |
| Dimensions     | 82 mm × 80 mm                                                                                                                                                                                                                                                                                                                                          |

</TabItem>

<TabItem value="Radxa VMARC-Q9075 IO Board">

| Category                  | Specification                                                                                                                                                                                                                              |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Compatible Compute Module | VMARC-Q9075                                                                                                                                                                                                                                |
| Storage                   | 1× M.2 M Key 2280 slot (NVMe SSD)                                                                                                                                                                                                          |
| Network                   | 2× 2.5GbE RJ45 ports<br/>1× M.2 E Key 2230 slot (Wi-Fi / Bluetooth module)<br/>1× M.2 B Key 3042 slot (4G / 5G cellular module)<br/>1× Nano SIM card slot                                                                                  |
| Display                   | 1× 4-lane MIPI DSI display connector (39-pin)<br/>1× eDP connector<br/>1× standard HDMI connector (Type-A)<br/>1× DP connector (DisplayPort)                                                                                               |
| Camera                    | 1× 4-lane MIPI CSI camera connector (31-pin)<br/>1× 2-lane MIPI CSI camera connector (15-pin)                                                                                                                                              |
| USB                       | 4× USB 3.1 Type-A ports<br/>1× USB 3.2 Gen 2 port<br/>3× USB 2.0 ports<br/>1× USB Type-C debug port                                                                                                                                        |
| Other Interfaces          | 1× power button<br/>1× EDL button<br/>1× status LED<br/>1× fan connector<br/>1× RTC battery connector<br/>4× CAN bus interfaces<br/>2× RS-232 interfaces<br/>1× RS-485 interface<br/>1× 40-pin GPIO header (UART / SPI / PWM / GPIO, etc.) |
| Power                     | DC5525 power jack or XT60 power connector (19–24V input)                                                                                                                                                                                   |
| Compute Module Connector  | 314-pin MXM 3.0 connector                                                                                                                                                                                                                  |
| Dimensions                | 120 mm × 120 mm                                                                                                                                                                                                                            |

</TabItem>

<TabItem value="Radxa VMARC-Q9075 Development Kit">

| Category         | Specification                                                                                                                                                                                                                                                                                                                                          |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Compute Module   | Radxa VMARC-Q9075                                                                                                                                                                                                                                                                                                                                      |
| IO Board         | Radxa VMARC-Q9075 IO Board                                                                                                                                                                                                                                                                                                                             |
| CPU              | 8-core Kryo Gen 6, up to 2.36GHz                                                                                                                                                                                                                                                                                                                       |
| MCU              | 4-core Cortex-R52, up to 1.85GHz                                                                                                                                                                                                                                                                                                                       |
| GPU              | Qualcomm Adreno 663<br/>- Supports secure general-purpose GPU computing with 1.2 TFLOPS FP32 performance<br/>- Supports Vulkan 1.2, OpenGL ES 3.2, and OpenCL 2.0 FP<br/>- Supports Adreno NN Direct                                                                                                                                                   |
| AI Performance   | 100 Dense / 200 Sparse TOPS@INT8<br/>- Hexagon Tensor Processor (HTP) with four HVX units and two HMX units<br/>- Supports mainstream deep-learning frameworks including TensorFlow, PyTorch, ONNX, Paddle, Caffe, and DarkNet                                                                                                                         |
| Video Codec      | Adreno VPU 765<br/>Video decoding:<br/>- Supports AV1, HEVC, H.264, H.265, VP9, and MPEG2<br/>- Performance: 1× 8K@60fps / 2× 8K@30fps / 4× 4K@60fps / 8× 4K@30fps / 16× 1080p@60fps / 32× 1080p@30fps<br/>Video encoding:<br/>- Supports H.264, H.265, HEIF, and HEIC<br/>- Performance: 2× 4K@60fps / 4× 4K@30fps / 8× 1080p@60fps / 16× 1080p@30fps |
| Memory           | LPDDR5<br/>- Capacity: 36GB<br/>- Bus width: 96-bit<br/>- Maximum data rate: 6400 MT/s                                                                                                                                                                                                                                                                 |
| Storage          | 1× onboard 32MB SPI Flash<br/>1× onboard 128GB UFS 3.1 (Gear4 x2)<br/>1× M.2 M Key 2280 slot (NVMe SSD)                                                                                                                                                                                                                                                |
| Display          | 1× 4-lane MIPI DSI display connector (39-pin)<br/>1× eDP connector<br/>1× standard HDMI connector (Type-A)<br/>1× DP connector                                                                                                                                                                                                                         |
| Camera           | 1× 4-lane MIPI CSI camera connector (31-pin)<br/>1× 2-lane MIPI CSI camera connector (15-pin)                                                                                                                                                                                                                                                          |
| Network          | 2× 2.5GbE RJ45 ports<br/>1× M.2 E Key 2230 slot (Wi-Fi / Bluetooth module)<br/>1× M.2 B Key 3042 slot (4G / 5G cellular module)<br/>1× Nano SIM card slot                                                                                                                                                                                              |
| USB              | 4× USB 3.2 Gen 2 Type-A ports (10Gbps)<br/>1× USB 3.2 Gen 2 port (10Gbps)<br/>3× USB 2.0 ports<br/>1× USB Type-C debug port                                                                                                                                                                                                                            |
| Other Interfaces | 1× power button<br/>1× EDL button<br/>1× status LED<br/>1× fan connector<br/>1× RTC battery connector<br/>4× CAN bus interfaces<br/>2× RS-232 interfaces<br/>1× RS-485 interface<br/>1× 40-pin GPIO header (UART / SPI / PWM / GPIO, etc.)                                                                                                             |
| Power            | DC5525 power jack or XT60 power connector (19–24V input)                                                                                                                                                                                                                                                                                               |
| Connector        | 314-pin MXM 3.0 connector                                                                                                                                                                                                                                                                                                                              |
| Dimensions       | 120 mm × 120 mm                                                                                                                                                                                                                                                                                                                                        |

</TabItem>

</Tabs>

## Block Diagram

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/block_diagram_radxa_vmarc_q9075.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Interface Description

<Tabs queryString="board interface">

<TabItem value="Radxa VMARC-Q9075">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description   | No. | Description                 | No. | Description               |
| :-: | :------------ | :-: | :-------------------------- | :-: | :------------------------ |
|  1  | LPDDR5        |  2  | Qualcomm Dragonwing IQ-9075 |  3  | 314-pin MXM 3.0 connector |
|  4  | SPI NOR Flash |  5  | Qualcomm QCA8081            |  6  | Onboard UFS               |

</TabItem>

<TabItem value="Radxa VMARC-Q9075 IO Board">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-io-board-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description               | No. | Description            | No. | Description                   |
| :-: | :------------------------ | :-: | :--------------------- | :-: | :---------------------------- |
|  1  | Fan connector             |  2  | 40-pin GPIO header     |  3  | 4× CAN bus interfaces         |
|  4  | 2× RS-232 interfaces      |  5  | RS-485 interface       |  6  | XT60 power connector          |
|  7  | 314-pin MXM 3.0 connector |  8  | DP connector           |  9  | 4× USB 3.2 Gen 2 Type-A ports |
| 10  | Nano SIM card slot        | 11  | eDP connector          | 12  | 1× 4-lane MIPI CSI            |
| 13  | 1× 2-lane MIPI CSI        | 14  | 1× M.2 M Key 2280 slot | 15  | USB Type-C debug port         |
| 16  | Power button              | 17  | USB 3.2 Gen 2 port     | 18  | 3× USB 2.0 ports              |
| 19  | RTC battery connector     | 20  | EDL button             | 21  | DC5525 power jack             |
| 22  | HDMI connector            | 23  | 2× 2.5GbE RJ45 ports   | 24  | 1× 4-lane MIPI DSI            |
| 25  | 1× M.2 B Key 3042 slot    | 26  | 1× M.2 E Key 2230 slot |     |                               |

</TabItem>

<TabItem value="Radxa VMARC-Q9075 Development Kit">

<div style={{textAlign: 'center'}}>
   <img src="/img/vmarc-q9075/vmarc-q9075-dev-kit-interface.webp" alt="Development kit interface diagram" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description               | No. | Description            | No. | Description                   |
| :-: | :------------------------ | :-: | :--------------------- | :-: | :---------------------------- |
|  1  | Fan connector             |  2  | 40-pin GPIO header     |  3  | 4× CAN bus interfaces         |
|  4  | 2× RS-232 interfaces      |  5  | RS-485 interface       |  6  | XT60 power connector          |
|  7  | 314-pin MXM 3.0 connector |  8  | DP connector           |  9  | 4× USB 3.2 Gen 2 Type-A ports |
| 10  | Nano SIM card slot        | 11  | eDP connector          | 12  | 1× 4-lane MIPI CSI            |
| 13  | 1× 2-lane MIPI CSI        | 14  | 1× M.2 M Key 2280 slot | 15  | USB Type-C debug port         |
| 16  | Power button              | 17  | USB 3.2 Gen 2 port     | 18  | 3× USB 2.0 ports              |
| 19  | RTC battery connector     | 20  | EDL button             | 21  | DC5525 power jack             |
| 22  | HDMI connector            | 23  | 2× 2.5GbE RJ45 ports   | 24  | 1× 4-lane MIPI DSI            |
| 25  | 1× M.2 B Key 3042 slot    | 26  | 1× M.2 E Key 2230 slot |     |                               |

</TabItem>

</Tabs>

## Applications

### Edge AI Computing and Intelligent Gateways

With 100 Dense / 200 Sparse TOPS@INT8 of AI performance, dual 2.5GbE ports, and Wi-Fi, Bluetooth, and 4G / 5G expansion capabilities, the system can aggregate data, perform AI inference, and make real-time decisions at the edge. It is suitable for industrial gateways, edge servers, and multi-protocol data acquisition devices.

### Machine Vision and Video Analytics

Support for 4-lane and 2-lane MIPI CSI camera inputs and multiple streams of 8K, 4K, and 1080p video encoding and decoding makes the system suitable for visual inspection, object recognition, behavior analysis, multi-channel video aggregation, and intelligent security applications.

### Industrial Automation and Equipment Control

The 4-core Cortex-R52 MCU and interfaces including CAN, RS-232, RS-485, UART, SPI, I2C, and GPIO can connect sensors, actuators, and industrial control equipment. The system is suitable for automated production lines, machine condition monitoring, quality inspection, and equipment control systems.

### Robotics and Autonomous Devices

The multi-core CPU, GPU, and high-performance AI accelerator can work together on environmental perception, object detection, and path-planning tasks. The extensive camera, network, and control interfaces simplify the expansion of sensors and motion-control modules, making the system suitable for mobile robots, service robots, inspection devices, and other autonomous systems.

### Smart Displays and Interactive Terminals

MIPI DSI, eDP, HDMI, and DP display capabilities enable high-resolution, multi-display, and embedded display solutions for digital signage, smart retail, self-service terminals, information displays, and interactive devices.
