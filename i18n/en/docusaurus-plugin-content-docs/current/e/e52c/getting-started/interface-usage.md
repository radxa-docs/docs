---
sidebar_position: 5
---

# Interface Usage Guidelines

## Interface preview

<img src="/img/e/e52c/radxa-e52c-hardware-overview.webp" width="800" alt="radxa-e52c pack" />

## Interface Usage Notes

### SYS LED

System status LED, will blink beat by beat when the system is booting up, green light.

### WAN / LAN LED

The WAN/LAN LED follows the signal of the WAN/LAN port.

### User Button

User button.

### USB Type-C 5V Power Connector

Power input, Radxa E52C fixed voltage is 5V input, please refer to [Power Supply](/e/e52c/getting-started/power-supply)。

### Gigabit Ethernet Port

The Radxa E52C provides two 2.5G Ethernet ports. Under OpenWrt systems, these two interfaces can be flexibly configured as WAN (Wide Area Network Interface) or LAN (Local Area Network Interface) ports, providing users with a highly customized network solution.

#### Unique MAC Address

The MAC address of the Radxa E52C is unique and fixed, the MAC stays the same after every power failure reboot or software reboot, and also after a re-flash.

#### Port Speed Test

- Install the iperf3 utility

```bash
sudo apt-get update
sudo apt-get install iperf3
```

- Run the command on the server side:

```bash
iperf -s
```

- Test the speed

1. Test upload speed

```bash
iperf3 -c server-ip -t 60
```

2. Test download speed

```bash
iperf3 -c server-ip -t 60 -R
```

### USB Type-C

Used as a debug port to view logs and access the device, with a default baud rate of 1500000.

### Maskrom Button

Maskrom button to enter Maskrom mode to complete the flashing.

### USB 3.0 OTG/Host Type-A

- As a burn port, use the Type-A to A cable to burn an image into the EMMC.

- Repeatedly unplugging peripherals

  Repeatedly plugging and unplugging USB peripherals ensures that they are recognised and used correctly every time.

  Identifying storage devices

  <pre>
    $ lsusb
    <strong>
      Bus 001 Device 003: ID 067b:2731 Prolific Technology, Inc. USB SD Card Reader
    </strong>
  </pre>

  As you can see above, the Micro-SD Card Reader has been successfully recognised here.

- Transmission Rate

  1. Identify the USB memory device

  Confirm the USB memory device with lsblk

  ```bash
  $ lsblk
  NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
  sda            8:0    1 29.3G  0 disk
  ```

  As shown above, the USB storage device inserted into the Radxa E52C is /dev/sda.

  2. Read Test

  <pre>
    $ sudo dd if=/dev/sda of=/dev/null bs=1M count=100
    100+0 records in
    100+0 records out
    104857600 bytes (105 MB, 100 MiB) copied, 1.14358 s, 91.7 MB/s
  </pre>

  This command will read data from the USB device and write it to /dev/null to test the read speed. The block size specified here is 1M, and 100 blocks are specified to be read, so a total of 100 MB of data is read, and the read speed is 91.7 MB/s.

  3. Write test

  <pre>
    $ sudo dd if=/dev/zero of=/dev/sda bs=1M count=100
    100+0 records in
    100+0 records out
    104857600 bytes (105 MB, 100 MiB) copied, 2.22391 s, 45.7 MB/s
  </pre>

  The block size specified here is 1M, 100 blocks were written, a total of 100M of data was written, and the write speed was 45.7 MB/s.

### microSD Card Slot

#### Introduction

Micro SD, known as Micro Secure Digital, is a small memory card that is a variant of the Secure Digital (SD) card. It was developed and introduced by the SD Association to provide expandable storage solutions for portable devices.

### eMMC

#### List Disk

```bash
$ lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
mmcblk1      179:0    0 29.5G  0 disk
├─mmcblk1p1  179:1    0   16M  0 part /config
├─mmcblk1p2  179:2    0  300M  0 part /boot/efi
└─mmcblk1p3  179:3    0 29.2G  0 part /
mmcblk0      179:32   0 29.4G  0 disk
mmcblk0boot0 179:64   0    4M  1 disk
mmcblk0boot1 179:96   0    4M  1 disk
zram0        253:0    0  1.9G  0 disk [SWAP]
```

mmcblk0 is the eMMC.

#### read test

```bash
# dd if=/dev/mmcblk0 of=/dev/null bs=64k count=16k
16384+0 records in
16384+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 0.541958 s, 193 MB/s
```

Read speed: 193 MB/s

#### Write test

```bash
# dd if=/dev/zero of=/dev/mmcblk0 bs=64k count=16k
16384+0 records in
16384+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 1.96788 s, 53.3 MB/s
```

Write speed：53.3 MB/s
