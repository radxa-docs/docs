---
sidebar_position: 2
---

import UART_DEBUG from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# UART Debug

UART debugging is a core method in embedded development for interacting with the motherboard through a serial communication interface (UART). It allows you to view system output and perform debugging using serial port tools.

## Hardware Connection

① : Power on the motherboard using a power adapter

② : Connect the motherboard's Debug port to your computer's USB port using a USB Type-C cable

<div style={{textAlign: 'center'}}>
  <img src="/en/img/e/e24c/uart-debug.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip Maskrom Mode
If the motherboard enters Maskrom mode and you connect the Debug port to your computer's USB port using a USB Type-C cable, the system will show two devices, similar to the following information:

```text
Bus 001 Device 014: ID 1a86:7523 QinHeng Electronics CH340 serial converter
Bus 001 Device 015: ID 2207:350c Fuzhou Rockchip Electronics Company
```

Where `Bus 001 Device 014` is the CH340 serial debug device, and `Bus 001 Device 015` is the motherboard's Maskrom mode device.

:::

## Serial Port Login

:::tip Serial Communication Parameters

Baud Rate: 1500000

Data Bits: 8

Stop Bits: 1

Parity: None

Flow Control: None
:::

<UART_DEBUG baud="1500000"/>
