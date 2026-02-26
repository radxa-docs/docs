---
sidebar_position: 3
---

# Install the system to eMMC

If your Radxa ROCK 5T has onboard eMMC, you can use the `dd` command to write the system image to eMMC while booting from a MicroSD card.

:::tip Important Notes
Installing the system will format the eMMC. Please back up any important data in advance!

If your system cannot currently boot from a MicroSD card, you can refer to the [Install OS to MicroSD Card](./boot_from_sd_card.md) tutorial.
:::

## Prerequisites

You will need the following hardware:

- Board: Radxa ROCK 5T
- Boot medium: MicroSD card
- Power adapter: Standard DC 12V/2A power adapter (DC-5525 interface)

We will boot the system from the MicroSD card, download the system image file after entering the system, and then use the `dd` command to write the system image to eMMC.

:::tip Recommended Accessories
Radxa ROCK 5T only supports 12V power input, and a current of 2A or higher is recommended to ensure stable operation of all peripherals.

- [Radxa DC12 36W Power Adapter](https://radxa.com/products/accessories/power-dc12-36w) (Recommended)
- [Radxa DC12 60W Power Adapter](https://radxa.com/products/accessories/power-dc12-60w)
- Standard 12V/2A DC power adapter (DC5525 interface)
  :::

## Download System Image

You can download the system image file by visiting the [Resource Download Center](../../download) page on your board.

:::tip Download Recommendations
We provide the following methods to download the system image file to your board. Please choose the appropriate method based on your situation:

- Using `wget` command

You can copy the system image file link from the [Resource Download Center](../../download) page and use the `wget` command on your board to download it.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo apt install wget
wget [url]
# Example
wget https://github.com/radxa-build/rock-5t/releases/download/rsdk-b2/rock-5t_bookworm_kde_b2.output.img.xz
```
</NewCodeBlock>
Parameter explanation: Replace `[url]` with the actual system image download link.

- PC Download

You can download the system image file from the [Resource Download Center](../../download) page on your PC, then transfer it to the board using a USB drive, FTP, SCP, or other methods.

:::

## Install System

Use the `dd` command to install the system image to eMMC.

:::tip Note
The downloaded system image file is compressed and needs to be extracted before use.
:::

### Extract System Image

Use the `unxz` command to extract the system image file.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo apt install xz-utils
unxz [image_path]
# Example
unxz ~/rock-5t_bookworm_kde_b2.output.img.xz
```
</NewCodeBlock>
Parameter explanation: Replace `[image_path]` with the actual path to the system image file.

### Write System Image

Use the `dd` command to write the extracted system image to eMMC.

:::danger
When using the `dd` command, make sure to select the correct device file to avoid formatting the wrong device and causing data loss!
:::

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo dd if=[image_path] of=/dev/mmcblk0 bs=4M status=progress
# Example
sudo dd if=~/rock-5t_bookworm_kde_b2.output.img of=/dev/mmcblk0 bs=4M status=progress
```
</NewCodeBlock>
Parameter explanation:
- `if`: Specify the input file. Replace `[image_path]` with the path to the extracted system image file.
- `of`: Specify the output device. Replace `/dev/mmcblk0` with the device file corresponding to your eMMC (please modify according to your actual device).
- `bs`: Block size, recommended 4M.
- `status=progress`: Show write progress.

### Verify System Image

After writing the system image, you can use the `fdisk` command to view the partition information of the boot medium to confirm if the system image was written successfully.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo fdisk -l /dev/mmcblk0
```
</NewCodeBlock>

If the system was written successfully, the terminal will output partition information similar to the following:

```text
Disk /dev/mmcblk0: 119.15 GiB, 127934660608 bytes, 31234048 sectors
Disk model: KLUDG4UHDC-B0E1
Units: sectors of 1 \* 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 524288 bytes
Disklabel type: gpt
Disk identifier: 33349998-C3CC-40F0-B818-DDDD8383A64D

Device Start End Sectors Size Type
/dev/mmcblk0p1 32768 65535 32768 128M Linux filesystem
/dev/mmcblk0p2 65536 679935 614400 2.3G EFI System
/dev/mmcblk0p3 679936 31234014 30554079 116.6G EFI System
```

## Boot the System

After completing the system installation, power off the board, remove the MicroSD card, and then reconnect the power adapter. The system will automatically boot from eMMC.

## System Information

When using our provided system image, you will need to log in with the following default credentials:

- Debian Linux

Username: radxa

Password: radxa
