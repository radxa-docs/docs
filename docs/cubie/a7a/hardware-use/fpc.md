---
sidebar_position: 9
---

# PCIe 3.0 FPC 接口

瑞莎 Cubie A7A 板载 PCIe 3.0 FPC 接口，支持PCIe 3.0标准、单通道（x1）的高速数据扩展接口。

我们可以通过 PCIe 3.0 FPC 接口连接 PCIe 转 M.2 M Key HAT，搭配 M.2 NVMe SSD 使用，实现 NVMe SSD 拓展存储空间。

:::tip
PCIe 3.0 FPC 接口具体位置可以查看 [硬件接口](./hardware-info) 教程的接口说明部分！
:::

## 使用指南

:::danger 注意
目前 NVMe SSD 只可以作为拓展存储空间使用，正在适配中！
:::

M.2 NVMe SSD 需要通过 PCIe 转 M.2 M Key HAT 连接 Cubie A7A 的 FPC 接口才可以使用。

- 拓展存储空间

将 PCIe 转 M.2 M Key HAT 扩展板安装到 Cubie A7A 上，然后将 NVMe SSD 安装到 PCIe 转 M.2 M Key HAT 扩展板的 M.2 M Key 接口中。

完成安装后，使用 `lsblk` 命令查看 NVMe SSD 是否被识别。

- 作为系统启动盘

M.2 NVMe SSD 模块作为系统启动盘使用：可以参考 [安装系统到 M.2 NVMe SSD](../getting-started/install-system/nvme-system/) 教程。

## 接口规格

:::info 技术参考
完整的技术规格和引脚定义可参考下载专区的 [硬件设计：原理图](../download) 文档
:::
