---
sidebar_position: 3
---

import UART_DEBUG from '../../../../common/radxa-os/system-config/\_uart_debug.mdx';

# Serial Port Login

Serial port login is a fundamental method in embedded development for interacting with the board through a UART (Universal Asynchronous Receiver/Transmitter) interface. It allows you to view system output and perform debugging using serial communication tools.

## Hardware Connection

:::danger
When using a USB-to-serial cable with the Radxa Cubie A5E for serial port login, ensure correct pin connections. Incorrect connections may damage the board hardware.

It is not recommended to connect the VCC pin of the USB-to-serial cable to avoid potential damage to the board.
:::

For serial communication between your PC and the board, you can use either a USB-to-TTL module or a USB-to-serial cable. Choose one of the following connection methods:

A -> USB-to-Serial Cable: Connect the Dupont wire end to the board and the USB end to your PC.

B -> USB-to-TTL Module: Use Dupont wires to connect the USB-to-TTL module to the board, then connect the USB end to your PC.

**Note: The diagram illustrates common pin configurations for USB-to-serial cables or USB-to-TTL modules. Always refer to the actual module or manufacturer's manual for specific pin configurations.**

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a5e/a5e_debug.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Cubie A5E Pin Function | Connection Method | USB-to-TTL Module / USB-to-Serial Cable Pins |
| ---------------------- | ----------------- | -------------------------------------------- |
| GND (Pin6)             | Dupont Wire       | GND                                          |
| UART0_TX (Pin8)        | Dupont Wire       | RXD                                          |
| UART0_RX (Pin10)       | Dupont Wire       | TXD                                          |

## Serial Port Login

:::tip Serial Communication Parameters

Baud Rate: 115200

Data Bits: 8

Stop Bits: 1

Parity: None

Flow Control: None
:::

<UART_DEBUG baud="115200"/>
