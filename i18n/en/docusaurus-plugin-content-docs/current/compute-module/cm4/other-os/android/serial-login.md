---
sidebar_position: 4
---

import UART_DEBUG from '../../../../common/other-system/android/\_uart_debug.mdx';

# Serial Login

Serial login is a core method for interacting with the board through serial communication interface (UART) in embedded development. Through serial tools, you can view system output logs and perform command line interactions.

:::danger
When using USB serial data cable for serial login with CM4, please ensure the pin connections are correct. Incorrect pin connections may cause hardware damage to the board.

It is not recommended to connect the VCC interface (red wire) of the USB serial data cable to avoid damage to the board caused by incorrect connections.
:::

Connect the USB serial data cable to the UART0 interface of ROCK 4D, and connect the other end to the PC's USB port.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cm4/cm4_uart.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| CM4 IO Board Pin Function         | Connection Method                                                                         |
| --------------------------------- | ----------------------------------------------------------------------------------------- |
| CM4 IO Board : GND（Pin6）        | CM4 IO Board GND pin connected to USB serial data cable GND pin (black DuPont wire)       |
| CM4 IO Board : UART0_TXD（Pin8）  | CM4 IO Board UART0_TXD pin connected to USB serial data cable RXD pin (white DuPont wire) |
| CM4 IO Board : UART0_RXD（Pin10） | CM4 IO Board UART0_RXD pin connected to USB serial data cable TXD pin (green DuPont wire) |

## Serial Login

:::info
Serial communication parameters

- Baud rate: 1500000
- Data bits: 8
- Stop bits: 1
- Parity: None
- Flow control: None
  :::

<UART_DEBUG baud="1500000"/>
