---
sidebar_position: 5
---

# M.2 E Key to SATA

ROCK 5B 有一个M.2 E-Key，支持PCIe 2.1 1-lanes、SATA、SDIO、UART。

它可以使用转接板（breakout board）使M.2 E-key变成SATA

## 准备

- ROCK 5B
- M.2 E-key to SATA breakout board
- SATA线材

![M.2-SATA-01](/zh/img/rock5b/m2-sata-01.webp)
![M.2-SATA-02](/zh/img/rock5b/m2-sata-02.webp)

## 硬件连接

SATA电源线，黄色 12V，红色 5V，黑色 GND。

1. 如果你使用固态硬盘。需要从 40pin 中使用 5V 电源。如图所示
   ![M.2-SATA-03](/zh/img/rock5b/m2-sata-03.webp)

2. 如果你使用硬盘。需要12V 和 5V 电源。图中使用数字电源供电12V，40pin 中使用 5V 电源。
   ![M.2-SATA-04](/zh/img/rock5b/m2-sata-04.webp)

## 软件配置

请参照[设备树配置](../os-config/rsetup#overlays)，启用名为 "Enable SATA1" 的 Overlay。

- 重启设备后，使用`lsblk`查看你的硬盘设备。

```
rock@rock-5b:~$ lsblk
NAME         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda            8:48   0 149.1G  0 disk
mmcblk1      179:0    0  14.6G  0 disk
├─mmcblk1p1  179:1    0   512M  0 part
└─mmcblk1p2  179:2    0  14.1G  0 part /
mmcblk1boot0 179:32   0     4M  1 disk
mmcblk1boot1 179:64   0     4M  1 disk
```

- 你可以用dd或fio命令测试读写速度，但前提是你要保护你的数据。

[** 购买链接 **](https://radxa.com/products/accessories/m2-ekey-to-sata-board/#buy)
