---
sidebar_position: 4
---

import UART_DEBUG from '../../../../common/other-system/android/\_uart_debug.mdx';

# Serial Login

## Prerequisites

Serial login is a core method for interacting with the board via serial communication interface (UART) in embedded development. Through serial tools, you can view system logs and perform command-line interactions.

:::danger
When using a USB serial data cable to connect to the board for serial debugging, please ensure the pin connections are correct. Connecting pins incorrectly may cause hardware damage to the board.

Do not connect the USB serial data cable's VCC interface (red wire). Connecting it incorrectly may damage the board.
:::

Connect the USB serial data cable to the UART2 interface on the Radxa NX5 Development Kit, and the other end to the PC's USB port.

Note: Please follow the USB serial cable manufacturer's pin definitions for connection. The diagram shows common USB serial cable pin definitions.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-uart.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Radxa NX5 Development Kit | Connection Method                                                                                                     |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| GND (Pin 6)               | Connect the GND pin of the Radxa NX5 Development Kit to the GND pin of the USB serial cable (black Dupont wire)       |
| UART2_TXD (Pin 8)         | Connect the UART2_TXD pin of the Radxa NX5 Development Kit to the RXD pin of the USB serial cable (white Dupont wire) |
| UART2_RXD (Pin 10)        | Connect the UART2_RXD pin of the Radxa NX5 Development Kit to the TXD pin of the USB serial cable (green Dupont wire) |

## Serial Login

:::tip Serial Communication Parameters

Baud Rate: 1500000

Data Bits: 8

Stop Bits: 1

Parity: None

Flow Control: None
:::

<UART_DEBUG baud="1500000"/>
