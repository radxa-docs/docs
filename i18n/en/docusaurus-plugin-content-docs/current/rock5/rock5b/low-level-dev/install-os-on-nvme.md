---
sidebar_position: 22
---

import Etcher from '../../../common/general/\_etcher.mdx'

# Install the system to NVME SSD

## Option 1: with NVME to USB3.0 reader or PC with NVME slot

### Preparation

- ROCK 5B main board
- 1x 5V power adapter (recommended [Radxa Power PD30W](../accessories/pd-30w))
- One M.2 NVME SSD
- NVME to USB3.0 reader or a PC with NVME slot

### Image Download

Please go to [Resource Download Summary](/rock5/rock5b/getting-started/download.md) to download the corresponding image file.

### Write the image to M.2 NVME SSD with etcher

<Etcher model="rock5b" />

## Option 2: Write to NVME SSD on ROCK 5B

### Preparation

- ROCK 5B main board
- 1x 5V power adapter (recommended [Radxa Power PD30W](../accessories/pd-30w))
- One M.2 NVME SSD
- NVME to USB3.0 reader or a PC with NVME slot
- SD card or eMMC module

### Install Debian Linux image to SD card or eMMC module

Please refer to the [System Installation Guide for SD Card/eMMC](../getting-started/install-os) to install the system to SD Card/eMMC.

### Boot from SD card or eMMC module on ROCK 5B with NVME SSD attached

### Download the ROCK 5B image when running Debian on ROCK 5B

### Check if NVME SSD is detected

On ROCK 5B:

```
sudo fdisk -l
```

You can see the output message just like this:

```
Disk /dev/nvme0n1: 232.9 GiB, 250059350016 bytes, 488397168 sectors             #The '/dev/nvme0n1' is your NVME SSD devicpath
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

### Write Image

On ROCK 5B:

```
sudo sudo xzcat 'your compressed image path' | dd of='your NVME SSD device path' bs=1M status=progress
#such as: sudo xzcat rock-5b-debian-bullseye-xfce4-arm64-20220906-0626-gpt.img.xz  | dd of=/dev/nvme0n1 bs=1M status=progress
```

## Option 3: Erase M.2 NVME SSD

When M.2 NVME SSD is written with Android (or Linux) images before, now we change to Linux (or Android). It's recommended that you erase M.2 NVME SSD first. Then write the target images.

## Boot from NVME SSD

After you write the image to NVME SSD, to boot from the NVME SSD, you need to write the bootloader to SPI flash. Check [Install to SPI to boot from NVME SSD](./bootloader_spi_flash).
