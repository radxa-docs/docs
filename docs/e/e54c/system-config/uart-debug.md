---
sidebar_position: 1
---

import UART_DEBUG from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# 串口调试

串口调试是嵌入式开发中通过串行通信接口 (UART) 与主板交互的核心手段，通过串口工具可以查看系统输出的信息和进行调试。

## 硬件连接

① : 使用电源适配器给主板供电

② : 使用 USB Type-C 数据线连接主板的 Debug 端口和电脑的 USB 端口

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/uart-debug.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip Maskrom 模式
若主板进入 Maskrom 模式，使用 USB Type-C 数据线连接主板的 Debug 端口和电脑的 USB 端口，系统会出现两个设备，类似如下信息：

```
Bus 001 Device 014: ID 1a86:7523 QinHeng Electronics CH340 serial converter
Bus 001 Device 015: ID 2207:350c Fuzhou Rockchip Electronics Company
```

其中 `Bus 001 Device 014` 是 CH340 串口调试设备，`Bus 001 Device 015` 是主板对应的 Maskrom 模式设备。

:::

## 串口登录

:::tip 串口通讯参数

波特率：1500000

数据位：8

停止位：1

校验位：无

流控：无
:::

<UART_DEBUG baud="1500000"/>
