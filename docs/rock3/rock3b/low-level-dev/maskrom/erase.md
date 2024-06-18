---
sidebar_position: 4
description: "通过 Maskrom 清除 eMMC 或者 SPI Flash"
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# 清除 eMMC 或者 SPI Flash

<ERASE loader="https://dl.radxa.com/rock5/sw/images/loader/rock-5a/rk3588_spl_loader_v1.15.113.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<ol>
    <li>移除 MicroSD 卡，插入 eMMC</li>
    <li>将 USB 3.0 座子下方的拨码开关调至 device 侧</li>
    <li>短接 Maskrom 引脚，其位于 USB 3.0 座子和以太网中间</li>
    <li>使用 USB-A 转 USB-A 线从 OTG 端口连接 PC 主机</li>
    <li>插入电源线上电，如果电源绿灯常亮则成功进入 Maskrom 模式</li>
</ol>

<img src="/img/rock3/3b/rock3b-maskrom-wire.webp" alt="rock 3b maskrom wire" width="500" />

</ERASE>
