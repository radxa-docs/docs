---
sidebar_position: 3
---

# 安装系统到 NVMe SSD

NVMe SSD 是一种高速、高容量、低成本的存储设备，可用于存储设备或启动系统盘。

## 存储设备

若要将 NVMe SSD 用作存储设备，只需要将 NVMe SSD 连接安装到 Cubie A5E 的 M.2 M Key 2230 接口上即可。

## 启动系统盘

若要将 NVMe SSD 用作启动系统盘，你需要按照以下步骤和教程操作：

1. 烧录 SPI 启动固件

[烧录 SPI 启动固件](./burn-spi.md)后，Cubie A5E 才支持从 NVMe SSD 启动系统。

2. 安装系统到 NVMe SSD

你可以根据自己的硬件设备选择不同的安装方式：

- [使用硬盘盒安装系统](./install-system/reader.md)：需要使用到 NVMe 固态硬盘盒，操作相对简单！
- [使用 dd 命令安装系统](./install-system/no-reader.md)：需要基于 MicroSD 卡正常启动系统，然后使用 `dd` 命令将系统安装到 NVMe SSD 上。
