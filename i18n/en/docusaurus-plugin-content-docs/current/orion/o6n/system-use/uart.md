---
sidebar_position: 1
---

import UART from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# UART Login

UART login is a fundamental method in embedded development for interacting with the motherboard through a UART interface. It allows you to view system logs and perform command-line interactions.

## Hardware Connection

:::danger
When using a USB-to-TTL serial cable with the Radxa Orion O6N, ensure the pins are connected correctly. Incorrect connections may damage the motherboard hardware.

It is not recommended to connect the VCC pin (red wire) of the USB-to-TTL cable to avoid potential damage to the motherboard.
:::

Connect the USB-to-TTL serial cable to the UART interface of the O6N and the other end to a USB port on your PC.

Note: Please refer to the pinout of your specific USB-to-TTL cable. The following image shows a common USB-to-TTL cable pinout.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/orion/o6n/orion-o6n-serial.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| O6N Pin Function       | Connection Method                      |
| ---------------------- | -------------------------------------- |
| O6N: GND (Pin 6)       | Connect to GND pin of USB-to-TTL cable |
| O6N: UART_TXD (Pin 8)  | Connect to RXD pin of USB-to-TTL cable |
| O6N: UART_RXD (Pin 10) | Connect to TXD pin of USB-to-TTL cable |

## Serial Port Login

:::info
Serial Communication Parameters:

- Baud Rate: 115200
- Data Bits: 8
- Stop Bits: 1
- Parity: None
- Flow Control: None
  :::

<UART baud="115200"/>
