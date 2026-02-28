---
sidebar_position: 2

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/general/_etcher.mdx
---

import Etcher from '../../../common/general/\_etcher.mdx'

# 安装操作系统

## 镜像下载

请到 [资源下载汇总](./download) 下载对应的镜像文件

## 安装系统

<Etcher model="zero2pro" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡 后，将 microSD 卡插入 ZERO 2 PRO 的 MicroSD 插槽内。
- ZERO 2 PRO 的供电接口为 [USB OTG](../hardware-design/hardware-interface)，请使用 Type-C 线缆连接供电口和适配器。

:::tip
ZERO 2 PRO 支持 5V 电源输入，建议使用额定最大电流大于2A的电源适配器。瑞莎推荐使用 [Radxa Power PD30W](../accessories/power/pd_30w)。
:::

## 登录系统

默认账号：radxa 密码：radxa

## 参考文档

- [从 USB OTG 口安装操作系统镜像到 eMMC](../low-level-dev/install-os-on-emmc)
