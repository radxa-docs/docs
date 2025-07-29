---
sidebar_position: 50
sidebar_label: E24C
---

# Radxa E24C - Compact High-Performance Network Computer

## Product Overview

The Radxa E24C is a compact, high-performance network computer powered by the Rockchip RK3528A processor. Designed specifically for routing, edge networking, and industrial applications, it features four Gigabit Ethernet ports, 4K HDMI output, and NVMe storage expansion, achieving an optimal balance between performance, connectivity, and reliability.

As a versatile networking device, the E24C offers a rich selection of interfaces and flexible configuration options, making it suitable for various network scenarios and application requirements. With its powerful processing capabilities and diverse connectivity options, the E24C can meet various needs, from simple home networks to complex enterprise network solutions.

The Radxa E24C is an ideal choice for network engineers, developers, and system integrators, providing a robust platform for deploying firewalls, VPN gateways, custom routers, and edge computing solutions.

## Product Appearance

The bare board version of the Radxa E24C offers more peripheral interfaces compared to the aluminum alloy enclosure version, while the aluminum alloy enclosure provides sturdier protection!

<Tabs queryString="e24cmode1">

<TabItem value="E24C(Enclosure Version)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C Top View</div>
  <img src="/img/e/e24c/e24c-01-shell.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '10px', fontSize: '18px', color: '#000000'}}>E24C Side View</div>
  <img src="/img/e/e24c/e24c-02-shell.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="E24C(Bare Board)">
<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C Top View</div>
  <img src="/img/e/e24c/e24c-01.webp" style={{width: '100%', maxWidth: '600px'}} />
  <img src="/img/e/e24c/e24c-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C Side View</div>
  <img src="/img/e/e24c/e24c-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

</Tabs>

## Technical Specifications

| Category                | Specifications                                                               |
| :---------------------- | :--------------------------------------------------------------------------- |
| **Processor**           |                                                                              |
| SoC                     | Rockchip RK3528A                                                             |
| CPU                     | Quad-core ARM Cortex‑A53, up to 2.0GHz                                       |
| GPU                     | ARM Mali-450 GPU, supports OpenGL® ES1.1, ES2.0, OpenVG® 1.1               |
| **Memory & Storage**    |                                                                              |
| Memory (Optional)       | 1GB/2GB/4GB, LPDDR4                                                          |
| Onboard eMMC (Optional) | 8GB/16GB/32GB, eMMC 5.1 standard                                             |
| Expandable Storage      | MicroSD card slot (supports UHS-I)                                           |
| High-speed Storage      | M.2 PCIe 2.1 NVMe SSD interface (supports 2280 form factor)                  |
| **Networking**          |                                                                              |
| Ethernet                | 4x Gigabit Ethernet ports (WAN/LAN configurable)                             |
| Network Controller      | RTL8367RB-CG built-in switch chip                                            |
| **I/O Ports**           |                                                                              |
| USB Ports               | 3x USB 2.0 Type-A + 1x USB 2.0 Type-C (OTG)                                  |
| Video Output            | HDMI 2.1: Supports up to 4K@60Hz resolution                                  |
| Expansion Headers       | 14-pin header: Supports UART, SPI, I2C, and power output                     |
| Other Interfaces        | Power button, Maskrom button, User button, Fan header, RTC battery connector |
| **Power & Physical**    |                                                                              |
| Power Input             | DC 12V/2A, 5.5x2.5mm power jack                                              |
| Power Consumption       | Typical: 5W (idle), Maximum: 12W (full load)                                 |
| Cooling Solution        | Aluminum alloy enclosure (passive cooling) / Optional active fan cooling     |
| Dimensions (Bare Board) | 143 × 99 × 25.3 mm                                                           |
| Operating Temperature   | 0°C ~ 70°C                                                                   |
| **Software Support**    |                                                                              |
| Operating Systems       | Debian Linux, OpenWrt, and more                                              |
| Boot Options            | Boot from MicroSD, eMMC, or NVMe SSD                                         |

## Interface Layout

<Tabs queryString="e24cmode2">

<TabItem value="E24C(Enclosure Version)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '10px', fontSize: '18px', color: '#000000'}}>E24C Enclosure Version Interfaces</div>
  <img src="/img/e/e24c/e24c-shell-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| No. | Description                                   | Qty |
| :-: | :-------------------------------------------- | :-: |
|  ①  | Power Input: DC5525                           |  1  |
|  ②  | HDMI 2.1 Output                               |  1  |
|  ③  | Gigabit Ethernet Ports (WAN/LAN configurable) |  4  |
|  ④  | Power Button                                  |  1  |
|  ⑤  | LED Indicators (1x Power, 4x Ethernet)        |  5  |
|  ⑥  | MicroSD Card Slot                             |  1  |
|  ⑦  | USB 2.0 Type-A Ports                          |  3  |
|  ⑧  | Maskrom Button                                |  1  |
|  ⑨  | User Button                                   |  1  |
|  ⑩  | USB 2.0 Type-C Port (OTG + UART Debug)        |  1  |

</TabItem>

<TabItem value="E24C(Bare Board)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C Bare Board Interfaces</div>
  <img src="/img/e/e24c/e24c-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| No. | Description                            | Qty |
| :-: | :------------------------------------- | :-: |
|  ①  | Power Input: DC5525                    |  1  |
|  ②  | Onboard eMMC                           |  1  |
|  ③  | USB 2.0 Type-C (OTG + UART Debug)      |  1  |
|  ④  | User Button                            |  1  |
|  ⑤  | USB 2.0 Type-A Ports                   |  3  |
|  ⑥  | RTC Battery Connector                  |  1  |
|  ⑦  | MicroSD Card Slot                      |  1  |
|  ⑧  | GPIO: 14-pin Expansion Header          |  1  |
|  ⑨  | LED Indicators (1x Power, 4x Ethernet) |  5  |
|  ⑩  | Power Button                           |  1  |
|  ⑪  | Fan Header                             |  1  |
|  ⑫  | Maskrom Button                         |  1  |
|  ⑬  | Gigabit Ethernet Ports                 |  4  |
|  ⑭  | HDMI 2.1 Output                        |  1  |
|  ⑮  | M.2 NVMe SSD Slot                      |  1  |

</TabItem>

</Tabs>

## Key Features

- Versatile Network Configuration: 4x Gigabit Ethernet ports with flexible WAN/LAN configuration
- Expandable Storage: Supports M.2 NVMe SSD for high-speed storage expansion
- Developer-Friendly: Type-C interface supports dual-mode (OTG data transfer and UART debugging)
- Software Ecosystem: Official support for Debian Linux and OpenWrt systems

## System Support

The Radxa E24C supports both Debian Linux and OpenWrt operating systems, allowing users to choose the most suitable system for different application scenarios.

### Debian Linux

Provides a complete Linux desktop environment, ideal for general computing and development needs.

- Complete package management system
- Suitable for application development and testing
- Supports mainstream programming languages and development tools

### OpenWrt

Lightweight router operating system based on open source, suitable for highly customized networking needs.

- Lightweight and efficient operation
- Modular design with flexible network configuration
- Supports various network services and security features

## Package Contents

The Radxa E24C offers multiple configuration options, with the standard package including:

| Item                 | Qty | Notes                                        |
| :------------------- | :-: | :------------------------------------------- |
| Radxa E24C Main Unit |  1  | Bare board or enclosure version (as ordered) |
| Quick Start Guide    |  1  | Printed manual                               |

:::tip
The following accessories may be included or need to be purchased separately depending on the configuration:

- 12V/2A Power Adapter with DC5525 connector
- MicroSD Card (required for versions without eMMC)
- M.2 NVMe SSD (for users needing expanded storage)
- USB Type-A to Type-C Cable (for debugging)
- HDMI Cable (for display connection)
  :::

## Application Scenarios

With its versatile network interfaces and powerful processing capabilities, the Radxa E24C is suitable for various application scenarios:

### Network Router & Firewall

Configure the E24C as a high-performance network router and firewall using OpenWrt to protect home or small office networks.

- Supports stateful packet inspection firewall rules
- Detailed monitoring of internal and external network traffic
- Network bandwidth management and QoS control

### VPN Gateway

Set up the E24C as a remote access VPN gateway to enable secure remote work or home network access.

- Supports various VPN protocols including OpenVPN and WireGuard
- Easy deployment and management
- Low-power 24/7 operation solution

### Home Media Server

Pair with NVMe SSD to use E24C as a home media server.

- Plex/Emby Media Server
- NAS file storage and sharing
- DLNA media streaming services

### Edge Computing & IoT Gateway

Function as an edge computing node or IoT gateway to collect and process data from IoT devices.

- Low-power edge data processing
- Supports IoT protocols like MQTT
- Connect sensors and peripherals via GPIO interface

### Compact Server

Configure the E24C as a lightweight web server, database server, or development platform based on Debian Linux.

- Deploy Docker containerized applications
- Automation and monitoring services
- Achieve higher storage and performance with SSD
