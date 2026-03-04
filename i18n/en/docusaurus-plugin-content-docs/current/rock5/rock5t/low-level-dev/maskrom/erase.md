---
sidebar_position: 4
description: "Empty eMMC or SPI Flash via Maskrom"

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - i18n/en/docusaurus-plugin-content-docs/current/common/dev/_erase-spi-emmc.mdx
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# Clear eMMC or SPI Flash

<ERASE loader="https://dl.radxa.com/rock5/sw/images/loader/rock-5a/rk3588_spl_loader_v1.15.113.bin"  loader_name="rk3588_spl_loader_v1.15.113.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<TabItem value="ROCK 5T">
        <ol>
            <li>Remove the microSD card and power cable.</li>
            <li>Press and hold the Maskrom button.</li>
            <li>Insert the USB A-C cable into the Type-C port of ROCK 5T, with the other end plugged into the computer. Power on the ROCK 5T; this should normally put it into Maskrom mode.</li>
        </ol>
        <img src="/img/rock5t/rock-5t-typec-maskrom.webp" alt="rock 5b maskrom wire" width="500" />
</TabItem>

</ERASE>
