---
sidebar_position: 1
---

# Using Radxa eMMC/UFS Combo Module Reader

This tutorial is for users who have a Radxa eMMC/UFS combo module reader. It explains how to install the system on a UFS module using the Radxa eMMC/UFS combo module reader.

## Hardware Requirements

Using the Radxa eMMC/UFS combo module reader to install the system doesn't require a MicroSD card. Simply insert the UFS module into the eMMC/UFS module reader and use the Etcher software to install the system to the UFS module.

**You will need the following hardware:**

- Development board: Radxa ROCK 4D
- [UFS Module](https://radxa.com/products/accessories/ufs-module)
- [Radxa eMMC/UFS Combo Module Reader](https://radxa.com/products/accessories/emmc-ufs-module-reader)
- Power adapter: Type-C power adapter (PD protocol supported, 5V input, 2A or higher current recommended)

:::tip
The Radxa ROCK 4D motherboard only supports 5V power input. A current of 2A or higher is recommended to ensure stable operation of all peripherals.

Recommended power supplies:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard Type-C power adapter (5V input, PD protocol supported, 2A or higher current recommended)
  :::

## Installing the System

Installing the system will format the UFS module. Please back up any important data in advance.

### Download System Image

On your PC, visit the [Resource Downloads](../../../download) page and find the system image for the UFS module.

After downloading, extract the system image file. The resulting `*.img` file is the system image file to be written to the UFS module.

:::tip
The downloaded system image is a compressed file that needs to be extracted before it can be installed to the UFS module using the image burning software. If you try to burn the compressed file directly to the UFS module, the system installation or boot may fail.
:::

### Hardware Connection

Insert the UFS module into the Radxa eMMC/UFS combo module reader, then connect the reader to your PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/write-ufs.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::caution

UFS Module Installation Steps:

1. Ensure the notch on the UFS module aligns with the reader's interface direction
2. Make sure the slot interface at the bottom of the UFS module is properly aligned with the Radxa eMMC/UFS combo module reader's interface
3. Gently press down on one end of the UFS module until you hear a click, then repeat for the other end to ensure the UFS module is properly installed.
   :::

### Installing the System Image

Use the open-source image burning tool Etcher to write the system image file to the UFS module.

#### Downloading Etcher

Go to the official Balena Etcher website and download the software for your platform: [balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Download the appropriate software package for your system platform and architecture.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Using Etcher

After downloading, double-click to open the Etcher application.

:::tip

- Windows

The downloaded file is an `*.exe` installer. Double-click to run the program.

- Linux

It's recommended to download the `*.zip` archive. After extraction, double-click the program to run it.

- macOS

Download the appropriate `*.dmg` file for your system architecture. Double-click to open it, then drag the application to the Applications folder to install. After installation, double-click the application icon to run it.

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### Installing the System Image

1. Select the Image File

Click the `Flash from file` option and select the system image file you downloaded and extracted earlier.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. Select the Target Device

Click the `Select target` option and choose the storage device where you want to install the system image.

:::danger
Be careful not to select the wrong storage device, as Etcher will format the selected device, which could result in data loss!

You can plug and unplug storage devices to observe changes in the available devices to help identify the correct target device.
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Select the storage device where you want to install the system image

② : Click the `Select 1` option to confirm your device selection

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. Install the System Image

Click the `Flash` option and wait for the software to automatically install and verify the system image.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system installation to complete
  <img src="/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system verification to complete
  <img src="/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
  After successfully installing the system image, close the Etcher software!
</div>

## System Information

When using our provided system image, you'll need to log in with the following default credentials on first boot:

- Debian Linux

Username: radxa

Password: radxa

## Booting the System

After completing the system image installation:

1. Remove the UFS module from the Radxa eMMC/UFS combo module reader
2. Remove any MicroSD card from the Radxa ROCK 4D
3. Install the UFS module onto the eMMC/UFS module interface of the Radxa ROCK 4D
4. Connect power to the Radxa ROCK 4D
5. Wait for the system to boot from the UFS module

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-ufs.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::caution

UFS Module Installation Steps:

1. Ensure the notch on the UFS module aligns with the eMMC/UFS module interface on the Radxa ROCK 4D
2. Make sure the slot interface at the bottom of the UFS module is properly aligned with the eMMC/UFS module interface on the Radxa ROCK 4D
3. Gently press down on one end of the UFS module until you hear a click, then repeat for the other end to ensure the UFS module is properly installed.
   :::

When the system boots, both the blue and green LEDs will light up simultaneously. After a few seconds, the green LED will stay lit while the blue LED will blink, indicating that the system has successfully booted.

## Verifying the System

After the system boots, you can check the system partition information using the `lsblk` command:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo lsblk
```
</NewCodeBlock>

If you see `/dev/sda3` mounted as the root directory `/`, it means the system has successfully booted from the UFS module.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
NAME      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda         8:0    0 119.1G  0 disk
├─sda1      8:1    0   128M  0 part /config
├─sda2      8:2    0   2.3G  0 part /boot/efi
└─sda3      8:3    0 116.6G  0 part /
mtdblock0  31:0    0    16M  0 disk
zram0     253:0    0   1.9G  0 disk [SWAP]
```
</NewCodeBlock>

:::tip

If you encounter issues booting from the UFS module, please try the following solutions:

- System cannot boot:

  - Try reinserting the UFS module and booting the system
  - Try [downloading and burning the latest SPI boot firmware](../boot_start)
  - Try reinstalling the system to the UFS module

- System can boot but cannot log in:
  - Default username: radxa, password: radxa
  - If the password is incorrect, download the system image and reinstall the system to the UFS module
    :::
