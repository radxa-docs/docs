---
sidebar_position: 4
description: "usb2.0"
---

# USB2.0

## Usage Instructions

### Repeatedly unplug and plug in peripherals

Repeatedly unplug and plug in peripherals.

- Identify the mouse and keyboard.

  ```
  radxa@radxa-cm3j-rpi-cm4-io:~$ lsusb
  Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
  Bus 001 Device 003: ID c0f4:04c0 SZH usb keyboard
  Bus 001 Device 004: ID 03f0:1f4a HP, Inc HP USB Optical Mouse
  Bus 001 Device 002: ID 0424:2514 Microchip Technology, Inc. (formerly SMSC) USB 2.0 Hub
  Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
  ```

  - As shown above, the mouse (USB OPTICAL MOUSE) and keyboard (USB keyboard) have been successfully recognized.

- Identify storage devices

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

  - As shown above, the USB 2.0 flash drive has been successfully recognized.

### Wake up the peripherals

After the system enters sleep mode for 10 minutes, test the USB peripherals such as the keyboard and mouse to see if the system wakes up properly.

Enter the username and password to log into the system, then check if all peripherals, such as Wi-Fi and sound card, have woken up and are working properly.

### Transmission rate

Confirm USB memory device via lsblk

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

As shown above, the USB storage device inserted is /dev/sda and /deb/sdb.

- Read Test

  ```
  radxa@radxa-cm3j-rpi-cm4-io:~$ sudo dd if=/dev/sda of=/dev/null bs=1M count=100
  100+0 records in 100+0 records out 104857600 bytes (105 MB, 100
  MiB) copied, 1.31635 s, 30.7 MB/s
  ```

  - This command will read data from the USB device and write it to /dev/null to test the read speed. The size of the block written is specified as 1M, and 100 blocks are specified to be read, so a total of 100 MB of data is read, and the read speed is 30.7 MB/s (usb2.0).

- Write Test

  ```
  radxa@radxa-cm3j-rpi-cm4-io:~$ sudo dd if=/dev/zero of=/dev/sda bs=1M count=100
  100+0 records in 100+0 records out 104857600 bytes (105 MB, 100
  MiB) copied, 1.31635 s, 20.4 MB/s
  ```

  - Here the block size specified for writing is 1M, 100 blocks were written, a total of 100 M of data was written, the write speed was 36.7 MB/s, and the write speed was 20.4 MB/s (usb2.0).
