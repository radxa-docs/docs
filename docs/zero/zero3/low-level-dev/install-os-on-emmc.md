---
sidebar_position: 1
---

# 安装系统到 EMMC

## 准备工作

- 1x USB 线 （一端 USB C，一端 USB A）
- 1x 5V 电源适配器 (推荐使用 [Radxa Power PD30W](/accessories/pd_30w))

## 镜像下载

请到 [资源下载汇总](/zero/zero3/getting-started/download.md) 下载对应的镜像文件

## 进入 Maskrom 模式

<Tabs queryString="model">
<TabItem value="zero-3w" label="ZERO 3W">

![ZERO 3W Overview](/img/zero/zero3/radxa_zero_3w.webp)

Radxa ZERO 3W 进入 Maskrom 模式的方法

1. 拔出 microSD 卡和电源线
2. 按住背面的 [Maskrom 按钮](/zero/zero3/hardware-design/hardware-interface.md)
3. 通过 USB-A 转 USB-C 线连接PC 主机的 USB，如果电源绿灯常亮则成功进入 Maskrom 模式

</TabItem>
<TabItem value="zero-3e" label="ZERO 3E">

![ZERO 3E Overview](/img/zero/zero3/radxa_zero_3e.webp)

Radxa ZERO 3E 进入 Maskrom 模式的方法

1. 拔出 microSD 卡和电源线
2. 通过 USB-A 转 USB-C 线连接PC 主机的 USB，如果电源绿灯常亮则成功进入 Maskrom 模式

</TabItem>
</Tabs>

Radxa ZERO 3 的 OTG 接口是 TYPE-C,可通过 USB-C 转 USB-A 线连接主机和进入 Maskrom 的主板进行通信。

在 Maskrom 模式下，您可使用 [rkdevtool](rkdevtool) 或 [upgrade-tool](upgrade-tool) 来对您的产品进行擦写、线刷等操作。

## 安装系统到 eMMC

[Windows 环境下安装](rkdevtool)

[Linux 环境下安装](rkdeveloptool)

## 启动系统

- 使用USB线连接板子的 [USB 2.0 OTG Type C port](/zero/zero3/hardware-design/hardware-interface.md) 到电源适配器上，然后系统开始启动，状态灯闪烁。

:::tip
Radxa ZERO 3 只支持 `5V` 供电。瑞莎推荐使用 [Radxa Power PD30W](/accessories/pd_30w)。
:::

## 常见问题
