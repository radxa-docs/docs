---
sidebar_position: 7
---

# USB Type-A / C Ports

The Radxa Dragon Q6A features 1 USB Type-C port, 3 USB 2.0 Type-A ports, and 1 USB 3.1 Type-A port.

- USB Type-C Port

The USB Type-C port supports 12 V power delivery to the motherboard and is compatible with the PD protocol.

- USB 2.0 Type-A Port

Supports HOST mode, with a theoretical maximum transfer rate of 480 Mbps. The internal color of the port is black.

- USB 3.1 Type-A Port

Supports OTG and HOST modes, with a theoretical maximum transfer rate of 5 Gbps. The internal color of the port is blue.

## Hardware Connectivity

To test the HOST mode functionality of the USB interface, we can test the basic functionality of devices connected to the USB interface and the read/write speed of USB drives.

### Basic Functionality

We can connect devices such as card readers, mice, and keyboards to the USB interface and test whether they are recognized and function normally by plugging and unplugging them.

#### No External Devices Connected

Use the `lsusb` command to view the devices currently recognized by the system.

<NewCodeBlock tip="radxa@device$" type="device">

```bash
lsusb
```

</NewCodeBlock>

Terminal output example:

```text
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 001 Device 004: ID a69c:8d81 AICSemi AIC 8800D80
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
```

#### External device connected

Connect devices such as card readers, mice, and keyboards to the USB port, and use the `lsusb` command to check if any new devices have been added.

<NewCodeBlock tip="radxa@device$" type="device">

```bash
lsusb
```

</NewCodeBlock>

Terminal output example: I connected a card reader to the USB port.

```text
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 001 Device 004: ID a69c:8d81 AICSemi AIC 8800D80
Bus 001 Device 005: ID 3535:6300 aigo     U330
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
```

By comparing the output information from both, you can confirm that the newly added USB device has been recognized normally, with the new device ID being `3535:6300`.

After the USB device has been recognized normally, you can use the device to verify whether the functionality is working properly.

### Read and write test

Connect the USB flash drive to the USB port and use the `dd` command to test the read/write speed of the USB flash drive.

#### Confirm storage device

Use the `lsblk` command to confirm the device name of the USB flash drive.

<NewCodeBlock tip="radxa@device$" type="device">

```bash
lsblk
```

</NewCodeBlock>

Terminal output example: Where `sda` is the name of my current USB flash drive device, please replace it according to the actual situation.

```text
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    1  29.3G  0 disk
├─sda1        8:1    1    16M  0 part
└─sda2        8:2    1  29.3G  0 part
mmcblk2     179:0    0    58G  0 disk
├─mmcblk2p1 179:1    0   112M  0 part
└─mmcblk2p2 179:2    0  57.8G  0 part /
```

#### Testing write performance

<NewCodeBlock tip="radxa@device$" type="device">

```bash
sudo dd if=/dev/zero of=/dev/sda bs=1M count=100
```

</NewCodeBlock>

- `dd`: A command-line tool in Linux systems used for copying and converting files.
- `if=/dev/zero`: Specifies the input file as `/dev/zero`, a special file that provides an infinite stream of zero bytes.
- `of=/dev/sda`: Specifies the output file as `/dev/sda`, which is the USB drive device.
- `bs=1M`: Specifies the block size as 1MB.
- `count=100`: Specifies to copy 100 blocks.

This command writes 100MB of zero bytes to the USB flash drive and displays the write speed.

Terminal output example:

```text
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 3.40424 s, 30.8 MB/s
```

#### Testing read performance

<NewCodeBlock tip="radxa@device$" type="device">

```bash
sudo dd if=/dev/sda of=/dev/null bs=1M count=100
```

</NewCodeBlock>

- `dd`: A command-line tool in Linux systems used to copy and convert files.
- `if=/dev/sda`: Specifies the input file as `/dev/sda`, which is the USB drive device.
- `of=/dev/null`: Specifies the output file as `/dev/null`, a special file that discards all written data.
- `bs=1M`: Specifies the block size as 1MB.
- `count=100`: Specifies to copy 100 blocks.

This command reads 100MB of data from the USB flash drive to `/dev/null` and displays the read speed.

Terminal output example:

```text
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 4.0582 s, 25.8 MB/s
```
