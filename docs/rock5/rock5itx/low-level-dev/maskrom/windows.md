---
sidebar_position: 3
description: "Windows 下通过 Maskrom 刷机"
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";
import Images from "../../_image.mdx"

# Windows 主机

## 文件下载

<Images loader={true} system_img={true} spi_img={true} />

<Rkdevtool rkdevtool_emmc_img="/img/rkdevtool/emmc-path.webp" loader_name="rk3588_spl_loader_v1.08.111.bin" emmc={false} pcie={false} sata={false} >
<ol>
    <li>拔出 microSD 卡和电源线</li>
    <li>按住 Maskrom 按钮</li>
    <li>通过 USB-A 转 USB-C 线连接PC 主机的 USB，如果如果PC端检测到有设备，则进入到 Maskrom 模式（Radxa ROCK 5 ITX 的 OTG 接口是 TYPE-C,可通过 USB-C 转 USB-A 线连接主机和进入 Maskrom 的主板进行通信）</li>
</ol>
<img src="/img/rock5itx/rock5itx-maskrom-new.webp" alt="maskrom new version" width="500" />
</Rkdevtool>
