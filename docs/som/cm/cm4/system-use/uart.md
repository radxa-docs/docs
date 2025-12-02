---
sidebar_position: 4
---

import UART from '../../../../common/radxa-os/system-config-debian12/\_uart.mdx';

# 串口调试

## 使用前提

进行串口调试，你需要使用 USB 串口数据线连接主板的 UART0 接口和 PC 的 USB 端口。

:::danger
使用 USB 串口数据线和主板进行串口调试时，请确保引脚连接正确，接错引脚可能会导致主板硬件损坏。

不建议连接 USB 串口数据线的 VCC 接口（红色线），避免接错导致主板损坏。
:::

<div style={{textAlign: 'center'}}>
   <img src="/img/cm4/cm4_uart.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 瑞莎 CM4 IO 板引脚功能              | 连接方式                                                                    |
| ----------------------------------- | --------------------------------------------------------------------------- |
| 瑞莎 CM4 IO 板 : GND（Pin6）        | 瑞莎 CM4 IO 板的 GND 引脚连接 USB 串口数据线的 GND 引脚（黑色杜邦线）       |
| 瑞莎 CM4 IO 板 : UART0_TXD（Pin8）  | 瑞莎 CM4 IO 板的 UART0_TXD 引脚连接 USB 串口数据线的 RXD 引脚（白色杜邦线） |
| 瑞莎 CM4 IO 板 : UART0_RXD（Pin10） | 瑞莎 CM4 IO 板的 UART0_RXD 引脚连接 USB 串口数据线的 TXD 引脚（绿色杜邦线） |

## 串口登录

:::tip 串口通讯参数

波特率：1500000

数据位：8

停止位：1

校验位：无

流控：无
:::

<UART baud="1500000"/>
