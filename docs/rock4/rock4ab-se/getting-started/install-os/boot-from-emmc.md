---
sidebar_position: 1
---

import Etcher from '../../../../common/general/\_etcherV2.mdx';

# 安装系统到 eMMC Module

本文介绍如何在 ROCK 4A/4B/4SE 上将系统安装到 eMMC Module 中，并通过 eMMC Module 启动系统。

## 文件下载

到资源下载汇总页面下载 [ROCK 4A/4B/4SE 系统镜像](../../download)

## eMMC Module 准备

将 [eMMC Module](../../../../accessories/emmc_module) 插入到 [eMMC Reader](../../../../accessories/emmc_reader) 中，然后将 Reader 插入到 PC 的 USB 端口上

## 镜像烧录

<Etcher/>

## 启动系统

按照上述步骤成功烧录 eMMC Module 后， 将 eMMC Module 插入到 eMMC Module 插槽内（如下图所示），然后上电，系统开始启动，HDMI显示桌面。

<img
src="/img/rock4/rock4ab-se_with_emmc_module.webp"
alt="emmc slot"
style={{ width: "60%"}}
/>

## 登录系统

系统启动后，使用 radxa 账号登录，密码为 radxa。

:::tip
系统从上电到开机启动，整个过程持续约 40 秒，然后进入系统桌面。
:::
