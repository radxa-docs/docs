---
sidebar_position: 3
---

# Without an M.2 NVMe SSD Enclosure

This guide explains how to install the system on an M.2 NVMe SSD without using an external SSD enclosure.

This method involves booting the Cubie A7A from a MicroSD card and then using the `dd` command to install the system image to the M.2 NVMe SSD.

:::warning
Installing the system will format the M.2 NVMe SSD. Please back up any important data before proceeding!

Booting from an M.2 NVMe SSD requires using it with a PCIe to M.2 M Key HAT expansion board.
:::

## Hardware Requirements

Prepare the following hardware in advance:

- Single Board Computer: Radxa Cubie A7A
- Boot media: MicroSD card
- Installation target: M.2 NVMe SSD
- Expansion board: PCIe to M.2 M Key HAT
- Power adapter: 5V Type-C power adapter

The Cubie A7A supports standard PD protocol 5V power input. A power adapter with 3A or higher current is recommended to ensure stable operation of all peripherals.

## Hardware Connection

After confirming that the Cubie A7A has successfully booted from the MicroSD card, install the M.2 NVMe SSD into the PCIe to M.2 M Key HAT expansion board on the Cubie A7A.

## System Installation

Use the `dd` command to install the system image to the M.2 NVMe SSD.

### Download System Image

Go to the [Downloads](../../../download) page to download and extract the system image file to your Cubie A7A.

:::tip
Recommended methods to download the system image to your Cubie A7A:

- **Browser Download**
  Access the [Downloads](../../../download) page through the web browser on your Cubie A7A to download the system image.

- **Using `wget`**
  Copy the download URL from the [Downloads](../../../download) page and use the `wget` command on your Cubie A7A to download the system image.

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo apt install wget
wget [url]
```
</NewCodeBlock>
Replace `[url]` with the actual download URL.

- **Alternative Methods**
  Download the system image on your PC, then transfer it to the Cubie A7A using a USB drive, FTP, SCP, or other methods.
  :::

### Install System Image

Use the `dd` command to install the extracted system image to the M.2 NVMe SSD.

### Write System Image

:::danger
When using the `dd` command, make absolutely sure you've selected the correct device file. Using the wrong device can result in data loss!
:::

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo dd if=[image_path] of=/dev/nvme0n1 bs=4M status=progress
```
</NewCodeBlock>

Parameter explanation:

- `if`: Input file - replace `[image_path]` with the path to your extracted system image
- `of`: Output file - replace `/dev/nvme0n1` with the correct device file for your M.2 NVMe SSD (modify according to your actual device)
- `bs`: Block size - 4M is recommended
- `status`: Shows progress during the operation

### Verify the Write Operation

Use the `fdisk` command to check the partition information of the M.2 NVMe SSD.

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo fdisk -l /dev/nvme0n1
```
</NewCodeBlock>

After a successful write, the terminal will display partition information similar to:

```
Disk /dev/nvme0n1: 119.15 GiB, 127934660608 bytes, 31234048 sectors
Disk model: KLUDG4UHDC-B0E1
Units: sectors of 1 * 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 524288 bytes
Disklabel type: gpt
Disk identifier: 33349998-C3CC-40F0-B818-DDDD8383A64D

Device Start End Sectors Size Type
/dev/nvme0n1p1 32768 65535 32768 128M Linux filesystem
/dev/nvme0n1p2 65536 679935 614400 2.3G EFI System
/dev/nvme0n1p3 679936 31234014 30554079 116.6G EFI System
```

## System Information

When using our provided system image for the first time, you'll need to log in with the following default credentials:

- **Username**: radxa
- **Password**: radxa
