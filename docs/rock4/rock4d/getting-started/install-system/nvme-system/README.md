---
sidebar_position: 3
---

# 安装系统到 NVMe SSD

M.2 NVMe SSD 是一种高速、高容量、低成本的存储设备，其读写速度快于 MicroSD 卡和 UFS 模块，对于想进一步提高系统读写和启动速度的用户来说，是个不错的选择。

我们介绍两种方式安装系统到 M.2 NVMe SSD：

- 对于有 M.2 NVMe 固态硬盘盒的用户，安装系统步骤和 MicroSD 卡安装系统的步骤类似，比较简单。

- 对于没有 M.2 NVMe 固态硬盘盒的用户，使用 `dd` 命令将系统镜像安装到 M.2 NVMe SSD。

:::tip

瑞莎 ROCK 4D 上预留一个 FPC 接口，提供了 PCIe Gen2 ×1 通道的扩展能力。

使用 FPC 接口需要提前购买 PCIe 转 M.2 M Key HAT ，并按照配件说明正确安装。

:::

<DocCardList />
