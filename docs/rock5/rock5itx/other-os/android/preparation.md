---
sidebar_position: 1
---

# 准备工作

## 开发准备

<Tabs queryString="target">

<TabItem value="necessary item" label="必要项">

### 供电

ROCK 5 ITX 采用 12V 电源供电，建议最低使用 12V/3A 电源适配器。

:::warning

- 系统只支持 12V 输入
- DC 输入/ POE 输入/ ATX PWR 输入 到主板都是 12V，三个电源是并联的，不支持多个电源同时插入
- 12V 电源直供给 SATA PWR 和 EDP，如果误插入更高的电源，会损坏对应的器件和电路

:::

### 存储（三选一）

- microSD， 大于 8GB （用于从 SD 启动）
- eMMC Module（已板载）
- NVME ssd （M.2 接口，用于从 SPI-NVME 启动）

### 读卡器

- microSD 读卡器（用于从 SD 启动）

:::tip

只有在使用 microSD 启动 ROCK 5 ITX 时，microSD 读卡器才是必选项

:::

</TabItem>

<TabItem value="non essential" label="非必要项">

### 显示

HDMI (最高支持8K)、MIPI（[Radxa 8HD Display](https://radxa.com/products/accessories/display-8hd)、[Radxa 10FHD Display](https://radxa.com/products/accessories/display-10fhd)）

### 网络连接

100/1000M 以太网，WIFI/BT 模块（A1、A2、A3、A8 详情请查看配件列表）

### Type-C Hub

用于 USB 口接口扩展，可外接类似 USB 鼠标, USB 键盘等设备

### USB 鼠标

### USB 键盘

</TabItem>

</Tabs>

[配件列表](../../accessories)
