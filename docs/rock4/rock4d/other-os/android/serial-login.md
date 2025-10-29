---
sidebar_position: 4
---

import UART_DEBUG from '../../../../common/other-system/android/\_uart_debug.mdx';

# 串口登录

串口登录是嵌入式开发中通过串行通信接口 (UART) 与主板交互的核心手段，通过串口工具可以查看系统输出的日志和进行命令行交互。

:::danger
使用 USB 串口数据线和 ROCK 4D 进行串口登录时，请确保引脚连接正确，接错引脚可能会导致主板硬件损坏。

不建议连接 USB 串口数据线的 VCC 接口（红色线），避免接错导致主板损坏。
:::

将 USB 串口数据线连接到 ROCK 4D 的 UART0 接口，另一端连接到 PC 的 USB 端口。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-connect.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

| 序号 | 引脚功能                       | 连接方式                       |
| ---- | ------------------------------ | ------------------------------ |
| ①    | ROCK 4D : GND（Pin6）          | 连接 USB 串口数据线的 GND 引脚 |
| ②    | ROCK 4D : UART0_TX（Pin8）     | 连接 USB 串口数据线的 RX 引脚  |
| ③    | ROCK 4D : UART0_RX（Pin10）    | 连接 USB 串口数据线的 TX 引脚  |
| ④    | USB 串口数据线 : GND（黑色线） | 连接 ROCK 4D 的 GND 引脚       |
| ⑤    | USB 串口数据线 : RX（白色线）  | 连接 ROCK 4D 的 UART0_TX 引脚  |
| ⑥    | USB 串口数据线 : TX（绿色线）  | 连接 ROCK 4D 的 UART0_RX 引脚  |
| ⑦    | USB 串口数据线 : VCC（红色线） | 不连接                         |

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
