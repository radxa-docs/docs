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

M.2 NVMe SSD 需要通过 PCIe 转 M.2 M Key HAT 连接 Cubie A7A 的 FPC 接口才可以使用。

- 拓展存储空间

您可以直接将 M.2 NVMe SSD 插入 PCIe 转 M.2 M Key HAT，然后将 HAT 连接 Cubie A7A 的 FPC 接口，使用 `lsblk` 命令查看 NVMe SSD 是否被识别。

- 作为系统启动盘

M.2 NVMe SSD 模块作为系统启动盘使用：可以参考 [安装系统到 M.2 NVMe SSD](../getting-started/install-system/ufs-system/) 教程。

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

| Pin# | Name       | Pin# | Name       | Pin# | Name             |
| :--: | :--------- | :--: | :--------- | :--: | :--------------- |
|  1   | VCC5V0_SYS |  7   | PCIE1-RX0P |  13  | PCIE_PWR_EN      |
|  2   | VCC5V0_SYS |  8   | PCIE1-RX0N |  14  | PCIE-WAKEn_3V3   |
|  3   | GND        |  9   | GND        |  15  | PCIE-CLKREQn_3V3 |
|  4   | PCIE1-CLKP |  10  | PCIE1-TX0P |  16  | PCIE-PERSTn_3V3  |
|  5   | PCIE1-CLKN |  11  | PCIE1-TX0N |      |                  |
|  6   | GND        |  12  | GND        |      |                  |
