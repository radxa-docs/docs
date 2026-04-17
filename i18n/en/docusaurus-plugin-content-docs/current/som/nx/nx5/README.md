---
sidebar_position: 3
---

# Radxa NX5

## Product Overview

The Radxa NX5 is a high-performance compute module based on the Rockchip RK3588S, integrating a 4-core Cortex-A76 + 4-core Cortex-A55 CPU, ARM Mali-G610 MP4 GPU, and 6 TOPS@INT8 NPU, supporting mainstream deep learning frameworks. It offers rich I/O and expansion capabilities with 8K video codec support, suitable for edge computing, machine vision, smart terminals, multimedia processing, and more.

The Radxa NX5 can be paired with the official IO board for quick feature validation and prototyping, helping users complete power-on debugging, interface evaluation, and application development in a short time.

## Product Images

<Tabs queryString="board model">

<TabItem value="Radxa NX5">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Radxa NX5 IO Board">

The Radxa NX5 IO Board integrates rich external interfaces for quick validation of the Radxa NX5 compute module's features, helping users easily complete power-on debugging, interface evaluation, and preliminary application development.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-io-board-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Radxa NX5 Development Kit">

The Radxa NX5 Development Kit consists of the Radxa NX5 compute module and Radxa NX5 IO Board, providing a complete hardware development platform for quick validation of compute module features, performance evaluation, and prototype system building, helping users efficiently complete development and solution verification.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-dev-kit-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## Specifications

| Model            | Radxa NX5                                                                                                                                                                                       |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SoC              | Rockchip RK3588S                                                                                                                                                                                |
| CPU              | 4-core Cortex-A76 + 4-core Cortex-A55                                                                                                                                                           |
| GPU              | ARM Mali-G610 MP4<br/>- Supports OpenGL ES 1.1, 2.0 and 3.2, OpenCL 1.1, 1.3 and 2.2, Vulkan 1.1 and 1.2<br/>- High-performance 2D image acceleration module embedded                           |
| NPU              | 6 TOPS@INT8<br/>- Supports INT4 / INT8 / INT16 / FP16 / BF16 / TF32 compute precision<br/>- Supports TensorFlow, Caffe, Tflite, Pytorch, Onnx NN, Android NN and other deep learning frameworks |
| Memory           | LPDDR4X<br/>- Capacity: up to 16GB                                                                                                                                                              |
| Video codec      | Video encoding<br/>- Up to 8K@30fps H.265 / H.264 encoding<br/>Video decoding<br/>- Up to 8K@60fps AV1 / AVS2 / VP9 / H.265 / H.264 decoding                                                    |
| Storage          | Optional onboard eMMC<br/>- eMMC 5.1, up to 512GB<br/>Onboard SPI Flash (optional)<br/>1x SDMMC                                                                                                 |
| Networking       | 1x Gigabit Ethernet                                                                                                                                                                             |
| Display          | 1x HDMI TX<br/>- Up to 8K@60Hz<br/>1x eDP TX<br/>- Up to 4K@60Hz<br/>1x DP TX<br/>- Up to 8K@30Hz<br/>1x MIPI DSI (2-lane)                                                                      |
| Camera           | 2x MIPI CSI (2-lane) or 1x MIPI CSI (4-lane)<br/>1x MIPI CSI (4-lane)<br/>1x MIPI CSI (2-lane)                                                                                                  |
| USB              | USB 3.1 Gen1<br/>USB 2.0                                                                                                                                                                        |
| PCIe             | PCIe2.0                                                                                                                                                                                         |
| Other interfaces | Supports UART, I2C, I2S, CAN, PWM, GPIOs and more                                                                                                                                               |
| Connector        | 260-pin SO-DIMM connector                                                                                                                                                                       |
| OS               | Supports Debian, Yocto, Buildroot, Android 14                                                                                                                                                   |
| Dimensions       | 70 mm x 45 mm                                                                                                                                                                                   |

## Interface Description

<Tabs queryString="board interface">

<TabItem value="Radxa NX5">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| No. | Description     | No. | Description      | No. | Description  |
| :-: | :-------------- | :-: | :--------------- | :-: | :----------- |
|  1  | LPDDR4X         |  2  | Rockchip RK3588S |  3  | Onboard eMMC |
|  4  | 260-pin SO-DIMM |  5  | SPI Flash        |     |              |

</TabItem>

<TabItem value="Radxa NX5 IO Board">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-io-board-interface.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| No. | Description               | No. | Description                            | No. | Description                  |
| :-: | :------------------------ | :-: | :------------------------------------- | :-: | :--------------------------- |
|  1  | 2x USB 3.1 Gen1 Type-A    |  2  | Top: DP output<br/>Bottom: HDMI output |  3  | DC5525 power jack (5V input) |
|  4  | Fan header                |  5  | MIPI camera interface                  |  6  | MIPI camera interface        |
|  7  | Power button              |  8  | Maskrom button                         |  9  | microSD card slot            |
| 10  | M.2 E Key 2230 slot       | 11  | 40-pin GPIO header                     | 12  | 260-pin SO-DIMM slot         |
| 13  | micro USB interface (OTG) | 14  | Gigabit Ethernet port                  | 15  | 2x USB 3.1 Gen1 Type-A       |

</TabItem>

<TabItem value="Radxa NX5 Development Kit">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-devkit-interface.webp" alt="Radxa NX5 Development Kit interface diagram" style={{width: '75%', maxWidth: '1200px'}} />
</div>

| No. | Description        | No. | Description |
| :-: | :----------------- | :-: | :---------- |
|  1  | Radxa NX5 IO Board |  2  | Radxa NX5   |

</TabItem>

</Tabs>

## Application Scenarios

### Edge Computing and Smart Gateways

With a 6 TOPS NPU and Gigabit Ethernet, it can perform AI inference tasks such as video analytics, object detection, and face recognition locally without relying on the cloud. This enables edge-side intelligent decision-making and data pre-processing, significantly reducing network bandwidth and cloud computing pressure.

### Machine Vision and Industrial Automation

It can be used for machine vision scenarios such as visual inspection, recognition, and measurement. With support for CAN bus and other industrial interfaces, it can work with fieldbuses and industrial control equipment to build flexible production lines, automated inspection stations, and smart devices.

### Multimedia Processing and Smart Displays

Supports 8K@60fps video decoding and 8K@30fps video encoding, suitable for digital signage, video surveillance, video conferencing, smart advertising displays, information kiosks, self-service devices, smart retail terminals, and other multimedia applications. High-resolution display output combined with local intelligent analysis enables richer human-machine interaction experiences.

### Service and Mobile Robots

The 8-core CPU combined with NPU offers various sensor expansion interfaces and wired networking capabilities. It can serve as a main controller platform for mobile or collaborative robots, used for path planning, environmental perception, target tracking, and remote operations and status monitoring.

### Education, Training, and R&D Validation

Suitable as an embedded and AI teaching practice platform for universities and training institutions. It is also ideal as a basic hardware platform for enterprise solution prototyping and functional validation, accelerating the process from concept design to product launch.
