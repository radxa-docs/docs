---
sidebar_position: 4
---

# Radxa CM4

## Product Overview

Radxa CM4 is a high-performance System on Module (SoM) based on the Rockchip RK3576(J) SoC, specifically designed for embedded applications and edge computing scenarios.

The Radxa CM4 features the Rockchip RK3576(J) SoC, equipped with an octa-core CPU (quad-core Cortex-A72 + quad-core Cortex-A53, up to 2.2GHz), Mali G52 GPU, and an NPU with up to 6 TOPS computing power, providing users with powerful computing capabilities and AI acceleration.

Radxa CM4 is available in two product versions, differing in their SoC and operating environment:

- Commercial-grade version: Based on Rockchip RK3576 SoC
- Industrial-grade version: Based on Rockchip RK3576J SoC

## Product Appearance

<Tabs queryString="product">
<TabItem value="CM4">

<div style={{textAlign: 'center'}}>
   CM4 Front View
   <img src="/en/img/cm4/cm4_comb_top.webp" style={{width: '100%', maxWidth: '1200px'}} />
   CM4 Back View
   <img src="/en/img/cm4/cm4_core_bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="CM4 IO Board">

<div style={{textAlign: 'center'}}>
   CM4 IO Board Front View
   <img src="/en/img/cm4/cm4_base_top.webp" style={{width: '100%', maxWidth: '1200px'}} />
   CM4 IO Board Back View
   <img src="/en/img/cm4/cm4_base_bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>
</Tabs>

## Product Specifications

<Tabs queryString="product">
<TabItem value="CM4">

| Category              | Specifications                                                                                                                                                                                                                          |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| System on Chip (SoC)  | Rockchip RK3576(J)                                                                                                                                                                                                                      |
| CPU                   | Quad-core Cortex-A72 + Quad-core Cortex-A53, up to 2.2GHz                                                                                                                                                                               |
| GPU                   | ARM Mali G52 MC3 <br /> - Supports OpenGL ES 1.1, 2.0 and 3.2, OpenCL 2.1, Vulkan 1.2                                                                                                                                                   |
| NPU                   | Up to 6 TOPS@INT8 <br /> - Supports INT4/INT8/INT16/FP16/TF32 <br /> - Supports mainstream AI frameworks: TensorFlow, ONNX, PyTorch, Caffe                                                                                              |
| Storage               | Memory: LPDDR4X, up to 16GB <br /> Storage: Onboard eMMC, up to 128GB <br /> SDMMC interface: Supports data storage or OS boot                                                                                                          |
| Networking            | Wired: 1x Gigabit Ethernet <br /> Wireless (optional): Wi-Fi 6, Bluetooth 5.4, with external antenna interface                                                                                                                          |
| USB                   | - 3x USB 2.0 Type A HOST<br /> - 1x USB 3.0 Type A HOST<br /> - 1x USB 3.0 Type C OTG/HOST                                                                                                                                              |
| Audio Interface       | Supports SPDIF, I2S, PDM interfaces                                                                                                                                                                                                     |
| Video Output          | Video output interfaces: <br /> - 1x HDMI <br /> - 1x eDP <br /> - 1x DP <br /> - 1x 4-lane MIPI DSI output                                                                                                                             |
| Video Input           | MIPI interface: Supports 4x 2-lane MIPI CSI or 2x 4-lane MIPI CSI cameras                                                                                                                                                               |
| Video Codec           | - Decoding: Supports H.264/H.265/VP9/AV2/AVS2 formats, up to 8K@30fps<br /> - Encoding: Supports H.264/H.265 formats, up to 4K@60fps                                                                                                    |
| Expansion             | 2x 1-lane PCIe 2.1 interfaces: <br /> - 1x 1-lane PCIe 2.1 / SATA3 combo interface <br /> - 1x 1-lane PCIe 2.1 / SATA3 / USB3.0 combo interface <br /> Expansion pins: Supports UART, I2C, SPI, PWM, etc. <br /> Button: Maskrom button |
| Connection Interface  | 3x 100 Pin B2B connectors                                                                                                                                                                                                               |
| Software Support      | Operating Systems: <br /> - Debian Linux <br /> - Android <br /> - Buildroot <br /> - Yocto                                                                                                                                             |
| Operating Temperature | - Commercial-grade: 0°C ~ 70°C <br /> - Industrial-grade: -40°C ~ 85°C                                                                                                                                                                  |

</TabItem>

<TabItem value="CM4 IO Board">

| Category              | Specifications                                                                                                                                        |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| System on Chip (SoC)  | Rockchip RK3576(J)                                                                                                                                    |
| CPU                   | Quad-core Cortex-A72 + Quad-core Cortex-A53, up to 2.2GHz                                                                                             |
| GPU                   | ARM Mali G52 MC3 <br /> - Supports OpenGL ES 1.1, 2.0 and 3.2, OpenCL 2.1, Vulkan 1.2                                                                 |
| NPU                   | Up to 6 TOPS@INT8 <br /> - Supports INT4/INT8/INT16/FP16/TF32 <br /> - Supports mainstream AI frameworks: TensorFlow, ONNX, PyTorch, Caffe            |
| Storage               | Memory: LPDDR4X, up to 16GB <br /> Storage: Supports onboard eMMC, MicroSD card, UFS module, M.2 M Key NVMe SSD for data storage or system boot       |
| Networking            | Wired: 1x Gigabit Ethernet (PoE supported, requires external HAT) <br /> Wireless (optional): Wi-Fi 6, Bluetooth 5.4, with external antenna interface |
| USB                   | - 2x USB 2.0 Type A HOST<br /> - 1x USB 3.0 Type A HOST<br /> - 1x USB 3.0 Type C OTG/HOST                                                            |
| Audio Interface       | Audio Input: 3.5mm 4-pole headphone jack with microphone support <br /> Audio Output: Supports stereo output, can directly drive 32Ω headphones       |
| Video Output          | Video output interfaces: <br /> - 1x HDMI <br /> - 1x 4-lane MIPI DSI output                                                                          |
| Video Input           | MIPI interfaces: <br /> - 2x 2-lane MIPI CSI <br /> - 1x 4-lane MIPI CSI camera                                                                       |
| Video Codec           | - Decoding: Supports H.264/H.265/VP9/AV2/AVS2 formats, up to 8K@30fps<br /> - Encoding: Supports H.264/H.265 formats, up to 4K@60fps                  |
| Expansion             | Expansion pins: <br /> - 40-pin GPIO: Supports UART, I2C, SPI, PWM, etc. <br /> - RTC, fan interfaces <br /> Button: Maskrom button                   |
| Software Support      | Operating Systems: <br /> - Debian Linux <br /> - Android <br /> - Buildroot <br /> - Yocto                                                           |
| Power Input           | DC 12V input, standard DC-5525 connector                                                                                                              |
| Operating Temperature | - Commercial-grade: 0°C ~ 50°C <br /> - Industrial-grade: -40°C ~ 85°C                                                                                |

</TabItem>
</Tabs>

## Interface Description

<Tabs queryString="product">
<TabItem value="CM4">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cm4/cm4_core_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description    | No. | Description             | No. | Description       | No. | Description               |
| --- | -------------- | --- | ----------------------- | --- | ----------------- | --- | ------------------------- |
| ①   | LPDDR4X Memory | ③   | SoC: Rockchip RK3576(J) | ⑤   | Antenna Interface | ⑦   | Onboard eMMC              |
| ②   | Maskrom Button | ④   | SPI Flash               | ⑥   | WiFi/BT Module    | ⑧   | 3x 100 Pin B2B Connectors |

</TabItem>

<TabItem value="CM4 IO Board">

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cm4/cm4_base_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description                      | No. | Description                      | No. | Description               |
| --- | -------------------------------- | --- | -------------------------------- | --- | ------------------------- |
| ①   | DC 12V Input                     | ⑧   | 2x USB 2.0 Type-A Port           | ⑮   | 14 Pin GPIO Interface     |
| ②   | Function Pins (Power off/Reboot) | ⑨   | Gigabit Ethernet (PoE supported) | ⑯   | RTC Interface             |
| ③   | Power Output                     | ⑩   | USB 3.0 Type-A Port              | ⑰   | UFS Module Interface      |
| ④   | Fan Connector                    | ⑪   | HDMI Port                        | ⑱   | 4-lane MIPI CSI Interface |
| ⑤   | MicroSD Card Slot                | ⑫   | 2x 2-lane MIPI CSI Interfaces    | ⑲   | 4-lane MIPI DSI Interface |
| ⑥   | Headphone Jack                   | ⑬   | PoE Interface                    | ⑳   | M.2 M Key 2280 Slot       |
| ⑦   | USB 3.0 Type-C Ports             | ⑭   | 40 Pin GPIO Interface            | ㉑  | 3x 100 Pin B2B Connectors |

</TabItem>
</Tabs>

## Supported Platforms

Radxa CM4 supports multiple operating systems:

- Debian Linux
- Android
- Buildroot
- Yocto
