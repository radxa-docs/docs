---
sidebar_position: 3
---

# USB Type-A Ports

The Radxa ROCK 4D features 4 onboard USB Type-A ports, including 2 USB 3.0 ports and 2 USB 2.0 ports.

- **USB 3.0 Type-A**

  - Theoretical maximum transfer rate: 5Gbps
  - Ports are typically colored blue internally
  - The top USB 3.0 Type-A port supports both OTG and HOST modes
  - The bottom USB 3.0 Type-A port supports HOST mode only

- **USB 2.0 Type-A**
  - Theoretical maximum transfer rate: 480Mbps
  - Ports are typically colored black internally

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-typea.webp" style={{width: '100%', maxWidth: '1200px'}} alt="ROCK 4D USB Type-A Ports" />
</div>

## User Guide

Test both USB 3.0/2.0 Type-A HOST and OTG modes.

Connect USB devices such as mice and keyboards to each USB Type-A port, then repeatedly connect and disconnect them to verify that the ROCK 4D properly recognizes and works with the devices.

### USB HOST Mode Testing

#### Without USB Peripherals Connected

Use the `lsusb` command to list all USB devices.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
lsusb
```
</NewCodeBlock>

Example output:

```
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 003: ID a69c:8d80 aicsemi AIC Wlan
Bus 003 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

#### With USB Peripherals Connected

Use the `lsusb` command to check the USB device list and verify if the connected USB peripherals are recognized.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
lsusb
```
</NewCodeBlock>

Example output (with a USB card reader connected):

```
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 003: ID a69c:8d80 aicsemi AIC Wlan
Bus 003 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 003: ID 067b:2731 Prolific Technology, Inc. USB SD Card Reader
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

By comparing the outputs, you can observe that after connecting a USB peripheral, the ID `Bus 002 Device 003` appears, indicating that the USB peripheral has been properly recognized.

### USB Read/Write Testing

Connect a USB flash drive to either a USB 2.0 or USB 3.0 Type-A port and use the `dd` command to test USB read/write performance.

#### Identify Storage Device

Use the `lsblk` command to identify your USB device name.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
lsblk
```
</NewCodeBlock>

Example output (in this case, `sda` is the USB flash drive - replace with your actual device name):

```
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

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo dd if=/dev/zero of=/dev/sda bs=1M count=100
```
</NewCodeBlock>

- `dd`: A command-line utility for copying and converting files in Linux
- `if=/dev/zero`: Specifies the input file as `/dev/zero`, a special file that provides an endless stream of null bytes
- `of=/dev/sda`: Specifies the output file as your USB device (replace `sda` with your actual device)
- `bs=1M`: Sets the block size to 1MB
- `count=100`: Specifies to copy 100 blocks

This command writes 100MB of zero bytes to the USB drive and displays the write speed.

Example output:

```
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 3.40424 s, 30.8 MB/s
```

#### Test Read Performance

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo dd if=/dev/sda of=/dev/null bs=1M count=100
```
</NewCodeBlock>

- `dd`: A command-line utility for copying and converting files in Linux
- `if=/dev/sda`: Specifies the input file as your USB device (replace `sda` with your actual device)
- `of=/dev/null`: Specifies the output file as `/dev/null`, a special file that discards all data written to it
- `bs=1M`: Sets the block size to 1MB
- `count=100`: Specifies to copy 100 blocks

This command reads 100MB of data from the USB drive to `/dev/null` and displays the read speed.

Example output:

```
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 4.0582 s, 25.8 MB/s
```

## Interface Specifications

:::tip
For detailed interface specifications, please refer to the [Hardware Design: Schematics](../download) in the download section.
:::

### USB 2.0 Type-A

| Pin# | Name        | Pin# | Name        | Pin# | Name |
| :--: | :---------- | :--: | :---------- | :--: | :--- |
|  1   | 5V_USB_HOST |  5   | 5V_USB_HOST |  9   | GND  |
|  2   | USB20_2DM   |  6   | USB20_3DM   |  10  | GND  |
|  3   | USB20_2DP   |  7   | USB20_3DP   |  11  | GND  |
|  4   | GND         |  8   | GND         |  12  | GND  |

### USB 3.0 Type-A

| Pin# | Name           | Pin# | Name           | Pin# | Name          |
| :--: | :------------- | :--: | :------------- | :--: | :------------ |
|  1   | 5V_USB_OTG0    |  9   | USB3_OTGOSSTXP |  17  | USB3_OTG1_TXN |
|  2   | USB3_OTG0DM    |  10  | 5V_USB_HOST    |  18  | USB3_OTG1_TXP |
|  3   | USB3_OTG0DP    |  11  | USB3_HOST1DM   |  19  | GND           |
|  4   | GND            |  12  | USB3_HOST1DP   |  20  | GND           |
|  5   | USB3_OTG0SSRXN |  13  | GND            |  21  | GND           |
|  6   | USB3_OTG0SSRXP |  14  | USB3_OTG1_RXN  |  22  | GND           |
|  7   | GND            |  15  | USB3_OTG1_RXP  |      |               |
|  8   | USB3_OTGOSSTXN |  16  | GND            |      |               |
