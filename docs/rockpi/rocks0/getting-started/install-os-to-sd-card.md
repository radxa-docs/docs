---
sidebar_position: 2
---

import Etcher from '../../../common/general/\_etcher.mdx'

# 安装系统到 SD 卡

## 准备工作

- 1x microSD 卡(容量 >=8GB)
- 1x microSD 读卡器
- 5V 电源适配器

## 镜像下载

请到 [资源下载汇总](/rockpi/rocks0/getting-started/download) 下载对应的镜像文件

## 安装系统

<Etcher model="rocks0" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡后，将 microSD 卡插入 ROCK S0 的 microSD 插槽内。
- ROCK S0 的供电接口为 4-Pin USB2.0 OTG 接口，请使用 [Radxa 4P to USB-A Male Cable](/rockpi/rocks0/getting-started/preparation#usb-otg-线材) 连接供电口和适配器。

:::tip
ROCK S0 只支持 `5V` 供电。
:::

## 烧录 OS 到 eMMC

请参考[安装 OS 到 eMMC](/rockpi/rocks0/low-level-dev/install-os-to-emmc)
