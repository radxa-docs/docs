---
sidebar_position: 2
description: "Flashing via USB on macOS"
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV2.mdx";

# macOS Host

## File Downloads

Download the [ROCK 4A/4B/4SE system images](../../download) from the resource download page

<Rkdeveloptool model="rock-4se" release_num="38" desktop="xfce" platform="macos" loader="rk3399_loader_spinor_v1.15.114.bin">

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

<img src="/en/img/rock4/rock4-maskrom-no-board-emmc.webp" alt="rock 4 with no button maskrom wire" style={{ width: "80%" }} />

    </TabItem>

</Tabs>

If the board power LED stays solid green, it indicates successful entry into Maskrom mode.

</Rkdeveloptool>
