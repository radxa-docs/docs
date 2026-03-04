---
sidebar_position: 1
description: "Linux 下通过 USB 刷机"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/dev/_rkdeveloptoolV2.mdx
---

import Rkdeveloptool from "../../../../../common/dev/\_rkdeveloptoolV2.mdx";

# Linux 主机

## 文件下载

请到[资源汇总](../../download)部分下载对应的系统镜像以及 Loader

<Rkdeveloptool model="radxa-cm3-io" release_num="27" desktop="xfce" platform="linux" loader="rk356x_spl_loader_v1.15.113.bin">

<ol>
    <li>将 CM3 安装到 CM3 IO 板上</li>
    <li>移除（拔出）CM3 IO 板上的 MicroSD 卡</li>
    <li>在上电前按住 CM3 上的 SPI Disable 按键，并保持按住</li>
    <li>将 USB-A 转 Micro-USB 连接线插入 CM3 IO 板的 OTG 端口（Micro-USB 端口），另一端插入电脑</li>
    <li>插入 DC 12V 电源为 CM3 IO 板供电；如果电源绿灯常亮，则已成功进入 Maskrom 模式（此时可松开按键）</li>
</ol>

<img src="/img/cm3/cm3-button.webp" alt="cm3 core button" style={{ width: "40%" }} />
<img src="/img/cm3/cm3-with-io.webp" alt="cm3 io with cm3" style={{ width: "40%" }} />

</Rkdeveloptool>
