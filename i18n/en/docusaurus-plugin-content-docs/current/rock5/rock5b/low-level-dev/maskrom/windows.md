---
sidebar_position: 3
description: "Flash via Maskrom under  Windows"
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";
import Images from "../../\_image.mdx"

# Windows Host

## File Download

<Images loader={true} rock5b_system_img={true} rock5b_system_img_61={true} rock5bp_system_img={true} spi_img={true} />

<Rkdevtool rkdevtool_emmc_img="/img/rock5b/rock-5bp-rkdevtool-maskrom-flash-system.webp" loader_name="rk3588_spl_loader_v1.08.111.bin" emmc={false} pcie={false} sata={false} >

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

</Rkdevtool>
