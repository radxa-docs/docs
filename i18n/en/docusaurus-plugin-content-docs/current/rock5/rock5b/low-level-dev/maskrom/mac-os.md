---
sidebar_position: 2
description: "Flash via Maskrom under MacOS"
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV2.mdx";
import Images from "../../\_image.mdx"

# Mac OS Host

## File Download

<Images loader={true} rock5b_system_img={true} rock5bp_system_img={true} spi_img={false} />

<Rkdeveloptool model="rock-5b" release_num="b39" desktop="kde" platform="macos" loader="rk3588_spl_loader_v1.08.111.bin">

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

</Rkdeveloptool>
