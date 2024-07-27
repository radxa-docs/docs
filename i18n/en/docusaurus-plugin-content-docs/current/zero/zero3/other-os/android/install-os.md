---
sidebar_position: 2
---

# System installation

Introduces how to install Android os on ZERO 3

## Image download

Please go to [Resource Download Summary](/zero/zero3/other-os/android/download) to download the corresponding image file

## Install OS

There are two main methods to install the operating system depends on where you want board to boot from.

**Boot from SD Card** (**recommended**)

- Install the system image to a MicroSD card via a card reader

**Boot from eMMC OnBoard**

- Using a USB cable to write the system image directly to eMMC.

:::caution Note
If the board doesn't come with eMMC, you can't boot from eMMC, such as Radxa ZERO 3E.
:::

<Tabs queryString="install-method">
<TabItem value="install-os-on-microsd-card" label="Install OS on microSD card">

### Install OS On microSD Card

#### Preparation

- 1x microSD Card（Capacity size >= 8GB）
- 1x SD card Reader
- 1x 5V Power Supply (Radxa Recommended [Radxa Power PD30W](/accessories/pd_30w))

#### Install OS

1. Insert MicroSD Card into SD Card reader, and then insert SD card Reader into PC's USB Port

2. [Download](https://etcher.balena.io/) Flash tool `Etcher`.
   ![ROCK5A via Etcher 01](/img/rock5a/rock5a-etcher.webp)

3. Open Etcher and flash the prepared operating system image to the microSD card. In the Etcher window, click `Flash from file` to select the operating
   system image you just downloaded.
   ![ROCK5A via Etcher 02](/img/rock5a/rock5a-etcher-1.webp)

4. In the Etcher window, click `Select target`.
   ![ROCK5A via Etcher 03](/img/rock5a/rock5a-etcher-2.webp)

5. In the Etcher window, click `Flash!` and wait for the flash progress bar to flash.
   ![ROCK5A via Etcher 04](/img/rock5a/rock5a-etcher-3.webp)

6. In the Etcher window, `Flash Complete!` will be displayed when the flash is successful.
   ![ROCK5A via Etcher 05](/img/rock5a/rock5a-etcher-4.webp)

**If there is an error in flashing, please try again. **

</TabItem>

<TabItem value="install-os-on-emmc-onboard" label="Install OS on eMMC onboard">

### Install OS on eMMC OnBoard

#### Preparation

- 1x USB Cable with one end USB C and one end USB A.
  <img src="/img/common/usb-cable-usb-a-usb-c.webp" width = "400" alt="USB Cable"/>
- 1x 5V Power Supply. Radxa Recommended [Radxa Power PD30W](/accessories/pd_30w).

#### Install OS

##### Enter MaskRom

Press the [Maskrom Button](/zero/zero3/hardware-design/hardware-interface), and then connect the ZERO 3W's OTG Type C port to the PC's USB port, then release the Maskrom Key.
![zero3w](/img/zero/zero3/radxa_zero_3w.webp)

##### My PC is Windows

&emsp;[Install OS via rkdevtool](../../low-level-dev/rkdevtool)

##### My PC is Linux / macOS

&emsp;[Install OS via rkdeveloptool](../../low-level-dev/rkdeveloptool)

&emsp;[Install OS via upgrade_tool](../../low-level-dev/upgrade-tool)(Install OS on Multiple devices at the same time)

</TabItem>
</Tabs>

## Boot the system

#### Boot from SDcard

- Insert the SDCard (System OS inside) on the board's sdcard slot, and power the board via
  [USB 2.0 OTG Type C port](/zero/zero3/hardware-design/hardware-interface). Then board will start up with the led blink.

#### Boot from eMMC

- Power the board via [USB 2.0 OTG Type C port](/zero/zero3/hardware-design/hardware-interface). Then board will start up with the led blink.

:::tip
Radxa ZERO 3 only supports `5V` power supply.Radxa Recommended [Radxa Power PD30W](/accessories/pd_30w).
:::

## FAQ
