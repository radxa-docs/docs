---
sidebar_position: 1
---

# Hardware Interface Description

## Interface Overview

![](/img/aicore-sg2300x/mark_aicore_sg2300x.webp)

## network card

The core board has two NICs, eth0 is DHCP by default, eth1 is set to static IP by default: 192.168.150.1.

## 144pin BTB connector

The Radxa AICore SG2300X provides 3 groups of UARTs on the 144pin BTB interface, of which UART0 has been used as the console port for bootloader and Linux;

1 group of I2C masters, corresponding to the device node /dev/i2c-2;

1 PWM output pin, corresponding to PWM0;

1 fan speed input pin.
