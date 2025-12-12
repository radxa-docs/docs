---
sidebar_position: 3
---

# 安装系统到 NVMe SSD

若要将 NVMe SSD 用作启动系统盘，你需要按照以下步骤和教程操作：

## 烧录 SPI 启动固件

- [烧录 SPI 启动固件](./burn-spi.md)

## 把系统镜像写入 NVMe SSD

你可以根据自己的硬件设备选择不同的写入方式：

- [使用硬盘盒写入系统镜像](./install-system/reader.md)：需要使用到 NVMe 固态硬盘盒，操作相对简单！
- [从 SD 卡写入系统镜像到 NVMe](./install-system/no-reader.md)：需要基于 MicroSD 卡正常启动系统，然后使用 `dd` 命令将系统安装到 NVMe SSD 上。
