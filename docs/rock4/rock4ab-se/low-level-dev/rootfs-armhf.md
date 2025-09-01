---
sidebar_position: 5
---

# 替换 32 位的根文件系统

## 编译 Debian 11 armhf rootfs

### 安装必要的工具

```bash

PC:~$ sudo apt install -y debootstrap

```

### 创建 rootfs 目录

```bash

PC:~$ mkdir rootfs

PC:~$ cd rootfs

```

### 使用 debootstrap 生成 Debian 11 armhf rootfs

```bash

PC:~$ sudo debootstrap --arch armhf bullseye rootfs http://mirrors.tuna.tsinghua.edu.cn/debian

```

### 切换到 armhf rootfs

```bash

sudo chroot rootfs bash

```

### 在 armhf rootfs 中安装你需要的软件包

```bash

apt update

apt install -y sudo usbutils network-managerfdisk \
vim nano openssh-server iputils-ping wget curl \
iproute2 dialog locales kmod zip unzip u-boot-tools initramfs-tools

```

### 创建用户

```bash

adduser radxa

gpasswd -a radxa sudo

```

## 烧录 Debian 11 arm64 的镜像到 SD 卡或 eMMC 模块中

## 记录目标设备信息

### 确认目标设备

将刚刚烧录 Debian 11 arm64 的 SD 卡或 eMMC 模块到本地 PC 中并挂载

```bash

PC:~$ lsblk
sdb      8:16   1  29.3G  0 disk
├─sdb1   8:17   1    16M  0 part
└─sdb2   8:18   1   5.1G  0 part
```

由此可知，我们的目标设备是 /dev/sdb2

### 记录 UUID

```bash

PC:~$ sudo blkid /dev/sdb2
/dev/sdb2: LABEL="rootfs" UUID="8bf96d05-7c97-42fc-863c-95e3e7603ef4" BLOCK_SIZE="4096" TYPE="ext4" PARTLABEL="rootfs" PARTUUID="474d4c1f-53da-447c-bab4-334abe0d5753"
PC:~$ sudo blkid /dev/sdb1
/dev/sdb1: LABEL_FATBOOT="config" LABEL="config" UUID="4AD5-9369" BLOCK_SIZE="512" TYPE="vfat" PARTLABEL="config" PARTUUID="8d24a074-ea49-4d24-a17c-82dd88776fa2"

```

## 替换 rootfs

### 挂载目标设备

```bash

PC:~$ sudo mount /dev/sdb2 /data2
PC:~$ cd /data2

```

### 替换 rootfs

进入到刚刚已经挂载的根文件系统，备份启动目录，删除并替换根文件系统，然后将启动目录恢复到根文件系统

```bash

PC:/data2$ sudo cp -r ./boot ~/
PC:/data2$ sudo rm -rf *
PC:/data2$ sudo cp -av /path/to/rootfs/* ./
PC:/data2$ sudo cp -av ~/boot/* ./boot/

```

### 修改 fstab

```bash

PC:/data2$ cat ./etc/fstab
### UNCONFIGURED FSTAB FOR BASE SYSTEM

```

将刚刚记录的 UUID 替换到 fstab 文件中

```bash

PC:/data2$ sudo cat ./etc/fstab
### UNCONFIGURED FSTAB FOR BASE SYSTEM
UUID=8bf96d05-7c97-42fc-863c-95e3e7603ef4       /       ext4    defaults        0       1
UUID=4AD5-9369  /config vfat    defaults,x-systemd.automount    0       2

```

### 取消挂载

```bash

radxa@radxa:/data2$ cd
radxa@radxa:~$ sudo umount /data2

```

## 检查是否是 32 位的 rootfs

### 启动系统

将刚刚已替换好 rootfs 的 SD 或者 eMMC 卡插入到板子上，然后上电启动。

### 检查当前 rootfs是否是 32 位的

```bash

radxa@rock-4se:~$ sudo apt-get install file -y
radxa@rock-4se:~$ file /bin/ls
/bin/ls: ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3, Build

```

由此可知我们已经成功替换了 32 位的 rootfs
