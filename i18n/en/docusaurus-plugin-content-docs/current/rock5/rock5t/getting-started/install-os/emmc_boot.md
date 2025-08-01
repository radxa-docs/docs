---
sidebar_position: 3
---

# Install OS to eMMC Module

If your Radxa ROCK 5T has an onboard eMMC module, you can use the `dd` command to write the system image to the eMMC module while booting from a MicroSD card.

:::tip Note
Installing the system will format the eMMC module. Please back up any important data in advance!

If your system cannot currently boot from a MicroSD card, you can refer to the [Install OS to MicroSD Card](./boot_from_sd_card.md) tutorial.
:::

## Prerequisites

You will need the following hardware:

- Board: Radxa ROCK 5T
- System boot media: MicroSD card
- Power adapter: Standard DC 12V/2A power adapter (DC-5525 interface)

We need to boot the board system from a MicroSD card, download the system image file after entering the board system, and then use the `dd` command to write the system image to the eMMC module.

:::tip Recommended Accessories
Radxa ROCK 5T only supports 12V power input. A current of 2A or higher is recommended to ensure stable operation of all peripherals.

- [Radxa DC12 36W Power Adapter](https://radxa.com/products/accessories/power-dc12-36w) (Recommended)
- [Radxa DC12 60W Power Adapter](https://radxa.com/products/accessories/power-dc12-60w)
- Standard 12V/2A DC power adapter (DC5525 interface)
  :::

## Download System Image

You can download the system image file by visiting the [Resource Download Center](../../download) page on the board.

:::tip Download Suggestions
We provide the following methods to download the system image file to the board. You can choose the appropriate method according to your actual situation:

- Download using `wget` command

You can copy the system image file link from the [Resource Download Center](../../download) page and use the `wget` command to download it on the board.

```
sudo apt install wget
wget [url]
```

Parameter explanation: Replace `[url]` with the actual system image file download link.

- PC Download

You can download the system image file on your PC by visiting the [Resource Download Center](../../download) page, and then transfer the system image file to the board via USB flash drive, FTP, SCP, etc.
:::

## Install System

Use the `dd` command to install the system image to the eMMC module.

:::tip Note
The downloaded system image file is a compressed package and needs to be extracted before use.
:::

### Write System Image

Use the `dd` command to write the extracted system image file to the eMMC module.

:::danger
When using the `dd` command, make sure to select the correct device file, otherwise it may format the wrong device, resulting in data loss!
:::

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo dd if=[image_path] of=/dev/mmcblk1 bs=4M status=progress
```
</NewCodeBlock>
Parameter explanation:
- `if`: Specify the input file, replace `[image_path]` with the path to the extracted system image file
- `of`: Specify the output device, replace `/dev/mmcblk1` with the device file corresponding to the eMMC module (please modify according to the actual device)
- `bs`: Block size, recommended 4M
- `status=progress`: Show write progress

### Verify System Image

After writing the system image, you can use the `fdisk` command to view the partition information of the target boot medium to confirm whether the system image was written successfully.

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo fdisk -l /dev/mmcblk1
```
</NewCodeBlock>

If the system is successfully written, the terminal will output partition information similar to the following:

```
Disk /dev/mmcblk1: 119.15 GiB, 127934660608 bytes, 31234048 sectors
Disk model: KLUDG4UHDC-B0E1
Units: sectors of 1 \* 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 524288 bytes
Disklabel type: gpt
Disk identifier: 33349998-C3CC-40F0-B818-DDDD8383A64D

Device Start End Sectors Size Type
/dev/mmcblk1p1 32768 65535 32768 128M Linux filesystem
/dev/mmcblk1p2 65536 679935 614400 2.3G EFI System
/dev/mmcblk1p3 679936 31234014 30554079 116.6G EFI System
```

## Boot System

After completing the system installation, power off the board, unplug the MicroSD card, and then reconnect the power adapter. The system will automatically boot from the eMMC module.

## System Information

When using our provided system image, you need to log in to the system using the username and password we set for the first time.

- Debian Linux

Username: radxa

Password: radxa
