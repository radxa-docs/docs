---
sidebar_position: 3
---

import UART_DEBUG from '../../../../common/radxa-os/system-config/\_uart_debug.mdx';

# 串口调试

串口调试是嵌入式开发中通过串行通信接口 (UART) 与主板交互的核心手段，通过串口工具可以查看系统输出的信息和进行调试。

## 硬件连接

:::danger
使用 USB 串口数据线和 Cubie A7A 进行串口调试时，请确保引脚连接正确，接错引脚可能会导致主板硬件损坏。

不建议连接 USB 串口数据线的 VCC 接口，避免接错导致主板损坏。
:::

将 USB 串口数据线连接到 Cubie A7A 的 UART0 接口，另一端连接到 PC 的 USB 端口。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-uart.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Cubie A7A 引脚功能             | 连接方式                                                  |
| ------------------------------ | --------------------------------------------------------- |
| Cubie A7A : GND（Pin6）        | Cubie A7A 的 GND 引脚连接 USB 串口数据线的 GND 引脚       |
| Cubie A7A : UART0_TXD（Pin8）  | Cubie A7A 的 UART0_TXD 引脚连接 USB 串口数据线的 RXD 引脚 |
| Cubie A7A : UART0_RXD（Pin10） | Cubie A7A 的 UART0_RXD 引脚连接 USB 串口数据线的 TXD 引脚 |

## 串口登录

:::info
串口通讯参数

- 波特率：115200
- 数据位：8
- 停止位：1
- 校验位：无
- 流控：无
  :::

## 串口登录

:::tip 串口通讯参数

波特率：115200

数据位：8

停止位：1

校验位：无

流控：无
:::

<UART_DEBUG baud="115200"/>
