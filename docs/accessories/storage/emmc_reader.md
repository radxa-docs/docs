---
sidebar_position: 3
---

# 瑞莎 eMMC 读写器

Radxa eMMC USB3 读卡器是一款真正具有 USB3.0 性能的 eMMC 读卡器。基于 GL3227E 芯片设计。GL3227E 是一个 USB 3.1 Gen1 eMMC 控制器，它提供单一的 LUN（逻辑单元编号），可以支持 eMMC v5.0、1/4/8bit 数据总线、高速 SDR /高速 DDR / HS200 / HS400 模式。

![eMMC Reader](/img/accessories/storage/emmc-reader.webp)

## 特征

- 高速 USB3.1 Gen2 GL3227E 控制器
- 支持 eMMC HS400 模式
- eMMC 模块双重固定
- 支持 ROCK eMMC 模块，最高可达 128GB
- 兼容 Odroid/PINE64 eMMC 模块
- 支持 Linux/Windows/MacOS
- 支持 GPT 分区表和固件

:::tip eMMC 启动分区限制

当使用瑞莎 eMMC 读卡器通过 USB 连接 eMMC 模块时，主机电脑只能访问用户数据区。
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

- 大小：55 x 20 x 5 mm

[**立即购买**](https://radxa.com/products/accessories/emmc-usb3-reader#buy)
