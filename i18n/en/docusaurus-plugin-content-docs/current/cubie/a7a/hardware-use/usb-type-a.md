---
sidebar_position: 3
---

# USB Type-A Port

Radxa Cubie A7A features 4 onboard USB Type-A ports: 1 USB 3.1 port and 3 USB 2.0 ports.

:::tip
For the exact location of the USB Type-A ports, please refer to the interface description section in the [Hardware Interfaces](./hardware-info) guide!
:::

- USB 3.1 Type-A

Theoretical maximum transfer rate is 5Gbps, and the internal color of the port is usually blue.

- USB 2.0 Type-A

Theoretical maximum transfer rate is 480Mbps, and the internal color of the port is usually black.

## Usage Guide

Test USB 3.1/2.0 Type-A HOST mode.

You can connect USB devices such as a mouse or keyboard to each USB Type-A port, repeatedly plug and unplug to test whether Cubie A7A recognizes and works with them properly.

### USB HOST Test

#### No USB Device Connected

Use the `lsusb` command to view the list of USB devices.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
lsusb
```
</NewCodeBlock>

Sample terminal output:

```text
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 003: ID a69c:8d80 aicsemi AIC Wlan
Bus 003 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

#### USB Device Connected

Use the `lsusb` command to view the list of USB devices and check if the connected USB device is recognized.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
lsusb
```
</NewCodeBlock>

Sample terminal output: I connected a card reader to the USB port

```text
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 003: ID a69c:8d80 aicsemi AIC Wlan
Bus 003 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 003: ID 067b:2731 Prolific Technology, Inc. USB SD Card Reader
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

By comparing the two, you can see that after connecting the USB device, the ID of `Bus 002 Device 003` changes, indicating the USB device is recognized correctly.

### USB Read/Write Test

Connect a USB flash drive to the USB 2.0 or USB 3.0 Type-A port, and use the `dd` command to test USB read/write performance.

#### Confirm Storage Device

Use the `lsblk` command to confirm the device name of the USB flash drive.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
lsblk
```
</NewCodeBlock>

Sample terminal output: Here, `sda` is the device name of my current USB flash drive. Please replace it according to your actual situation.

```text
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda           8:0    1   58G  0 disk
mtdblock0    31:0    0   16M  0 disk
mmcblk1     179:0    0   58G  0 disk
├─mmcblk1p1 179:1    0   16M  0 part /config
├─mmcblk1p2 179:2    0  300M  0 part /boot/efi
└─mmcblk1p3 179:3    0 57.6G  0 part /
zram0       253:0    0  1.9G  0 disk [SWAP]
```

#### Test Write Performance

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo dd if=/dev/zero of=/dev/sda bs=1M count=100
```
</NewCodeBlock>

- `dd`: A command-line tool in Linux for copying and converting files.
- `if=/dev/zero`: Specifies the input file as `/dev/zero`, a special file that provides unlimited zero bytes.
- `of=/dev/sda`: Specifies the output file as `/dev/sda`, i.e., the USB flash drive device.
- `bs=1M`: Sets the block size to 1MB.
- `count=100`: Copies 100 blocks.

This command writes 100MB of zero bytes to the USB flash drive and displays the write speed.

Sample terminal output:

```text
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 3.40424 s, 30.8 MB/s
```

#### Test Read Performance

<NewCodeBlock tip="radxa@device$" type="device">
```bash
sudo dd if=/dev/sda of=/dev/null bs=1M count=100
```
</NewCodeBlock>

- `dd`: A command-line tool in Linux for copying and converting files.
- `if=/dev/sda`: Specifies the input file as `/dev/sda`, i.e., the USB flash drive device.
- `of=/dev/null`: Specifies the output file as `/dev/null`, a special file that discards all data written to it.
- `bs=1M`: Sets the block size to 1MB.
- `count=100`: Copies 100 blocks.

This command reads 100MB of data from the USB flash drive to `/dev/null` and displays the read speed.

Sample terminal output:

```text
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 4.0582 s, 25.8 MB/s
```

## Port Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematic](../download) document in the download section.
:::
