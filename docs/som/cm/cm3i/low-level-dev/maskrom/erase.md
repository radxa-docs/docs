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

<ERASE loader="https://dl.radxa.com/rock3/images/loader/rock-3b/rk356x_spl_loader_ddr1056_v1.10.111.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rkdevtool_erase_all.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rkdevtool_erase_all.webp">

<ol>
    <li>移除底板上的 MicroSD 卡</li>
    <li>同时按住 CM3I 上的 Maskrom Button （SPI Flash） 和 Maskrom Button （eMMC）并保持</li>
    <li>使用 USB-A 转 USB-A 线从 OTG 端口连接 PC 主机</li>
    <li>接入电源,即可进入 MASKROM 模式</li>
</ol>
<img src="/img/cm3i/cm3i-overview.webp" alt="cm3i module" style={{ width: "80%" }} />
<img src="/img/cm3i/cm3i-io-otg-connection.webp" alt="cm3i module" style={{ width: "80%" }} />

</ERASE>
