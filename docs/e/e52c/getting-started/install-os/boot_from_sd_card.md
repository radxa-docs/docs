---
sidebar_position: 1

doc_kind: wrapper
source_of_truth: local
imports_resolve_to:
  - docs/e/e52c/_image.mdx
  - docs/common/general/_etcherV2.mdx
---

import Images from "../../\_image.mdx"
import Etcher from '../../../../common/general/\_etcherV2.mdx';

# 安装系统到 MicroSD 卡

## 文件下载

请到[镜像下载页面](../../download)下载对应的操作系统镜像。

## MicroSD 卡准备

将 MicroSD 卡插入到 SD 卡读卡器中，然后将读卡器插入到 PC 的 USB 端口上

## 镜像烧录

<Etcher/>

## 启动系统

按照上述步骤成功烧录 MicroSD Card 后， 将 MicroSD Card 插入到 MicroSD Card 插槽内（下图右边为 SD 卡插槽），然后上电，系统开始启动，电源指示灯开始闪烁。

<img src="/img/e/e52c/radxa-e52c-insert-sd.webp" width="500" alt="radxa-e52c pack" />

## 登录系统

如果是 RadxaOS 系统启动后， 默认账号是 radxa，密码为 radxa

如果是 iStoreOS 系统启动后，默认账号是 root，密码是 password
