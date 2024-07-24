---
sidebar_position: 4
description: "Empty eMMC or SPI Flash via Maskrom"
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# Erase eMMC or SPI Flash

<ERASE loader="https://dl.radxa.com/rock3/images/loader/rock-3b/rk356x_spl_loader_ddr1056_v1.10.111.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rkdevtool_erase_all.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rkdevtool_erase_all.webp">

<ol>
    <li>Remove the MicroSD card from the base Board</li>
    <li>Simultaneously press and hold the Maskrom Button (SPI Flash) and Maskrom Button (eMMC) on the CM3I.</li>
    <li>Connect a PC host from the OTG port using a USB-A to USB-A cable</li>
    <li>Connect the power supply, you can enter the MASKROM mode</li>
</ol>
<img src="/img/cm3i/cm3i-overview.webp" alt="cm3i module" style={{ width: "80%" }} />
<img src="/img/cm3i/cm3i-io-otg-connection.webp" alt="cm3i module" style={{ width: "80%" }} />

</ERASE>
