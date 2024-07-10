---
sidebar_position: 4
description: "Empty eMMC or SPI Flash via Maskrom"
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# Clear eMMC or SPI Flash

<ERASE loader="https://dl.radxa.com/rock5/sw/images/loader/rock-5a/rk3588_spl_loader_v1.15.113.bin" loader_name="rk3588_spl_loader_v1.15.113.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<ul>
    <li>Remove the microSD card and power cable</li>
    <li>Press and hold the Maskrom button</li>
    <li>Connect the USB of the PC host via USB-A to USB-C cable, and if a device is detected on the PC side, it will enter into Maskrom mode (the OTG interface of Radxa ROCK 5 ITX is TYPE-C, so you can connect the host to the motherboard that enters into Maskrom through the USB-C to USB-A cable for communication).</li>
</ul>

<img src="/img/rock5itx/rock5itx-maskrom-new.webp" alt="maskrom new version" width="500" />

</ERASE>
