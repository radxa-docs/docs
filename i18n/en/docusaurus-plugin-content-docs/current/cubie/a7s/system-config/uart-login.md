---
sidebar_position: 4
---

import UART_DEBUG from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# Serial login (UART)

Serial login is a common way to interact with the board over UART. It lets you view boot logs and debug the system using a serial terminal.

## Hardware connection

:::danger
When using a USB‑to‑serial cable with Cubie A7S, make sure the pins are connected correctly. Incorrect wiring may damage the hardware.

Do not connect the VCC wire of the USB‑to‑serial cable to avoid accidental damage.
:::

To connect your PC and the board for serial communication, use either a USB‑to‑TTL module or a USB‑to‑serial cable.

**Option A** -> USB‑to‑serial cable: connect the Dupont wires to the board and the USB end to the PC.

**Option B** -> USB‑to‑TTL module: use Dupont wires to connect the module to the board, then connect the USB end to the PC.

**Note:** The pinout shown is for common USB‑to‑serial cables/modules. Refer to your specific module’s documentation if it differs.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7s/a7s-uart-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Cubie A7S pin     | Connection  | USB‑to‑TTL module / USB‑to‑serial pin |
| ----------------- | ----------- | ------------------------------------- |
| GND (Pin 6)       | Dupont wire | GND                                   |
| UART0_TX (Pin 8)  | Dupont wire | RXD                                   |
| UART0_RX (Pin 10) | Dupont wire | TXD                                   |

## Serial console

:::info
Serial parameters

- Baud rate: 115200
- Data bits: 8
- Stop bits: 1
- Parity: none
- Flow control: none
  :::

<UART_DEBUG baud="115200"/>
