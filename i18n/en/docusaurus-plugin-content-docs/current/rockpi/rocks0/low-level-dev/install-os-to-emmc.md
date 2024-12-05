---
sidebar_position: 1
---

# Install OS to eMMC

## Preparation

- 1x [Radxa 4P to USB-A Male Cable](/rockpi/rocks0/getting-started/preparation#usb-otg-cable)

## Image Download

Please go to [Download Summary](../getting-started/download) to download the corresponding image file.

## Enter Maskrom mode

![ROCK S0 Overview](/img/rockpi/s0/mark_rock_pi_s0.webp)

How to enter Maskrom Mode of Radxa ROCK S0

1. Disconnect the microSD card and power.
2. Press and hold the Maskrom button on the front of the device.
3. Connect the OTG cable to the USB of the host PC, if the green light of the power supply is always on, it will enter the Maskrom mode successfully.

In Maskrom mode, you can use [rkdevtool](../low-level-dev/rkdevtool) or [upgrade-tool](../low-level-dev/upgrade-tool) to erase, wire-flash, etc. your product.

## Install the system to eMMC

[Installation for Windows](../low-level-dev/rkdevtool)

[Linux installation](../low-level-dev/rkdeveloptool)

## Boot the system

- Using [Radxa 4P to USB-A Male Cable](/rockpi/rocks0/getting-started/preparation#usb-otg-cable) to connect the 4-Pin USB2.0 OTG connector on the board to the power adapter, and then the system will start booting up with the green light blinking.

## FAQ
