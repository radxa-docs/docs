---
sidebar_position: 2

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/general/_etcherV2.mdx
---

import Etcher from '../../../../common/general/\_etcherV2.mdx';

# 安装系统到 MicroSD 卡

本文介绍如何在 ROCK 4A/4B/4A+/4B+/4SE 上将系统安装到 MicroSD 卡 中，并通过 MicroSD 卡 启动系统。

## 文件下载

到资源下载汇总页面下载 [ROCK 4A/4B/4A+/4B+/4SE 系统镜像](../../download)

## MicroSD 卡准备

将 MicroSD 卡插入到 SD 卡读卡器中，然后将读卡器插入到 PC 的 USB 端口上

## 镜像烧录

<Etcher/>

## 启动系统

按照上述步骤成功烧录 MicroSD Card 后， 将 MicroSD Card 插入到 MicroSD Card 插槽内（如下图所示)，然后上电，系统开始启动，HDMI显示桌面。

<img
src="/img/rock4/rock4-sd-slot.webp"
alt="sd slot"
style={{ width: "60%"}}
/>

## 登录系统

系统启动后，使用 radxa 账号登录，密码为 radxa。

:::tip
系统从上电到开机启动，整个过程持续约 40 秒，然后进入系统桌面。
:::
