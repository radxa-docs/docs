---
sidebar_position: 1
---

# Hardware Interface and Design


## 1. Hardware Overview

The Radxa E24C is a compact, high-performance network computer powered by the Rockchip RK3528A processor, designed for routing, edge networking, and industrial applications, achieving an optimal balance between performance, connectivity, and reliability.

This document details the hardware interfaces, connection methods, and application recommendations for the E24C to help you maximize the device's performance.
## 2. Chip Architecture

The RK3528A is a high-performance processor from Rockchip, featuring high performance, low power consumption, and cost-effectiveness.

- **Powerful Processing**: Quad-core ARM Cortex-A53
- **Networking Capabilities**: Supports multiple Gigabit Ethernet interfaces, optimized for networking applications
- **Diverse Interfaces**: Supports various high-speed interfaces including PCIe, USB 3.0, and HDMI 2.1

<div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '12px', color: '#000000'}}>E24C Chip Internal Architecture Diagram</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/radxa-e24c-chip-diagram.webp" style={{width: '100%', maxWidth: '800px'}} />
</div>

## 3. System Architecture

The E24C features a compact and efficient hardware design that integrates multiple interfaces and functions on a single board.

<div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '12px', color: '#000000'}}>E24C System Internal Architecture and Component Connection Diagram</div>
<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-rk3528.webp" style={{width: '100%', maxWidth: '800px'}} />
</div>

## 4. Hardware Interfaces

:::tip
For detailed hardware interface pinouts of the Radxa E24C, refer to the [Hardware Schematics](../download)
:::

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C Bare Board Interfaces</div>
  <img src="/img/e/e24c/e24c-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| No. | Description                                          | Qty |
| :-: | :--------------------------------------------------- | :-: |
|  ①  | Power Interface: DC5525                              |  1  |
|  ②  | Onboard eMMC                                        |  1  |
|  ③  | USB 2.0 Type-C Interface: Device + Debug Combo Port |  1  |
|  ④  | User Button                                         |  1  |
|  ⑤  | USB 2.0 Type-A Ports                                |  3  |
|  ⑥  | RTC Battery Connector                               |  1  |
|  ⑦  | MicroSD Card Slot                                   |  1  |
|  ⑧  | GPIO: 14-pin Expansion Header                       |  1  |
|  ⑨  | LED Status Indicators (1 Power, 4 Ethernet)         |  5  |
|  ⑩  | Power Button                                        |  1  |
|  ⑪  | Fan Connector                                       |  1  |
|  ⑫  | Maskrom Button                                     |  1  |
|  ⑬  | Gigabit Ethernet Ports (Configurable as WAN/LAN)   |  4  |
|  ⑭  | HDMI 2.1 Output                                     |  1  |
|  ⑮  | M.2 NVMe SSD Slot                                   |  1  |

### 4.1 MicroSD Card Slot

The E24C features an onboard MicroSD card slot that can be used for system data, OS images, and system configuration storage.

| PIN | Name       | Description           |
| --- | ---------- | --------------------- |
| 1   | SDMMC_D2   | SD Card Data Line 2   |
| 2   | SDMMC_D3   | SD Card Data Line 3   |
| 3   | SDMMC_CMD  | SD Card Command Line  |
| 4   | VCC_3V3    | 3.3V Power            |
| 5   | SDMMC_CLK  | SD Card Clock Signal  |
| 6   | GND        | Ground                |
| 7   | SDMMC_D0   | SD Card Data Line 0   |
| 8   | SDMMC_D1   | SD Card Data Line 1   |
| 9   | SDMMC_DETN | SD Card Detect        |
| 10  | GND        | Ground                |
| 11  | GND        | Ground                |
| 12  | GND        | Ground                |
| 13  | GND        | Ground                |

#### Usage Guidelines

- **Supported Card Types**: Compatible with MicroSD/MicroSDHC/MicroSDXC memory cards
- **Recommended Specifications**: Class 10/UHS-I or higher recommended for better performance
- **Maximum Capacity**: Theoretically supports up to 2TB MicroSDXC cards, tested with 512GB

#### Main Applications

- **System Boot**: E24C can boot operating systems from the MicroSD card, which is the most common usage
- **Data Storage**: Can be used to expand storage when the system is already running (e.g., when booted from eMMC)
- **System Backup**: Useful for backing up the current system and data

:::tip
For production environments or systems requiring 24/7 operation, it's recommended to use eMMC or M.2 SSD as the primary storage and boot device, as they offer better stability and read/write endurance. MicroSD cards are suitable for temporary storage and development/testing scenarios.
:::

### 4.2 USB Interfaces

The E24C provides two different types of USB interfaces: USB 2.0 Type-C and USB 2.0 Type-A.

#### USB 2.0 Type-C

Functions as a data transfer interface, supporting USB 2.0 OTG data transfer and serial debugging, with a maximum data transfer rate of 480Mbps.

#### USB 2.0 Type-A

Three USB 2.0 Type-A ports, each supporting up to 480Mbps data transfer rate.

| PIN | Name         | Description                     |
| --- | ------------ | ------------------------------- |
| 1   | VCC5V0_USB   | 5V Power Output, max 500mA     |
| 2   | USB2_HOST_DM | USB 2.0 Data Negative (D-)     |
| 3   | USB2_HOST_DP | USB 2.0 Data Positive (D+)     |
| 4   | GND          | Ground                         |

**Application Suggestions**:

- Input devices like mice and keyboards
- Low-bandwidth peripherals (printers, scanners, etc.)
- External devices supporting USB 2.0

### 4.3 HDMI Interface

The E24C features a standard HDMI 2.1 interface supporting up to 4K video output, suitable for connecting to external displays, TVs, and other devices.

| PIN | Name        | Description                                 |
| --- | ----------- | ------------------------------------------- |
| 1   | HDMI_TX2+   | HDMI High-Speed Data Lane 2+ (Positive)     |
| 2   | GND         | Ground                                      |
| 3   | HDMI_TX2-   | HDMI High-Speed Data Lane 2- (Negative)     |
| 4   | HDMI_TX1+   | HDMI High-Speed Data Lane 1+ (Positive)     |
| 5   | GND         | Ground                                      |
| 6   | HDMI_TX1-   | HDMI High-Speed Data Lane 1- (Negative)     |
| 7   | HDMI_TX0+   | HDMI High-Speed Data Lane 0+ (Positive)     |
| 8   | GND         | Ground                                      |
| 9   | HDMI_TX0-   | HDMI High-Speed Data Lane 0- (Negative)     |
| 10  | HDMI_TXC+   | HDMI Clock+ (Positive)                      |
| 11  | GND         | Ground                                      |
| 12  | HDMI_TXC-   | HDMI Clock- (Negative)                      |
| 13  | HDMI_CEC    | Consumer Electronics Control (CEC) Signal   |
| 14  | NC          | Not Connected                               |
| 15  | HDMI_SCL    | DDC Clock for EDID Information              |
| 16  | HDMI_SDA    | DDC Data for EDID Information               |
| 17  | GND         | Ground                                      |
| 18  | VCC5V0_HDMI | 5V Power Output                             |
| 19  | HDMI_HPD    | Hot Plug Detect Signal                      |

### 4.4 Gigabit Ethernet Interfaces

The E24C is equipped with 4 Gigabit Ethernet ports, which are core functional components supporting various networking application scenarios.

| PIN | Name    | Description                         |
| --- | ------- | ----------------------------------- |
| 1   | ETH_TXP | Gigabit Ethernet Transmit Data+     |
| 2   | ETH_TXN | Gigabit Ethernet Transmit Data-     |
| 3   | ETH_RXP | Gigabit Ethernet Receive Data+      |
| 4   | NC      | Not Connected                       |
| 5   | NC      | Not Connected                       |
| 6   | ETH_RXN | Gigabit Ethernet Receive Data-      |
| 7   | NC      | Not Connected                       |
| 8   | NC      | Not Connected                       |

#### Gigabit Network Controller

The Gigabit network interfaces on the E24C are driven by the integrated network controller in the Rockchip RK3528A processor's SoC, with key features including:

- **Full-Duplex Gigabit Ethernet**: Each port supports 10/100/1000 Mbps speeds
- **MDI/MDIX Auto-Detection**: Automatically detects straight-through and crossover cables
- **IEEE 802.3 Compliance**: Supports standard Ethernet protocols
- **Hardware Flow Control**: Implements IEEE 802.3x flow control
- **Internal MAC Addresses**: Each port is assigned a unique MAC address

#### Network Configuration Scenarios

The four Gigabit Ethernet ports allow for flexible configuration of various network topologies:

**1. Multi-WAN Router Configuration**

Multiple ports can be configured as WAN interfaces to implement:

- Multi-line load balancing
- Link aggregation
- Multi-ISP failover connections

**2. Network Hub Configuration**

All ports can be configured in switch mode for:

- Network segmentation (VLAN)
- QoS priority control
- Port mirroring and monitoring

**3. Combined Mode**

The most common configuration: 1 WAN + 3 LAN ports:

- 1 port connects to the upstream router/modem
- 3 ports for internal network device connections

#### Usage Recommendations

- Use CAT 5e or higher specification Ethernet cables to achieve full Gigabit performance
- Multi-WAN configurations require specialized routing software support, such as iStoreOS or OpenWrt
- When running high-traffic network applications, pay attention to heat dissipation issues

:::tip
For applications requiring high bandwidth and low latency (such as video conferencing, online gaming, etc.), it's recommended to use Link Aggregation to combine multiple WAN connections for higher bandwidth and reliability.

For applications requiring high availability (such as enterprise applications, critical business systems, etc.), it's recommended to use multi-ISP backup connections to ensure network reliability.

For applications requiring network isolation (such as production and testing environment isolation), it's recommended to use VLAN configuration to isolate different types of traffic in separate networks.
:::

### 4.5 M.2 M Key Interface

| PIN | Name          |
| --- | ------------- |
| 1   | GND           |
| 2   | VCC3V3_PCIE   |
| 3   | GND           |
| 4   | VCC3V3_PCIE   |
| 5   | GND           |
| 6   | NC            |
| 7   | GND           |
| 8   | NC            |
| 9   | GND           |
| 10  | NC            |
| 11  | GND           |
| 12  | NC            |
| 13  | GND           |
| 14  | NC            |
| 15  | GND           |
| 16  | NC            |
| 17  | GND           |
| 18  | NC            |
| 19  | GND           |
| 20  | NC            |
| 21  | GND           |
| 22  | NC            |
| 23  | GND           |
| 24  | NC            |
| 25  | GND           |
| 26  | NC            |
| 27  | GND           |
| 28  | NC            |
| 29  | GND           |
| 30  | NC            |
| 31  | GND           |
| 32  | NC            |
| 33  | GND           |
| 34  | NC            |
| 35  | GND           |
| 36  | NC            |
| 37  | GND           |
| 38  | NC            |
| 39  | VCC3V3_PCIE   |
| 40  | NC            |
| 41  | VCC3V3_PCIE   |
| 42  | NC            |
| 43  | GND           |
| 44  | NC            |
| 45  | NC            |
| 46  | NC            |
| 47  | GND           |
| 48  | NC            |
| 49  | GND           |
| 50  | PCIE_CLKREQ_N |
| 51  | GND           |
| 52  | PCIE_WAKE_N   |
| 53  | GND           |
| 54  | PCIE_REFCLK_P |
| 55  | PCIE_REFCLK_N |
| 56  | NC            |
| 57  | GND           |
| 58  | PCIE_RX_N     |
| 59  | PCIE_RX_P     |
| 60  | GND           |
| 61  | GND           |
| 62  | PCIE_TX_N     |
| 63  | PCIE_TX_P     |
| 64  | GND           |
| 65  | GND           |
| 66  | NC            |
| 67  | NC            |
| 68  | PCIE_RST_N    |
| 69  | GND           |
| 70  | NC            |
| 71  | GND           |
| 72  | NC            |
| 73  | GND           |
| 74  | NC            |
| 75  | GND           |

### 4.6 Fan Interface (2-Pin 1.25mm)

| PIN | Name |
| --- | ---- |
| 1   | PWM  |
| 2   | GND  |

### 4.7 RTC Battery Interface (2-Pin 1.25mm)

| PIN | Name       |
| --- | ---------- |
| 1   | VCC3V0_RTC |
| 2   | GND        |

### 4.8 14-Pin GPIO Interface (0.1"/2.54mm)

| PIN | Name   | Function              |
| --- | ------ | -------------------- |
| 1   | VCC5V0 | 5V Power Output     |
| 2   | VCC5V0 | 5V Power Output     |
| 3   | VCC3V3 | 3.3V Power Output   |
| 4   | GND    | Ground              |
| 5   | GPIO0  | SPI_Clock           |
| 6   | GPIO1  | SPI_MOSI            |
| 7   | GPIO2  | SPI_MISO            |
| 8   | GPIO3  | SPI Chip Select     |
| 9   | GPIO4  | UART_TX             |
| 10  | GPIO5  | UART_RX             |
| 11  | GPIO6  | I2C_Clock           |
| 12  | GPIO7  | I2C_Data            |
| 13  | GPIO8  | General Purpose GPIO|
| 14  | GND    | Ground              |
