---
sidebar_position: 9
---

# FPC 接口

瑞莎 ROCK 4D 板载 FPC 接口，支持PCIe 2.1标准、单通道（x1）的高速数据扩展接口。

我们可以通过 FPC 接口连接 PCIe 转 M.2 M Key HAT，搭配 M.2 NVMe SSD 使用，实现 NVMe SSD 启动系统或拓展存储空间。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-fpc.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

M.2 NVMe SSD 需要通过 PCIe 转 M.2 M Key HAT 连接 ROCK 4D 的 FPC 接口才可以使用。

- 拓展存储空间

您可以直接将 M.2 NVMe SSD 插入 PCIe 转 M.2 M Key HAT，然后将 HAT 连接 ROCK 4D 的 FPC 接口，使用 `lsblk` 命令查看 NVMe SSD 是否被识别。

- 作为系统启动盘

您可以参考 [安装系统到 NVMe SSD](../getting-started/install-system/nvme-system) 教程，然后将 NVMe SSD 插入 PCIe 转 M.2 M Key HAT，再将 HAT 连接 ROCK 4D 的 FPC 接口，测试启动系统是否正常。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-nvme-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

| Pin# | Name              | Pin# | Name          | Pin# | Name             |
| :--: | :---------------- | :--: | :------------ | :--: | :--------------- |
|  1   | VCC5V0_SYS_S5     |  7   | PCIE0_SOC_RXP |  13  | PCIE0_PWREN_H    |
|  2   | VCC5V0_SYS_S5     |  8   | PCIE0_SOC_RXN |  14  | PCIE0_WAKEN_M0   |
|  3   | GND               |  9   | GND           |  15  | PCIE0_CLKREQn_M0 |
|  4   | PCIE0_SOC_REFCLKP |  10  | PCIE0_SOC_TXP |  16  | PCIE0_PERSTn     |
|  5   | PCIE0_SOC_REFCLKN |  11  | PCIE0_SOC_TXN |      |                  |
|  6   | GND               |  12  | GND           |      |                  |
