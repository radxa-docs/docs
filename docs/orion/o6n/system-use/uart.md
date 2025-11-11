---
sidebar_position: 1
---

import UART from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# 串口登录

串口登录是嵌入式开发中通过串行通信接口 (UART) 与主板交互的核心手段，通过串口工具可以查看系统输出的日志和进行命令行交互。

## 硬件连接

:::danger
使用 USB 串口数据线和瑞莎星睿 O6N 进行串口登录时，请确保引脚连接正确，接错引脚可能会导致主板硬件损坏。

不建议连接 USB 串口数据线的 VCC 接口（红色线），避免接错导致主板损坏。
:::

将 USB 串口数据线连接到 O6N 的 UART 接口，另一端连接到 PC 的 USB 端口。

说明：请根据厂商的 USB 串口线引脚定义进行连接，图中示例为常见的 USB 串口线引脚定义。

<div style={{textAlign: 'center'}}>
  <img src="/img/orion/o6n/orion-o6n-serial.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| O6N 引脚功能            | 连接方式                                           |
| ----------------------- | -------------------------------------------------- |
| O6N : GND（Pin6）       | O6N 的 GND 引脚连接 USB 串口数据线的 GND 引脚      |
| O6N : UART_TXD（Pin8）  | O6N 的 UART_TXD 引脚连接 USB 串口数据线的 RXD 引脚 |
| O6N : UART_RXD（Pin10） | O6N 的 UART_RXD 引脚连接 USB 串口数据线的 TXD 引脚 |

## 串口登录

:::info
串口通讯参数

- 波特率：115200
- 数据位：8
- 停止位：1
- 校验位：无
- 流控：无
  :::

<UART baud="115200"/>
