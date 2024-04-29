---
sidebar_position: 2
---

import Etcher from '../../../common/general/\_etcher.mdx'
import NVME from '../../../common/dev/\_nvme.mdx'
import Rkdeveloptool from "../../../common/dev/\_rkdeveloptool.mdx";
import RKDevTool from "../../../common/dev/\_rkdevtool.mdx"

# Installing the operating system

## Preparation

- 1x microSD card (capacity >=8GB)
- 1x microSD card reader
- 12V DC power adapter

## Image Download

Please download [this image](https://github.com/radxa-build/rock-5-itx/releases/download/test-build-2/rock-5-itx_debian_bullseye-test_kde_test-build-2 .img.xz), this document is used as an example.

:::tip
Please go to [Resource Download Summary](../getting-started/download) for more mirrors.
:::

## Installing the system

<Tabs queryString="install-os">
    <TabItem value="MicroSD">
        <Etcher model="rock5itx" product="Radxa ROCK 5 ITX" power_supply="12V DC"/>
    </TabItem>
    <TabItem value="eMMC">
        <h3>Enter Maskrom mode</h3>
        <ol>
            <li>Remove the microSD card and power cord</li>
            <li>Press and hold the Maskrom button</li>
            <li>Connect the USB of the PC host via USB-A to USB-C cable, and if a device is detected on the PC side, it will enter the Maskrom mode (the OTG connector of the Radxa ROCK 5 ITX is TYPE-C, so you can connect the host to the motherboard that enters the Maskrom mode through the USB-C to USB-A cable for communication).</li>
        </ol>
        <img src="/img/rock5itx/rock5itx-maskrom-new.webp" alt="maskrom new version" width="500" />
        <Tabs queryString="maskrom">
        <TabItem value="Windows">
            <p>If the operation is normal, RKDevTool will prompt `A MASKROM device was found`:</p>
            <img src="/img/configuration/rkdevtool-zh-maskrom.webp" alt="RKDevTool zh maskrom" />
        </TabItem>
        <TabItem value="Linux">
            <p>If the operation is normal, `rkdeveloptool ld` will prompt to enter MASKROM mode:</p>
            <pre><code>PC:~$ sudo rkdeveloptool ld
        DevNo=1 Vid=0x2207,Pid=0x350b,LocationID=109 Maskrom
        </code></pre>
        </TabItem>
        </Tabs>
        <p>In Maskrom mode, you can use <a href="rkdevtool">rkdevtool</a> or <a href="upgrade-tool">upgrade-tool</a> to erase, wire-flush, etc. your product. </p>
        <h3>Installing the System to eMMC</h3>
        <Tabs queryString="install-os-emmc-using-maskrom">
        <TabItem value="Windows">
            <RKDevTool series="rock5" />
        </TabItem>
        <TabItem value="Linux">
            <Rkdeveloptool series="rock5"/>
        </TabItem>
        </Tabs>
        <h3>Boot system</h3>
        <ul>
            <li>Power up the system using the 12V DC power adapter, then the system starts booting and HDMI displays the desktop. </li>
        </ul>
    </TabItem>
    <TabItem value="NVME">
        <NVME model="rock-5-itx" release_num="b3" install_os_path="../getting-started/install-os" rsetup_path="../os-config/rsetup" />
    </TabItem>
</Tabs>

:::tip
The entire process of powering up the system and booting it up lasts about 53 seconds before it enters the system desktop.
:::
