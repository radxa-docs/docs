---
sidebar_position: 2
---

# 快速上手

## 包装清单

<Tabs queryString="model">
    <TabItem value="CM3I 核心板">
        <img src="/img/cm3i/cm3i-core-package.webp" alt="cm3i" style={{ width: "60%" }} />

        Radxa CM3I 核心板标准包装包括以下物品：

            - Radxa CM3I 核心板
    </TabItem>
    <TabItem value="CM3I IO 板">
        <img src="/img/cm3i/cm3i-io-package.webp" alt="cm3i" style={{ width: "60%" }} />

        Radxa CM3I IO 板标准包装包括以下物品：

            - Radxa CM3I IO 板
    </TabItem>

</Tabs>

要启动 Radxa CM3I + Radxa CM3I IO Board, 你还需要以下物品：

- DC 12V/3A 适配器。Radxa CM3I IO Board 还支持 PoE 供电。更过供电详情，请参考[电源方案](./pwr-supply)。
- 一个 HDMI 线和一个支持 HDMI 的显示器，推荐分辨率为 1080P 或更高，4K 显示器将提供最佳体验。
- 一套 USB 鼠标和键盘，常见的 USB 输入设备均支持即插即用。
- 一根网线，更新系统时需要联网。

:::tip

电源适配器推荐使用官方的 [Power DC12 36W](https://radxa.com/products/accessories/power-dc12-36w)

:::

非必需但可增强 Radxa CM3I IO Board 基本功能的外设：

- 散热器，参考[散热器选型](./interface-usage/fan)来安装散热器
- M.2 无线模块： Radxa CM3I IO Board 支持标准的 M.2 Wi-Fi 卡。请查看[无线模块兼容列表](./interface-usage/pcie-e-key#wifi--bt-支持模块列表)。一些较旧的免驱动 M.2 Wi-Fi 卡也可能支持即插即用。
- M.2 NVMe SSD。推荐在 M.2 NVMe SSD 上安装操作系统。

## 安装操作系统

参考[安装系统](./install-os/) 部分安装操作系统。

## 接线和上电

1. 通过 HDMI 线将 Radxa CM3I IO Board 的 HDMI 输出接口连接到 HDMI 显示器。

<img src="/img/cm3i/cm3i-io-hdmi-wire.webp" width="500" alt="cm3i io hdmi" />

2. 将 USB 鼠标和键盘连接到 Radxa CM3I IO Board 的任一 USB 2.0 或 3.0 接口。

<img src="/img/cm3i/cm3i-io-usb-wire.webp" width="500" alt="cm3i io usb" />

3. 将网线连接到以太网口。

<img src="/img/cm3i/cm3i-io-ethernet-wire.webp" width="500" alt="cm3i io ethernet" />

4. 如果有 M.2 Wi-Fi 模块或 SSD，使用提供的 M.2 螺丝安装并固定。

5. 将电源适配器插入 Radxa CM3I IO Board 的电源接口。设备上电启动，电源指示灯将亮起。

<img src="/img/cm3i/cm3i-io-pwr-wire.webp" alt="cm3i io pwr" width="500" />

:::tip

系统从上电到开机启动，整个过程持续约 40 秒，然后进入系统桌面。

:::
