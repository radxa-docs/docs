---
sidebar_position: 4
description: "Empty eMMC or SPI Flash via Maskrom"
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# Clear eMMC or SPI Flash

<ERASE loader="https://dl.radxa.com/rock3/images/loader/radxa-cm3-io/rk356x_spl_loader_ddr1056_v1.10.111.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<ol>
    <li>Install the CM3 core board onto the CM3 IO Board</li>
    <li>Remove MicroSD Card</li>
    <li>Press and hold the SPI Disable button</li>
    <li>Connect the USB-A to Micro USB cable by plugging the Micro USB end into the Radxa CM3 IO OTG port (Micro USB port), and then plug the other USB-A end into your computer</li>
    <li>Plug in the power cable to power on the board. If the power LED is steadily illuminated, that indicates the board has successfully entered Maskrom mode</li>
</ol>

:::tip
To clear eMMC, press and hold SPI Disable button; to clear SPI Flash, press and hold eMMC Disable button.
:::

<img src="/img/cm3/cm3-button.webp" alt="cm3 core button" style={{ width: "40%" }} />
<img src="/img/cm3/cm3-with-io.webp" alt="cm3 io with cm3" style={{ width: "40%" }} />

</ERASE>
