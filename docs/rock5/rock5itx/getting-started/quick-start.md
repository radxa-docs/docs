---
sidebar_position: 2
---

# 快速上手

本指南假设您使用 12V DC 适配器为 ROCK 5 ITX 主板供电来快速上手使用。如果您计划将其安装在机箱中，请参考[装机指南](assembly-guide.md)。

## 包装清单

<img src="/img/rock5itx/rock5itx-packlist-zh.jpeg" width="400" alt="rock 5 itx package list" />

ROCK 5 ITX 标准包装包括以下物品：

- 一块主板
- 一个机箱挡板
- 两个 M.2 螺丝

要启动 ROCK 5 ITX，您还需要以下设备：

- 一个 12V/2A 或更高功率的 DC 适配器，插头规格为 5.5x2.5mm，内为正极，外为地线。ROCK 5 ITX 还支持 PoE 供电和标准 PC 机箱电源（ATX 电源）。更多详情，请参考[电源方案](./power-supply.md)。
- 一个支持 HDMI 的显示器，推荐分辨率为 1080P 或更高，4K / 8K 显示器将提供最佳体验
- 一套 USB 鼠标和键盘，常见的 USB 输入设备均支持即插即用
- 一根或两根网线以及支持以太网的交换机或路由器，因为 ROCK 5 ITX 有两个 2.5G RJ45 以太网口，安装和更新系统时需要联网。

:::tip 注意
在接口标注图中，[编号 ⑭](./introduction.md#主板概览) 是 HDMI 输入口，不能用来连接 HDMI 显示器。如需连接 HDMI 显示器，请使用[编号 ⑩  或 ⑪ ](./introduction.md#主板概览) HDMI 接口。
:::

非必需但可增强 ROCK 5 ITX 基本功能的外设：

- 散热器，参考[散热器选型]来安装散热器
- M.2 无线模块；ROCK 5 ITX 支持标准的 M.2 Wi-Fi 卡。请查看[无线模块兼容列表]。一些较旧的免驱动 M.2 Wi-Fi 卡也可能支持即插即用。
- M.2 NVMe SSD；ROCK 5 ITX 支持 2230/2242/2260/2280 尺寸的 M.2 NVMe SSD。不支持 SATA 协议的 M.2 SSD。推荐在 M.2 NVMe SSD 上安装操作系统。
- 2.5 英寸或 3.5 英寸的机械硬盘或 SATA 固态硬盘，用于大容量数据存储。
  - ROCK 5 ITX 支持最多 4 个 SATA 接口，可连接 2.5 英寸或 3.5 英寸的机械硬盘或固态硬盘。
  - 需要另外购买 SATA 数据线和电源线；详细信息，请查看配件列表的 [SATA 电源线]说明。

## 接线和上电

1. 通过 HDMI 线将 ROCK 5 ITX 的任一 HDMI 输出接口连接到 HDMI 显示器。
2. 将 USB 鼠标和键盘连接到 ROCK 5 ITX 的任一 USB 2.0 或 3.0 接口。
3. 如果有 M.2 Wi-Fi 模块或 SSD，使用提供的 M.2 螺丝安装并固定。
4. 如果有 2.5/3.5 英寸的 SATA 硬盘，连接 SATA 线和硬盘电源线。
5. 将 12V DC 适配器插入 ROCK 5 ITX 的 DC 接口。设备会自动上电启动，电源指示灯将亮起。
6. ROCK 5 ITX 配备了预装的 Radxa 自研 ROOBI OS 的 8GB eMMC。上电后几秒钟，HDMI 显示器将显示 ROOBI OS 的界面。
