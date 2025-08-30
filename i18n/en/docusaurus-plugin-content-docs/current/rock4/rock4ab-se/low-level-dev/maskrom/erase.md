---
sidebar_position: 4
description: "Erase eMMC or SPI Flash via Maskrom"
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# Erase eMMC or SPI Flash

<ERASE loader="https://dl.radxa.com/rockpi4/images/loader/spi/rk3399_loader_spinor_v1.15.114.bin"  loader_name="rk3399_loader_spinor_v1.15.114.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<Tabs queryString="model">

    <TabItem value="With onboard eMMC">

        <ol>
            <li>Remove the MicroSD card and disconnect the power</li>
            <li>If there is an SPI Nor Flash on the board, short the SPI Nor Flash pins</li>
            <li>Connect to the PC host using a USB-A to USB-A cable from the OTG port</li>
            <li>Press and hold the Maskrom button</li>
            <li>Connect the power cable while holding the button, then release the Maskrom button. If the power LED stays solid green, you've successfully entered Maskrom mode</li>
        </ol>

        <img src="/img/rock4/rock4p-maskrom_button.webp" alt="rock 4 maskrom button" style={{ width: "80%" }} />

    </TabItem>

    <TabItem value="Without onboard eMMC">

        <ol>
            <li>Remove the MicroSD card and disconnect the power</li>
            <li>If there is an SPI Nor Flash on the board, short the SPI Nor Flash pins</li>
            <li>Connect to the PC host using a USB-A to USB-A cable from the OTG port</li>
            <li>Connect the power cable. If the power LED stays solid green, you've successfully entered Maskrom mode</li>
            <li>Insert the eMMC module</li>
        </ol>

    </TabItem>

</Tabs>

<img src="/img/rock4/rock4-maskrom.webp" alt="rock 4 with no button maskrom wire" style={{ width: "80%" }} />

</ERASE>
