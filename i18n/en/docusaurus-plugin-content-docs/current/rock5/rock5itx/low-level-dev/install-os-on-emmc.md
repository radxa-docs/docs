---
sidebar_position: 1
---

# Install OS on eMMC

## Preparation

- 1x USB cable (USB C to USB A)
- 1x 12V DC Power Adapter

## Image download

Please [Resource Download Summary](/rock5/rock5itx/getting-started/download.md) download the image file

## Enter Maskrom Mode

1. Remove the microSD card and power cable
2. Press the Maskrom button
3. Connect the USB of PC host via USB-A to USB-C cable, If the PC detects a device, it enters into Maskrom mode
   ![Maskrom 按钮](/img/rock5itx/rock5itx-maskrom.webp)

The OTG connector on the Radxa ROCK 5 ITX is TYPE-C, which allows communication between the host computer and the motherboard entering the Maskrom via a USB-C to USB-A cable.

If the operation is normal, RKDevTool will prompt `A MASKROM device was found`:
![RKDevTool zh maskrom](/img/configuration/rkdevtool-zh-maskrom.webp)

If the operation is normal, `rkdeveloptool ld` will prompt to enter MASKROM mode:
![rkdeveloptool zh](/img/rock5itx/rock5itx-rkdeveloptool.webp)

In Maskrom mode, you can use the [rkdevtool](rkdevtool) or [upgrade-tool](upgrade-tool) to erase, wire-flash, etc. your product.

## Install OS on eMMC

[Windows Flash eMMC](rkdevtool)

[Linux Flash eMMC](rkdeveloptool)

## Boot the system

- Use the 12V DC power adapter to power up the system, then the system starts booting and HDMI displays the desktop.

## FAQ
