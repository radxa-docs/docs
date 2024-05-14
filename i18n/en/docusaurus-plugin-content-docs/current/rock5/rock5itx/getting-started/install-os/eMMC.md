---
sidebar_position: 2
---

import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptool.mdx";
import RKDevTool from "../../../../common/dev/\_rkdevtool.mdx";

# Install the System to eMMC

## Enter Maskrom mode

<ol>
    <li>Remove the microSD card and power cord</li>
    <li>Press and hold the Maskrom button</li>
    <li>Connect the USB of the PC host via USB-A to USB-C cable, and if a device is detected on the PC side, it will enter into Maskrom mode (the OTG interface of Radxa ROCK 5 ITX is TYPE-C, so you can connect the host to the motherboard that enters into Maskrom through the USB-C to USB-A cable for communication).</li>
</ol>

<img src="/img/rock5itx/rock5itx-maskrom-new.webp" alt="maskrom new version" width="500" />

<Tabs groupId="platform" queryString="platform">
    <TabItem value="Windows">
        <p>If the operation is normal, RKDevTool will prompt `A MASKROM device was found`:</p>
        <img src="/img/configuration/rkdevtool-zh-maskrom.webp" alt="RKDevTool zh maskrom" />
    </TabItem>
    <TabItem value="Linux">
        <p>If the operation is normal, `rkdeveloptool ld` will prompt to enter MASKROM mode:</p>
        <pre>
            <code>PC:~$ sudo rkdeveloptool ld
            DevNo=1	Vid=0x2207,Pid=0x350b,LocationID=109	Maskrom </code>
        </pre>
    </TabItem>
</Tabs>

<p> In Maskrom mode, you can use <a href="../../low-level-dev/rkdevtool"> upgrade-tool </a> or <a href="../../low-level-dev/upgrade-tool"> upgrade-tool </a> to erase, wire-flash, etc. your product.</p>

## Installing the system

<Tabs groupId="platform" queryString="install the system">
    <TabItem value="Windows">
        <RKDevTool series="rock5" />
    </TabItem>
    <TabItem value="Linux">
        <Rkdeveloptool series="rock5"/>
    </TabItem>
</Tabs>

## Boot system

Power up the system using the 12V DC power adapter, then the system starts booting and HDMI displays the desktop.

:::tip
The entire process of powering up the system and booting it up lasts about 53 seconds before it enters the system desktop.
:::
