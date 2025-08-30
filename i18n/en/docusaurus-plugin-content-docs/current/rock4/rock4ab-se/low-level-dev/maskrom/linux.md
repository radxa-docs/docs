---
sidebar_position: 1
description: "Flashing via USB on Linux"
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV2.mdx";

# Linux Host

## File Downloads

Download the [ROCK 4A/4B/4SE system images](../../download) from the resource download page

<Rkdeveloptool model="rock-4se" release_num="38" desktop="xfce" platform="linux" loader="rk3399_loader_spinor_v1.15.114.bin">

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

</Rkdeveloptool>
