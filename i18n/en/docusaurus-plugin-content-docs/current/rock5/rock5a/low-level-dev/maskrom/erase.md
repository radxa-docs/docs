---
sidebar_position: 4
description: "Empty eMMC or SPI Flash via Maskrom"
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# Clear eMMC or SPI Flash

<ERASE loader="https://dl.radxa.com/rock5/sw/images/loader/rock-5a/rk3588_spl_loader_v1.15.113.bin" loader_name="rk3588_spl_loader_v1.15.113.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<ul>
    <li>Remove the microSD card and power cord</li>
    <li>Install the eMMC or SPI Flash Module </li>
    <li>Short the Maskrom pin hole with DuPont wire</li>
    <li>Connect the USB of the PC host via the USB-A to USB-A cable, and if a device is detected on the PC side, it will enter the Maskrom mode (the OTG connector of the Radxa ROCK 5A is the USB 3.0 port located on the top, which can be connected to the host via the USB-A to USB-A cable to communicate with the host board that enters the Maskrom)</li>
</ul>

<img src="/img/rock5a/rock5a-maskrom-wire.webp" alt="rock 5a maskrom wire" width="500" />

</ERASE>
