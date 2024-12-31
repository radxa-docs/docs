---
sidebar_position: 1
---

# Preparation

## Required Cables

** Radxa ROCK S0 must be configured with a specialized cable in order to be used. **

### Wire Signal Definition

#### USB OTG / HOST Signal Definition

| color | signal |
| ----- | ------ |
| red   | 5V     |
| white | USB_DM |
| green | USB_DP |
| black | GND    |

#### 100Mbps Ethernet Signal Definition

| color | signal |
| ----- | ------ |
| red   | RXN    |
| green | RXP    |
| white | TXN    |
| black | TXP    |

![rocks0 sequence](/img/rockpi/s0/rock-s0-signal-sequence.webp)

### USB OTG Cable

The Radxa 4P to USB-A Male Cable is a 4-Pin MX1.25mm to Male USB cable that can be connected to a 5V adapter to power the ROCK S0 or directly to a host computer for communication.

![rocks0 otg](/img/rockpi/s0/rocks0-otg-wire.webp)

### USB HOST Cable

The Radxa 4P to USB-A Female Cable is a 4-Pin MX1.25mm to female USB cable that provides the ROCK S0 with an interface to USB devices.

![rocks0 usb](/img/rockpi/s0/rocks0-usb-wire.webp)

### 100Mbps Ethernet Cable

The Radxa 4P to Ethernet Adapter Cable is a 4-Pin MX1.25mm to Ethernet adapter cable that provides access to a 100Mbps Ethernet network for the ROCK S0.

![rocks0 eth](/img/rockpi/s0/rocks0-eth-wire.webp)

## Development preparation

### Power supply

The Radxa ROCK S0's power supply connector is a 4-Pin USB2.0 OTG connector, which can be used with [USB OTG Cable](/rockpi/rocks0/getting-started/preparation#usb-host-cable), **supports 5V input only**.

### Boot Media

microSD card, capacity not less than 8GB, for system boot disk

### microSD card reader

Used to create system boot disk

### Network connection

The ROCK S0 has an on-board Wi-Fi module. The network can be accessed via Wi-Fi and a 4-Pin 100Mbps Ethernet connector.The 4-Pin 100Mbps Ethernet connector requires an [100Mbps Ethernet Cable](/rockpi/rocks0/getting-started/preparation#100mbps-ethernet-cable).

### Serial Debugging

Please refer to [Serial Debugging Documentation](../low-level-dev/serial).

## Antenna Switch

Please refer to [Antenna Switch Documentation](antenna-switch)

## FAQ

## Notes

## Accessories
