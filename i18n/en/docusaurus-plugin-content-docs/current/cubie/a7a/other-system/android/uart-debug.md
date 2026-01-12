---
sidebar_position: 3
---

import UART_DEBUG from '../../../../common/radxa-os/system-config/\_uart_debug.mdx';

# UART Debugging

UART debugging is a core method for interacting with the motherboard through a serial communication interface (UART) in embedded development. It allows you to view system output and perform debugging using serial port tools.

## Hardware Connection

:::danger
When using a USB-to-TTL serial cable for UART debugging with Cubie A7A, ensure the pin connections are correct. Incorrect connections may damage the motherboard hardware.

It is not recommended to connect the VCC pin of the USB-to-TTL serial cable to avoid potential damage to the motherboard.
:::

Connect the USB-to-TTL serial cable to the UART0 interface of Cubie A7A, and connect the other end to a USB port on your PC.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-uart.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Cubie A7A Pin Function        | Connection Method                             |
| ----------------------------- | --------------------------------------------- |
| Cubie A7A: GND (Pin 6)        | Connect to GND pin of USB-to-TTL serial cable |
| Cubie A7A: UART0_TXD (Pin 8)  | Connect to RXD pin of USB-to-TTL serial cable |
| Cubie A7A: UART0_RXD (Pin 10) | Connect to TXD pin of USB-to-TTL serial cable |

## Serial Port Login

:::tip Serial Communication Parameters

Baud Rate: 115200

Data Bits: 8

Stop Bits: 1

Parity: None

Flow Control: None
:::

<UART_DEBUG baud="115200"/>
