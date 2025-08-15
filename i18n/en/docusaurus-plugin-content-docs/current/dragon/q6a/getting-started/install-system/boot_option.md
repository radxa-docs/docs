---
sidebar_position: 4
---

# Modifying the system boot disk boot options

The Dragon Q6A supports modifying the system boot disk to MicroSD cards, USB flash drives, NVMe SSDs, and other devices.

The system image file we provide defaults to a MicroSD card as the boot disk. If you need to modify it to a USB flash drive, NVMe SSD, or other device, you can refer to the tutorial below for instructions.

## USB flash drive boot

Edit the `/boot/grub/grub.cfg` file and change the `root` parameter to the device path of the USB flash drive.

:::tip default boot disk
The default boot disk is a MicroSD card, root=/dev/mmcblk2p2
:::

### View the USB device number

Plug the USB flash drive into the motherboard, then use the `lsblk` command to view the USB device number.

<NewCodeBlock tip="radxa@device$" type="device">

```
lsblk
```

</NewCodeBlock>

Terminal output example: You can determine the USB device number by checking whether it can be safely plugged in and unplugged.

```
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda           8:0    1    58G  0 disk
├─sda1        8:1    1   112M  0 part
└─sda2        8:2    1  57.8G  0 part /media/user/9a5bc14a-4269-4786-a4e1-e5604266da9b
```

### Mount the USB flash drive BOOT partition

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo mkdir ~/mnt
sudo mount /dev/sda1 ~/mnt
```

</NewCodeBlock>

### Modify the GRUB configuration file

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo nano ~/mnt/grub/grub.cfg
```

</NewCodeBlock>

Modify the GRUB configuration file: Change the default `root=/dev/mmcblk2p2` to `root=/dev/sda2`.

```
insmod part_gpt
insmod part_msdos
insmod all_video
terminal_input console
terminal_output console
if serial --unit=0 --speed=115200; then
        terminal_input --append console
        terminal_output --append console
fi
set timeout_style=menu
set timeout=0
set default=0
menuentry 'Arch Linux ARM for Radxa Dragon Q6A' {
#       insmod fat
#       search --no-floppy --fs-uuid --set=root 1778-ABF5
        devicetree /qcs6490-radxa-dragon-q6a.dtb
        echo 'Loading Kernel...'
        linux /Image panic=30 loglevel=8 rw rootwait=10 root=/dev/sda2 rootfstype=ext4
#       echo 'Loading Initramfs...'
#       initrd /initramfs-linux-mainline-aarch64.img
        echo 'Booting...'
}
```

### Safely remove USB flash drive

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo umount ~/mnt
```

</NewCodeBlock>

Then eject the USB flash drive, install it on the motherboard, and start the system.

## NVMe SSD Boot

Edit the `/boot/grub/grub.cfg` file and change the `root` parameter to the device path of the NVMe SSD.

:::tip default boot disk
The default boot disk is a MicroSD card, root=/dev/mmcblk2p2
:::

### View the NVMe SSD device number

Insert the NVMe SSD into the motherboard, then use the `lsblk` command to view the NVMe SSD device number.

<NewCodeBlock tip="radxa@device$" type="device">

```
lsblk
```

</NewCodeBlock>

Terminal output example: The NVMe SSD device number can be determined by safe plugging and unplugging.

```
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
nvme0n1     259:0    0    58G  0 disk
├─nvme0n1p1 259:1    0   112M  0 part
└─nvme0n1p2 259:2    0  57.8G  0 part /media/user/2543266-9541-5123-a4e1-e42501125542
```

### Mounting the NVMe SSD BOOT partition

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo mkdir ~/mnt
sudo mount /dev/nvme0n1p2 ~/mnt
```

</NewCodeBlock>

### Modify the GRUB configuration file

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo nano ~/mnt/grub/grub.cfg
```

</NewCodeBlock>

Modify the GRUB configuration file: Change the default `root=/dev/mmcblk2p2` to `root=/dev/nvme0n1p2`.

```
insmod part_gpt
insmod part_msdos
insmod all_video
terminal_input console
terminal_output console
if serial --unit=0 --speed=115200; then
        terminal_input --append console
        terminal_output --append console
fi
set timeout_style=menu
set timeout=0
set default=0
menuentry 'Arch Linux ARM for Radxa Dragon Q6A' {
#       insmod fat
#       search --no-floppy --fs-uuid --set=root 1778-ABF5
        devicetree /qcs6490-radxa-dragon-q6a.dtb
        echo 'Loading Kernel...'
        linux /Image panic=30 loglevel=8 rw rootwait=10 root=/dev/nvme0n1p2 rootfstype=ext4
#       echo 'Loading Initramfs...'
#       initrd /initramfs-linux-mainline-aarch64.img
        echo 'Booting...'
}
```

### Safely eject the NVMe SSD

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo umount ~/mnt
```

</NewCodeBlock>

Then eject the NVMe SSD and install it on the motherboard to start the system.
