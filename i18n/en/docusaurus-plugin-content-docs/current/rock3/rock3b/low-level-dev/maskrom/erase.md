---
sidebar_position: 4
description: "Empty eMMC or SPI Flash via Maskrom"
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# Clear eMMC or SPI Flash

<ERASE loader="https://dl.radxa.com/rock3/images/loader/rock-3b/rk356x_spl_loader_ddr1056_v1.10.111.bin" loader_name="rk356x_spl_loader_ddr1056_v1.10.111.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<ol>
    <li>Remove MicroSD card, insert eMMC</li>
    <li>Set the dip switch below the USB 3.0 cradle to the device side.</li>
    <li>Short the Maskrom pin, which is located between the USB 3.0 cradle and the Ethernet.</li>
    <li>Connecting a PC host from the OTG port using a USB-A to USB-A cable</li>
    <li>Plug in the power cord and power up, if the green light of the power supply is always on, then it has successfully entered the Maskrom mode.</li>
</ol>

<img src="/img/rock3/3b/rock3b-otg.webp" alt="rock 3b otg" width="500" />
<img src="/img/rock3/3b/rock3b-maskrom.webp" alt="rock 3b maskrom wire" width="500" />

</ERASE>
