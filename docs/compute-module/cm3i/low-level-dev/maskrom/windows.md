---
sidebar_position: 3
description: "Windows 下通过 USB 刷机"
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";
import Images from "../../\_image.mdx"

# Windows 主机

## 文件下载

<Images loader={true} system_img={true} spi_img={true} />

<Rkdevtool rkdevtool_emmc_img="/img/cm3i/cm3i-io-rkdevtool-maskrom-flash-system.webp" loader_name="rk356x_spl_loader__v1.15.113.bin" emmc={false} pcie={false} sata={false} >

<ol>
    <li>移除底板上的 MicroSD 卡</li>
    <li>同时按住 CM3I 上的 Maskrom Button （SPI Flash） 和 Maskrom Button （eMMC）并保持</li>
    <li>使用 USB-A 转 USB-A 线从 OTG 端口连接 PC 主机</li>
    <li>接入电源,即可进入 MASKROM 模式</li>
</ol>

<img src="/img/cm3i/cm3i-overview.webp" alt="cm3i module" style={{ width: "80%" }} />
<img src="/img/cm3i/cm3i-io-otg-connection.webp" alt="cm3i module" style={{ width: "80%" }} />

</Rkdevtool>
