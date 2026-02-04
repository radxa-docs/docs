---
sidebar_position: 4
---

# Radxa Cubie A7S

## Product overview

Radxa Cubie A7S is a pocket-sized, high-performance single-board computer designed for edge AI and embedded applications.

Based on the Allwinner A733, it packs an 8-core CPU, a 3 TOPS NPU, LPDDR5 memory, and PCIe NVMe expansion into an ultra-compact 51 × 51 mm form factor, balancing performance, power, and size.

With a heterogeneous octa-core CPU (2× Cortex‑A76 + 6× Cortex‑A55, up to 2.0 GHz) and a 3 TOPS@INT8 NPU, Cubie A7S runs on-device AI inference efficiently. It supports USB‑C DisplayPort 4K output, 4K video encode/decode, and multimedia/vision processing for AI vision, smart terminals, and HMI applications.

For connectivity, it provides Gigabit Ethernet, Wi‑Fi 6, and Bluetooth 5.4. Storage can be expanded with an NVMe SSD via PCIe 3.0 x1 for high-speed and scalable capacity.

## Product views

| Position |         View         | Position |        View         | Position |        View         |
| :------: | :------------------: | :------: | :-----------------: | :------: | :-----------------: |
|   Left   | Cubie A7S front view |  Center  | Cubie A7S back view |  Right   | Cubie A7S side view |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a7s/cubie-a7s-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Package contents

| Qty | Item                      |
| :-: | :------------------------ |
|  1  | Radxa Cubie A7S           |
|  1  | Wi‑Fi / Bluetooth antenna |

## Specifications

| Category              | Specification                                                                                                                                      |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| SoC                   | Allwinner A733                                                                                                                                     |
| CPU                   | 2× Cortex‑A76 + 6× Cortex‑A55, up to 2.0 GHz                                                                                                       |
| GPU                   | Imagination PowerVR BXM-4-64 MC1<br />- Supports OpenGL ES 1.1, 2.0 and 3.x, OpenCL 3.0, Vulkan 1.3                                                |
| NPU                   | 3 TOPS@INT8<br />- Supports INT4 / INT8 / INT16 / FP16 / BF16 and more<br />- Supports TensorFlow, Caffe, TFLite, PyTorch, ONNX, Darknet and more  |
| MCU                   | RISC‑V Xuantie E902, up to 200 MHz                                                                                                                 |
| Memory                | LPDDR5<br />- Up to 16 GB options                                                                                                                  |
| Video codec           | Encode<br />- H.264 / H.265 up to 4K@30fps<br />Decode<br />- H.265 / VP9 / AVS2 up to 4K@60fps<br />- H.264 up to 4K@30fps                        |
| Storage               | Optional eMMC<br />- Up to 256 GB options<br />1× microSD slot                                                                                     |
| Network               | 1× Gigabit Ethernet<br />Onboard Wi‑Fi 6 & BT 5.4 module<br />- 1× antenna connector                                                               |
| Display               | 1× USB‑C with DisplayPort Alt Mode, up to 4Kp60                                                                                                    |
| Camera                | 1× MIPI camera (4‑lane)                                                                                                                            |
| USB                   | 1× USB Type‑C (USB 3.2, DisplayPort Alt Mode and OTG)<br />1× USB Type‑C (USB 2.0, 5V power input and OTG)<br />1× USB Type‑A (USB 2.0, host mode) |
| PCIe                  | 1× FPC connector (PCIe 3.0 x1)<br />- Supports NVMe SSD expansion                                                                                  |
| Other I/O             | 1× fan header<br />1× USB BOOT button<br />15‑pin and 30‑pin GPIO headers<br />- UART, I2C, I2S, PWM, GPIOs, etc.                                  |
| Power                 | USB Type‑C (5V input)                                                                                                                              |
| OS                    | Debian, Android 13                                                                                                                                 |
| Dimensions            | 51 mm × 51 mm                                                                                                                                      |
| Operating temperature | 0–60°C                                                                                                                                             |

## Interface overview

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a7s/cubie-a7s-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description                           | No. | Description        | No. | Description                                          |
| --- | ------------------------------------- | --- | ------------------ | --- | ---------------------------------------------------- |
| 1   | Gigabit Ethernet                      | 2   | 15‑pin GPIO header | 3   | Wi‑Fi 6 & BT 5.4 module                              |
| 4   | Antenna connector                     | 5   | USB 2.0 Type‑A     | 6   | FPC connector<br />- PCIe 3.0 x1, NVMe SSD expansion |
| 7   | USB BOOT button                       | 8   | 30‑pin GPIO header | 9   | Onboard eMMC                                         |
| 10  | MIPI CSI camera connector             | 11  | Fan header         | 12  | microSD slot                                         |
| 13  | Allwinner A733                        | 14  | LPDDR5             | 15  | USB‑C 2<br />- USB 3.2, DP Alt Mode and OTG          |
| 16  | USB‑C 1<br />- 5V power input and OTG |     |                    |     |                                                      |

:::tip Onboard eMMC
If you purchased a Cubie A7S variant without onboard eMMC, the eMMC footprint on the board will be unpopulated.
:::

## Use cases

Radxa Cubie A7S is suitable for edge AI applications such as image recognition, smart vision, speech processing, robotics, and intelligent IoT devices.

### Edge AI

For real-time image recognition/processing and speech recognition/processing on the edge.

### Embedded development

The onboard 15‑pin and 30‑pin GPIO headers support PWM, UART, SPI, I2C, and more for connecting a wide range of peripherals.

### Robotics

As a controller for robotics projects, Cubie A7S provides strong performance and rich I/O.

### Developer kit

An entry-level board for embedded and robotics enthusiasts, with open hardware design resources and extensive documentation.

## Supported platforms

Cubie A7S is based on the Allwinner A733 SoC and supports multiple operating systems:

- Debian Linux
- Buildroot
- Tina Linux
- Android 13
