---
sidebar_position: 2

doc_kind: wrapper
source_of_truth: local
imports_resolve_to:
  - docs/rock5/rock5c/_image.mdx
  - docs/common/general/_etcherV2.mdx
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# 安装系统到 EMMC Module

## 文件下载

<Images loader={false} system_img={true} spi_img={false} />

## EMMC Module 准备

将 [EMMC Module](../../../../accessories/emmc_module) 插入到 [EMMC Reader](../../../../accessories/emmc_reader) 中，然后将 Reader 插入到 PC 的 USB 端口上

## 镜像烧录

<Etcher/>

## 启动系统

按照上述步骤成功烧录 EMMC Module 后， 将 EMMC Module 插入到 EMMC Module 插槽内（如下图所示)，然后上电，系统开始启动，HDMI显示桌面。

<img
src="/img/rock5c/rock5c_with_emmc_module.webp"
alt="emmc slot"
style={{ width: "60%"}}
/>

## 登录系统

系统启动后，使用 radxa 账号登录，密码为 radxa。

:::tip
系统从上电到开机启动，整个过程持续约 40 秒，然后进入系统桌面。
:::
