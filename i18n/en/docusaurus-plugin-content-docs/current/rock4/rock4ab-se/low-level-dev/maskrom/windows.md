---
sidebar_position: 3
description: "Flashing via USB on Windows"
---

import Rkdevtool from "../../../../common/dev/\_rkdevtoolV2.mdx";

# Windows Host

## File Downloads

- Download the [ROCK 4A/4B/4SE system images](../../download) from the resource download page

- [RK3399 Loader V1.27.126](https://dl.radxa.com/rockpi4/images/loader/rk3399_loader_v1.27.126.bin)

<Rkdevtool rkdevtool_emmc_img="/img/rock3/3b/rock-3b-rkdevtool-maskrom-flash-system.webp" loader_name="rk3399_loader_spinor_v1.15.114.bin" emmc={false} pcie={false} sata={false} >

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

</Rkdevtool>
