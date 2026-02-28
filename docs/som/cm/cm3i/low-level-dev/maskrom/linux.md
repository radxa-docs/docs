---
sidebar_position: 1
description: "Linux 下通过 USB 刷机"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/dev/_rkdeveloptoolV3.mdx
---

import Rkdeveloptool from "../../../../../common/dev/\_rkdeveloptoolV3.mdx";

# Linux 主机

## 文件下载

请到 [资源下载汇总](../../download) 下载系统镜像和 Loader 文件

<Rkdeveloptool >

<ol>
    <li>移除底板上的 MicroSD 卡</li>
    <li>同时按住 CM3I 上的 Maskrom Button （SPI Flash） 和 Maskrom Button （eMMC）并保持</li>
    <li>使用 USB-A 转 USB-A 线从 OTG 端口连接 PC 主机</li>
    <li>接入电源,即可进入 MASKROM 模式</li>
</ol>

<img src="/img/cm3i/cm3i-overview.webp" alt="cm3i module" style={{ width: "80%" }} />
<img src="/img/cm3i/cm3i-io-otg-connection.webp" alt="cm3i module" style={{ width: "80%" }} />

</Rkdeveloptool>
