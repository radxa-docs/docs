---
sidebar_position: 3
---

import UART_DEBUG from '../../../../common/radxa-os/system-config/\_uart_debug.mdx';

# 串口调试

串口调试是嵌入式开发中通过串行通信接口 (UART) 与主板交互的核心手段，通过串口工具可以查看系统输出的信息和进行调试。

## 硬件连接

:::danger
使用 USB 串口数据线和 Cubie A5E 进行串口调试时，请确保引脚连接正确，接错引脚可能会导致主板硬件损坏。

不建议连接 USB 串口数据线的 VCC 接口，避免接错导致主板损坏。
:::

PC 和主板进行串口通讯，可以使用 USB 转 TTL 模块或 USB 转串口数据线进行硬件连接：选择其中一种方式连接即可。

① -> USB 转串口数据线：将杜邦线那端连接到主板，USB 端连接到 PC。

② -> USB 转 TTL 模块：使用杜邦线将 USB 转 TTL 模块和主板连接起来，USB 端连接到 PC。

**说明：图中示意的为常见 USB转串口数据线或 USB 转 TTL 模块的引脚说明，具体以实际模块或厂商提供的手册说明为准。**

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a5e/a5e_debug.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Cubie A5E 引脚功能            | 连接方式 | USB 转 TTL 模块 / USB 转串口数据线引脚 |
| ----------------------------- | -------- | -------------------------------------- |
| Cubie A5E : GND（Pin6）       | 杜邦线   | GND                                    |
| Cubie A5E : UART0_TX（Pin8）  | 杜邦线   | RXD                                    |
| Cubie A5E : UART0_RX（Pin10） | 杜邦线   | TXD                                    |

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
