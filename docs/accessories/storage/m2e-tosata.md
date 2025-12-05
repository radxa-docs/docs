---
sidebar_position: 5
---

# 瑞莎 M.2 E 型转 SATA 板

M.2 E Key to SATA Breakout Board 是一种扩展嵌入式系统存储容量的解决方案。

M.2 E 型接口通常用于连接存储卡、Wi-Fi 模块、蓝牙模块等。而 SATA 接口则用于连接硬盘，通常用于固态硬盘和机械硬盘等。通过这块扩展板，用户可以将 SATA 设备连接到 M.2 E 接口，从而扩展系统的存储容量和性能。

![M.2 E key to SATA Breakout Board](/img/accessories/storage/m2e-to-sata-1.webp)

这个扩展板使用起来非常方便，只需将其直接插入 M.2 E 接口，然后将 SATA 设备的 SATA 接口连接到扩展板上，再将电源接到指定的 40-Pin 位置即可。

## 特征

- 描述：将 M.2 E 型端口转换为 SATA 端口
- 尺寸：22mm x 30mm x 7mm

## 安装使用

:::tip
本教程使用的是 2.5 英寸的硬盘演示，仅需 5V 供电。如果您使用的是 3.5 英寸的硬盘，则需要 12V 供电，这种情况下不能从 40-pin 供电，需额外连接 12V 电源。
:::

### 使用前准备

- ROCK 5A
- M.2 E Key to SATA Breakout Board
- 15-Pin SATA 电源转 4 路杜邦线

:::tip
黑色线接 GND，红色线接 5V 接口，黄色线接 12V 接口（2.5 英寸 SATA 硬盘不需要）。
:::

### 安装流程

- 将 SATA 数据线的一端连接到 SATA 硬盘，另一端连接到 M.2 E 型转 SATA 转接板上，然后将转接板插入 ROCK 5A 的 M.2 E Key 接口，并用螺丝固定。

![M.2 E key to SATA Breakout Board](/img/accessories/storage/m2e-to-sata-4.webp)

![M.2 E key to SATA Breakout Board](/img/accessories/storage/m2e-to-sata-2.webp)

- 将 SATA 电源转 4 路杜邦线的 SATA 电源接口连接到 SATA 硬盘，另一端的杜邦线分别接到 ROCK 5A 的 40-pin 对应位置。

![M.2 E key to SATA Breakout Board](/img/accessories/storage/m2e-to-sata-3.webp)
