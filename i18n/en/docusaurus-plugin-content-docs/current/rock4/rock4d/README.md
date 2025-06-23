---
sidebar_position: 11
sidebar_label: ROCK 4D
---

# ROCK 4D - Industrial-Grade AI Single Board Computer

## Product Overview

The Radxa ROCK 4D is a compact single-board computer (SBC) featuring numerous top-tier functions, features, and expansion options.

Equipped with the Rockchip RK3576 or RK3576J SoC, the ROCK 4D boasts an octa-core CPU (4x Cortex-A72 + 4x Cortex-A53), Mali-G52 GPU, and a powerful 6 TOPS NPU, making it ideal for AI and multimedia tasks.

The ROCK 4D is perfect for makers, IoT enthusiasts, hobbyists, gamers, PC users, OEMs, industrial applications, and anyone in need of a high-performance, reliable platform.

Two versions are available: the commercial-grade ROCK 4D based on RK3576, and the industrial-grade ROCK 4D based on RK3576J.

## Product Appearance

<div style={{textAlign: 'center'}}>
   ROCK 4D Front View
   <img src="/img/rock4/4d/rock4d-top.webp" style={{width: '100%', maxWidth: '800px'}} />
   ROCK 4D Rear View
    <img src="/img/rock4/4d/rock4d-bottom.webp" style={{width: '100%', maxWidth: '800px'}} />
</div>

## Specifications

| Category     | Specification                                                                                                                                                                                                       |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Processor    | System on Chip (SoC): Rockchip RK3576 / RK3576J <br/> CPU: 4x Cortex-A72 + 4x Cortex-A53 <br/> GPU: Arm Mali-G52 MC3 <br/> Neural Processing Unit (NPU): 6 TOPS (supports INT4 / INT8 / INT16 / FP16 / BF16 / TF32) |
| Memory (RAM) | LPDDR5, options: 2GB / 4GB / 8GB / 16GB                                                                                                                                                                             |
| Storage      | Boot: 16MB SPI NOR Flash <br/> Expandable: eMMC / UFS module interface, MicroSD card slot                                                                                                                           |
| Networking   | Wired: 1x Gigabit Ethernet (PoE supported with external HAT) <br/> Wireless: Wi-Fi 6, Bluetooth 5.4, external antenna interface                                                                                     |
| Video Output | HDMI: 1× HDMI 2.1, up to 4K@120fps <br/> MIPI DSI: 1× 4-lane MIPI DSI                                                                                                                                               |
| Camera Input | MIPI CSI: 1× 4-lane (configurable as 2× 2-lane) + 1× 2-lane CSI                                                                                                                                                     |
| Audio        | Audio Jack: 3.5mm 4-pole headphone jack with mic input <br/> Audio Output: Supports stereo output, can drive 32Ω headphones directly                                                                                |
| USB Ports    | USB 3.0: 1× Type-A HOST, 1× Type-A OTG/HOST <br/> USB 2.0: 2× Type-A HOST                                                                                                                                           |
| Expansion    | GPIO Header: Supports UART, SPI, I2C, I2S, PWM, CAN, ADC, etc. <br/> PCIe Slot: PCIe 2.1 x1 via FPC interface <br/> Fan Connector: 1× 2-pin 1.25mm PWM controlled fan header                                        |
| Power Input  | Power Supply: USB Type-C or via GPIO header                                                                                                                                                                         |
| OS Support   | Operating Systems: Debian Linux, Android 14, Yocto, Buildroot                                                                                                                                                       |
| Temperature  | Commercial: 0°C ~ 60°C (RK3576) <br/> Industrial: -40°C ~ 85°C (RK3576J)                                                                                                                                            |

## Interface Description

Click on the interface names for tutorials on connecting external devices.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/rock4d-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
| No. | Description                       | Qty | No. | Description                         | Qty | No. | Description                         | Qty |
|:---:|:---------------------------------|:---:|:---:|:------------------------------------|:---:|:---:|:------------------------------------|:---:|
|  ①  | [USB Type-C Port](/rock4/rock4d/hardware-use/usb-type-c) |  1  |  ⑩ | [PoE Port](/rock4/rock4d/hardware-use/gigabit-ethernet) |  1  |  ⑲ | [MIPI CSI Port](/rock4/rock4d/hardware-use/mipi-csi) |  1  |
|  ②  | User LED                         |  1  |  ⑪ | [Maskrom Button](/rock4/rock4d/hardware-use/maskrom) |  1  |  ⑳ | [HDMI 2.1 Port](/rock4/rock4d/hardware-use/hdmi) |  1  |
|  ③  | Power LED                        |  1  |  ⑫ | [USB 2.0 Type-A Ports](/rock4/rock4d/hardware-use/usb-type-a) |  2  |  ㉑ | [Recovery Pins](/rock4/rock4d/hardware-use/recovery) |  1  |
|  ④  | Power Button                     |  1  |  ⑬ | Rockchip RK3576(J)                |  1  |  ㉒ | [UFS Module Connector](/rock4/rock4d/hardware-use/emmc-ufs-connector) |  1  |
|  ⑤  | [FPC Connector](/rock4/rock4d/hardware-use/fpc-connector)|  1  |  ⑭ | [USB 3.0 Type-A Ports](/rock4/rock4d/hardware-use/usb-type-a) |  2  |  ㉓ | [RTC Connector](/rock4/rock4d/hardware-use/rtc-connector) |  1  |
|  ⑥  | [WiFi6 & Bluetooth 5.4](/rock4/rock4d/hardware-use/ante.md) |  1  |  ⑮ | SPI NOR Flash                      |  1  |  ㉔ | [eMMC Module Connector](/rock4/rock4d/hardware-use/emmc-ufs-connector) |  1  |
|  ⑦  | [Antenna Connector](/rock4/rock4d/hardware-use/ante) |  1  |  ⑯ | [Gigabit Ethernet (PoE)](/rock4/rock4d/hardware-use/gigabit-ethernet) |  1  |  ㉕ | [MIPI CSI Port](/rock4/rock4d/hardware-use/mipi-csi) |  1  |
|  ⑧  | [40-pin GPIO Header](/rock4/rock4d/hardware-use/pin-gpio)| 1  |  ⑰ | [Fan Connector](/rock4/rock4d/hardware-use/fan) |  1  |  ㉖ | [MicroSD Card Slot](/rock4/rock4d/hardware-use/microsd) |  1  |
|  ⑨  | LPDDR5 Memory                    |  1  |  ⑱ | [Headphone Jack](/rock4/rock4d/hardware-use/headphone) |  1  |  ㉗ | [MIPI DSI Port](/rock4/rock4d/hardware-use/mipi-dsi) |  1  |

- User LED

Blinks when the system is booting normally.

- Power LED

Lights up when the system is powered on.

- Power Button

Short press to power on or access power menu; long press to power off.

- LPDDR5 Memory

Available in 2GB / 4GB / 8GB / 16GB capacities.

- Rockchip RK3576(J)

Two SoC versions available: commercial-grade ROCK 4D with RK3576 and industrial-grade ROCK 4D with RK3576J.

## Application Scenarios

### Linux Beginners

As a Linux-based single-board computer, the ROCK 4D is perfect for learning Linux, as well as low-level and application development.

### Robotics Development

Serves as a main controller for robotics development, offering excellent performance and rich hardware interfaces for developing robotic applications.

### Embedded Development

Features extensive GPIO interfaces supporting UART, SPI, I2C, I2S, and other communication protocols, making it easy to drive various hardware components.

### AI Development

Equipped with a powerful 6 TOPS NPU for AI inference and training.

## System Platform

The ROCK 4D, based on the RK3576 or RK3576J chipset, supports the ArmV8 instruction set and multiple operating systems.

- Debian Linux
- Yocto Linux
- Buildroot
- Android 14
