---
sidebar_position: 1
---

import UART_DEBUG from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# Serial Port Login

Serial port login is a fundamental method for interacting with the motherboard through a UART (Universal Asynchronous Receiver/Transmitter) interface in embedded development. It allows you to view system logs and perform command-line interactions.

## Hardware Connection

:::danger
When using a USB-to-serial cable with the Dragon Q6A for serial port login, ensure the pins are connected correctly. Incorrect connections may damage the motherboard hardware.

It is not recommended to connect the VCC (red wire) of the USB-to-serial cable to prevent potential damage from incorrect connections.
:::

Connect the USB-to-serial cable to the UART0 interface of the Dragon Q6A, and connect the other end to a USB port on your PC.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/dragon/q6a/q6a_serial_debug.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Dragon Q6A Pin Function        | Connection Method                             |
| ------------------------------ | --------------------------------------------- |
| Dragon Q6A: GND (Pin 6)        | Connect to GND pin of the USB-to-serial cable |
| Dragon Q6A: UART0_TXD (Pin 8)  | Connect to RXD pin of the USB-to-serial cable |
| Dragon Q6A: UART0_RXD (Pin 10) | Connect to TXD pin of the USB-to-serial cable |

## Serial Port Login

:::info
Serial Communication Parameters

- Baud Rate: 115200
- Data Bits: 8
- Stop Bits: 1
- Parity: None
- Flow Control: None
  :::

<UART_DEBUG baud="115200"/>
