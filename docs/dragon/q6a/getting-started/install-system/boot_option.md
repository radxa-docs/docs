---
sidebar_position: 4
---

# 修改系统启动盘引导选项

瑞莎 Dragon Q6A 支持将系统引导盘修改为 MicroSD 卡、U 盘、NVMe SSD 等设备。

我们提供的系统镜像文件默认引导盘为 MicroSD 卡，如果需要修改成 U 盘、NVMe SSD 等设备，可以参考下面教程进行修改。

## U 盘启动

修改 `/boot/grub/grub.cfg` 文件，将 `root` 参数修改为 U 盘的设备路径。

:::tip 默认引导盘
默认引导盘为 MicroSD 卡，root=/dev/mmcblk2p2
:::

### 查看 U 盘设备号

将 U 盘插入主板，然后使用 `lsblk` 命令查看 U 盘的设备号。

<NewCodeBlock tip="radxa@device$" type="device">

```
lsblk
```

</NewCodeBlock>

终端输出示例：可以通过安全插拔判断 U 盘设备号。

```
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda           8:0    1    58G  0 disk
├─sda1        8:1    1   112M  0 part
└─sda2        8:2    1  57.8G  0 part /media/user/9a5bc14a-4269-4786-a4e1-e5604266da9b
```

### 挂载 U 盘 BOOT 分区

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo mkdir ~/mnt
sudo mount /dev/sda1 ~/mnt
```

</NewCodeBlock>

### 修改 GRUB 配置文件

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo nano ~/mnt/grub/grub.cfg
```

</NewCodeBlock>

修改 GRUB 配置文件：将默认的 `root=/dev/mmcblk2p2` 修改为 `root=/dev/sda2`

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

### 安全退出 U 盘

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo umount ~/mnt
```

</NewCodeBlock>

然后弹出 U 盘，将 U 盘安装到主板上启动系统。

## NVMe SSD 启动

修改 `/boot/grub/grub.cfg` 文件，将 `root` 参数修改为 NVMe SSD 的设备路径。

:::tip 默认引导盘
默认引导盘为 MicroSD 卡，root=/dev/mmcblk2p2
:::

### 查看 NVMe SSD 设备号

将 NVMe SSD 插入主板，然后使用 `lsblk` 命令查看 NVMe SSD 的设备号。

<NewCodeBlock tip="radxa@device$" type="device">

```
lsblk
```

</NewCodeBlock>

终端输出示例：可以通过安全插拔判断 NVMe SSD 设备号。

```
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
nvme0n1     259:0    0    58G  0 disk
├─nvme0n1p1 259:1    0   112M  0 part
└─nvme0n1p2 259:2    0  57.8G  0 part /media/user/2543266-9541-5123-a4e1-e42501125542
```

### 挂载 NVMe SSD BOOT 分区

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo mkdir ~/mnt
sudo mount /dev/nvme0n1p2 ~/mnt
```

</NewCodeBlock>

### 修改 GRUB 配置文件

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo nano ~/mnt/grub/grub.cfg
```

</NewCodeBlock>

修改 GRUB 配置文件：将默认的 `root=/dev/mmcblk2p2` 修改为 `root=/dev/nvme0n1p2`

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

### 安全退出 NVMe SSD

<NewCodeBlock tip="radxa@device$" type="device">

```
sudo umount ~/mnt
```

</NewCodeBlock>

然后弹出 NVMe SSD，将 NVMe SSD 安装到主板上启动系统。
