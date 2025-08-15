---
sidebar_position: 2
---

# Without an M.2 M Key NVMe SSD enclosure

This section mainly describes how to use the `dd` command to burn a system image to an M.2 M Key 2230 NVMe SSD without an M.2 M Key NVMe SSD enclosure.

:::warning
Installing the system will format the NVMe SSD. Please back up any important data in advance!
:::

## Prerequisites

You need to prepare the following hardware devices in advance:

- Motherboard: Radxa Dragon Q6A
- System boot media: MicroSD card
- System target media: M.2 M Key 2230 NVMe SSD
- Power adapter: 12V Type-C power adapter (compatible with PD protocol)

Note: We need to boot the motherboard normally using the MicroSD card, then use the `dd` command to install the system image onto the NVMe SSD.

:::tip Recommended accessories

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard 12V Type-C power adapter, current 2A or above recommended
  :::

## Hardware Connection

Install the M.2 M Key 2230 NVMe SSD into the NVMe SSD interface on the motherboard.

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_nvme_boot.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

## Download system image

You can access the [Resource Summary Download](../../../download) page on the motherboard to download the system image file.

:::tip Download Recommendations
We provide the following methods for downloading system image files to the motherboard. You can choose the appropriate method based on your actual situation:

- Download using the `wget` command

You can copy the system image file link from the [Resource Summary Download](../../../download) page, and then use the `wget` command to download it on the motherboard.

```
sudo apt install wget
wget [url]
```

Parameter explanation: Replace `[url]` with the actual system image file download link.

- PC download

You can access the [Resource Summary Download](../../../download) page on a PC to download the system image file, then transfer the system image file to the motherboard via USB drive, FTP, SCP, etc.

:::

## Extract the system image

:::tip Explanation
The downloaded system image file is a compressed package and must be decompressed before use.
:::

Use the `unxz` command to decompress the system image file.

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo apt install xz-utils
unxz [image_path]
```

</NewCodeBlock>
Parameter explanation: Replace `[image_path]` with the actual system image file path.

## Install the system image

Use the `dd` command to install the system image on the NVMe SSD.

### Write the system image

:::danger
When using the `dd` command, make sure to select the correct device file, otherwise you will format the wrong device and cause data loss!
:::

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo dd if=[image_path] of=/dev/*** bs=4M status=progress
```

</NewCodeBlock>
Parameter description:
- `if`: Specifies the file to write to. Replace `[image_path]` with the path of the unzipped system image file.
- `of`: Specifies the device to write to. Replace `/dev/***` with the device corresponding to the system boot media (please modify according to the actual device).
- `bs`: Block size. Recommended parameter: 4M. - `status=progress`: Displays the write status.

:::tip Determine the system boot media device file

The device file names vary depending on the boot media used for different systems. The following are common device file names for boot media:

- eMMC module: `/dev/mmcblk*`
- UFS module: `/dev/sda*`
- NVMe SSD: `/dev/nvme*n*`

The most effective method: You can use the `lsblk` command to compare the device list changes between when the system boot media is installed and when it is not installed, thereby determining the device file name corresponding to the system boot media.

**Note: When installing or removing the system boot media (such as UFS modules, NVMe SSDs, etc.), you must power off the motherboard before performing the operation to avoid data or hardware damage caused by hot-swapping.**
:::

### Verify the system image

After writing the system image, you can use the `fdisk` command to view the partition information of the system boot media to determine whether the system image has been written successfully.

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo fdisk -l /dev/***
```

</NewCodeBlock>

If the system writes successfully, the terminal will output information similar to the following:

```
Disk /dev/\*\*\*: 119.15 GiB, 127934660608 bytes, 31234048 sectors
Disk model: KLUDG4UHDC-B0E1
Units: sectors of 1 \* 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 524288 bytes
Disklabel type: gpt
Disk identifier: 33349998-C3CC-40F0-B818-DDDD8383A64D

Device Start End Sectors Size Type
/dev/**_ 32768 65535 32768 128M Linux filesystem
/dev/_** 65536 679935 614400 2.3G EFI System
/dev/\*\*\* 679936 31234014 30554079 116.6G EFI System
```

## Modify grub settings

:::tip

Refer to the NVMe boot section in [Modify system boot disk boot options](../boot_option)

:::

## Power on and boot
