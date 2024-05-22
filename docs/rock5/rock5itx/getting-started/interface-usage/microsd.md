---
sidebar_position: 4
---

# Micro SD

## 简介

Micro SD，全称Micro Secure Digital，是一种小型存储卡，属于Secure Digital（SD）卡的一种变种。它是由SD卡协会（SD Association）制定和推出的，旨在为便携设备提供可扩展的存储解决方案。

## 接口测试方法

### 读写测试

打开终端，输入 lsblk 找到 SD 卡设备，此处以 /dev/mmcblk1 为例

```bash
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
mmcblk1     179:0    0 116.5G  0 disk
|-mmcblk1p1 179:1    0    16M  0 part /config
|-mmcblk1p2 179:2    0   300M  0 part /boot/efi
`-mmcblk1p3 179:3    0 116.2G  0 part /
```

- 读取测试

```bash
dd if=/dev/mmcblk0 of=/dev/null bs=4M count=100
```

这个命令将会从Micro SD卡中读取100个块大小为4MB的数据，并将其写入/dev/null设备中丢弃掉。在这个过程中，命令行会输出读取和写入的速度。

- 写入测试

```bash
dd if=/dev/zero of=/dev/mmcblk0 bs=4M count=100
```
