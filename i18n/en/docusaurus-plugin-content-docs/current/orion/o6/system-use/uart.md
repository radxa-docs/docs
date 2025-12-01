---
sidebar_position: 1
---

import UART from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# UART Login

UART login is a core method in embedded development for interacting with the motherboard through a serial communication interface (UART). Using a UART tool, you can view system logs and perform command-line interactions.

## Hardware Connection

:::danger
When using a USB-to-UART cable for UART login with Radxa Orion O6, ensure the pins are connected correctly. Incorrect connections may damage the motherboard hardware.

It is not recommended to connect the VCC interface (red wire) of the USB-to-UART cable to avoid potential motherboard damage from incorrect connections.
:::

Connect the USB-to-UART cable to the UART interface of the O6 and the other end to a USB port on your PC.

Note: Please connect according to the pin definition of your USB-to-UART cable. The image below shows a common USB-to-UART cable pin definition.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/orion/o6/orion-o6-serial.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| O6 Pin Function | Connection Method                                                  |
| --------------- | ------------------------------------------------------------------ |
| O6 : GND        | Connect O6's GND pin to the GND pin of the USB-to-UART cable       |
| O6 : UART2_TXD  | Connect O6's UART2_TXD pin to the RXD pin of the USB-to-UART cable |
| O6 : UART2_RXD  | Connect O6's UART2_RXD pin to the TXD pin of the USB-to-UART cable |

## UART Login

:::info
UART Communication Parameters

- Baud Rate: 115200
- Data Bits: 8
- Stop Bits: 1
- Parity: None
- Flow Control: None
  :::

<UART baud="115200"/>
