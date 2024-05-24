---
sidebar_position: 5
---

# M.2 E Key to SATA

The ROCK 5B has an M.2 E-Key that supports PCIe 2.1 1-lanes, SATA, SDIO, UART.

It can use a breakout board to turn the M.2 E-key into a SATA key.

## Preparation

- ROCK 5B
- M.2 E-key to SATA breakout board
- SATA cable

! [M.2-SATA-01](/zh/img/rock5b/m2-sata-01.webp)
! [M.2-SATA-02](/zh/img/rock5b/m2-sata-02.webp) !

## Hardware Connections

SATA power cable, yellow 12V, red 5V, black GND.

1. If you are using an SSD. You need to use 5V power from 40pin. As shown in the picture
   ! [M.2-SATA-03](/zh/img/rock5b/m2-sata-03.webp)

2. if you are using a hard disk. 12V and 5V power supplies are required. The figure uses a digital power supply to power the 12V and a 5V power supply in the 40pin.
   ! [M.2-SATA-04](/zh/img/rock5b/m2-sata-04.webp)

## Software Configuration

Please refer to the [device tree configuration](../os-config/rsetup#overlays) to enable the Overlay named "Enable SATA1".

- After rebooting the device, use `lsblk` to view your hard disk devices.

```
rock@rock-5b:~$ lsblk
NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
sda 8:48 0 149.1G 0 disk
mmcblk1 179:0 0 14.6G 0 disk
├─mmcblk1p1 179:1 0 512M 0 part
└─mmcblk1p2 179:2 0 14.1G 0 part /
mmcblk1boot0 179:32 0 4M 1 disk
mmcblk1boot1 179:64 0 4M 1 disk
```

- You can test read and write speeds with the dd or fio commands, but only if you protect your data.

[** Buy Now **](https://radxa.com/products/accessories/m2-ekey-to-sata-board/#buy)
