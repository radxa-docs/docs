---
sidebar_position: 3
description: "Windows 下通过 USB 刷机"
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";

# Windows 主机

## 文件下载

请到[资源汇总](../../download)部分下载对应的系统镜像以及 Loader

<Rkdevtool rkdevtool_emmc_img="/img/common/rkdevtool/rkdevtool_genenal_maskrom_flash.webp" loader_name="rk356x_spl_loader_ddr1056_v1.10.111.bin" emmc={false} pcie={false} sata={false} >

<ol>
    <li>把 CM3 安装到 IO 板上</li>
    <li>移除 MicroSD 卡</li>
    <li>按住 SPI Disable 按键</li>
    <li>将 USB-A 转 MicroUSB 连接线插入 Radxa CM3 IO OTG 端口（Micro USB 端口），另一端插入电脑</li>
    <li>插入电源线上电，如果电源绿灯常亮则成功进入 Maskrom 模式</li>
</ol>

<img src="/img/cm3/cm3-button.webp" alt="cm3 core button" style={{ width: "40%" }} />
<img src="/img/cm3/cm3-with-io.webp" alt="cm3 io with cm3" style={{ width: "40%" }} />

</Rkdevtool>
