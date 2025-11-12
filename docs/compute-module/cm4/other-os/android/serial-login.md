---
sidebar_position: 4
---

import UART_DEBUG from '../../../../common/other-system/android/\_uart_debug.mdx';

# 串口登录

串口登录是嵌入式开发中通过串行通信接口 (UART) 与主板交互的核心手段，通过串口工具可以查看系统输出的日志和进行命令行交互。

:::danger
使用 USB 串口数据线和 CM4 IO 板进行串口登录时，请确保引脚连接正确，接错引脚可能会导致主板硬件损坏。

不建议连接 USB 串口数据线的 VCC 接口（红色线），避免接错导致主板损坏。
:::

将 USB 串口数据线连接到 CM4 IO 板的 UART0 接口，另一端连接到 PC 的 USB 端口。

<div style={{textAlign: 'center'}}>
   <img src="/img/cm4/cm4_uart.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 瑞莎 CM4 IO 板引脚功能              | 连接方式                                                                    |
| ----------------------------------- | --------------------------------------------------------------------------- |
| 瑞莎 CM4 IO 板 : GND（Pin6）        | 瑞莎 CM4 IO 板的 GND 引脚连接 USB 串口数据线的 GND 引脚（黑色杜邦线）       |
| 瑞莎 CM4 IO 板 : UART0_TXD（Pin8）  | 瑞莎 CM4 IO 板的 UART0_TXD 引脚连接 USB 串口数据线的 RXD 引脚（白色杜邦线） |
| 瑞莎 CM4 IO 板 : UART0_RXD（Pin10） | 瑞莎 CM4 IO 板的 UART0_RXD 引脚连接 USB 串口数据线的 TXD 引脚（绿色杜邦线） |

## 串口登录

:::info
串口通讯参数

- 波特率：1500000
- 数据位：8
- 停止位：1
- 校验位：无
- 流控：无
  :::

<UART_DEBUG baud="1500000"/>
