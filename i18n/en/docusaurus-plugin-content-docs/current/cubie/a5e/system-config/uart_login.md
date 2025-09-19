---
sidebar_position: 4
---

import UART_DEBUG from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# UART Login

UART login is a core method in embedded development for interacting with the board through a serial communication interface (UART). Using UART tools, you can view system output and perform debugging.

## Hardware Connection

:::danger
When using a USB-to-serial cable to connect to the Cubie A5E for UART login, ensure the pins are connected correctly. Incorrect connections may damage the board hardware.

It is not recommended to connect the VCC interface of the USB-to-serial cable to avoid potential board damage from incorrect connections.
:::

For serial communication between your PC and the board, you can use either a USB-to-TTL module or a USB-to-serial cable. Choose one of the following connection methods:

**Method A** -> USB-to-Serial Cable: Connect the DuPont wire end to the board and the USB end to your PC.

**Method B** -> USB-to-TTL Module: Use DuPont wires to connect the USB-to-TTL module to the board, then connect the USB end to your PC.

**Note: The diagram shows common pin configurations for USB-to-serial cables or USB-to-TTL modules. Always refer to the actual module or manufacturer's manual for specific pin configurations.**

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a5e/a5e_debug.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Cubie A5E Pin Function | Connection Method | USB-to-TTL Module / USB-to-Serial Cable Pin |
| ---------------------- | ----------------- | ------------------------------------------- |
| GND (Pin6)             | DuPont Wire       | GND                                         |
| UART0_TX (Pin8)        | DuPont Wire       | RXD                                         |
| UART0_RX (Pin10)       | DuPont Wire       | TXD                                         |

## UART Login

:::info
UART Communication Parameters

- Baud Rate: 115200
- Data Bits: 8
- Stop Bits: 1
- Parity: None
- Flow Control: None
  :::

<UART_DEBUG baud="115200"/>
