---
sidebar_position: 1
---

# Radxa Cubie A5E

## Product Overview

The Radxa Cubie A5E is a well-designed, compact single-board computer (SBC) that can be configured with either the Allwinner A527 SoC or the industrial-grade T527 SoC, offering excellent performance alongside high application flexibility.

This board features an 8-core Arm® Cortex®-A55 CPU (with the A527 SoC reaching up to 2.0 GHz and the T527 SoC up to 1.8 GHz). The T527 SoC is equipped with a 2TOPS@INT8 NPU, enabling efficient machine learning inference tasks, making it suitable for edge computing and AI applications.

The Cubie A5E achieves an optimal balance between performance and power efficiency in a compact form factor, making it ideal for embedded systems, smart IoT devices, and lightweight industrial applications, providing users with an excellent combination of computing power and energy efficiency.

## Product Appearance

| No. |         View         | No. |        View         | No. |        View         |
| :-: | :------------------: | :-: | :-----------------: | :-: | :-----------------: |
|  ①  | Cubie A5E Front View |  ②  | Cubie A5E Rear View |  ③  | Cubie A5E Side View |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a5e/cubie_a5e_view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Package Contents

| Qty | Component                |
| :-: | :----------------------- |
|  1  | Radxa Cubie A5E          |
|  1  | WiFi / Bluetooth Antenna |

## Product Specifications

<Tabs queryString="product model">

<TabItem value="Cubie A5E (A527 SoC)">

| Category     | Specifications                                                                                                                                                                                                        |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Processor    | SoC: Allwinner A527 <br/> CPU: 8-core Cortex-A55 <br/> GPU: Arm Mali-G57; Supports OpenGL® ES 1.1 / 2.0 / 3.1 / 3.2, Vulkan® 1.1, OpenCL™ 1.1 / 1.2 / 2.0 <br/> NPU: None                                          |
| Memory       | LPDDR4 / LPDDR4x, Options: 1GB / 2GB / 4GB                                                                                                                                                                            |
| Storage      | Boot Storage: On-board SPI Flash <br/> System Storage: Supports MicroSD Card / On-board eMMC (Options: 0GB / 8GB / 16GB / 32GB) / M.2 M Key NVMe SSD <br/> **Boot Priority**: MicroSD Card > NVMe SSD > On-board eMMC |
| Network      | Wired: 2x Gigabit Ethernet (PoE supported, requires external PoE HAT) <br/> Wireless: Wi-Fi 6, Bluetooth 5.4, with antenna connector                                                                                  |
| Video Output | HDMI: 1x HDMI port, supports up to 4K@60fps <br/> MIPI DSI: 1x 4-lane MIPI DSI                                                                                                                                        |
| Camera       | 1x 4-lane MIPI CSI or 2x 2-lane MIPI CSI                                                                                                                                                                              |
| USB          | 1x USB 3.0 Type-A HOST <br/> 1x USB 2.0 Type-C OTG with 5V power                                                                                                                                                      |
| Expansion    | 40-pin GPIO Header: Supports UART, SPI, I2C, etc. <br/> M.2 M Key 2230 Slot: Supports M.2 M Key 2230 NVMe SSD                                                                                                         |
| Power Supply | USB Type-C 5V power supply <br/> PoE power supply (requires external PoE HAT) <br/> 5V power supply via GPIO pins (Pins 2 & 4)                                                                                        |
| OS Support   | Debian Linux, Android 13                                                                                                                                                                                              |

</TabItem>

<TabItem value="Cubie A5E (T527 SoC)">

| Category     | Specifications                                                                                                                                                                                                        |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Processor    | SoC: Allwinner T527 <br/> CPU: 8-core Cortex-A55 <br/> GPU: Arm Mali-G57; Supports OpenGL® ES 1.1 / 2.0 / 3.1 / 3.2, Vulkan® 1.1, OpenCL™ 1.1 / 1.2 / 2.0 <br/> NPU: 2TOPS@INT8                                    |
| Memory       | LPDDR4 / LPDDR4x, Options: 1GB / 2GB / 4GB                                                                                                                                                                            |
| Storage      | Boot Storage: On-board SPI Flash <br/> System Storage: Supports MicroSD Card / On-board eMMC (Options: 0GB / 8GB / 16GB / 32GB) / M.2 M Key NVMe SSD <br/> **Boot Priority**: MicroSD Card > NVMe SSD > On-board eMMC |
| Network      | Wired: 2x Gigabit Ethernet (PoE supported, requires external PoE HAT) <br/> Wireless: Wi-Fi 6, Bluetooth 5.4, with antenna connector                                                                                  |
| Video Output | HDMI: 1x HDMI port, supports up to 4K@60fps <br/> MIPI DSI: 1x 4-lane MIPI DSI                                                                                                                                        |
| Camera       | 1x 4-lane MIPI CSI or 2x 2-lane MIPI CSI                                                                                                                                                                              |
| USB          | 1x USB 3.0 Type-A HOST <br/> 1x USB 2.0 Type-C OTG with 5V power                                                                                                                                                      |
| Expansion    | 40-pin GPIO Header: Supports UART, SPI, I2C, etc. <br/> M.2 M Key 2230 Slot: Supports M.2 M Key NVMe SSD                                                                                                              |
| Power Supply | USB Type-C 5V power supply <br/> PoE power supply (requires external PoE HAT) <br/> 5V power supply via GPIO pins (Pins 2 & 4)                                                                                        |
| OS Support   | Debian Linux, Android 13                                                                                                                                                                                              |

</TabItem>

</Tabs>

## Interface Description

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a5e/cubie_a5e_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description         | No. | Description            | No. | Description                 |
| --- | ------------------- | --- | ---------------------- | --- | --------------------------- |
| ①   | Wi-Fi / Bluetooth   | ⑧   | PoE Header             | ⑭   | LPDDR4 / LPDDR4x Memory     |
| ②   | Antenna Connector   | ⑨   | Gigabit Ethernet (PoE) | ⑮   | Allwinner A527 / T527       |
| ③   | USB 3.0 Type-A HOST | ⑩   | MIPI DSI               | ⑯   | On-board eMMC (Reserved)    |
| ④   | HDMI                | ⑪   | MicroSD Card Slot      | ⑰   | 40-pin GPIO Header          |
| ⑤   | SPI Flash           | ⑫   | MIPI CSI               | ⑱   | USB Type-C (5V Power & OTG) |
| ⑥   | UBOOT Button        | ⑬   | M.2 M Key 2230 Slot    | ⑲   | Gigabit Ethernet (Non-PoE)  |
| ⑦   | Status LED          |     |                        |     |                             |

:::tip On-board eMMC
If you have purchased the Cubie A5E model without on-board eMMC, the eMMC position on the board will be reserved without any components.
:::

## Application Scenarios

### Linux Beginners

As a Linux-based single-board computer, it can be used for Linux entry-level learning and advanced underlying and application layer development.

### Robotics Development

As a main controller for robotics development, it provides excellent performance and rich hardware interfaces, making it convenient for users to develop robotic applications.

### Embedded Development

With abundant GPIO interfaces and support for communication protocols like UART, SPI, and I2C, it enables users to drive various hardware components with ease.

### AI Vision Development

The T527 SoC features a 2 TOPS NPU, supporting AI vision development and accelerating AI inference and training.

## System Platform

Based on the Allwinner A527 / T527 SoC, Cubie A5E supports multiple operating systems:

- **Debian Linux** - Complete desktop environment, suitable for daily use and development
- **Android 13** - Mobile application ecosystem with touchscreen support
- **Tina Linux** - Allwinner's official embedded system based on OpenWrt, efficient and stable
- **Buildroot** - Lightweight embedded Linux with high customizability
