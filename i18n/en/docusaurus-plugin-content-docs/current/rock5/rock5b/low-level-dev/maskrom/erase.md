---
sidebar_position: 4
description: "Empty eMMC or SPI Flash via Maskrom"
---

import ERASE from "../../../../common/dev/\_erase-spi-emmc.mdx";

# Clear eMMC or SPI Flash

<ERASE loader="https://dl.radxa.com/rock5/sw/images/loader/rock-5a/rk3588_spl_loader_v1.15.113.bin" loader_name="rk3588_spl_loader_v1.15.113.bin"  rkdevtool_erase_emmc_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-eMMC.webp" rkdevtool_erase_spi_flash_img="/img/common/rkdevtool/rk3588-rkdevtool-erase-spi-flash.webp">

<Tabs queryString="versions">
    <TabItem value="ROCK 5B">
        <ol>
            <li>Remove the microSD card and power cable.</li>
            <li>Press and hold the Maskrom button.</li>
            <li>Insert the USB A-C cable into the Type-C port of ROCK 5B, with the other end plugged into the computer. This should normally put it into Maskrom mode.</li>
        </ol>
        <img src="/img/rock5b/rock-5b-typec-maskrom-400px.webp" alt="rock 5b maskrom wire" width="500" />
    </TabItem>
    <TabItem value="ROCK 5B+">
        <ol>
            <li>Remove the microSD card and power cable.</li>
            <li>Press and hold the Maskrom button.</li>
            <li>Insert the USB A-C cable into the Type-C port of ROCK 5B+, with the other end plugged into the computer. Power on the ROCK 5B+; this should normally put it into Maskrom mode.</li>
        </ol>
        <img src="/img/rock5b/rock-5bp-typec-maskrom.webp" alt="rock 5b maskrom wire" width="500" />
    </TabItem>
</Tabs>

</ERASE>
