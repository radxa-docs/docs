---
sidebar_position: 1
---

# Hardware Interface Overview

The Fogwise® AIRbox Q900 integrates a rich set of hardware interfaces to meet the connectivity requirements of various application scenarios such as Industrial IoT and edge computing.

![Fogwise® AIRbox Q900 Interfaces](/img/fogwise/airbox-q900/airbox-q900-interfaces.webp)

| No. | Interface           | No. | Interface                 | No. | Interface      |
| --- | ------------------- | --- | ------------------------- | --- | -------------- |
| 1   | 12V Power Input     | 7   | HDMI 2.0                  | 13  | M.2 M Key 2230 |
| 2   | USB 3.2 OTG Type-A  | 8   | Nano SIM Card Slot        | 14  | Power Button   |
| 3   | USB 3.2 HOST Type-A | 9   | 3x External Antennas      | 15  | EDL Button     |
| 4   | 2.5GbE RJ45 LAN     | 10  | RTC Battery Connector     | 16  | Fan Connector  |
| 5   | 2.5GbE RJ45 WAN     | 11  | Mini PCIe Slot            |     |                |
| 6   | Type-C Console Port | 12  | eMMC & UFS Connector (NC) |     |                |

## Power Interface

DC power input interface, featuring a standard DC jack with 2.5mm inner diameter and 5.5mm outer diameter, center-positive polarity. Supports power adapters of 12V/5.4A or higher. It is recommended to use the original or compatible power adapter to ensure stable operation of the device.

## Bottom USB Port

USB 3.2 Gen2 OTG interface with transfer speeds up to 10Gbps. Supports dual-mode operation (Host/Device) with software-configurable switching. In Emergency Download Mode (EDL), this port operates in device mode for system firmware flashing and recovery. Backward compatible with USB 2.0/1.1 devices.

## Top USB Port

Dedicated USB 3.2 Gen2 HOST interface with transfer speeds up to 10Gbps. Specifically designed for connecting various USB peripherals such as flash drives, external hard drives, keyboards, mice, and cameras. Operates exclusively in host mode, providing stable and reliable peripheral connectivity.

## Ethernet LAN

2.5G RJ45 Ethernet interface supporting auto-negotiation at 10M/100M/1000M/2500M speeds. Primarily used to connect PC devices or local network equipment to the AIRbox Q900. Features TSN (Time-Sensitive Networking) protocol support, making it ideal for latency-sensitive applications like industrial automation. Note: 2500M and 1000M speeds require manual loading of the appropriate device tree overlay to function.

## Ethernet WAN

2.5G RJ45 Ethernet interface supporting auto-negotiation at 10M/100M/1000M/2500M speeds. Primarily used to connect the AIRbox Q900 to the internet or external networks. Features TSN (Time-Sensitive Networking) protocol support, ensuring real-time and reliable network transmission. Note: 2500M and 1000M speeds require manual loading of the appropriate device tree overlay to function.

## Type-C Port

Serial debug console interface using USB Type-C physical connector. Connect to a PC using a USB Type-A to Type-C cable for system debugging and log viewing. Serial communication parameters: 115200 baud rate, 8 data bits, 1 stop bit, no parity. Ideal for development, system configuration, and troubleshooting.

## HDMI 2.0

Standard HDMI 2.0 Type-A interface supporting up to 4K@60fps (3840×2160@60Hz) resolution output. Features digital audio output and can connect to displays, TVs, projectors, and other visual output devices. Note: HDMI CEC (Consumer Electronics Control) is not supported.

## Nano SIM Card Slot

Nano SIM card slot with card dimensions of 12.3mm × 8.8mm. Supports hot-swapping and is conveniently located on the side of the device. Works in conjunction with 4G/5G communication modules installed in the Mini PCIe slot to provide mobile network connectivity. Supports multiple network standards including 2G/3G/4G/5G (specific supported standards depend on the installed communication module).

## External Antenna Ports

Three independent external antenna interfaces using SMA female connectors. Used to connect external antennas for Wi-Fi, Bluetooth, and cellular networks (4G/5G) to enhance wireless signal transmission and reception. Supports 2.4GHz/5GHz dual-band Wi-Fi antennas and mobile communication antennas. Avoid over-tightening the SMA connectors during installation.

## RTC Battery Connector

Real-Time Clock (RTC) battery connector using 2P XH 1.25mm interface specification. Used to connect a coin cell battery or equivalent battery pack (battery voltage: 3V) to maintain RTC operation during system power-off, ensuring accurate system timekeeping. Reference battery: [Radxa 2-Pin RTC Battery](../../../accessories/2p-rtc-bat.md).

## Mini PCIe Slot

Standard Mini PCIe expansion slot providing PCIe 4.0 x1 and USB 2.0 composite signal support. Suitable for installing wireless communication devices such as Wi-Fi/Bluetooth modules and 4G/5G mobile communication modules. Compatible with both half-height and full-height Mini PCIe modules, designed to work in conjunction with the Nano SIM card slot. Verify module compatibility before installation.

## eMMC & UFS Module Connector (NC)

Board-to-board storage module connector supporting Radxa eMMC and UFS flash memory modules. Primarily used for storage expansion and system debugging during the development and testing phases. This connector is not populated in mass production units and is only available on engineering samples.

## M.2 M Key

M.2 M Key 2230 NVMe SSD slot with dimensions of 22mm × 30mm. Features PCIe Gen4 x4 high-speed interface with theoretical bandwidth up to 64Gbps, supporting high-performance NVMe solid-state drives. Enables users to quickly expand storage capacity.

## Power Button

System power control button located on the side of the device. A short press initiates a soft shutdown, safely powering off the system after closing all services. Important: This button only functions for power-off operations and cannot power on the system. After shutdown, the DC power adapter must be disconnected and reconnected to restart the device.

## EDL Button

Emergency Download Mode (EDL) activation button. Used to enter the Qualcomm processor's EDL mode, primarily for system firmware flashing and recovery operations. Operation method: Press and hold the EDL button while powering on the device to enter EDL mode, allowing firmware downloads and system recovery operations via the USB 3.2 OTG interface.

## Fan Connector

Active cooling fan connection interface using a 2P XH 1.25mm connector. Features PWM (Pulse Width Modulation) speed control, intelligently adjusting fan speed based on system temperature for efficient cooling and quiet operation. Works in conjunction with the aluminum alloy heat dissipation enclosure to provide excellent thermal management. The fan operates at 12V DC.
