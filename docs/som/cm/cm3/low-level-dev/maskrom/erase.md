---
sidebar_position: 4
description: "通过 Maskrom 清除 eMMC 或者 SPI Flash"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/dev/_erase-spi-emmc.mdx
---

import ERASE from "../../../../../common/dev/\_erase-spi-emmc.mdx";

# 清除 eMMC 或者 SPI Flash

<ERASE loader="https://dl.radxa.com/rock3/images/loader/radxa-cm3-io/rk356x_spl_loader_ddr1056_v1.10.111.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<ol>
    <li>将 CM3 安装到 CM3 IO 板上</li>
    <li>移除（拔出）CM3 IO 板上的 MicroSD 卡</li>
    <li>在上电前按住 CM3 上的 SPI Disable 按键或按住 CM3 上的 eMMC Disable 按键，并保持按住</li>
    <li>将 USB-A 转 Micro-USB 连接线插入 CM3 IO 板的 OTG 端口（Micro-USB 端口），另一端插入电脑</li>
    <li>插入 DC 12V 电源为 CM3 IO 板供电；如果电源绿灯常亮，则已成功进入 Maskrom 模式（此时可松开按键）</li>
</ol>

:::tip
需要清理 eMMC，则按住 SPI Disable 按键； 需要清理 SPI Flash， 则按住 eMMC Disable 按键
:::

<img src="/img/cm3/cm3-button.webp" alt="cm3 core button" style={{ width: "40%" }} />
<img src="/img/cm3/cm3-with-io.webp" alt="cm3 io with cm3" style={{ width: "40%" }} />

</ERASE>
