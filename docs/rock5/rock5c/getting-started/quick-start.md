---
sidebar_position: 2
---

# 快速上手

## 包装清单

<Tabs queryString="vendorTolibgpiod">

<TabItem value="RK3588S2">
<img src="/img/rock5c/rock5c-3588s2-package.webp" width="500" alt="rock5c rk3582 pack" />
</TabItem>
<TabItem value="RK3582">
<img src="/img/rock5c/rock5c-3582-package.webp" width="500" alt="rock5c rk3582 pack" />
</TabItem>
</Tabs>

ROCK 5C 标准包装包括以下物品：

- ROCK 5C 主板

要启动 ROCK 5C，您还需要一下设备：

- 一个支持 5V 3A 输出的 USB Type-C 电源适配器，或 PoE 供电设备及与 ROCK 5C 兼容的 PoE HAT。详情请参考[电源方案](./power-supply)。
- 一个 HDMI 线和一个支持 HDMI 的显示器，推荐分辨率为 1080P 或更高，4K / 8K 显示器将提供最佳体验。
- 一套 USB 鼠标和键盘，常见的 USB 输入设备均支持即插即用。
- 一根网线，更新系统时需要联网。

:::tip
电源适配器推荐使用官方的 [瑞莎 PD30W 适配器](../../../accessories/power/pd_30w)。
:::

非必需但可增强 ROCK 5C 基本功能的外设：

- 散热器，参考[散热器选型](./interface-usage/fan)来安装散热器

## 安装操作系统

参考[安装系统](./install-system/) 部分安装操作系统。

## 接线和上电

1. 通过 Micro HDMI 转 HDMI 线将 ROCK 5C 的任一 HDMI 输出接口连接到 HDMI 显示器。

<img src="/img/rock5c/rock5c-hdmi-connect.webp" width="500" alt="rock5c hdmi" />

2. 将 USB 鼠标和键盘连接到 ROCK 5C 的任一 USB 2.0 或 3.0 接口。

<img src="/img/rock5c/rock5c-usb-connect.webp" width="500" alt="rock5c usb" />

3. 将网线连接到以太网口。

<img src="/img/rock5c/rock5c-ethernet-connect.webp" width="500" alt="rock5c ethernet" />

4. 将电源适配器插入 ROCK 5C 的电源接口。设备上电启动，电源指示灯将亮起。

<img src="/img/rock5c/rock5c-pwr-connect.webp" alt="rock5c pwr" width="500" />

:::tip
系统从上电到开机启动，整个过程持续约 40 秒，然后进入系统桌面。
:::
