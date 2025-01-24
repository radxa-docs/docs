---
sidebar_position: 2
description: "Radxa CM3J + Raspberry Pi Compute Module 4 IO Board"
---

import InstallCoreBoard from "../../../\_install_uninstall_coreboard_on_rpi-cm4-io_guide.mdx";

# Radxa CM3J + Raspberry Compute Module 4 IO Board

## Preparation

- Radxa CM3J Core Board + Raspberry Pi Compute Module 4 IO Base Board

<Tabs queryString="model">
    <TabItem value="CM3J Core Board">
        <img src="/img/cm3j/cm3j-core-package.webp" alt="cm3j" style={{ width: "60%" }} />
    </TabItem>
    <TabItem value="Raspberry Pi Compute Module 4 IO Board">
        <img src="/img/cm3j/rpi-cm4-io-package.webp" alt="cm3j" style={{ width: "60%" }} />
    </TabItem>
</Tabs>

- To start the Radxa CM3J + Raspberry Pi Compute Module 4 IO Board, the following items are also required:

  - DC 12V/3A Adapter.
  - An HDMI cable and a display that supports HDMI, with a recommended resolution of 1080P or higher. A 4K display will provide the best experience.
  - A set of USB mouse and keyboard, with common USB input devices supporting plug-and-play.
  - An Ethernet cable, as an internet connection is required for system updates.

:::tip
It is recommended to use the official power adapter [Power DC12 36W](https://radxa.com/products/accessories/power-dc12-36w)
:::

## Assembly

<InstallCoreBoard />

## Choose Boot Method

Please refer to the [Install System](../install-os/) section to choose the method for booting your system according to your needs.

## Wiring and Powering On

1. Insert the SD card with the operating system flashed (using SD card boot as an example).

<img src="/img/cm3j/cm3j-sdcard.webp" width="500" alt="cm3j sdcard" />

2. Connect the HDMI0 output port of the Raspberry Pi Compute Module 4 IO Board to an HDMI display using an HDMI cable.

<img src="/img/cm3j/cm3j-hdmi-wire.webp" width="500" alt="cm3j hdmi" />

3. Connect the USB mouse and keyboard to any USB 2.0 port on the Raspberry Pi Compute Module 4 IO Board.

<img src="/img/cm3j/cm3j-usb-wire.webp" width="500" alt="cm3j usb" />

4. Connect the Ethernet cable to the Ethernet port.

<img src="/img/cm3j/cm3j-ethernet-wire.webp" width="500" alt="cm3j ethernet" />

5. Plug the power adapter into the power interface of the Raspberry Pi Compute Module 4 IO Board. When the device is powered on, the green power indicator on the core board will light up.

<img src="/img/cm3j/cm3j-pwr-wire.webp" width="500" alt="cm3j pwr" />

:::tip

The system takes approximately 40 seconds to boot up after powering on. Once the system successfully starts, the green indicator light on the core board will change from a steady light to a blinking state.

:::

## LogIn to the System

After the system boots, the HDMI display shows the desktop.

<img src="/img/cm3j/cm3j-login.webp" alt="cm3j login" style={{ width: "60%"}} />

Log in using the username `radxa` and the password `radxa`.
