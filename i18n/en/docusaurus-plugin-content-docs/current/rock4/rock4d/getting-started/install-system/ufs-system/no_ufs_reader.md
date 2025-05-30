---
sidebar_position: 2
---

# Not Using Radxa eMMC/UFS Combo Module Reader

This guide is for users who don't have a Radxa eMMC/UFS combo module reader. It explains how to install the system to a UFS module using a MicroSD card as the boot medium.

## Hardware Requirements

To install the system on a UFS module without a Radxa eMMC/UFS combo module reader, you'll need a Radxa ROCK 4D that can boot normally from a MicroSD card.

We'll be working within the system on the MicroSD card and use the `dd` command to install the system to the UFS module.

Note: If you encounter issues booting from the MicroSD card, please refer to the [Install System to MicroSD Card](../boot_sd) guide first to install the system on a MicroSD card.

**You will need the following hardware:**

- Development board: Radxa ROCK 4D
- [UFS Module](https://radxa.com/products/accessories/ufs-module)
- MicroSD card with a working system
- Power adapter: Type-C power adapter (PD protocol supported, 5V input, 2A or higher current recommended)

:::tip
The Radxa ROCK 4D motherboard only supports 5V power input. A current of 2A or higher is recommended to ensure stable operation of all peripherals.

Recommended power supplies:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard Type-C power adapter (5V input, PD protocol supported, 2A or higher current recommended)
  :::

## System Installation

Installing the system will format the UFS module. Please back up any important data in advance.

### Download System Image

Download the Radxa ROCK 4D system image to your Radxa ROCK 4D board: You can use the `wget` command to download the file to the current directory. The download link can be copied from the [Resource Downloads](../../../download) page.

:::tip
You can also transfer the system image to your Radxa ROCK 4D using other methods like FTP or SCP.
:::

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
# Install wget if not already installed
sudo apt-get install wget
# Download system image file
wget [URL]
```
</NewCodeBlock>
- wget: Downloads files. Replace [URL] with the actual download link.

### Hardware Connection

Install the UFS module into the eMMC/UFS module interface on the motherboard, then power on the system using a 5V Type-C power adapter.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-ufs-sd.webp" style={{width: '60%', maxWidth: '1200px'}} />
</div>

:::caution

UFS Module Installation Steps:

1. Ensure the notch on the UFS module aligns with the eMMC/UFS module interface on the Radxa ROCK 4D
2. Make sure the slot interface at the bottom of the UFS module is properly aligned with the eMMC/UFS module interface on the Radxa ROCK 4D
3. Gently press down on one end of the UFS module until you hear a click, then repeat for the other end to ensure the UFS module is properly installed.
   :::

### Installing the System Image

#### Writing the System Image to UFS Module

Use the following command to extract the compressed system image and write it directly to the UFS module. Modify the filename according to the actual system image you downloaded.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo xzcat ~/radxa-rk3576_bookworm_kde_b1.output_4096.img.xz | sudo dd of=/dev/sda bs=1M status=progress
```
</NewCodeBlock>

- xzcat: Decompresses the xz-format system image file
- dd: Copies and writes to the UFS module (⚠️Warning: Double-check the device name before using dd as incorrect device names may cause data loss)
- of=/dev/sda: Specifies the target device as sda (modify according to your actual device)
- bs=1M: Sets the block size to 1M for faster writing
- status=progress: Shows the writing progress

#### Verifying the Write Result

After writing is complete, you can verify that the partition table on the UFS module was created correctly:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo fdisk -l /dev/sda
```
</NewCodeBlock>

If successful, you should see partition information similar to the following:
<NewCodeBlock tip="radxa@radxa-4d$" type="device">

```
Disk /dev/sda: 119.15 GiB, 127934660608 bytes, 31234048 sectors
Disk model: KLUDG4UHDC-B0E1
Units: sectors of 1 \* 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 524288 bytes
Disklabel type: gpt
Disk identifier: 33349998-C3CC-40F0-B818-DDDD8383A64D

Device Start End Sectors Size Type
/dev/sda1 32768 65535 32768 128M Linux filesystem
/dev/sda2 65536 679935 614400 2.3G EFI System
/dev/sda3 679936 31234014 30554079 116.6G EFI System
```

</NewCodeBlock>

## System Information

When using our provided system image, you'll need to log in with the following default credentials on first boot:

- Debian Linux

Username: radxa

Password: radxa

## Booting the System

After completing the system image installation:

1. Shut down the system: `sudo shutdown -h now`
2. Disconnect power from the Radxa ROCK 4D
3. Remove the MicroSD card
4. Reconnect the power
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
NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
sda 8:0 0 119.1G 0 disk
├─sda1 8:1 0 128M 0 part /config
├─sda2 8:2 0 2.3G 0 part /boot/efi
└─sda3 8:3 0 116.6G 0 part /
mtdblock0 31:0 0 16M 0 disk
zram0 253:0 0 1.9G 0 disk [SWAP]
```
</NewCodeBlock>

:::tip

If you encounter issues during the boot process, try the following solutions:

- System fails to boot:

  - Try reinstalling the UFS module and booting again
  - Try [downloading and flashing the latest SPI boot firmware](../boot_start)
  - Try reinstalling the system to the UFS module

- System boots but cannot log in:
  - Default username: radxa, password: radxa
  - If the password is incorrect, redownload the system image and reinstall to the UFS module
    :::
