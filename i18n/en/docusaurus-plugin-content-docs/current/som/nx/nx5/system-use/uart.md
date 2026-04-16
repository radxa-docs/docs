---
sidebar_position: 4
---

import UART from '../../../../common/radxa-os/system-config-debian12/\_uart.mdx';

# Serial Login

## Prerequisites

Serial login is a core method for embedded development to interact with the board through serial communication interfaces (UART). Through serial tools, you can view system logs and perform command-line interactions.

:::danger
When using a USB serial data cable for serial debugging with the board, ensure the pin connections are correct. Incorrect pin connections may cause damage to the board hardware.

It is not recommended to connect the VCC interface (red wire) of the USB serial data cable to avoid damage caused by incorrect connection.

:::

Connect the USB serial data cable to the UART2 interface of the Radxa NX5 Development Kit, and the other end to the PC's USB port.

Note: Please make connections according to the USB serial cable pin definitions provided by the manufacturer. The example in the diagram shows common USB serial cable pin definitions.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/nx5/radxa-nx5-uart.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Radxa NX5 Development Kit | Connection Method                                                                                                     |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| GND (Pin6)                | Connect the GND pin of the Radxa NX5 Development Kit to the GND pin of the USB serial cable (black Dupont wire)       |
| UART2_TXD (Pin8)          | Connect the UART2_TXD pin of the Radxa NX5 Development Kit to the RXD pin of the USB serial cable (white Dupont wire) |
| UART2_RXD (Pin10)         | Connect the UART2_RXD pin of the Radxa NX5 Development Kit to the TXD pin of the USB serial cable (green Dupont wire) |

## Serial Login

:::tip Serial Communication Parameters

Baud rate: 1500000

Data bits: 8

Stop bits: 1

Parity: None

Flow control: None
:::

<UART baud="1500000"/>
