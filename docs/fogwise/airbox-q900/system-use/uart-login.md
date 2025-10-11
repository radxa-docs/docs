---
sidebar_position: 1
---

import UART_DEBUG from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# 串口登录

串口登录是嵌入式开发中通过串行通信接口 (UART) 与主板交互的核心手段，通过串口工具可以查看系统输出的日志和进行命令行交互。

## 硬件连接

使用 USB Type-C 数据线连接主板的 USB Type-C 接口和电脑的 USB 接口。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-uart-connect.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : 使用 USB Type-C 数据线连接主板的 USB Type-C 接口和电脑的 USB 接口

② : 使用 12V DC 电源适配器给主板供电

## 串口登录

:::info 串口通讯参数

- 波特率：115200
- 数据位：8
- 停止位：1
- 校验位：无
- 流控：无

:::

<UART_DEBUG baud="115200"/>
