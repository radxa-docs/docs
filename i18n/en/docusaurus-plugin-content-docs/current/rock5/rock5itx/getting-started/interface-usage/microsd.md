---
sidebar_position: 4
---

# Micro SD

## Introduction

Micro SD, known as Micro Secure Digital, is a small memory card that is a variant of the Secure Digital (SD) card. It was developed and introduced by the SD Card Association (SD Association) to provide expandable storage solutions for portable devices.

## Interface Test Methods

### Read and Write Test

Open a terminal and type lsblk to find the SD card device, take /dev/mmcblk1 as an example.

```bash
NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
mmcblk1 179:0 0 116.5G 0 disk
|-mmcblk1p1 179:1 0 16M 0 part /config
|-mmcblk1p2 179:2 0 300M 0 part /boot/efi
|-mmcblk1p3 179:3 0 116.2G 0 part /
```

- Read test

```bash
dd if=/dev/mmcblk0 of=/dev/null bs=4M count=100
```

This command will read 100 blocks of data with a block size of 4MB from the Micro SD card and write them to the /dev/null device to be discarded. During this process, the command line will output the read and write speeds.

- Write test

```bash
dd if=/dev/zero of=/dev/mmcblk0 bs=4M count=100
```
