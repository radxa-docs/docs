---
sidebar_position: 2
---

import Etcher from '../../../common/general/\_etcher.mdx'

# 安装操作系统

## 准备工作

- 1x microSD 卡 (容量 >=8GB)
- 1x microSD 读卡器
- 5V 电源适配器 (推荐使用 [Radxa Power PD30W](../accessories/power/pd_30w))

## 镜像下载

请到 [资源下载汇总](./download) 下载对应的镜像文件

## 安装系统

<Etcher model="zero3" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡后，将 microSD 卡插入 Radxa ZERO 3 的 MicroSD 插槽内。
- Radxa ZERO 3 的供电接口为 [USB 2.0 OTG Type C port](../hardware-design/hardware-interface)，请使用 Type-C 线缆连接供电口和适配器。

:::tip
Radxa ZERO 3 只支持 `5V` 供电。瑞莎推荐使用 [Radxa Power PD30W](../accessories/power/pd_30w)。
:::

## 参考文档

[安装操作系统镜像到 eMMC](../low-level-dev/install-os-on-emmc)
