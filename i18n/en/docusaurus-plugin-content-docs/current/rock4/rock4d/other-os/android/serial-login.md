---
sidebar_position: 4
---

import UART_DEBUG from '../../../../common/other-system/android/\_uart_debug.mdx';

# Serial Login

Serial login is a fundamental method for interacting with the ROCK 4D board through a UART (Universal Asynchronous Receiver/Transmitter) interface. It allows you to view system logs and access the command line interface.

:::danger
When using a USB-to-TTL serial adapter with ROCK 4D, ensure correct pin connections to prevent hardware damage.

Do NOT connect the VCC (red wire) of the USB-to-TTL adapter to avoid potential damage to the board.
:::

Connect the USB-to-TTL adapter to the ROCK 4D's UART0 interface, and the other end to your PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/serial-connect.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

| No. | Pin Function              | Connection                    |
| --- | ------------------------- | ----------------------------- |
| ①   | ROCK 4D: GND (Pin6)       | Connect to GND pin of USB-TTL |
| ②   | ROCK 4D: UART0_TX (Pin8)  | Connect to RX pin of USB-TTL  |
| ③   | ROCK 4D: UART0_RX (Pin10) | Connect to TX pin of USB-TTL  |
| ④   | USB-TTL: GND (Black wire) | Connect to ROCK 4D GND        |
| ⑤   | USB-TTL: RX (White wire)  | Connect to ROCK 4D UART0_TX   |
| ⑥   | USB-TTL: TX (Green wire)  | Connect to ROCK 4D UART0_RX   |
| ⑦   | USB-TTL: VCC (Red wire)   | Do not connect                |

## Serial Access

:::info
Serial Communication Parameters

- Baud Rate: 1500000
- Data Bits: 8
- Stop Bits: 1
- Parity: None
- Flow Control: None
  :::

<UART_DEBUG baud="1500000"/>
