---
sidebar_position: 3
---

# Without Radxa eMMC/UFS Combo Module Reader

This guide explains how to install the system to a UFS module without using the Radxa eMMC/UFS Combo Module Reader.

This method involves booting the Cubie A7A from a MicroSD card and then using the `dd` command to install the system image to the UFS module.

:::warning
Installing the system will format the UFS module. Please back up any important data before proceeding!
:::

## Hardware Requirements

Prepare the following hardware in advance:

- Single Board Computer: Radxa Cubie A7A
- Boot media: MicroSD card
- Installation target: UFS module
- Power adapter: 5V Type-C power adapter

The Cubie A7A supports 5V power input with PD protocol. A power adapter with 3A or higher current is recommended to ensure stable operation of all peripherals.

:::tip Recommended Accessories

- [Radxa UFS Module](https://radxa.com/products/accessories/ufs-module)
- [Radxa 30W PD Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## Hardware Connection

After confirming that the Cubie A7A has successfully booted from the MicroSD card, install the UFS module into the eMMC/UFS combo module interface of the Cubie A7A.

:::caution

### UFS Module Installation Steps:

1. Ensure the notch on the UFS module aligns with the notch on the Cubie A7A's eMMC/UFS combo module interface
2. Align the bottom edge connector of the UFS module with the eMMC/UFS combo module interface on the Cubie A7A
3. Gently press down on one end of the UFS module until you hear a "click" sound, then repeat the process for the other end to ensure the module is properly seated.
   :::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/cubie/a7a/a7a-ufs-write-system.webp" style={{width: '100%', maxWidth: '1200px'}} alt="UFS module installation diagram" />
</div>

## System Installation

Use the `dd` command to install the system image to the UFS module.

### Download System Image

Go to the [Downloads](../../../download) page to download and extract the system image file to your Cubie A7A.

:::info Download Methods
Recommended methods to download the system image to your Cubie A7A:

- **Browser Download**
  Access the [Downloads](../../../download) page through the web browser on your Cubie A7A to download the system image.

- **Using `wget`**
  Copy the download URL from the [Downloads](../../../download) page and use the `wget` command on your Cubie A7A to download the system image.

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

Use the `dd` command to install the extracted system image to the UFS module.

### Write System Image

:::danger
When using the `dd` command, make absolutely sure you've selected the correct device file. Using the wrong device can result in data loss!
:::

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```bash
sudo dd if=[image_path] of=/dev/sda bs=4M status=progress
```
</NewCodeBlock>

Parameter explanation:

- `if`: Input file - replace `[image_path]` with the path to your extracted system image
- `of`: Output file - replace `/dev/sda` with the correct device file for your UFS module (modify according to your actual device)
- `bs`: Block size - 4M is recommended
- `status`: Shows progress during the operation

### Verify the Write Operation

Use the `fdisk` command to check the partition information of the UFS module.

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```bash
sudo fdisk -l /dev/sda
```
</NewCodeBlock>

After a successful write, the terminal will display partition information similar to:

```text
Disk /dev/sda: 119.15 GiB, 127934660608 bytes, 31234048 sectors
Disk model: KLUDG4UHDC-B0E1
Units: sectors of 1 * 4096 = 4096 bytes
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

When using our provided system image for the first time, you'll need to log in with the following default credentials:

- **Username**: radxa
- **Password**: radxa
