---
sidebar_position: 2
---

import InstallCoreBoard from "../../../\_install_uninstall_coreboard_guide.mdx";

# Quick Start

## Packing List

<Tabs queryString="versions">
    <TabItem value="Radxa CM3 Core Board">
        <img src="/img/cm3/cm3-package.webp" alt="Radxa CM3 Core Board" style={{ width: "80%" }} />
    </TabItem>
    <TabItem value="Radxa CM3 IO Board">
        <img src="/img/cm3/cm3-io-package.webp" alt="Radxa CM3 IO Board" style={{ width: "80%" }} />
    </TabItem>
</Tabs>

<Tabs queryString="versions">
    <TabItem value="Radxa CM3 Core Board">
        The standard package for Radxa CM3 includes:
        - Radxa CM3 Core Board
    </TabItem>
    <TabItem value="Radxa CM3 IO Board">
        The standard package for Radxa CM3 IO Board includes:
        - Radxa CM3 IO Board
    </TabItem>
</Tabs>

To start using the Radxa CM3 IO Board, you will also need the following:

- A power adapter (DC 12V recommended). The Radxa CM3 IO Board also supports PoE. For more power supply details, refer to the [Power Supply section](./power-supply).
- An HDMI cable and a monitor that supports HDMI, preferably with a resolution of 1080P or higher. A 4K monitor will provide the best experience.
- A set of USB mouse and keyboard; common USB input devices are supported plug-and-play.
- An Ethernet cable for network connectivity during system updates.

Optional peripherals to enhance the basic functionality of the Radxa CM3 IO Board:

- Heat sink, refer to [Heat Sink Selection](./interface-usage/fan) for installation instructions.

## assembly

<InstallCoreBoard />

## Installing the Operating System

Refer to the [Operating System Installation](./install-os/) section for OS installation steps.

## Connection and Power On

1. Connect any HDMI output port of the Radxa CM3 IO Board to an HDMI monitor using an HDMI cable.

<img src="/img/cm3/cm3-io-hdmi-connect.webp" alt="cm3 io board hdmi" style={{ width: "80%" }} />

2. Connect a USB mouse and keyboard to any USB 2.0 or 3.0 port on the Radxa CM3 IO Board.

<img src="/img/cm3/cm3-io-usb.webp" alt="cm3 io board usb" style={{ width: "80%" }} />

3. Connect the Ethernet cable to the Ethernet port.

<img src="/img/cm3/cm3-io-ethernet-connect.webp" alt="cm3 io board ethernet" style={{ width: "80%" }} />

4. Insert the power adapter into the power port of the Radxa CM3 IO Board. The device powers on, and the power indicator displays green. Once the boot process starts, the indicator begins to blink.

<img src="/img/cm3/cm3-io-pwr.webp" alt="cm3 io board pwr" style={{ width: "80%" }} />

:::tip

From powering on to booting into the desktop, the entire process takes approximately 40 seconds.

:::
