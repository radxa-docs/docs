---
sidebar_position: 1
---

import UART_DEBUG from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# Serial Debugging

Serial debugging is a fundamental method for interacting with the Cubie A7A board through a UART (Universal Asynchronous Receiver/Transmitter) interface. It allows you to view system output and perform debugging using serial communication tools.

## Hardware Connection

:::danger
When using a USB-to-TTL serial adapter with the Cubie A7A for serial debugging, ensure the pins are connected correctly. Incorrect connections may damage the board hardware.

It is not recommended to connect the VCC pin of the USB-to-TTL adapter, as this could potentially damage the board if connected incorrectly.
:::

Connect the USB-to-TTL serial adapter to the Cubie A7A's UART0 interface, with the other end connected to your PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-uart.webp" alt="Cubie A7A UART Connection Diagram" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Cubie A7A Pin Function        | Connection Method                        |
| ----------------------------- | ---------------------------------------- |
| Cubie A7A: GND (Pin 6)        | Connect to GND pin of USB-to-TTL adapter |
| Cubie A7A: UART0_TXD (Pin 8)  | Connect to RXD pin of USB-to-TTL adapter |
| Cubie A7A: UART0_RXD (Pin 10) | Connect to TXD pin of USB-to-TTL adapter |

## Serial Login

:::info
Serial Communication Parameters

- Baud Rate: 115200
- Data Bits: 8
- Stop Bits: 1
- Parity: None
- Flow Control: None
  :::

<UART_DEBUG baud="115200"/>
