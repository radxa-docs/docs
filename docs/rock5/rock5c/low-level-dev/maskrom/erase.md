---
sidebar_position: 4
description: "通过 Maskrom 清除 eMMC 或者 SPI Flash"
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# 清除 eMMC 或者 SPI Flash

<ERASE loader="https://dl.radxa.com/rock5/sw/images/loader/rock-5a/rk3588_spl_loader_v1.15.113.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<ul>
    <li>拔出 microSD 卡和电源线</li>
    <li>安装 eMMC 或者 SPI Flash Module</li>
    <li>用杜邦线短接 Maskrom 针脚孔</li>
    <li>通过 USB-A to USB-A 线连接PC 主机的 USB，如果如果 PC 端检测到有设备，则进入到 Maskrom 模式（Radxa ROCK 5C 的 OTG 接口是位于上面的那个 USB 3.0 口 ,可通过 USB-A to USB-A 线连接主机和进入 Maskrom 的主板进行通信）</li>
</ul>

<img src="/img/rock5c/rock-5c-maskrom.webp" alt="rock 5c maskrom wire" width="500" />

</ERASE>
