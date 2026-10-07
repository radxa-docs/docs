---
sidebar_position: 1
---

import UART_DEBUG from '../../../common/radxa-os/system-config/\_uart_debug.mdx';

# 串口登录

串口登录是嵌入式开发中通过串行通信接口 (UART) 与主板交互的核心手段，通过串口工具可以查看系统输出的日志和进行命令行交互。

## 硬件连接

:::danger
使用 USB 串口数据线和 Dragon Q8B 进行串口登录时，请确保引脚连接正确，接错引脚可能会导致主板硬件损坏。

不建议连接 USB 串口数据线的 VCC 接口（红色线），避免接错导致主板损坏。
:::

将 USB 串口数据线连接到 Dragon Q8B 的 UART0 接口，另一端连接到 PC 的 USB 端口。

<div style={{textAlign: 'center'}}>
  <img src="/img/dragon/q8b/q8b_serial_debug.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Dragon Q8B 引脚功能            | 连接方式                                                  |
| ------------------------------ | --------------------------------------------------------- |
| Dragon Q8B : GND（Pin6）       | Dragon Q8B 的 GND 引脚连接 USB 串口数据线的 GND 引脚      |
| Dragon Q8B : UART_TXD（Pin8）  | Dragon Q8B 的 UART_TXD 引脚连接 USB 串口数据线的 RXD 引脚 |
| Dragon Q8B : UART_RXD（Pin10） | Dragon Q8B 的 UART_RXD 引脚连接 USB 串口数据线的 TXD 引脚 |

## 串口登录

:::info
串口通讯参数

- 波特率：115200
- 数据位：8
- 停止位：1
- 校验位：无
- 流控：无
  :::

:::warning 串口输出乱码 / 疑似无法开机
部分串口终端软件（例如 Tabby）在设备频繁重绘输出时可能丢失串口数据，例如启动菜单会反复重绘界面、`apt` / `dpkg` 等进度输出会不断改写同一行或移动光标。此时启动日志会显示为大量半截行与重复信息，登录提示符也不可见，看起来像是系统启动失败或卡住，但实际系统已正常启动。

这类现象属于终端软件的显示问题，不是主板故障。如果遇到，建议改用 `picocom` 等已验证可以完整显示输出的串口终端：

```bash
picocom -b 115200 /dev/ttyUSB0
```

使用 `Ctrl+A` `Ctrl+X` 退出 `picocom`。
:::

<UART_DEBUG baud="115200"/>
