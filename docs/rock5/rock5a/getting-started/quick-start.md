---
sidebar_position: 2
---

# 快速上手

## 包装清单

<img src="/img/rock5a/rock5a-package.webp" width="500" alt="rock5a pack" />

ROCK 5A 标准包装包括以下物品：

- ROCK 5A 主板

要启动 ROCK 5A，您还需要一下设备：

- 一个 Type-C 电源适配器( 支持 PD 协议，5V 电源输入，建议电流 3A 以上)。ROCK 5A 还支持 PoE 供电。更过供电详情，请参考[电源方案](./power-supply)。
- 一个 Micro-HDMI 线和一个支持 HDMI 的显示器，推荐分辨率为 1080P 或更高，4K / 8K 显示器将提供最佳体验。
- 一套 USB 鼠标和键盘，常见的 USB 输入设备均支持即插即用。
- 一根网线，更新系统时需要联网。

:::tip
电源适配器推荐使用官方的 [瑞莎 PD30W 适配器](https://radxa.com/products/accessories/power-pd-30w/)。
:::

非必需但可增强 ROCK 5A 基本功能的外设：

- 散热器，参考[散热器选型](./interface-usage/fan)来安装散热器
- M.2 无线模块；ROCK 5 ITX 支持标准的 M.2 Wi-Fi 卡。请查看[无线模块兼容列表](./interface-usage/pcie-e-key#wifi--bt-支持模块列表)。一些较旧的免驱动 M.2 Wi-Fi 卡也可能支持即插即用。
- M.2 NVMe SSD。推荐在 M.2 NVMe SSD 上安装操作系统。

## 安装操作系统

参考[安装系统](./install-os/) 部分安装操作系统。

## 接线和上电

1. 通过 Micro HDMI 转 HDMI 线将 ROCK 5A 的任一 HDMI 输出接口连接到 HDMI 显示器。

<img src="/img/rock5a/rock5a_hdmi.webp" width="500" alt="rock5a hdmi" />

2. 将 USB 鼠标和键盘连接到 ROCK 5A 的任一 USB 2.0 或 3.0 接口。

<img src="/img/rock5a/rock5a_usb.webp" width="500" alt="rock5a usb" />

3. 将网线连接到以太网口。

<img src="/img/rock5a/rock5a_ethernet_01.webp" width="500" alt="rock5a ethernet 01" />

4. 如果有 M.2 Wi-Fi 模块或 SSD，使用提供的 M.2 螺丝安装并固定。

5. 将电源适配器插入 ROCK 5A 的电源接口。设备上电启动，电源指示灯将亮起。

<img src="/img/rock5a/rock5a_power.webp" alt="rock5a pwr" width="500" />

:::tip
系统从上电到开机启动，整个过程持续约 40 秒，然后进入系统桌面。
:::
