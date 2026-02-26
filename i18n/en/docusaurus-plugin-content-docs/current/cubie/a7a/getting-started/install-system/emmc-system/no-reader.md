---
sidebar_position: 3
---

# Installing Without Radxa eMMC/UFS Combo Module Reader

This guide explains how to install the system to an eMMC module without using an eMMC/UFS combo module reader.

We'll be using the `dd` command to install the system image to the eMMC module while the Cubie A7A is booted from a MicroSD card.

:::warning
Installing the system will format the eMMC module. Please back up any important data in advance!
:::

## Hardware Requirements

Prepare the following hardware in advance:

- Mainboard: Radxa Cubie A7A
- Boot media: MicroSD card with system image
- Target installation media: eMMC module
- Power adapter: 5V Type-C power adapter

The Cubie A7A supports 5V power input with standard PD protocol. A power adapter with 3A or higher current is recommended to ensure stable operation of all peripherals.

:::tip Recommended Accessories

- [Radxa eMMC Module](https://radxa.com/products/accessories/emmc-module)
- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## Hardware Connection

After confirming that the Cubie A7A has successfully booted from the MicroSD card, install the eMMC module into the eMMC/UFS combo module interface of the Cubie A7A.

:::caution

### eMMC Module Installation Steps:

1. Ensure the notch on the eMMC module aligns with the notch on the Cubie A7A's eMMC/UFS combo module interface
2. Align the bottom edge connector of the eMMC module with the eMMC/UFS combo module interface on the Cubie A7A
3. Gently press down on one end of the eMMC module until you hear a "click" sound, indicating successful installation. Repeat the same process for the other end to ensure the eMMC module is properly seated.
   :::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-emmc-write-system.webp" style={{width: '100%', maxWidth: '1200px'}} alt="eMMC module installation diagram" />
</div>

## System Installation

Use the `dd` command to install the system image to the eMMC module.

### Download System Image

Go to the [Downloads](../../../download) page to download and extract the system image file to your Cubie A7A.

:::info Download Methods
Recommended methods to download the system image to your Cubie A7A:

- **Browser Download**
  Access the [Downloads](../../../download) page through the web browser on your Cubie A7A to download the system image.

- **Using `wget`**
  Copy the download URL from the [Downloads](../../../../download) page and use the `wget` command on your Cubie A7A to download the system image.

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```bash
sudo apt install wget
wget [url]
```
</NewCodeBlock>
Replace `[url]` with the actual download URL.

- **Alternative Methods**
  Download the system image on your PC, then transfer it to the Cubie A7A using a USB drive, FTP, SCP, or other methods.
  :::

### Install System Image

Use the `dd` command to install the extracted system image to the eMMC module.

### Write System Image

:::danger
When using the `dd` command, make absolutely sure you've selected the correct device file. Using the wrong device can result in data loss!
:::

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```bash
sudo dd if=[image_path] of=/dev/mmcblk1 bs=4M status=progress
```
</NewCodeBlock>

Parameter explanation:

- `if`: Input file - replace `[image_path]` with the path to your extracted system image
- `of`: Output file - replace `/dev/mmcblk1` with the correct device file for your eMMC module (modify according to your actual device)
- `bs`: Block size - 4M is recommended
- `status`: Shows progress during the operation

### Verify the Write Operation

Use the `fdisk` command to check the partition information of the eMMC module.

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```bash
sudo fdisk -l /dev/mmcblk1
```
</NewCodeBlock>

After a successful write, the terminal will display partition information similar to:

```text
Disk /dev/mmcblk1: 119.15 GiB, 127934660608 bytes, 31234048 sectors
Disk model: KLUDG4UHDC-B0E1
Units: sectors of 1 * 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 524288 bytes
Disklabel type: gpt
Disk identifier: 33349998-C3CC-40F0-B818-DDDD8383A64D

Device Start End Sectors Size Type
/dev/mmcblk1p1 32768 65535 32768 128M Linux filesystem
/dev/mmcblk1p2 65536 679935 614400 2.3G EFI System
/dev/mmcblk1p3 679936 31234014 30554079 116.6G EFI System
```

## System Information

When using our provided system image for the first time, you'll need to log in with the following default credentials:

- **Username**: radxa
- **Password**: radxa
