---
sidebar_position: 5
---

# Replacing the 32-bit Root Filesystem

## Compiling Debian 11 armhf Root Filesystem

### Install Required Tools

```bash

PC:~$ sudo apt install -y debootstrap

```

### Create Root Filesystem Directory

```bash

PC:~$ mkdir rootfs

PC:~$ cd rootfs

```

### Generate Debian 11 armhf Root Filesystem Using debootstrap

```bash

PC:~$ sudo debootstrap --arch armhf bullseye rootfs http://mirrors.tuna.tsinghua.edu.cn/debian

```

### Switch to armhf Root Filesystem

```bash

sudo chroot rootfs bash

```

### Install Required Packages in armhf Root Filesystem

```bash

apt update

apt install -y sudo usbutils network-managerfdisk \
vim nano openssh-server iputils-ping wget curl \
iproute2 dialog locales kmod zip unzip u-boot-tools initramfs-tools

```

### Create User

```bash

adduser radxa

gpasswd -a radxa sudo

```

## Flash Debian 11 arm64 Image to SD Card or eMMC Module

## Record Target Device Information

### Confirm Target Device

Insert the SD card or eMMC module with the newly flashed Debian 11 arm64 into your local PC and mount it

```bash

PC:~$ lsblk
sdb      8:16   1  29.3G  0 disk
├─sdb1   8:17   1    16M  0 part
└─sdb2   8:18   1   5.1G  0 part
```

From this, we can see our target device is /dev/sdb2

### Record UUIDs

```bash

PC:~$ sudo blkid /dev/sdb2
/dev/sdb2: LABEL="rootfs" UUID="8bf96d05-7c97-42fc-863c-95e3e7603ef4" BLOCK_SIZE="4096" TYPE="ext4" PARTLABEL="rootfs" PARTUUID="474d4c1f-53da-447c-bab4-334abe0d5753"
PC:~$ sudo blkid /dev/sdb1
/dev/sdb1: LABEL_FATBOOT="config" LABEL="config" UUID="4AD5-9369" BLOCK_SIZE="512" TYPE="vfat" PARTLABEL="config" PARTUUID="8d24a074-ea49-4d24-a17c-82dd88776fa2"

```

## Replace Root Filesystem

### Mount Target Device

```bash

PC:~$ sudo mount /dev/sdb2 /data2
PC:~$ cd /data2

```

### Replace Root Filesystem

Navigate to the mounted root filesystem, back up the boot directory, delete and replace the root filesystem, then restore the boot directory to the new root filesystem

```bash

PC:/data2$ sudo cp -r ./boot ~/
PC:/data2$ sudo rm -rf *
PC:/data2$ sudo cp -av /path/to/rootfs/* ./
PC:/data2$ sudo cp -av ~/boot/* ./boot/

```

### Modify fstab

```bash

PC:/data2$ cat ./etc/fstab
### UNCONFIGURED FSTAB FOR BASE SYSTEM

```

Update the fstab file with the previously recorded UUIDs

```bash

PC:/data2$ sudo cat ./etc/fstab
### UNCONFIGURED FSTAB FOR BASE SYSTEM
UUID=8bf96d05-7c97-42fc-863c-95e3e7603ef4       /       ext4    defaults        0       1
UUID=4AD5-9369  /config vfat    defaults,x-systemd.automount    0       2

```

### Unmount

```bash

radxa@radxa:/data2$ cd
radxa@radxa:~$ sudo umount /data2

```

## Verify 32-bit Root Filesystem

### Boot the System

Insert the SD card or eMMC with the replaced rootfs into the board and power it on.

### Verify Current Root Filesystem is 32-bit

```bash

radxa@rock-4se:~$ sudo apt-get install file -y
radxa@rock-4se:~$ file /bin/ls
/bin/ls: ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3, Build

```

This confirms we have successfully replaced the rootfs with a 32-bit version
