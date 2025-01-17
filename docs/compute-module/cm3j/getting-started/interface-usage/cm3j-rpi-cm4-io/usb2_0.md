---
sidebar_position: 4
description: "usb2.0"
---

# USB2.0 接口

## 使用介绍

### 反复拔插外设

反复拔插 USB 外设，确保每次都能正常识别得到，且正常使用。

- 识别鼠标键盘

  ```
  radxa@radxa-cm3j-rpi-cm4-io:~$ lsusb
  Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
  Bus 001 Device 003: ID c0f4:04c0 SZH usb keyboard
  Bus 001 Device 004: ID 03f0:1f4a HP, Inc HP USB Optical Mouse
  Bus 001 Device 002: ID 0424:2514 Microchip Technology, Inc. (formerly SMSC) USB 2.0 Hub
  Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
  ```

  - 如上所示，这里已经成功识别到了鼠标（USB OPTICAL MOUSE）和键盘（usb keyboard）。

- 识别存储设备

  ```
  radxa@radxa-cm3j-rpi-cm4-io:~$ lsusb -tv
  /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
      ID 1d6b:0003 Linux Foundation 3.0 root hub
  /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 480M
      ID 1d6b:0002 Linux Foundation 2.0 root hub
      |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
          ID 0424:2514 Microchip Technology, Inc. (formerly SMSC) USB 2.0 Hub
          |__ Port 1: Dev 5, If 0, Class=Mass Storage, Driver=usb-storage, 480M
              ID 090c:1000 Silicon Motion, Inc. - Taiwan (formerly Feiya Technology Corp.) Flash Drive
          |__ Port 2: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
              ID 090c:1000 Silicon Motion, Inc. - Taiwan (formerly Feiya Technology Corp.) Flash Drive
  ```

  - 如上所示，这里已经成功识别到了 USB2.0 U盘

### 唤醒外设

休眠过程系统休眠10分钟后，操作 USB 外设键鼠等，系统是否正常唤醒

输入账号密码，登录进入系统，检查外设是否均唤醒且正常工作如 WIFI 、声卡等

### 传输速率

通过 lsblk 命令确认 USB 存储设备

```
radxa@radxa-cm3j-rpi-cm4-io:~$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda            8:0    1   1.9G  0 disk
└─sda1         8:1    1   1.9G  0 part
sdb            8:16   1   1.9G  0 disk
└─sdb1         8:17   1   1.9G  0 part
mtdblock0     31:0    0     8M  0 disk
mmcblk1      179:0    0    60G  0 disk
mmcblk0      179:32   0   7.3G  0 disk
├─mmcblk0p1  179:33   0    16M  0 part /config
├─mmcblk0p2  179:34   0   300M  0 part /boot/efi
└─mmcblk0p3  179:35   0     7G  0 part /
mmcblk0boot0 179:64   0     4M  1 disk
mmcblk0boot1 179:96   0     4M  1 disk
zram0        254:0    0 991.8M  0 disk [SWAP]
```

如上所示，插入的两个 USB 存储设备为 /dev/sda 和 /dev/sdb

- 读速度测试

  ```
  radxa@radxa-cm3j-rpi-cm4-io:~$ sudo dd if=/dev/sda of=/dev/null bs=1M count=100
  100+0 records in 100+0 records out 104857600 bytes (105 MB, 100
  MiB) copied, 1.31635 s, 30.7 MB/s
  ```

  - 这个命令将会从 USB 设备读取数据，并将其写入 /dev/null，以便测试读取速度。这里指定了写入的块的大小为 1M，指定了读取 100 个块，因此总共读取了 100 MB 的数据，读取速度为 30.7 MB/s (usb2.0)。

- 写速度测试

  ```
  radxa@radxa-cm3j-rpi-cm4-io:~$ sudo dd if=/dev/zero of=/dev/sda bs=1M count=100
  100+0 records in 100+0 records out 104857600 bytes (105 MB, 100
  MiB) copied, 1.31635 s, 20.4 MB/s
  ```

  - 这里指定了写入的块的大小为 1M，写入了 100 个块，总共写入了 100 M 的数据，写入速度为 36.7 MB/s，写入速度为 20.4 MB/s (usb2.0)。
