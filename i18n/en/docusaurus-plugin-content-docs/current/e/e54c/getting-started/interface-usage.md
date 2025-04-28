---
sidebar_position: 3
---

# Interface Usage Guide

## Interface Overview

<img src="/img/e/e54c/e54c-board-label.webp" width="800" alt="e54c-board-label" />

## Interface Description

### Power Status LED

Power status indicator, lights up green when the device is powered on.

### Network Status LEDs

Four network port status indicators that light up according to the signal changes of each network port.

### User Button

User-programmable button, functionality can be customized through software.

### Power Button

Used to turn the device on and off.

### 12V DC Power Connector

Power input, Radxa E54C uses 12V voltage input with a standard 5525 DC connector. Please refer to [Power Supply Options](./power-supply).

### Gigabit Ethernet Ports

Radxa E54C provides four gigabit Ethernet ports. In an OpenWrt system, these interfaces can be flexibly configured as WAN (Wide Area Network interface) or LAN (Local Area Network interface) ports, providing users with highly customizable network solutions. Multiple ports also provide redundancy and load balancing capabilities, enhancing network reliability and performance.

#### Unique MAC Address

The MAC address of Radxa E54C is unique and fixed. It remains unchanged after each power cycle or software restart, and even after reflashing the system.

#### Network Speed Testing

- Install the iperf3 tool

<NewCodeBlock tip="root@radxa-e54c#" type="device">

```
sudo apt-get install iperf3
```

</NewCodeBlock>

- Run the command on the server side:

<NewCodeBlock type="host">

```
iperf -s
```

</NewCodeBlock>

- Speed Testing

1. Test upload speed

<NewCodeBlock tip="root@radxa-e54c#" type="device">

```
iperf3 -c server-ip -t 60
```

</NewCodeBlock>

2. Test download speed

<NewCodeBlock type="host">

```
iperf3 -c server-ip -t 60 -R
```

</NewCodeBlock>

### USB Type-C Port

Used as a debug port for viewing logs and accessing the device, with a default baud rate of 1500000.

Also serves as a data transfer interface, supporting USB3.0 OTG, firmware flashing, and DP display output.

#### USB3.0 OTG

Supports adb.

Supports usbnet.

Supports mass storage.

##### USB 2.0 Mass Storage

Execute the following commands:

  <NewCodeBlock tip="root@radxa-e54c#" type="device">

```
modprobe libcomposite
modprobe usb_f_mass_storage
systemctl daemon-reload
umount /sys/kernel/config
mount -t configfs none /sys/kernel/config
cd /sys/kernel/config/usb_gadget
mkdir -p my_udisk
cd my_udisk
echo 0x1d6b > idVendor
echo 0x0104 > idProduct
echo 0x0100 > bcdDevice
echo 0x0200 > bcdUSB
mkdir -p strings/0x409
echo "123456789" > strings/0x409/serialnumber
echo "My Manufacturer" > strings/0x409/manufacturer
echo "My USB Disk" > strings/0x409/product
mkdir -p configs/c.1
mkdir -p configs/c.1/strings/0x409
echo "Mass Storage Config" > configs/c.1/strings/0x409/configuration
mkdir -p functions/mass_storage.usb0
dd if=/dev/zero of=/tmp/disk.img bs=1M count=100
mkfs.ext4 /tmp/disk.img
echo /tmp/disk.img > functions/mass_storage.usb0/lun.0/file
ln -s functions/mass_storage.usb0 configs/c.1
echo fc000000.usb > UDC
```

  </NewCodeBlock>

A USB 2.0 flash drive device will appear on your computer. View it as follows (on a Linux computer):

  <NewCodeBlock type="host">

```
$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 20000M/x2​
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M​
  |__ Port 1: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 1.5M​
  |__ Port 1: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M​
  |__ Port 2: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M​
  |__ Port 4: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M​
      |__ Port 1: Dev 7, If 0, Class=Mass Storage, Driver=usb-storage, 480M​
      |__ Port 2: Dev 6, If 0, Class=Vendor Specific Class, Driver=ch341, 12M​
  |__ Port 14: Dev 4, If 0, Class=Wireless, Driver=btusb, 12M​
  |__ Port 14: Dev 4, If 1, Class=Wireless, Driver=btusb, 12M
$ lsblk
...
sda           8:0    1   100M  0 disk /media/lsj/320c4009-2d38-412b-bdd3-2e4059203ee8
                                     /media/devmon/sda-usb-Linux_File-Stor_
...
```

  </NewCodeBlock>

sda is the corresponding Mass Storage device.

##### USB 3.0 Mass Storage

Execute the following commands, and a USB 3.0 flash drive device will appear on your computer.

  <NewCodeBlock tip="root@radxa-e54c#" type="device">

```
modprobe libcomposite
modprobe usb_f_mass_storage
systemctl daemon-reload
umount /sys/kernel/config
mount -t configfs none /sys/kernel/config
cd /sys/kernel/config/usb_gadget
mkdir -p my_udisk
cd my_udisk
echo 0x1d6b > idVendor
echo 0x0104 > idProduct
echo 0x0100 > bcdDevice
echo 0x0300 > bcdUSB
mkdir -p strings/0x409
echo "123456789" > strings/0x409/serialnumber
echo "My Manufacturer" > strings/0x409/manufacturer
echo "My USB Disk" > strings/0x409/product
mkdir -p configs/c.1
mkdir -p configs/c.1/strings/0x409
echo "Mass Storage Config" > configs/c.1/strings/0x409/configuration
mkdir -p functions/mass_storage.usb0
dd if=/dev/zero of=/tmp/disk.img bs=1M count=100
mkfs.ext4 /tmp/disk.img
echo /tmp/disk.img > functions/mass_storage.usb0/lun.0/file
ln -s functions/mass_storage.usb0 configs/c.1
echo fc000000.usb > UDC
```

  </NewCodeBlock>

The viewing method is the same as for USB 2.0 Mass Storage above, the difference being that this is a USB 3.0 Mass Storage device.

#### DP Display

You can connect a monitor through the USB Type-C port using a USB-C to DisplayPort adapter. The E54C supports display resolutions up to 4K@60Hz through this port.

### HDMI Port

The E54C features an HDMI 2.1 port that supports resolutions up to 8K. This allows you to connect your E54C to monitors, TVs, and projectors for high-quality video output.

### USB 3.0 Type-A Port

This high-speed USB port allows you to connect a wide range of peripherals including storage devices, keyboards, mice, and more. The USB 3.0 specification offers data transfer speeds up to 5Gbps.

### USB 2.0 Type-A Ports

These ports provide standard USB connectivity for devices that don't require the higher bandwidth of USB 3.0. They're ideal for keyboards, mice, and other low-bandwidth USB devices.

### MicroSD Card Slot

The MicroSD card slot allows you to use a MicroSD card for operating system installation or additional storage. It supports high-capacity MicroSD cards for flexible storage expansion.

### M.2 M-Key Slot

This slot supports M.2 NVMe SSDs in the 2280 form factor. With PCIe 2.1 connectivity, it provides high-speed storage expansion options, ideal for applications requiring fast storage access.

### GPIO Expansion Header

The 14-pin GPIO header provides access to various I/O interfaces including SPI, UART, I2C, and power pins. This allows the E54C to interface with sensors, displays, and other external devices for custom projects and applications.

#### GPIO Pin Definitions

| Pin Number | Function | Description             |
| ---------- | -------- | ----------------------- |
| 1          | 3.3V     | 3.3V power output       |
| 2          | 5V       | 5V power output         |
| 3          | SPI_CLK  | SPI Clock               |
| 4          | GND      | Ground                  |
| 5          | SPI_MISO | SPI Master In Slave Out |
| 6          | UART_TX  | UART Transmit           |
| 7          | SPI_MOSI | SPI Master Out Slave In |
| 8          | UART_RX  | UART Receive            |
| 9          | SPI_CS   | SPI Chip Select         |
| 10         | I2C_SCL  | I2C Clock               |
| 11         | GPIO     | General Purpose I/O     |
| 12         | I2C_SDA  | I2C Data                |
| 13         | GPIO     | General Purpose I/O     |
| 14         | GND      | Ground                  |

### Fan Connector

The fan connector supports a 5V cooling fan for active cooling when needed. This is especially useful for maintaining optimal performance in high-load scenarios or hot environments.

### RTC Battery Connector

This connector allows you to attach a backup battery for the Real-Time Clock (RTC), ensuring that the system clock remains accurate even when the device is powered off.
