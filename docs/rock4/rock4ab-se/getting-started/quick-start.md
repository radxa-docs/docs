---
sidebar_position: 2
---

import Package from "./\_package.mdx"

# 快速上手

## 包装清单

<Tabs queryString="model">

    <TabItem value="ROCK 4A">
        <img src="/img/rock4/rock4a-package.webp" width="800" alt="rock4a package" />

        <Package items={['ROCK 4A']} />
    </TabItem>

    <TabItem value="ROCK 4B">
        <img src="/img/rock4/rock4b-package.webp" width="800" alt="rock4b package" />

        <Package items={['ROCK 4B']} />

    </TabItem>

    <TabItem value="ROCK 4A+">
        <img src="/img/rock4/rock4ap-package.webp" width="800" alt="rock4ap package" />

        <Package items={['ROCK 4A+']} />
    </TabItem>

    <TabItem value="ROCK 4B+">
        <img src="/img/rock4/rock4bp-package.webp" width="800" alt="rock4bp package" />

        <Package items={['ROCK 4B+']} />
    </TabItem>

    <TabItem value="ROCK 4SE">
        <img src="/img/rock4/rock4se-package.webp" width="800" alt="rock4se package" />

        <Package items={['ROCK 4SE']} />
    </TabItem>

</Tabs>

要启动 ROCK 4A/4B/4A+/4B+/4SE，您还需要以下设备：

- 一个 12V/2A 或更高功率的 PD 适配器。其中 ROCK 4B/4B+/4SE 还支持 PoE 供电。更过供电详情，请参考[电源方案](./power-supply)。

- 一个 HDMI 线和一个支持 HDMI 的显示器，推荐分辨率为 1080P 或更高，4K 显示器将提供最佳体验。

- 一套 USB 鼠标和键盘，常见的 USB 输入设备均支持即插即用。

- 一根网线，更新系统时需要联网。

:::tip
电源适配器推荐使用官方的 [瑞莎 PD30W 适配器](../../../accessories/pd_30w)。
:::

非必需但可增强 ROCK 4A/4B/4A+/4B+/4SE 基本功能的外设：

- 散热片

- M.2 NVMe SSD。推荐在 M.2 NVMe SSD 上安装操作系统。

## 安装操作系统

参考 [安装系统](./install-os)部分安装操作系统。

## 接线和上电

1. 通过 HDMI 线将 ROCK 4A/4B/4A+/4B+/4SE 的任一 HDMI 输出接口连接到 HDMI 显示器。

<img src="/img/rock4/rock4p_hdmi.webp" width="500" alt="rock4 hdmi" />

2. 将 USB 鼠标和键盘连接到 ROCK 4A/4B/4A+/4B+/4SE 的任一 USB 2.0 或 3.0 接口。

<img src="/img/rock4/rock4p_usb.webp" width="500" alt="rock4 usb" />

3. 将网线连接到以太网口。

<img src="/img/rock4/rock4p_ethernet.webp" width="500" alt="rock4 ethernet" />

4. 如果有 M.2 Wi-Fi 模块或 SSD，使用提供的 M.2 螺丝安装并固定。

5. 将电源适配器插入 ROCK 4A/4B/4A+/4B+/4SE 的电源接口。设备上电启动，电源指示灯将亮起。

<img src="/img/rock4/rock4p_power.webp" alt="rock4 pwr" width="500" />

:::tip
系统从上电到开机启动，整个过程持续约 40 秒，然后进入系统桌面。
:::
