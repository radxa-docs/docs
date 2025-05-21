---
sidebar_position: 2
---

# Interface Usage

## 1. Interface Overview

<Tabs queryString="e24cmode2">

<TabItem value="E24C (Bare Board)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C Bare Board Interfaces</div>
  <img src="/img/e/e24c/e24c-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| No. | Description | Qty |
| :--: | :-------------------------------------------- | :--: |
|  ①   | Power Interface: DC5525 |  1   |
|  ②   | Onboard eMMC |  1   |
|  ③   | USB 2.0 Type‑C Port (OTG + Debug Combo) |  1   |
|  ④   | User Button |  1   |
|  ⑤   | USB 2.0 Type‑A Ports |  3   |
|  ⑥   | RTC Battery Connector |  1   |
|  ⑦   | MicroSD Card Slot |  1   |
|  ⑧   | GPIO: 14-pin Expansion Header |  1   |
|  ⑨   | LED Indicators (1 Power LED, 4 Ethernet Port LEDs) |  5   |
|  ⑩   | Power Button |  1   |
|  ⑪   | Fan Connector |  1   |
|  ⑫   | Maskrom Button |  1   |
|  ⑬   | Gigabit Ethernet Ports (WAN/LAN Configurable) |  4   |
|  ⑭   | HDMI 2.1 Output Interface |  1   |
|  ⑮   | M.2 NVMe SSD Slot |  1   |

</TabItem>

<TabItem value="E24C Enclosure Version">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '10px', fontSize: '18px', color: '#000000'}}>E24C Enclosure Version Interfaces</div>
  <img src="/img/e/e24c/e24c-shell-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| No. | Description                                          | Qty |
| :--: | :--------------------------------------------------- | :--: |
|  ①   | Power Interface: DC5525                              |  1   |
|  ②   | HDMI 2.1 Output Interface                          |  1   |
|  ③   | Gigabit Ethernet Ports (Configurable as WAN/LAN)   |  4   |
|  ④   | Power Button                                       |  1   |
|  ⑤   | LED Status Indicators (1 Power, 4 Ethernet)        |  5   |
|  ⑥   | MicroSD Card Slot                                  |  1   |
|  ⑦   | USB 2.0 Type-A Ports                               |  3   |
|  ⑧   | Maskrom Button                                    |  1   |
|  ⑨   | User Button                                        |  1   |
|  ⑩   | USB 2.0 Type-C Port: Device + Debug Combo          |  1   |

</TabItem>

</Tabs>

## 2. Interface Description

The following interface descriptions are based on the Radxa E24C bare board.

### 2.1 Power Interface

The device is powered by a 12V/2A DC5525 power adapter.

:::tip

Recommended power supplies:

- [Radxa DC12 36W Power Adapter](https://radxa.com/products/accessories/power-dc12-36w) (Recommended)
- [Radxa DC12 60W Power Adapter](https://radxa.com/products/accessories/power-dc12-60w)
- Standard 12V/2A DC power adapter (DC5525 connector)

:::

### 2.2 Onboard eMMC

Optional onboard eMMC storage configuration.

### 2.3 USB 2.0 Type-C Port

The USB 2.0 Type-C port serves as a debug interface for viewing logs and accessing the device, with a default baud rate of 1500000.

It also functions as a data transfer interface, supporting USB2.0 OTG data transfer and serial debugging.

- USB2.0 OTG

Supports adb, usbnet, and mass storage.

The following example demonstrates USB mass storage configuration. Before executing the commands, ensure the SSD is properly connected via the M-Key.

<NewCodeBlock tip="radxa@radxa-e24c$" type="host">
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
mkfs.ext4 /dev/nvme0n1p1
echo /dev/nvme0n1p1 > functions/mass_storage.usb0/lun.0/file
ln -s functions/mass_storage.usb0 configs/c.1
echo fc000000.usb > UDC
```
</NewCodeBlock>

### 2.4 User Button

A programmable user button that can be customized through software.

### 2.5 USB 2.0 Type-A Ports

Provides three USB 2.0 ports for connecting external devices such as keyboards, mice, and storage devices.

### 2.6 RTC Battery Connector

A 2-Pin 1.25mm RTC battery connector for connecting a real-time clock battery to maintain system time accuracy even after power loss.

### 2.7 MicroSD Card Slot

For inserting MicroSD cards, which can be used as a boot device or for additional storage.

### 2.8 GPIO: 14-Pin Expansion Header

A 14-Pin 0.1" (2.54mm) interface supporting multiple interface functions:

- 1x SPI
- 1x UART
- 1x I2C
- 2x 5V power outputs
- 1x 3.3V power output

- Usage Example

<NewCodeBlock tip="radxa@radxa-e24c$" type="host">
```
# Install GPIO control tools
sudo apt-get install gpiod

# List available GPIO chips
gpiodetect

# View GPIO status
gpioinfo

# Control GPIO output
gpioset <chip> <line>=<value>

# Read GPIO input
gpioget <chip> <line>
```
</NewCodeBlock>

### 2.9 LED Status Indicators

Five status LEDs showing power and network status. The corresponding LEDs can be identified by the silkscreen on the Radxa E24C bare board.

- Power LED: Glows green when the device is powered on
- Network status LEDs: LED brightness changes according to the network port signal

### 2.10 Power Button

Used to turn the device power on and off.

### 2.11 Fan Connector

A 2-Pin 1.25mm fan connector for connecting a cooling fan.

### 2.12 Maskrom Button

The Maskrom button is used to enter Maskrom mode for firmware flashing.

### 2.13 Gigabit Ethernet Ports

Provides four Gigabit Ethernet ports.

In OpenWrt systems, these ports can be flexibly configured as WAN (Wide Area Network) or LAN (Local Area Network) ports, offering highly customizable network solutions. Multiple ports also provide redundancy and load balancing capabilities, enhancing network reliability and performance.

- Unique MAC Address

The Radxa E24C's MAC address is unique and fixed. It remains unchanged after power cycling or software restarts, and even after firmware reflashing.

- Network Port Speed Testing

<NewCodeBlock tip="radxa@radxa-e24c$" type="host">
```
# Install iperf3 tool
sudo apt install iperf3

# Run command on server side
iperf -s

# Test upload speed
iperf3 -c server-ip -t 60

# Test download speed
iperf3 -c server-ip -t 60 -R
```
</NewCodeBlock>

### 2.14 HDMI 2.1 Output Interface

Supports video output up to 4K resolution, connectable to monitors or TVs.

### 2.15 M.2 NVMe SSD Interface

Provides a PCIe 2.1 1-lane interface for connecting M.2 NVMe SSDs.
Supports standard M.2 2280 specification NVMe SSDs. Note that M.2 SATA SSDs are not supported.
