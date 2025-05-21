---
sidebar_position: 50
sidebar_label: E24C
---

# Radxa E24C - Compact High-Performance Network Computer

## 1. Product Overview

Radxa E24C is a compact high-performance network computer powered by the Rockchip RK3528A processor.

Designed for routing, edge networking, and industrial applications, it features four Gigabit Ethernet ports, 4K HDMI output, and NVMe storage expansion, achieving the perfect balance between performance, connectivity, and reliability.

Radxa E24C is an ideal choice for network engineers, developers, and system integrators, providing a powerful platform for deploying firewalls, VPN gateways, custom routers, and edge computing solutions.

## 2. Product Appearance

The bare board version of Radxa E24C offers more peripheral interfaces compared to the aluminum alloy case version; however, the aluminum alloy case provides more robust protection!

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

## 3. Technical Specifications

| Model              | Radxa E24C                                                   |
| :----------------- | :----------------------------------------------------------- |
| SoC                | Rockchip RK3528A                                             |
| CPU                | Quad-core ARM Cortex‑A53                                     |
| GPU                | ARM Mali-450 GPU, supports OpenGL® ES1.1, ES2.0, OpenVG® 1.1 |
| Memory (Optional)  | 2GB/4GB/8GB LPDDR4                                           |
| Onboard eMMC Storage (Optional) | 8GB/16GB/32GB                                                |
| Expandable Storage | MicroSD Card                                                |
| Ethernet           | 4x Gigabit Ethernet Ports (WAN/LAN Configurable)             |
| USB Ports          | 3x USB 2.0 Type-A + 1x USB 2.0 Type-C (OTG)                  |
| Video Output       | HDMI 2.1: Supports up to 4K resolution                      |
| GPIO               | 14-pin expansion header: supports UART, SPI, I2C, and power output |
| Other Interfaces   | Power button, Maskrom button, User-defined button, Fan connector, RTC battery connector |
| Power Supply       | DC 12V/2A, Connector: 5.5x2.5mm jack                           |
| Operating System   | Supports Debian Linux, OpenWrt, and other operating systems |

## 4. Interface Layout

<Tabs queryString="e24cmode2">

<TabItem value="E24C(Enclosure Version)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '10px', fontSize: '18px', color: '#000000'}}>E24C Enclosure Version Interfaces</div>
  <img src="/img/e/e24c/e24c-shell-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| No.  | Description                                         | Qty |
| :--: | :-------------------------------------------------- | :--: |
|  ①   | Power Interface: DC5525                            |  1   |
|  ②   | HDMI 2.1 Output Interface                          |  1   |
|  ③   | Gigabit Ethernet Ports (WAN/LAN Configurable)      |  4   |
|  ④   | Power Button                                       |  1   |
|  ⑤   | LED Indicators (1 Power LED, 4 Ethernet Port LEDs)  |  5   |
|  ⑥   | MicroSD Card Slot                                  |  1   |
|  ⑦   | USB 2.0 Type‑A Ports                               |  3   |
|  ⑧   | Maskrom Button                                     |  1   |
|  ⑨   | User Button                                        |  1   |
|  ⑩   | USB 2.0 Type‑C Port (OTG + Debug Combo)             |  1   |

</TabItem>

<TabItem value="E24C(Bare Board)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C Bare Board Interfaces</div>
  <img src="/img/e/e24c/e24c-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| No.  | Description                                         | Qty |
| :--: | :-------------------------------------------------- | :--: |
|  ①   | Power Interface: DC5525                            |  1   |
|  ②   | Onboard eMMC Storage                               |  1   |
|  ③   | USB 2.0 Type‑C Port (OTG + Debug Combo)             |  1   |
|  ④   | User Button                                        |  1   |
|  ⑤   | USB 2.0 Type‑A Ports                               |  3   |
|  ⑥   | RTC Battery Connector                              |  1   |
|  ⑦   | MicroSD Card Slot                                  |  1   |
|  ⑧   | GPIO: 14-pin Expansion Header                      |  1   |
|  ⑨   | LED Indicators (1 Power LED, 4 Ethernet Port LEDs)  |  5   |
|  ⑩   | Power Button                                       |  1   |
|  ⑪   | Fan Connector                                      |  1   |
|  ⑫   | Maskrom Button                                     |  1   |
|  ⑬   | Gigabit Ethernet Ports (WAN/LAN Configurable)      |  4   |
|  ⑭   | HDMI 2.1 Output Interface                          |  1   |
|  ⑮   | M.2 NVMe SSD Slot                                 |  1   |

</TabItem>

</Tabs>

## 5. Key Features

- **Versatile Network Configuration**: 4 Gigabit Ethernet ports with flexible WAN/LAN configuration
- **Expandable Storage**: Supports M.2 NVMe SSD for high-speed storage expansion
- **Developer Friendly**: Type-C port supports dual-mode (OTG data transfer and UART debugging)
- **Software Ecosystem**: Official support for Debian Linux and OpenWrt operating systems

## 6. System Support

Radxa E24C supports two major operating systems, Debian Linux and OpenWrt, allowing users to flexibly choose the most suitable system solution according to different application scenarios.

### 6.1 Debian Linux

Provides a complete Linux desktop environment, suitable for general computing and development needs.

- Complete package management system
- Ideal for application development and testing
- Supports mainstream programming languages and development tools

### 6.2 OpenWrt

An open-source router operating system, perfect for highly customized networking requirements.

- Lightweight and efficient system
- Modular design for flexible network configuration
- Supports various network services and security features
