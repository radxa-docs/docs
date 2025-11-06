---
sidebar_position: 4
description: "Erase eMMC or SPI Flash via Maskrom"
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# Erase eMMC or SPI Flash

<ERASE loader="https://dl.radxa.com/rockpi4/images/loader/spi/rk3399_loader_spinor_v1.15.114.bin"  loader_name="rk3399_loader_spinor_v1.15.114.bin" rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<Tabs queryString="model">

    <TabItem value="With onboard eMMC">

Disconnect the board power and remove the MicroSD card.

Detailed steps:

① If the board has SPI Flash, connect the corresponding SPI Flash pins to GND

② Use a USB Type-A to USB Type-A cable to connect the board and computer

③ Press and hold the Maskrom button before powering the board

④ Power the board using the power adapter

⑤ Release the Maskrom button after the board is powered

<img src="/en/img/rock4/rock4-maskrom-onboard-emmc.webp" alt="rock 4 maskrom button" style={{ width: "80%" }} />

    </TabItem>

    <TabItem value="Without onboard eMMC">

Disconnect the board power and remove bootable media (such as MicroSD card and eMMC module, etc.).

Detailed steps:

① If the board has SPI Flash, connect the corresponding SPI Flash pins to GND

② Use a USB Type-A to USB Type-A cable to connect the board and computer

③ Power the board using the power adapter

④ Install the eMMC module

<img src="/en/img/rock4/rock4-maskrom-no-board-emmc.webp" alt="rock 4 with no button maskrom wire" style={{ width: "80%" }} />

    </TabItem>

</Tabs>

If the board power LED stays solid green, it indicates successful entry into Maskrom mode.
</ERASE>
