---
sidebar_position: 50
---

# Radxa X5

## Overview

Radxa X5 is a high-performance single-board computer based on the Intel® Processor N150 (Twin Lake). It targets edge computing and embedded applications, providing general-purpose x86 compute and graphics capabilities in a compact form factor.

It offers LPDDR5 memory (up to 16GB), and supports optional onboard eMMC as well as M.2 M Key 2230 storage expansion, allowing flexible capacity and performance options.

For display and connectivity, it features 2× Micro HDMI outputs, 2.5GbE Ethernet, and onboard Wi‑Fi 6 / Bluetooth 5.2, making it suitable for smart devices, industrial gateways, and multimedia edge systems.

Power input is supported via USB Type-C (PD / QC compatible) or 12V DC. It also provides expansion interfaces such as a 40-pin GPIO header for peripheral connections and system integration.

## Product Appearance

| Position |     View      | Position |     View     | Position |     View     |
| :------: | :-----------: | :------: | :----------: | :------: | :----------: |
|   Left   | X5 Front View |  Center  | X5 Back View |  Right   | X5 Side View |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Product Specifications

| CPU              | Intel® Processor N150 (Twin Lake)<br />- Total Cores: 4<br />- Total Threads: 4<br />- Max Turbo Frequency: 3.6 GHz<br />- Cache: 6 MB Intel® Smart Cache          |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| GPU              | Intel® Graphics<br />- Max Dynamic Frequency: 1GHz<br />- Max Resolution: 4K@60Hz<br />- Support DirectX 12.1 / OpenGL 4.6 / OpenCL 3.0                             |
| MCU              | RP2350                                                                                                                                                               |
| RAM              | LPDDR5<br />- Up to 16 GB                                                                                                                                            |
| Storage          | Onboard eMMC (Optional)<br />1x M.2 M Key 2230 Slot                                                                                                                  |
| Display          | 2x Micro HDMI                                                                                                                                                        |
| Networking       | 1x 2.5GbE RJ45 Port (PoE supported via optional PoE HAT)<br />Onboard WiFi 6 / BT 5.2                                                                                |
| USB              | 1x USB 2.0 Type-A Port<br />3x USB 3.2 Gen 2 Type-A Port                                                                                                             |
| Audio            | 3.5mm Headphone Jack                                                                                                                                                 |
| Button           | 1x Power Button<br />1x BOOTSEL Button                                                                                                                               |
| Other            | 1x PoE Header<br />1x Fan Connector<br />1x RTC Battery Connector<br />1x 40-Pin GPIO Header<br />- Support UART, I2C, PWM, GPIO, etc<br />1x Power Button Connector |
| Power            | USB Type-C (PD supported) or 12V DC Power Input Header                                                                                                               |
| Operating System | Windows 10 / Windows 11<br />Major Linux distributions (Ubuntu, Debian, Fedora, etc.)                                                                                |
| Dimension        | 85 mm x 56 mm                                                                                                                                                        |

## Interface Description

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| No. | Description                   | No. | Description                                       | No. | Description                  |
| --- | ----------------------------- | --- | ------------------------------------------------- | --- | ---------------------------- |
| 1   | 40-Pin GPIO Header            | 2   | M.2 M Key 2230 Slot                               | 3   | BOOTSEL Button               |
| 4   | WiFi 6 & Bluetooth 5.2 Module | 5   | Power Button                                      | 6   | USB Type-C Power Input       |
| 7   | 12V DC Power Input            | 8   | 2x Micro HDMI                                     | 9   | Power Button Connector       |
| 10  | Fan Connector                 | 11  | RTC Battery Connector                             | 12  | RP2350                       |
| 13  | PoE Header                    | 14  | 2.5GbE RJ45 Port                                  | 15  | 2x USB 3.2 Gen2 Type-A Ports |
| 16  | Onboard eMMC                  | 17  | Up: USB 2.0 Type-A<br />Down: USB 3.2 Gen2 Type-A | 18  | 3.5mm Audio Jack             |
| 19  | LPDDR5 Memory                 | 20  | Intel® Processor N150 (Twin Lake)                | 21  | SPI Flash                    |

:::tip Onboard eMMC

The onboard eMMC is an optional configuration. You can choose the eMMC capacity based on your needs.

:::

## Use Cases

Radxa X5 is suitable for edge computing and embedded applications that require general-purpose x86 performance and multimedia capabilities, such as industrial gateways, lightweight visual analytics, smart terminals, and local service deployment.

### Edge AI Applications

You can leverage the Intel® processor and Intel® Graphics media capabilities for local image/video preprocessing, lightweight inference, and visualization, then connect to a LAN or edge cluster via 2.5GbE or Wi‑Fi 6.

### Embedded Development

With expansion interfaces such as the 40-pin GPIO header, plus USB 3.2, 2× Micro HDMI, and M.2 expansion, it is convenient for connecting peripherals and building prototypes.

### Robotics

As a host computer or edge control node for robotics/automation, Radxa X5 can run control and interaction software, and connect sensors, actuators, and expansion modules via wired/wireless networking, USB, and GPIO.

### Developer Kit

It can be used as a computing platform for makers and project development, enabling quick application porting, peripheral bring-up, and system integration on Windows or Linux.

## System Platform

Radxa X5 is based on the Intel® Processor N150 and supports multiple operating systems. Choose based on your project ecosystem and deployment needs:

- Windows 10 / Windows 11
- Major Linux distributions (such as Ubuntu, Debian, Fedora, etc.)
