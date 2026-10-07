---
sidebar_position: 1
---

import UART_DEBUG from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# Serial Port Login

Serial login is a core method for interacting with the board through a serial communication interface (UART) in embedded development. A serial tool lets you view system logs and interact with the command line.

## Hardware Connection

:::danger
When using a USB-to-serial cable for serial login on Dragon Q8B, make sure the pins are connected correctly. Incorrect pin connections may damage the board hardware.

Do not connect the VCC wire (red wire) of the USB-to-serial cable, to avoid board damage caused by incorrect wiring.
:::

Connect the USB-to-serial cable to the Dragon Q8B UART0 interface, and connect the other end to a PC USB port.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/dragon/q8b/q8b_serial_debug.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Dragon Q8B Pin Function        | Connection                                                             |
| ------------------------------ | ---------------------------------------------------------------------- |
| Dragon Q8B : GND (Pin 6)       | Connect the Dragon Q8B GND pin to the USB-to-serial cable GND pin      |
| Dragon Q8B : UART_TXD (Pin 8)  | Connect the Dragon Q8B UART_TXD pin to the USB-to-serial cable RXD pin |
| Dragon Q8B : UART_RXD (Pin 10) | Connect the Dragon Q8B UART_RXD pin to the USB-to-serial cable TXD pin |

## Serial Port Login

:::info
Serial communication parameters

- Baud rate: 115200
- Data bits: 8
- Stop bits: 1
- Parity: none
- Flow control: none
  :::

:::warning Garbled serial output / board appears not to boot
Some serial terminal applications (for example Tabby) can drop serial data when the device redraws its output frequently, such as a boot menu that keeps redrawing itself, or `apt` / `dpkg` style progress output that rewrites the same line or repositions the cursor. The boot log then shows many half-finished lines and repeated messages, the login prompt never appears, and the board looks like it failed to boot or hung — even though the system actually booted normally.

This is a display issue in the terminal application, not a board fault. If you hit it, use a serial terminal that has been verified to render the same output correctly, such as `picocom`:

```bash
picocom -b 115200 /dev/ttyUSB0
```

Press `Ctrl+A` `Ctrl+X` to exit `picocom`.
:::

<UART_DEBUG baud="115200"/>
