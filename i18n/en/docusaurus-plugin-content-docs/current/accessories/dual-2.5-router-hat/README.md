---
sidebar_position: 1
---

# Radxa Dual 2.5G Router HAT

![Radxa Dual 2.5G Router HAT](/img/accessories/dual-2.5-router-hat/dual-2.5-router-hat-01.webp)

## Overview

The Radxa Dual 2.5G Router HAT is designed specifically for the ROCK series and Raspberry Pi 5. This HAT delivers exceptional network and storage performance through the PCIe interface with the following key capabilities:

- High-speed networking with two 2.5G Ethernet ports for stable connections
- Storage expansion via M.2 M Key interface supporting NVMe SSDs
- Additional PCIe expansion through an FPC connector

This HAT is ideal for both networking applications and high-performance storage solutions, significantly enhancing the capabilities of your single-board computer.

## Compatible SBCs

The Radxa Dual 2.5G Router HAT currently supports:

- ROCK 2A / 2F
- ROCK 4D
- ROCK 5C
- Raspberry Pi 5

## Features

- 2x 2.5G Ethernet Ports for high-speed networking
- 1x M.2 M Key Connector with PCIe 3.0/2.0 1-lane for NVMe SSD storage
- 1x FPC Connector with PCIe 3.0/2.0 1-lane for additional expansion
- 1x 12V DC (5525) Jack for power input

![Radxa Dual 2.5G Router HAT](/img/accessories/dual-2.5-router-hat/dual-2.5-router-hat-02.webp)

## Technical Specifications

| Component           | Specification                   |
| ------------------- | ------------------------------- |
| Ethernet Controller | Realtek RTL8125B                |
| Ethernet Speed      | 2 × 2.5 Gigabit                 |
| PCIe Interface      | PCIe 3.0/2.0 1-lane             |
| Storage Support     | M.2 M Key 2280 NVMe SSD         |
| Power Input         | 12V DC via 5525 jack            |
| Dimensions          | Compatible with HAT form factor |

## Package Contents

- 1× Radxa Dual 2.5G Router HAT
- 4× Copper standoffs (for mounting)
- 8× Screws (for securing the HAT and SSD)
- 1× Heatsink (for cooling the Ethernet controller)
- 1× Adapter board (for connecting to compatible SBCs)
- 1× Connection cable

## Board Layout

![Radxa Dual 2.5G Router HAT Board](/img/accessories/dual-2.5-router-hat/AC016-en.webp)

## 40PIN Pinout

| Description | Function | Pin# | Pin# | Function | Description                                 |
| ----------- | -------- | ---- | ---- | -------- | ------------------------------------------- |
| Not Used    |          | 1    | 2    | VCC      | 5V                                          |
| Not Used    |          | 3    | 4    | VCC      | 5V                                          |
| Not Used    |          | 5    | 6    | GND      | Ground                                      |
| Not Used    |          | 7    | 8    | Not Used |                                             |
| Ground      | GND      | 9    | 10   | Not Used |                                             |
| Not Used    |          | 11   | 12   | Not Used |                                             |
| Not Used    |          | 13   | 14   | GND      | Ground                                      |
| Not Used    |          | 15   | 16   | GPIO     | FPC POWER (Controls power to FPC connector) |
| Not Used    |          | 17   | 18   | Not Used |                                             |
| Not Used    |          | 19   | 20   | GND      | Ground                                      |
| Not Used    |          | 21   | 22   | Not Used |                                             |
| Not Used    |          | 23   | 24   | Not Used |                                             |
| Ground      | GND      | 25   | 26   | Not Used |                                             |
| EEPROM I2C  | I2C_SDA  | 27   | 28   | I2C_SCL  | EEPROM I2C                                  |
| Not Used    |          | 29   | 30   | GND      | Ground                                      |
| Not Used    |          | 31   | 32   | Not Used |                                             |
| Not Used    |          | 33   | 34   | GND      | Ground                                      |
| Not Used    |          | 35   | 36   | Not Used |                                             |
| Not Used    |          | 37   | 38   | Not Used |                                             |
| Ground      | GND      | 39   | 40   | Not Used |                                             |

## Installation Guide

### Installing on ROCK Series Boards

1. Power off your SBC completely
2. Attach the copper standoffs to your SBC
3. Connect the adapter board to your SBC's PCIe connector
4. Align the Dual 2.5G Router HAT with the 40-pin header and standoffs
5. Secure the HAT using the provided screws
6. If using an NVMe SSD, install it into the M.2 slot and secure with screws
7. Connect the 12V power supply to the DC jack
8. Power on your SBC

### Installing on Raspberry Pi 5

1. Power off your Raspberry Pi 5 completely
2. Connect the adapter board to the PCIe connector on the Raspberry Pi 5
3. Align the Dual 2.5G Router HAT with the 40-pin header
4. Secure the HAT using the provided standoffs and screws
5. If using an NVMe SSD, install it into the M.2 slot and secure with screws
6. Connect the 12V power supply to the DC jack
7. Power on your Raspberry Pi 5

## Software Configuration

### Network Setup

The Ethernet ports will typically appear as additional network interfaces (e.g., eth1 and eth2). You can configure them using standard Linux networking tools.

Basic configuration example:

```bash
# Check available interfaces
ip addr

# Configure static IP for eth1
sudo ip addr add 192.168.1.100/24 dev eth1
sudo ip link set eth1 up

# Configure DHCP for eth2
sudo dhclient eth2
```

### NVMe SSD Setup

After installing an NVMe SSD, you can format and mount it using standard Linux commands:

```bash
# Check if the SSD is detected
lsblk

# Format the SSD (replace nvme0n1 with your device name)
sudo mkfs.ext4 /dev/nvme0n1

# Mount the SSD
sudo mkdir -p /mnt/ssd
sudo mount /dev/nvme0n1 /mnt/ssd
```

## Troubleshooting

### Common Issues

1. **Ethernet ports not detected**

   - Ensure the HAT is properly connected to the PCIe interface
   - Check if the 12V power supply is connected and working
   - Verify kernel support for the RTL8125B controller

2. **NVMe SSD not detected**

   - Ensure the SSD is properly seated in the M.2 slot
   - Try a different SSD to rule out hardware compatibility issues
   - Check kernel logs for PCIe-related errors: `dmesg | grep -i pcie`

3. **Poor network performance**
   - Update to the latest OS and kernel version
   - Check network cables (use Cat5e or better for 2.5G speeds)
   - Ensure the connected network equipment supports 2.5G speeds

## Applications

The Radxa Dual 2.5G Router HAT is ideal for:

- Building a high-performance router or firewall
- Network-attached storage (NAS) with fast networking
- Edge computing with high-speed data transfer requirements
- Home lab servers requiring multiple network interfaces
- Media streaming servers with fast storage and networking
