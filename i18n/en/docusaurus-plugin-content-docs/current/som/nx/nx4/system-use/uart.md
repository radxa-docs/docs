---
sidebar_position: 4
---

import UART from '../../../../common/radxa-os/system-config-debian12/\_uart.mdx';

# Serial Login

## Prerequisites

Serial login is a core method for interacting with embedded boards via the UART serial interface. With a serial terminal tool, you can view system logs and interact with the command line.

:::danger
When using a USB-to-UART cable to debug the board, make sure the pins are connected correctly. Incorrect wiring may damage the hardware.

It is not recommended to connect the VCC wire (usually the red wire) of the USB-to-UART cable, to avoid damaging the board due to miswiring.
:::

Connect the USB-to-UART cable to the UART header on the Radxa NX4 Development Kit, and connect the other end to a USB port on your PC.

Note: Wire the cable according to the pinout provided by your USB-to-UART cable vendor. The diagram shows a common pinout as an example.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx4/nx4-uart.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Radxa NX4 Development Kit pin function       | Connection                                                                                                        |
| -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| Radxa NX4 Development Kit: GND (Pin6)        | Connect the GND pin on the Radxa NX4 Development Kit to the GND pin of the USB-to-UART cable (black Dupont wire). |
| Radxa NX4 Development Kit: UART0_TXD (Pin8)  | Connect UART0_TXD on the Radxa NX4 Development Kit to RXD on the USB-to-UART cable (white Dupont wire).           |
| Radxa NX4 Development Kit: UART0_RXD (Pin10) | Connect UART0_RXD on the Radxa NX4 Development Kit to TXD on the USB-to-UART cable (green Dupont wire).           |

## Serial login

:::tip Serial port parameters

Baud rate: 1500000

Data bits: 8

Stop bits: 1

Parity: none

Flow control: none
:::

<UART baud="1500000"/>
