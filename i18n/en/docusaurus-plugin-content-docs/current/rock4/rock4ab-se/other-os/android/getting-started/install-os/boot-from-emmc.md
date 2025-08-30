---
sidebar_position: 2
---

import UPGRADE_TOOL from "../../../../../../common/dev/\_upgrade-tool.mdx";

# Installing System to eMMC

We can directly install the Android system into the eMMC module. Please refer to the [Installing System to MicroSD Card](./boot-from-sd) section.
This article mainly describes how to install the Android system in <strong>update format</strong> to the ROCK 4A/4B/4A+/4B+/4SE eMMC via Maskrom mode.

## File Downloads

Download the [ROCK 4A/4B/4SE system images](../../../../download) from the resource download page.

## Entering Maskrom Mode

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

## Installing the System

<Tabs queryString="platform">
    <TabItem value="MacOS/Linux">
        <ul>
            <li>Please download and extract the following file to install the upgrade_tool:</li>
            <ul>
                <li><a href="https://dl.radxa.com/tools/linux/Linux_Upgrade_Tool_V2.1.zip">upgrade_tool v2.1</a></li>
            </ul>
            <br />
            <li>Confirm that the development board has entered Maskrom mode</li>
            <br />
            <pre>
                $ sudo upgrade_tool ld
                Program Log will save in the /root/upgrade_tool/log/
                List of rockusb connected(1)
                DevNo=1	Vid=0x2207,Pid=0x330c,LocationID=19	Mode=Maskrom
                            </pre>
                            <li>Flash the update system image</li>
                            <br />
                            <pre>
                $ sudo upgrade_tool uf rock4xx-android-xx-update.img
            </pre>
            <li>The system will automatically boot after flashing is complete</li>
        </ul>
    </TabItem>
    <TabItem value="Windows">
        <ul>
            <li>Download and extract the following files to install RKDevTool:</li>
            <ul>
                <li><a href="https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96_zh.zip">RKDevTool v2.96</a> (includes Chinese documentation)</li>
                <li><a href="https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip">DriverAssistant v5.0</a></li>
            </ul>
            <br />
            <li>Select "Upgrade Firmware"</li>
            <li>Click "Firmware" to select the Android Image in <strong>update</strong> format</li>
            <li>Click "Upgrade"</li>
            <li>The system will automatically boot after flashing is complete</li>
            <img
                src="/img/rock4/rock4-rkdevtool-update-format-android-image.webp"
                style={{ width: "80%" }}
                alt="rock4 flash the update format image by rkdevtool"
            />
        </ul>
    </TabItem>
</Tabs>
