---
sidebar_position: 3
---

import UART_DEBUG from '../../../../common/radxa-os/system-config/\_uart_debug.mdx';

# UART Login

UART is an essential interface for embedded development that lets you monitor system logs and interact with the board through a serial console.

## Hardware Connections

:::danger
Double-check the wiring when using a USB-to-serial cable with the Cubie A7Z—incorrect pin connections can damage the board.

Do not connect the VCC lead from the cable to the board to avoid over-voltage issues.
:::

For communication between the PC and the board, you can use either a USB-to-TTL module or a USB-to-serial cable—pick whichever is more convenient.

1. **USB-to-serial cable**: Connect the Dupont wires to the board header and plug the USB end into the PC.

2. **USB-to-TTL module**: Use Dupont wires between the module and the board, then plug the module’s USB port into the PC.

> The illustration below shows the typical pin layout for these cables/modules. Always follow the documentation provided with your specific hardware.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7z/a7z-uart-debug.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Cubie A7Z Pin Function | Connection | USB-TTL / USB-Serial Pin |
| ---------------------- | ---------- | ------------------------ |
| GND (Pin 6)            | Dupont     | GND                      |
| UART0_TX (Pin 8)       | Dupont     | RXD                      |
| UART0_RX (Pin 10)      | Dupont     | TXD                      |

## Serial Login

:::tip Serial parameters

Baud rate: 115200

Data bits: 8

Stop bits: 1

Parity: None

Flow control: None
:::

<UART_DEBUG baud="115200"/>
