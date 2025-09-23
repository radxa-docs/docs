---
sidebar_position: 3
---

# 安装系统到 NVMe SSD

NVMe SSD 是一种高速、高容量、低成本的存储设备，可用于存储设备或启动系统盘。Cubie A5E 支持 2230 M.2 NVMe SSD，可以用作存储设备或者启动系统盘。 如果用作存储设备，需要从 SD 卡或者 eMMC 启动，插入 SSD 到 M.2 接口使用即可。 如果用作启动系统盘，需要先烧录 SPI 启动固件，然后将系统安装到 NVMe SSD 上，就可以无需 SD 卡或者 eMMC 即可启动 NVMe SSD 上的系统。

若要将 NVMe SSD 用作启动系统盘，你需要按照以下步骤和教程操作：

## 烧录 SPI 启动固件

- [烧录 SPI 启动固件](./burn-spi.md)

## 把系统镜像写入 NVMe SSD

你可以根据自己的硬件设备选择不同的写入方式：

- [使用硬盘盒写入系统镜像](./install-system/reader.md)：需要使用到 NVMe 固态硬盘盒，操作相对简单！
- [从 SD 卡写入系统镜像到 NVMe](./install-system/no-reader.md)：需要基于 MicroSD 卡正常启动 Cubie A5E 系统，然后使用 `dd` 命令将系统安装到 NVMe SSD 上。
