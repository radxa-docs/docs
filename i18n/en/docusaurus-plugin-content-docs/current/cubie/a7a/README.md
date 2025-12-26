---
sidebar_position: 2
---

# Radxa Cubie A7A

## Product Overview

The Radxa Cubie A7A is an ultra-compact yet feature-rich single-board computer (SBC) designed to deliver powerful performance in space-constrained environments.

Powered by the Allwinner A733 SoC, the Cubie A7A features a hybrid octa-core high-performance CPU (dual-core Arm Cortex-A76 + hexa-core Arm Cortex-A55 big.LITTLE architecture, up to 2.0GHz), integrated 3 TOPS NPU, and Imagination BXM-4-64 MC1 GPU, providing robust AI and multimedia processing capabilities.

## Product Appearance

<div style={{textAlign: 'center'}}>
   Cubie A7A Front View
   <img src="/en/img/cubie/a7a/a7a-bottom.webp" style={{width: '50%', maxWidth: '1200px'}} />
   Cubie A7A Rear View
   <img src="/en/img/cubie/a7a/a7a-top.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

## Package Contents

| Qty | Component             |
| --- | --------------------- |
| 1   | Radxa Cubie A7A Board |
| 1   | Wi-Fi/BT Antenna      |

## Product Specifications

| Category   | Specifications                                                                                                                                                                            |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Processor  | SoC: Allwinner A733 <br/> CPU: 2× Cortex-A76 + 6× Cortex-A55 <br/> GPU: Imagination BXM-4-64 MC1; Supports OpenGL ES 3.2, Vulkan 1.3, OpenCL 3.0 <br/> NPU: 3 TOPS AI Acceleration Engine |
| Memory     | LPDDR5, Options: 2GB / 4GB / 6GB / 8GB / 12GB / 16GB                                                                                                                                      |
| Storage    | Boot: 8MB SPI NOR Flash <br/> System Storage: Supports MicroSD card / eMMC module / UFS module                                                                                            |
| Network    | Wired: 1× Gigabit Ethernet (PoE supported with external PoE HAT) <br/> Wireless: Wi-Fi 6, Bluetooth 5.4, external antenna interface                                                       |
| Video Out  | HDMI: 1× HDMI port, up to 4K@60fps <br/> MIPI DSI: 1× 4-lane MIPI DSI                                                                                                                     |
| Camera     | 1× 4-lane MIPI CSI or 2× 2-lane MIPI CSI                                                                                                                                                  |
| Audio      | Audio Interface: 3.5mm 4-pole headphone jack with microphone input <br/> Audio Output: Supports stereo output, can directly drive 32Ω headphones                                          |
| USB        | USB 3.1: 1× Type-A HOST <br/> USB 2.0: 3× Type-A HOST, 1× Type-C OTG/Power                                                                                                                |
| Expansion  | 40-pin GPIO header: Supports UART, SPI, I2C, etc. <br/> PCIe slot: 1× single-lane PCIe 3.0 via FPC interface <br/> Fan header: 1× 2-pin 1.25mm <br/> RTC header: 1× 2-pin 1.25mm          |
| Power      | USB Type-C 5V power supply <br/> PoE power supply (requires external PoE HAT) <br/> 5V power supply via GPIO pins (pins 2 & 4)                                                            |
| OS Support | Debian Linux, Android 13                                                                                                                                                                  |

## Interface Description

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a7a/a7a-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description                                               | No. | Description                                                          | No. | Description                                                          |
| --- | --------------------------------------------------------- | --- | -------------------------------------------------------------------- | --- | -------------------------------------------------------------------- |
| ①   | [USB Type-C Port](/cubie/a7a/hardware-use/usb-type-c)     | ⑧   | [USB Type-A Port](/cubie/a7a/hardware-use/usb-type-a)                | ⑮   | [Antenna Connector](/cubie/a7a/hardware-use/ante)                    |
| ②   | [HDMI Port](/cubie/a7a/hardware-use/hdmi)                 | ⑨   | LPDDR5 Memory                                                        | ⑯   | [PCIe 3.0 FPC Connector](/cubie/a7a/hardware-use/fpc)                |
| ③   | [Fan Header](/cubie/a7a/hardware-use/fan)                 | ⑩   | [Gigabit Ethernet (PoE Supported)](/cubie/a7a/hardware-use/ethernet) | ⑰   | Allwinner A733                                                       |
| ④   | [Headphone Jack](/cubie/a7a/hardware-use/headphone)       | ⑪   | [PoE Connector](/cubie/a7a/hardware-use/ethernet)                    | ⑱   | [Power Button](/cubie/a7a/hardware-use/power-key)                    |
| ⑤   | [UBOOT Button](/cubie/a7a/hardware-use/uboot-key)         | ⑫   | WiFi 6 & Bluetooth 5.4                                               | ⑲   | [eMMC / UFS Module Combo Slot](/cubie/a7a/hardware-use/emmc-ufs-com) |
| ⑥   | [USB 2.0 Type-A Port](/cubie/a7a/hardware-use/usb-type-a) | ⑬   | [40-pin GPIO Header](/cubie/a7a/hardware-use/pin-gpio)               | ⑳   | [MIPI CSI Connector](/cubie/a7a/hardware-use/mipi-csi)               |
| ⑦   | [RTC Header](/cubie/a7a/hardware-use/rtc)                 | ⑭   | [MIPI DSI Connector](/cubie/a7a/hardware-use/mipi-dsi)               | ㉑  | [MicroSD Card Slot](/cubie/a7a/hardware-use/microsd)                 |

- Power LED

The green power LED lights up when Cubie A7A is properly powered; it turns off when powered down or shut down.

- Status LED

The blue status LED blinks when the system boots normally; it turns off when the system encounters an error.

- LPDDR5 Memory

LPDDR5 memory options: 2GB / 4GB / 6GB / 8GB / 12GB / 16GB.

## Application Scenarios

### Linux Beginners

As a Linux-based single-board computer, the Cubie A7A can be used for Linux learning, advanced low-level development, and application development.

### Robotics Development

Serves as a main controller for robotics development, offering excellent performance and rich hardware interfaces for developing robotic applications.

### Embedded Development

Features extensive GPIO interfaces supporting UART, SPI, I2C, and other communication protocols, making it easy to drive various hardware components.

### AI Vision Development

Equipped with a 3 TOPS NPU to support AI vision development, accelerating AI inference and training.

## System Platform

Based on the Allwinner A733 SoC, Cubie A7A supports multiple operating systems:

- Debian Linux
- Buildroot
- Tina Linux
- Android 13
