---
sidebar_position: 3
sidebar_label: Cubie A7Z
---

# Radxa Cubie A7Z

## Product Overview

The Radxa Cubie A7Z is an ultra-compact single-board computer measuring just 65 x 30mm, delivering powerful computing performance and rich expansion interfaces within a limited space, making it perfect for various application scenarios.

The Cubie A7Z is equipped with the Allwinner A733 SoC, featuring a high-performance octa-core CPU with hybrid architecture (dual-core Arm® Cortex®-A76 and hexa-core Arm Cortex-A55), Imagination PowerVR BXM-4-64 MC1 GPU, and a 3 TOPS@INT8 NPU.

With its compact size and powerful performance, it can efficiently handle complex tasks, making it particularly suitable for edge AI applications such as image recognition, computer vision, voice processing, robotics, and smart IoT devices.

## Product Appearance

<div style={{textAlign: 'center'}}>
   Cubie A7Z Front View
   <img src="/en/img/cubie/a7z/a7z-bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
   Cubie A7Z Back View
   <img src="/en/img/cubie/a7z/a7z-top.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Package Contents

| Qty | Item                      |
| --- | ------------------------- |
| 1   | Radxa Cubie A7Z Board     |
| 1   | Wi-Fi / Bluetooth Antenna |

## Specifications

| Category              | Specifications                                                                                                                                                                                                                                                          |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Processor             | SoC: Allwinner A733 <br/> CPU: 2x Cortex-A76 + 6x Cortex-A55 <br/> GPU: Imagination BXM-4-64 MC1, supports OpenGL ES 3.2, Vulkan 1.3, OpenCL 3.0 <br/> NPU: 3 TOPS@INT8 AI acceleration engine                                                                          |
| Memory                | LPDDR4/4x, options: 1GB / 2GB / 4GB / 8GB / 16GB                                                                                                                                                                                                                        |
| Storage               | Onboard: Optional UFS module (up to 1TB) <br/> Expandable: MicroSD card slot                                                                                                                                                                                            |
| Networking            | Onboard Wi-Fi 6, Bluetooth 5.4 chip, external antenna supported for enhanced signal                                                                                                                                                                                     |
| Video Output          | 1x Micro HDMI port, supports up to 4K@60fps <br/> 1x USB-C 3.0 port with DisplayPort Alt Mode support for external high-definition displays                                                                                                                             |
| Camera                | 1x 4-lane MIPI CSI (can be split into 2x 2-lane MIPI CSI)                                                                                                                                                                                                               |
| USB                   | 1x USB-C 2.0 OTG for power and data transfer <br/> 1x USB-C 3.0 HOST with DisplayPort Alt Mode support                                                                                                                                                                  |
| Expansion             | Standard 40-Pin GPIO interface: Supports PWM, UART, SPI, I2C, etc. <br/> PCIe Gen3.0 FPC interface: 1-lane PCIe 3.0 for expanding NVMe SSDs, AI accelerator cards, and other high-speed devices <br/> Fan interface: 1x 3-Pin 0.8mm Pitch 180° Horizontal SMD Connector |
| Power Supply          | USB Type-C 5V power supply <br/> GPIO pin 5V power supply (pins 2 and 4)                                                                                                                                                                                                |
| Operating Systems     | Supports Debian Linux, Android 13, and more                                                                                                                                                                                                                             |
| Dimensions            | 65 x 30mm                                                                                                                                                                                                                                                               |
| Operating Temperature | Recommended 0°C ~ 50°C                                                                                                                                                                                                                                                  |

## Interface Description

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cubie/a7z/a7z-interface.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Cubie A7Z Interface Diagram" />
</div>

| No. | Description                      | No. | Description               | No. | Description            |
| --- | -------------------------------- | --- | ------------------------- | --- | ---------------------- |
| ①   | USB-C 2.0 OTG & Power Port       | ⑥   | Antenna Connector         | ⑪   | PCIe 3.0 FPC Connector |
| ②   | USB-C 3.1 OTG & DP Alt Mode Port | ⑦   | WiFi 6 / BT5 Module       | ⑫   | 40-Pin GPIO Interface  |
| ③   | Allwinner A733 SoC               | ⑧   | 4-lane MIPI CSI Interface | ⑬   | LPDDR4/4x RAM          |
| ④   | Micro HDMI Port                  | ⑨   | Onboard UFS               | ⑭   | MicroSD Card Slot      |
| ⑤   | Fan Connector                    | ⑩   | U-Boot Button             |     |                        |

- Power Indicator

When the Cubie A7Z is powered on normally, the power indicator will light up green.

- LPDDR4/4x

LPDDR4/4x options: 1GB / 2GB / 4GB / 8GB / 16GB

- Onboard UFS

Onboard UFS module with options up to 1TB storage capacity.

## Application Scenarios

The Radxa Cubie A7Z is suitable for edge AI applications such as image recognition, computer vision, voice processing, robotics, and smart IoT devices.

### Edge AI Applications

Ideal for real-time image recognition and processing, voice recognition and processing, and other edge AI applications.

### Embedded Development

The onboard standard 40-Pin GPIO interface supports PWM, UART, SPI, I2C, and other functions, allowing connection to various peripherals.

### Robotics Development

As a main controller for robotics development, the Radxa Cubie A7Z provides excellent performance and rich interfaces to support robotic applications.

### Developer Kit

Serves as an entry-level development board for embedded enthusiasts and robotics developers, offering open-source hardware design, comprehensive technical documentation, and development resources.

## Supported Platforms

The Cubie A7Z, based on the Allwinner A733 SoC, supports multiple operating systems:

- Debian Linux
- Buildroot
- Tina Linux
- Android 13
