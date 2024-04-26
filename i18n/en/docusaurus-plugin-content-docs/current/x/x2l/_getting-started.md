---
sidebar_position: 10
---

# Getting Started

The Radxa X series is a newly launched single-board computer series by Radxa, based on the X86 platform.

:::warning
The Radxa X2L doesn't come with a CMOS battery. For the first time power on, the BIOS initializes hardware setting, the red light is on. This will last about 1 minute then X2L will reboot, and the white light is on, and the BIOS boots normally. Without CMOS battery(Type: CR1220), the above will repeat.
:::

## Activate Onboard eMMC

** Skip if No Onboard eMMC **

- By default, the eMMC is not recognized. It needs to be activated using the eMMC Recovery Button.
- Before powering on, press and hold the eMMC Recovery Button, then insert the power plug to start the device. Release the eMMC Recovery Button once the display lights up.
- At this point, the power indicator will be red, indicating that the system can now recognize and access the eMMC module.

## Install OS

### Before Start

- Radxa X2L

- USB Flash Drive with at least 8 GB

- [Rufus Install](https://rufus.ie/)

- M.2 M Key NVMe SSD as the system drive

- Ubuntu / Windows 10 ISO

- PC Host

- Display that supports HDMI interface

- Mouse and keyboard with USB support

- Power adapter with PD protocol support
  :::tip
  Radxa Recommends [Radxa Power PD30W](/accessories/pd_30w)。
  :::

### Burning ISO to USB Drive

- After downloading and installing Rufus, open the program. Next, insert the USB flash drive into the computer, and then choose the corresponding USB drive from the Rufus device list. Finally, select the ISO file you want to burn to demonstrate the burning process for Windows 10, with the burning process for Ubuntu being the same.

![install_rufus](/img/x/x2l/x-rufus.webp)

- After clicking Start, please wait patiently for the burning process to finish. If the burning is unsuccessful, try the operation again or switch to another USB flash drive.

### Operation Before Burning

![Radxa X2L Overview](/img/x/x2l/radxa_x2l_ports.webp)

- Gently insert the NVMe SSD into the corresponding M.2 M Key slot, and secure it in place using M2 x 4 flat-head screws.

- Insert the USB device, which has already been burned, into the USB 3.0 port.

- Connect the display to the HDMI port of Radxa X2L using an HDMI cable.

- Insert a mouse and keyboard into the USB 2.0 ports.

### Install OS

- Power on and start the system, then follow the process to install the image.

![install_win1](/img/x/x2l/x-win10_01.webp)

![install_win1](/img/x/x2l/x-win10_02.webp)

![install_win1](/img/x/x2l/x-win10_03.webp)

## [Install Driver](/x/x2l/driver)

## [BIOS Setting](/x/x2l/bios)

## [Use of accessories](/x/x2l/accessories/)

### [Heatsink 9010A](/x/x2l/accessories/heatsink-9010a)

### [Wireless Module](/x/x2l/accessories/wireless-module)

## [Hardware Information](/x/x2l/hardware/)

## [Software Development](/x/x2l/software-development)
