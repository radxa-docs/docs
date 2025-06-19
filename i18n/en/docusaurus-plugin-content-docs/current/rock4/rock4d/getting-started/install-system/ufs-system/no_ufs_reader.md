---
sidebar_position: 2
---

# Without Using Radxa eMMC/UFS Combo Module Reader

This tutorial is for users who don't have a Radxa eMMC/UFS combo module reader. It explains how to install the system to a UFS module using a MicroSD card as the boot medium.

## Hardware Preparation

To install the system on a UFS module without a Radxa eMMC/UFS combo module reader, you'll need to have your Radxa ROCK 4D booting properly from a MicroSD card.

We'll be working within the system on the MicroSD card and use the `dd` command to install the system to the UFS module.

**Note:** If you're having issues booting from the MicroSD card, please refer to the [Install System to MicroSD Card](../boot_sd) tutorial first to install the system on a MicroSD card.

**You will need the following hardware:**

- Development board: Radxa ROCK 4D
- [UFS Module](https://radxa.com/products/accessories/ufs-module)
- Functional MicroSD card with bootable system
- Power adapter: Type-C power adapter (with PD protocol support, 5V input, 3A or higher recommended)

:::tip
The ROCK 4D mainboard only supports 5V power input. A minimum of 3A is recommended to ensure stable operation of all peripherals.

Recommended power supplies:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)

- Standard Type-C power adapter (5V input, with PD protocol support, 3A or higher recommended)
  :::

## Installing the System

Installing the system will format the UFS module. Please back up any important data before proceeding.

### Download System Image

Download the ROCK 4D system image file to your ROCK 4D device. You can use the `wget` command to download the file to the current directory. The download link can be obtained from the [Downloads Summary](../../../download) page.

:::tip
You can also transfer the system image file to your ROCK 4D using other methods such as FTP or SCP.
:::

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
# Install wget if not already installed
sudo apt-get install wget
# Download the system image file
wget [URL]
```
</NewCodeBlock>
- wget: Downloads files. Replace [URL] with the actual download link.

### Hardware Connection

Install the UFS module into the eMMC/UFS module interface on the motherboard, then power on the system using a 5V Type-C power adapter.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/boot-ufs-sd.webp" style={{width: '60%', maxWidth: '1200px'}} />
</div>

:::caution

UFS Module Installation Steps:

1. Ensure the notch on the UFS module aligns with the eMMC/UFS module interface on the ROCK 4D
2. Align the connector on the bottom of the UFS module with the eMMC/UFS module interface on the ROCK 4D
3. Gently press down on one end of the UFS module until you hear a click, then repeat for the other end to ensure secure installation
   :::

### Installing the System Image

#### Writing the System Image to UFS Module

Use the following command to extract and write the compressed system image directly to the UFS module. Modify the filename according to the actual system image you downloaded.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo xzcat ~/radxa-rk3576_bookworm_kde_b1.output_4096.img.xz | sudo dd of=/dev/sda bs=1M status=progress
```
</NewCodeBlock>

- xzcat: Extracts the xz-compressed system image file
- dd: Copies and writes to the UFS module (⚠️ Caution: Verify the device name when using the dd command as incorrect device names may cause data loss)
- of=/dev/sda: Specifies the target device as sda (modify according to your actual device)
- bs=1M: Sets the block size to 1M for faster writing
- status=progress: Shows the progress of the write operation

#### Verifying the Write Operation

After writing is complete, verify that the partition table was created correctly on the UFS module:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo fdisk -l /dev/sda
```
</NewCodeBlock>

If successful, you should see partition information similar to:

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

## System Information

When using our provided system image for the first time, you'll need to log in with the default username and password we've set up.

- Debian Linux

Username: `radxa`

Password: `radxa`

## Booting the System

After completing the system image installation:

1. Shut down the system: `sudo shutdown -h now`
2. Disconnect power from the ROCK 4D
3. Remove the MicroSD card
4. Reconnect the power
5. Wait for the system to boot from the UFS module

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/boot-ufs.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::caution

UFS Module Installation Steps:

1. Ensure the notch on the UFS module aligns with the eMMC/UFS module interface on the ROCK 4D
2. Align the connector on the bottom of the UFS module with the eMMC/UFS module interface on the ROCK 4D
3. Gently press down on one end of the UFS module until you hear a click, then repeat for the other end to ensure secure installation
   :::

When the system boots, both the blue and green LED indicators will light up. After a few seconds, the green LED will stay solid and the blue LED will blink, indicating that the system has successfully booted.

## Verifying the System

After the system boots, you can check the partition information using the `lsblk` command:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo lsblk
```
</NewCodeBlock>

If you see `/dev/sda3` mounted as the root directory `/`, it means the system has successfully booted from the UFS module.

```
NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
sda 8:0 0 119.1G 0 disk
├─sda1 8:1 0 128M 0 part /config
├─sda2 8:2 0 2.3G 0 part /boot/efi
└─sda3 8:3 0 116.6G 0 part /
mtdblock0 31:0 0 16M 0 disk
zram0 253:0 0 1.9G 0 disk [SWAP]
```

:::tip

If you encounter issues during the boot process, try the following solutions:

- If the system fails to boot:

  - Try reinstalling the UFS module and booting the system
  - Try [downloading and flashing the latest SPI boot firmware](../boot_start)
  - Try reinstalling the system to the UFS module

- If the system boots but you can't log in:
  - Default username: `radxa`, password: `radxa`
  - If the password is incorrect, redownload the system image and reinstall it to the UFS module
    :::
