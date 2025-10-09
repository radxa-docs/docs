---
sidebar_position: 3
---

# 瑞莎 eMMC 读写器

Radxa eMMC USB3读卡器是一款真正具有USB3.0性能的eMMC读卡器。基于GL3227E芯片设计。GL3227E是一个USB 3.1 Gen1 eMMC控制器，它提供单一的LUN（逻辑单元编号），可以支持eMMC v5.0、1/4/8bit数据总线、高速SDR /高速DDR / HS200 / HS400模式。

![eMMC Reader](/img/accessories/emmc-reader.webp)

## 特征

- 高速 USB3.1 Gen2 GL3227E 控制器
- 支持 eMMC HS400 模式
- 稳固的双 B2B 连接座固定
- 支持 Radxa eMMC 模块，最高可达 256GB
- 兼容 Odroid / PINE64 eMMC 模块
- 支持 Linux / Windows / MacOS 主机
- 支持 GPT 分区表和固件

:::tip eMMC 启动分区限制

当使用瑞莎 eMMC 读卡器连接 eMMC 模块时，主机电脑只能访问用户数据区。
此行为由读卡器中使用的 USB 转 eMMC 桥接器固件决定。

支持：

- 用户数据区（作为 USB 驱动器可见的普通 eMMC 存储）

不支持：

- Boot0 分区
- Boot1 分区
- RPMB（重放保护内存块）

如果您的使用场景需要访问 Boot0 或 Boot1（例如刷写引导加载程序或设备固件），请将 eMMC 模块直接连接到开发板原生的 eMMC 接口（通过 SDIO 或焊接插座）。

💡 背景信息

瑞莎 eMMC 读卡器中使用的 USB 桥接控制器未实现切换到启动分区的命令（CMD8/CMD49），而这些命令是进行底层 eMMC 访问所必需的。这是市场上大多数 USB eMMC 读卡器的常见限制。

:::

## 尺寸

- 大小: 55 x 20 x 5 mm

[**购买链接**](https://radxa.com/products/accessories/emmc-usb3-reader#buy)
