---
sidebar_position: 1
---

# 安装系统到 eMMC

## 准备工作

- 1x [Radxa 4P to USB-A Male Cable](/rockpi/rocks0/getting-started/preparation#usb-otg-线材)

## 镜像下载

请到 [资源下载汇总](/rockpi/rocks0/getting-started/download) 下载对应的镜像文件

## 进入 Maskrom 模式

![ROCK S0 Overview](/img/rockpi/s0/mark_rock_pi_s0.webp)

Radxa ROCK S0 进入 Maskrom 模式的方法

1. 拔出 microSD 卡和电源线
2. 按住正面的 Maskrom 按钮
3. 通过 OTG 线连接 PC 主机的 USB，如果电源绿灯常亮则成功进入 Maskrom 模式

在 Maskrom 模式下，您可使用 [rkdevtool](../low-level-dev/rkdevtool) 或 [upgrade-tool](../low-level-dev/upgrade-tool) 来对您的产品进行擦写、线刷等操作。

## 烧录到 eMMC

[Windows 环境下安装](../low-level-dev/rkdevtool)

[Linux 环境下安装](../low-level-dev/rkdeveloptool)

## 启动系统

- 使用 [Radxa 4P to USB-A Male Cable](/rockpi/rocks0/getting-started/preparation#usb-otg-线材) 连接板子上的 4-Pin USB2.0 OTG 接口到电源适配器上，然后系统开始启动，绿灯闪烁。

## 常见问题
