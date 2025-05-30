---
sidebar_position: 2
---

# Not Using M.2 NVMe SSD Enclosure

This tutorial is for users who don't have an M.2 NVMe SSD enclosure. It explains how to install the system to an M.2 NVMe SSD using a MicroSD card as the boot medium.

:::tip
An M.2 NVMe SSD refers to a solid-state drive that supports the M.2 interface and NVMe protocol.
:::

## Hardware Requirements

To install the system without an M.2 NVMe SSD enclosure, you'll need a Radxa ROCK 4D that can boot normally from a MicroSD card.

**Note: If the MicroSD card doesn't boot properly, please refer to the [Install System to MicroSD Card](../boot_sd) guide to install the system on a MicroSD card first.**

We'll operate within the system on the MicroSD card and use the `dd` command to install the system to the M.2 NVMe SSD.

**Note: Booting from an M.2 NVMe SSD requires a PCIe to M.2 M Key HAT.**

You will need the following hardware:

- Development board: Radxa ROCK 4D
- MicroSD card with a working system
- M.2 NVMe SSD: Purchase separately
- PCIe to M.2 M Key HAT: Purchase separately
- Power adapter: Type-C power adapter (PD protocol supported, 5V input, 2A or higher current recommended)

:::tip
The Radxa ROCK 4D motherboard only supports 5V power input. A current of 2A or higher is recommended to ensure stable operation of all peripherals.

Recommended power supplies:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)
- Standard Type-C power adapter (5V input, PD protocol supported, 2A or higher current recommended)
  :::

## Reinstalling the System

Reinstalling the system will format the M.2 NVMe SSD. Please back up any important data in advance.

### Download System Image

Download the Radxa ROCK 4D system image to your device: You can use the `wget` command to download the file to the current directory. The download link can be copied from the [Resource Downloads](../../../download) page.

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

1. Install the M.2 NVMe SSD onto the PCIe to M.2 M Key HAT
2. Install the PCIe to M.2 M Key HAT onto the Radxa ROCK 4D
3. Connect the power to the Radxa ROCK 4D

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-nvme-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Installing the System Image

#### Writing the System Image to M.2 NVMe SSD

Use the following command to extract the compressed system image and write it directly to the M.2 NVMe SSD. Modify the filename according to the actual system image you downloaded.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo xzcat ~/radxa-rk3576_bookworm_kde_t2.output_512.img.xz | sudo dd of=/dev/nvme0n1 bs=1M status=progress
```
</NewCodeBlock>

- xzcat: Decompresses the xz-format system image file
- dd: Copies and writes to the M.2 NVMe SSD device (⚠️Warning: Double-check the device name before using dd as incorrect device names may cause data loss)
- of=/dev/nvme0n1: Specifies the target device as nvme0n1 (modify according to your actual device)
- bs=1M: Sets the block size to 1M for faster writing
- status=progress: Shows the writing progress

#### Verifying the Write Result

After writing is complete, you can verify that the partition table on the M.2 NVMe SSD was created correctly:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo fdisk -l /dev/nvme0n1
```
</NewCodeBlock>

If successful, you should see partition information similar to the following:
<NewCodeBlock tip="radxa@radxa-4d$" type="device">

```
Disk /dev/nvme0n1: 465.76 GiB, 500107862016 bytes, 976773168 sectors
Disk model: Samsung SSD 980 500GB
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 16384 bytes / 131072 bytes
Disklabel type: gpt
Disk identifier: 9ABAF4B4-329B-41A8-908A-088211D43542

Device Start End Sectors Size Type
/dev/nvme0n1p1 32768 65535 32768 16M Linux filesystem
/dev/nvme0n1p2 65536 679935 614400 300M EFI System
/dev/nvme0n1p3 679936 15620800 14940865 7.1G EFI System
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
4. Reconnect power to the Radxa ROCK 4D
5. Wait for the system to boot from the M.2 NVMe SSD

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/boot-nvme-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

When the system boots, both the blue and green LEDs will light up simultaneously. After a few seconds, the green LED will stay lit while the blue LED will blink, indicating that the system has successfully booted.

## Verifying the System

After the system boots, you can check the system partition information using the `lsblk` command:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo lsblk
```
</NewCodeBlock>

If you see `/dev/nvme0n1p3` mounted as the root directory `/`, it means the system has successfully booted from the M.2 NVMe SSD.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
mtdblock0    31:0    0    16M  0 disk
zram0       253:0    0   1.9G  0 disk [SWAP]
nvme0n1     259:0    0 465.8G  0 disk
├─nvme0n1p1 259:1    0    16M  0 part /config
├─nvme0n1p2 259:2    0   300M  0 part /boot/efi
└─nvme0n1p3 259:3    0 465.4G  0 part /
```
</NewCodeBlock>

:::tip

If you encounter issues during the boot process, try the following solutions:

- System fails to boot:

  - Try reinstalling the M.2 NVMe SSD and boot again
  - Try [downloading and flashing the latest SPI boot firmware](../boot_start)
  - Try reinstalling the system to the M.2 NVMe SSD

- System boots but cannot log in:
  - Default username: radxa, password: radxa
  - If the password is incorrect, redownload the system image and reinstall to the M.2 NVMe SSD
    :::
