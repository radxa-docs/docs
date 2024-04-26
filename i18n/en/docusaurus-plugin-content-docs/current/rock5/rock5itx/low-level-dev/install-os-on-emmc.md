---
sidebar_position: 1
---

import Rkdeveloptool from "../../../common/dev/\_rkdeveloptool.mdx".
import RKDevTool from "../../../common/dev/\_rkdevtool.mdx"

# Install the system to EMMC

## Preparation

- 1x USB cable (USB C on one end, USB A on the other)
- 1x 12V DC power adapter

## Image Download

Go to [Resource Download Summary](../getting-started/download) to download the image file.

## Enter Maskrom mode

1. Disconnect the microSD card and power cord.
2. Press and hold the Maskrom button
3. Connect the USB of PC host via USB-A to USB-C cable, if the PC detects a device, it will enter into Maskrom mode (the OTG port of Radxa ROCK 5 ITX is TYPE-C, so you can connect the host via USB-C to USB-A cable to communicate with the motherboard entering into Maskrom).
   
<img src="/img/rock5itx/rock5itx-maskrom-new.webp" alt="maskrom new version" width="500" />

<Tabs queryString="maskrom">

<TabItem value="Windows">

If it works, RKDevTool will prompt ``A MASKROM device was found``:

   <img src="/img/configuration/rkdevtool-zh-maskrom.webp" alt="RKDevTool zh maskrom" />
</TabItem

<TabItem value="Linux">

If the operation is normal, `rkdeveloptool ld` will prompt to enter MASKROM mode:

```
PC:~$ sudo rkdeveloptool ld
DevNo=1 Vid=0x2207,Pid=0x350b,LocationID=109 Maskrom
```

</TabItem>

</Tabs>

In Maskrom mode, you can use [rkdevtool](rkdevtool) or [upgrade-tool](upgrade-tool) to erase, wire-flash, etc. your product.

## Install system to eMMC

<Tabs queryString="install-os-emmc-using-maskrom">

<TabItem value="Windows">

<RKDevTool />

</TabItem

<TabItem value="Linux">

<Rkdeveloptool />

</TabItem>

</Tabs>

## Booting the system

- Power up the system using the 12V DC power adapter, then the system starts booting and HDMI displays the desktop.

## Frequently Asked Questions
