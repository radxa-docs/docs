---
sidebar_position: 4
description: "Empty eMMC or SPI Flash via Maskrom"
---

import ERASE from "../../../../../common/dev/\_erase-spi-emmc.mdx";

# Erase eMMC or SPI Flash

<ERASE loader="https://dl.radxa.com/rock3/images/loader/radxa-cm3-io/rk356x_spl_loader_ddr1056_v1.10.111.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<ol>
    <li>Install the CM3 onto the CM3 IO board</li>
    <li>Remove (unplug) the MicroSD card from the CM3 IO board</li>
    <li>Before powering on, press and hold the SPI Disable button or the eMMC Disable button on the CM3, and keep it pressed</li>
    <li>Connect a USB-A to Micro-USB cable to the OTG port (Micro-USB port) on the CM3 IO board, and the other end to the computer</li>
    <li>Connect the DC 12V power supply to power the CM3 IO board; if the green power LED stays on, it has successfully entered Maskrom mode (you can release the button at this point)</li>
</ol>

:::tip
To erase eMMC, press and hold SPI Disable button; to erase SPI Flash, press and hold eMMC Disable button.
:::

<img src="/img/cm3/cm3-button.webp" alt="cm3 core button" style={{ width: "40%" }} />
<img src="/img/cm3/cm3-with-io.webp" alt="cm3 io with cm3" style={{ width: "40%" }} />

</ERASE>
