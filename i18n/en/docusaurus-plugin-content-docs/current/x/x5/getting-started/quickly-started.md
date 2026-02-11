---
sidebar_position: 1
---

# Quick Start

This guide helps you get started with Radxa X5 quickly.

## Product Overview

| Position |     View      | Position |     View     | Position |     View     |
| :------: | :-----------: | :------: | :----------: | :------: | :----------: |
|   Left   | X5 Front View |  Center  | X5 Back View |  Right   | X5 Side View |

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

### Hardware

Prepare the following hardware:

- Board: Radxa X5
- Power: USB Type-C power adapter (PD / QC compatible) or a 12V DC power adapter
- Boot USB drive
- Target install drive: SSD (M.2 M Key 2230) or onboard eMMC
- Display: Micro HDMI to HDMI cable and a monitor (for GUI output)
- Input devices: keyboard and mouse (for GUI operation)

:::tip Recommended Accessories
Radxa X5 supports power input via USB Type-C (PD / QC compatible) or 12V DC. Use a sufficiently rated power adapter to ensure stable operation with peripherals.

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## Install an OS

You need to prepare a bootable USB drive first, then use it to install the OS onto the onboard eMMC or an NVMe SSD.

### Download an OS image

Choose an OS image that fits your needs. This guide uses Windows 11 as an example.

- [Windows 10](https://www.microsoft.com/software-download/windows10)
- [Windows 11](https://www.microsoft.com/zh-cn/software-download/windows11)
- [Ubuntu](https://ubuntu.com/download)
- [Debian](https://www.debian.org/download)
- [Fedora](https://fedoraproject.org/workstation/download)
- [FreeBSD](https://www.freebsd.org/where/)

### Create a bootable USB drive

Use [Rufus](https://rufus.ie/) to create a bootable USB drive.

#### Download Rufus

Go to [Rufus Downloads](https://rufus.ie/en/#download) and download Rufus.

#### Create the bootable drive

Open Rufus and follow the steps below:

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/rufus-windows-param.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

①: Select the USB drive

②: Select the downloaded OS image

③: Start

④: Customize Windows settings if prompted, then click `OK`

:::tip

Leave other options at their defaults unless you have specific requirements.

:::

#### Bootable drive created

Wait until Rufus finishes. It will show `Ready` when complete.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/rufus-windows-succ.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

### Install the OS

Plug the bootable USB drive into a USB Type-A port. Connect the monitor, keyboard, and mouse, then power on the board.

#### Enter the boot menu

After power-on, press `F7` to enter the boot menu, then select the USB boot entry.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-boot-menu.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Language

Select `English (United States)`, then click `Next`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-language.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Keyboard

Select `US`, then click `Next`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-keyboard.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Installation options

Select `Install Windows 11` and check `I agree ...`, then click `Next`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-install.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Product key

If you do not have a product key, click `I don't have a product key`. If you do, enter the key and click `Next`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-product-key.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Select an OS image

Select the image/edition you want to install, then click `Next`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-image.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Accept the license

Choose `Accept`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-accept.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Select installation destination

Select the destination drive, then click `Next`.

:::tip Installation destination

Radxa X5 can use onboard eMMC or an external M.2 M Key 2230 drive. You can usually identify the drive by its capacity.

:::

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-install-location.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Install

Click `Install` and wait for the installation to complete. The system may reboot during the process; this is normal.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-install-progress.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Region

Select `United States`, then click `Next`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-region.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Keyboard layout

Select `US`, then click `Next`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-keyboard-layout.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Network

You can connect via Ethernet to go online. Wi‑Fi may require drivers. This guide demonstrates an offline installation.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-network.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### User account

Enter the username, password, and confirmation password, then click `Next`.

:::tip Password

If you leave the password empty and click `Next`, Windows will set an empty password.

:::

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-user.webp" style={{width: '100%', maxWidth: '1200px'}} />
   <img src="/en/img/x/x5/x5-windows-password.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Privacy settings

Choose the privacy options you want, then click `Accept`.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-privacy.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Done

Wait a few minutes until you reach the Windows 11 desktop. The installation is complete.

<div style={{textAlign: 'center'}}>
   <img src="/en/img/x/x5/x5-windows-desktop.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
