---
sidebar_position: 1
---

# Install OS on eMMC

## Preparation

## Image download

## Enter Maskrom Mode

<Tabs queryString="model">
<TabItem value="zero-3w" label="ZERO 3W">

![ZERO 3W Overview](/img/zero/zero3/radxa_zero_3w.webp)

How to enter Maskrom mode on Radxa ZERO 3W

1. Remove the microSD card and power cable
2. Press and hold the Maskrom button on the back of the
3. Connect the USB of PC host via USB-A to USB-C cable, if the green light of the power supply is always on, it will enter the Maskrom mode successfully

</TabItem>
<TabItem value="zero-3e" label="ZERO 3E">

![ZERO 3E Overview](/img/zero/zero3/radxa_zero_3e.webp)

How to enter Maskrom mode on Radxa ZERO 3E

1. Remove the microSD card and power cable
2. Connect the USB of PC host via USB-A to USB-C cable, if the green light of the power supply is always on, it will enter the Maskrom mode successfully

</TabItem>
</Tabs>

The OTG interface on the Radxa ZERO 3 is TYPE-C, which allows communication between the host computer and the motherboard entering the Maskrom via a USB-C to USB-A cable.

In Maskrom mode, you can use the [rkdevtool](rkdevtool) or [upgrade-tool](upgrade-tool) to erase, wire-flash, etc. your product.

## Install OS on eMMC

[Windows Flash eMMC](rkdevtool)

[Linux Flash eMMC](rkdeveloptool)

## Boot the system

- Power the board via [USB 2.0 OTG Type C port](../hardware-design/hardware-interface). Then board will start up with the led blink.

:::tip
Radxa ZERO 3 only supports `5V` power supply.Radxa Recommended [Radxa Power PD30W](../../../accessories/power/pd_30w).
:::

## FAQ
