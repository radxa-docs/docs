---
sidebar_position: 4
---

import UART from '../../../../common/radxa-os/system-config-debian12/\_uart.mdx';

# Serial Console Debugging

## Prerequisites

To perform serial debugging, you need to connect the board's UART0 interface to your PC's USB port using a USB-to-TTL serial cable.

:::danger
When using a USB-to-TTL serial cable for debugging, ensure the pins are connected correctly. Incorrect connections may damage the board hardware.

It is not recommended to connect the VCC pin (red wire) of the USB-to-TTL serial cable to avoid potential damage to the board.
:::

<div style={{textAlign: 'center'}}>
   <img src="/en/img/cm4/cm4_uart.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Radxa CM4 IO Board Pin Functions      | Connection Method                                   |
| ------------------------------------- | --------------------------------------------------- |
| Radxa CM4 IO Board: GND (Pin6)        | Connect to GND pin (black wire) of USB-to-TTL cable |
| Radxa CM4 IO Board: UART0_TXD (Pin8)  | Connect to RXD pin (white wire) of USB-to-TTL cable |
| Radxa CM4 IO Board: UART0_RXD (Pin10) | Connect to TXD pin (green wire) of USB-to-TTL cable |

## Serial Login

:::tip Serial Communication Parameters

Baud Rate: 1500000

Data Bits: 8

Stop Bits: 1

Parity: None

Flow Control: None
:::

<UART baud="1500000"/>
