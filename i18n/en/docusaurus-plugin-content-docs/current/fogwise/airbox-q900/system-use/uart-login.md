---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/radxa-os/system-config/_uart_debug.mdx
---

import UART_DEBUG from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# UART Login

UART login is a core method in embedded development for interacting with the board through a serial communication interface (UART). Using a serial terminal tool, you can view system logs and perform command-line interactions.

## Hardware Connection

Connect the board's USB Type-C port to your computer's USB port using a USB Type-C cable.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/fogwise/airbox-q900/airbox-q900-uart-connect.webp" style={{width: '100%', maxWidth: '1200px'}} alt="UART Connection Diagram" />
</div>

① : Connect the board's USB Type-C port to your PC's USB port using a USB Type-C cable

② : Power the board using a 12V DC power adapter

## UART Login

:::info UART Communication Parameters

- Baud Rate: 115200
- Data Bits: 8
- Stop Bits: 1
- Parity: None
- Flow Control: None

:::

<UART_DEBUG baud="115200"/>
