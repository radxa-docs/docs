---
sidebar_position: 3
description: "Windows 下通过 USB 刷机"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/dev/_rkdevtoolV2.mdx
  - docs/rock3/rock3b/_image.mdx
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";
import Images from "../../\_image.mdx"

# Windows 主机

## 文件下载

<Images loader={true} system_img={true} spi_img={true} />

<Rkdevtool rkdevtool_emmc_img="/img/rock3/3b/rock-3b-rkdevtool-maskrom-flash-system.webp" loader_name="rk356x_spl_loader__v1.15.113.bin" emmc={false} pcie={false} sata={false} >

<ol>
    <li>移除 MicroSD 卡，插入 eMMC</li>
    <li>将 USB 3.0 座子下方的拨码开关调至 device 侧</li>
    <li>短接 Maskrom 引脚，其位于 USB 3.0 座子和以太网中间</li>
    <li>使用 USB-A 转 USB-A 线从 OTG 端口连接 PC 主机</li>
    <li>插入电源线上电，如果电源绿灯常亮则成功进入 Maskrom 模式</li>
</ol>
<img src="/img/rock3/3b/rock3b-otg.webp" alt="rock 3b otg" width="500" />
<img src="/img/rock3/3b/rock3b-maskrom.webp" alt="rock 3b maskrom wire" width="500" />

</Rkdevtool>
