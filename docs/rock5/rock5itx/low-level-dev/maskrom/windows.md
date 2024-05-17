---
sidebar_position: 3
description: "Windows 下通过 Maskrom 刷机"
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";

# Windows 主机

## 下载 Image

- Loader: <a href="https://dl.radxa.com/rock5/sw/images/loader/rock-5b/rk3588_spl_loader_v1.08.111.bin"> RK3588_SPL_Loader_v1.08.111.bin </a>
- 镜像: 从 <a href="../../download" > 资源下载汇总 </a> 下载一个镜像，这里以 rock-5-itx_debian_bullseye_kde_b3.img.xz 为例
- SPI Image: <a href="https://dl.radxa.com/rock5/5itx/images/spi_image.img" alt="spi image">Spi.image </a>

<Rkdevtool rkdevtool_emmc_img="/img/rkdevtool/emmc-path.webp" loader_name="rk3588_spl_loader_v1.08.111.bin" emmc={false} pcie={true} sata={false} >
<ol>
    <li>拔出 microSD 卡和电源线</li>
    <li>按住 Maskrom 按钮</li>
    <li>通过 USB-A 转 USB-C 线连接PC 主机的 USB，如果如果PC端检测到有设备，则进入到 Maskrom 模式（Radxa ROCK 5 ITX 的 OTG 接口是 TYPE-C,可通过 USB-C 转 USB-A 线连接主机和进入 Maskrom 的主板进行通信）</li>
</ol>
<img src="/img/rock5itx/rock5itx-maskrom-new.webp" alt="maskrom new version" width="500" />
</Rkdevtool>
