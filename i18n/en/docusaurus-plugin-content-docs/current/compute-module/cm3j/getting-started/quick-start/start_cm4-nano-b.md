---
sidebar_position: 5
description: "Radxa CM3J + WaveShare CM4-NANO-B"
---

# Radxa CM3J + WaveShare CM4-NANO-B

## Preparation

:::tip
If you are using the WaveShare CM4-NANO-B IO board for the first time, be sure to read the official user manual for the [CM4-NANO-B](https://www.waveshare.net/wiki/CM4-NANO-B) from WaveShare.
:::

- Radxa CM3J Core Board + WaveShare CM4-NANO-B

<Tabs queryString="model">
    <TabItem value="CM3J Core Board">
        <img src="/img/cm3j/cm3j-core-package.webp" alt="cm3j" style={{ width: "60%" }} />
    </TabItem>
    <TabItem value="WaveShare CM4-NANO-B">
        <img src="/img/cm3j/waveshare-cm4-nano-b.webp" alt="cm3j" style={{ width: "60%" }} />
    </TabItem>
</Tabs>

- To start the Radxa CM3J + WaveShare CM4-NANO-B, the following items are also required:

  - DC 5V/3A Adapter.
  - An HDMI cable and a display that supports HDMI, with a recommended resolution of 1080P or higher. A 4K display will provide the best experience.
  - A set of USB mouse and keyboard, with common USB input devices supporting plug-and-play.
  - An Ethernet cable, as an internet connection is required for system updates.

:::tip
It is recommended to use the official [Radxa PD 30W Adapter](https://radxa.com/products/accessories/power-pd-30w) as the power adapter.
:::

## Assembly

<Tabs queryString="Assembly">

    <TabItem value="Installing the Core Board">

    First, align the four mounting holes on the core board with the **four mounting holes** on the io board. Then, gently press down **one side** to about halfway, followed by pressing the other side to halfway as well. After confirming that all slots are aligned, press down each side to the bottom in sequence.

    Note: ***When pressing, do not forcefully press down on the suspended area in the middle, as this may cause stress on the PCB, leading to component loosening or damage, such as DDR loosening or resistor breakage.***

    ![Precautions](/img/cm3j/install-core-board-on-cm4-nano-b.webp)

    </TabItem>

     <TabItem value="Removing the Core Board">
    Use tools similar to the following to pry it open from the four corners sequentially. Do not use your hands or tools to forcefully bend it open from the middle or a single side.

    ![Removing the Core Board](/img/cm3j/uninstall-core-board-on-cm4-nano-b.webp)
    </TabItem>

</Tabs>

## Choose Boot Method

Please refer to the [Install System](../install-os/) section to choose the method for booting your system according to your needs.

## Wiring and Powering On

1. Insert the SD card with the operating system flashed (using SD card boot as an example).

<img src="/img/cm3j/cm4-nano-b-sdcard.webp" width="500" alt="cm3j sdcard" />

2. Connect the HDMI0 output port of the WaveShare CM4-NANO-B IO Board to an HDMI display using an HDMI cable.

<img src="/img/cm3j/cm4-nano-b-hdmi-wire.webp" width="500" alt="cm3j hdmi" />

3. Connect the USB mouse and keyboard to the USB 2.0 ports of the WaveShare CM4-NANO-B IO Board using a USB hub.

<img src="/img/cm3j/cm4-nano-b-usb-wire.webp" width="500" alt="cm3j usb" />

4. Connect the Ethernet cable to the Ethernet port.

<img src="/img/cm3j/cm4-nano-b-ethernet-wire.webp" width="500" alt="cm3j ethernet" />

5. Plug the power adapter into the power interface of the WaveShare CM4-NANO-B IO Board. When the device is powered on, the green power indicator on the core board will light up.

<img src="/img/cm3j/cm4-nano-b-pwr-wire.webp" width="500" alt="cm3j pwr" />

:::tip

The system takes approximately 40 seconds to boot up after powering on. Once the system successfully starts, the green indicator light on the core board will change from a steady light to a blinking state.

:::

## Login to the System

After the system boots, the HDMI display shows the desktop.

<img src="/img/cm3j/cm3j-login.webp" alt="cm3j login" style={{ width: "60%"}} />

Log in using the username `radxa` and the password `radxa`.
