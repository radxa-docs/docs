---
sidebar_position: 5
---

# USB Type-A / C Ports

The Radxa CM4 IO Board comes with the following USB ports:

- 1 × USB 3.0 Type-C port
- 1 × USB 3.0 Type-A port
- 2 × USB 2.0 Type-A ports

### USB 3.0 Type-C Port

- Supports both OTG and HOST modes
- Blue color-coded internal connector
- Theoretical maximum transfer rate: 5Gbps

### USB 3.0 Type-A Port

- Supports HOST mode only
- Blue color-coded internal connector
- Theoretical maximum transfer rate: 5Gbps

### USB 2.0 Type-A Ports

- Support HOST mode only
- Black color-coded internal connectors
- Theoretical maximum transfer rate: 480Mbps

## Hardware Connection

Connect USB devices such as mice, keyboards, or flash drives to the USB Type-A/C ports. The Type-C port also supports OTG mode, which can be verified by enabling ADB functionality.

:::tip Port Location
Refer to the [Hardware Information](./hardware_info.md) tutorial to locate the corresponding hardware interfaces.
:::

## HOST Mode

To test the HOST mode functionality of the USB ports, you can verify basic device connectivity and measure flash drive read/write speeds.

### Basic Functionality Test

Connect devices like card readers, mice, or keyboards to test if they are properly recognized and functional.

#### Check Connected Devices (Before Connection)

Use the `lsusb` command to view currently recognized USB devices.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
lsusb
```
</NewCodeBlock>

Example output:

```text
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID a69c:8d81 AICSemi AIC 8800D80
Bus 001 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

#### Check After Connecting a Device

After connecting a device (e.g., card reader, mouse, keyboard), run `lsusb` again to check for the new device.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
lsusb
```
</NewCodeBlock>

Example output after connecting a card reader:

```text
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID a69c:8d81 AICSemi AIC 8800D80
Bus 001 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 003: ID 067b:2731 Prolific Technology, Inc. USB SD Card Reader
```

By comparing the outputs, you can confirm that the new USB device (ID: `067b:2731`) has been properly recognized. Once recognized, you can proceed to test the device's functionality.

### Read/Write Speed Test

Connect a USB flash drive and use the `dd` command to test read/write speeds.

#### Identify the Storage Device

Use `lsblk` to identify your flash drive's device name.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
lsblk
```
</NewCodeBlock>

Example output (in this case, the flash drive is `sda`):

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

- `dd`: A command-line utility for copying and converting files in Linux
- `if=/dev/zero`: Specifies the input file as `/dev/zero`, which provides an infinite stream of null bytes
- `of=/dev/sda`: Specifies the output file as the USB flash drive (replace `sda` with your device)
- `bs=1M`: Sets the block size to 1MB
- `count=100`: Specifies to copy 100 blocks (total 100MB)

This command writes 100MB of zero bytes to the flash drive and displays the write speed.

Example output:

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

- `dd`: A command-line utility for copying and converting files in Linux
- `if=/dev/sda`: Specifies the input file as the USB flash drive
- `of=/dev/null`: Directs output to `/dev/null`, discarding all data
- `bs=1M`: Sets the block size to 1MB
- `count=100`: Specifies to copy 100 blocks (total 100MB)

This command reads 100MB of data from the flash drive and displays the read speed.

Example output:

```text
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 4.0582 s, 25.8 MB/s
```

## OTG Mode

Verify the OTG functionality of the Radxa CM4 by enabling ADB (Android Debug Bridge).

### Enable ADB Functionality

Use the `rsetup` tool to enable ADB functionality.

:::tip Using Rsetup
For more information about using Rsetup, refer to the [Rsetup Usage](../system-use/rsetup) tutorial.
:::

<NewCodeBlock tip="radxa@device$" type="device">
```bash
rsetup
```
</NewCodeBlock>

Navigate to `Hardware` -> `USB OTG services` and enable the `radxa-adbd@23000000.usb` option to activate ADB functionality.

### Test OTG Functionality

Connect your PC to the Radxa CM4's USB 3.0 Type-C port using a Type-C cable, then test the OTG functionality using ADB commands.

#### Install ADB Tools

<NewCodeBlock tip="Linux$" type="host">
```bash
sudo apt install adb
```
</NewCodeBlock>

#### Check ADB Devices

Use the `adb devices` command to list connected ADB devices.

<NewCodeBlock tip="Linux$" type="host">
```bash
adb devices
```
</NewCodeBlock>

Example output (showing one ADB device connected):

```text
List of devices attached
0123456789ABCDEF	device
```

#### Test ADB Shell

Access the Radxa CM4's terminal shell using the `adb shell` command.

<NewCodeBlock tip="Linux$" type="host">
```bash
adb shell
```
</NewCodeBlock>

If you successfully enter the Radxa CM4's terminal, the OTG functionality is working correctly. You can now use various commands to check system information on the Radxa CM4.

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Downloads](../download.md) page.
