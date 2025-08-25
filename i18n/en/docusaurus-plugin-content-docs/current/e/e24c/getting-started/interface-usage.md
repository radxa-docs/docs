---
sidebar_position: 2
---

# Interface Usage

## Interface Overview

<Tabs queryString="e24cmode2">

<TabItem value="E24C (Bare Board)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C Bare Board Interfaces</div>
  <img src="/img/e/e24c/e24c-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| No. | Description                                    | Qty |
| :-: | :--------------------------------------------- | :-: |
|  ①  | Power Interface: DC5525                        |  1  |
|  ②  | Onboard eMMC                                   |  1  |
|  ③  | USB 2.0 Type-C: Combined Device & Debug Port   |  1  |
|  ④  | User Button                                    |  1  |
|  ⑤  | USB 2.0 Type-A Ports                           |  3  |
|  ⑥  | RTC Battery Connector                          |  1  |
|  ⑦  | MicroSD Card Slot                              |  1  |
|  ⑧  | GPIO: 14-Pin Expansion Header                  |  1  |
|  ⑨  | LED Indicators (1 Power, 4 Ethernet Port LEDs) |  5  |
|  ⑩  | Power Button                                   |  1  |
|  ⑪  | Fan Header                                     |  1  |
|  ⑫  | Maskrom Button                                 |  1  |
|  ⑬  | Gigabit Ethernet Ports (Configurable WAN/LAN)  |  4  |
|  ⑭  | HDMI 2.1 Output                                |  1  |
|  ⑮  | M.2 NVMe SSD Slot                              |  1  |

</TabItem>

<TabItem value="E24C (Enclosed Version)">

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '10px', fontSize: '18px', color: '#000000'}}>E24C Enclosed Version Interfaces</div>
  <img src="/img/e/e24c/e24c-shell-interface.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

| No. | Description                                    | Qty |
| :-: | :--------------------------------------------- | :-: |
|  ①  | Power Interface: DC5525                        |  1  |
|  ②  | HDMI 2.1 Output                                |  1  |
|  ③  | Gigabit Ethernet Ports (Configurable WAN/LAN)  |  4  |
|  ④  | Power Button                                   |  1  |
|  ⑤  | LED Indicators (1 Power, 4 Ethernet Port LEDs) |  5  |
|  ⑥  | MicroSD Card Slot                              |  1  |
|  ⑦  | USB 2.0 Type-A Ports                           |  3  |
|  ⑧  | Maskrom Button                                 |  1  |
|  ⑨  | User Button                                    |  1  |
|  ⑩  | USB 2.0 Type-C: Combined Device & Debug Port   |  1  |

</TabItem>

</Tabs>

## Interface Description

This section describes the interfaces using the Radxa E24C bare board as an example.

### Power Interface

Powered by a 12V/2A power adapter with a DC5525 connector.

:::tip

Recommended power supplies:

- [Radxa DC12 36W Power Adapter](https://radxa.com/products/accessories/power-dc12-36w) (Recommended)
- [Radxa DC12 60W Power Adapter](https://radxa.com/products/accessories/power-dc12-60w)
- Standard 12V/2A DC Power Adapter (DC5525 connector)

:::

### Onboard eMMC

Optional onboard eMMC storage configuration.

### USB 2.0 Type-C Port

Serves as a debug port for viewing logs and accessing the device, with a default baud rate of 1500000.

As a data transfer interface, it supports USB 2.0 OTG data transfer and serial debugging.

- USB 2.0 OTG

Supports ADB, USB network, and mass storage.

Example for USB mass storage (ensure SSD is connected via M.2 M-Key before executing commands):

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

### User Button

Programmable button with software-configurable functionality.

### USB 2.0 Type-A Ports

Three USB 2.0 ports for connecting external devices such as keyboards, mice, and storage devices.

### RTC Battery Connector

2-Pin 1.25mm RTC battery connector for connecting a real-time clock battery to maintain accurate system time during power loss.

### MicroSD Card Slot

For inserting a MicroSD card, which can be used as a system boot device or for additional storage.

### GPIO: 14-Pin Expansion Header

14-Pin 0.1" (2.54mm) interface supporting multiple functions including SPI, UART, I2C, and power output.

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C GPIO Pinout Diagram</div>
  <img src="/img/e/e24c/e24c-gpio-pinout.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

#### GPIO Pin Definition Table

| Pin # | Pin Name | Description       | Level Type | Default Function |
| :---: | :------- | :---------------- | :--------: | :--------------- |
|   1   | 5V       | 5V Power Output   |   Power    | Power Output     |
|   2   | GND      | Ground            |   Ground   | Ground           |
|   3   | UART_TX  | UART Transmit     |    3.3V    | UART2_TX         |
|   4   | UART_RX  | UART Receive      |    3.3V    | UART2_RX         |
|   5   | I2C_SCL  | I2C Clock         |    3.3V    | I2C2_SCL         |
|   6   | I2C_SDA  | I2C Data          |    3.3V    | I2C2_SDA         |
|   7   | SPI_CLK  | SPI Clock         |    3.3V    | SPI2_CLK         |
|   8   | SPI_TX   | SPI MOSI          |    3.3V    | SPI2_TX/MOSI     |
|   9   | SPI_RX   | SPI MISO          |    3.3V    | SPI2_RX/MISO     |
|  10   | SPI_CS   | SPI Chip Select   |    3.3V    | SPI2_CS          |
|  11   | GPIO0    | Programmable GPIO |    3.3V    | GPIO0_A2         |
|  12   | GPIO1    | Programmable GPIO |    3.3V    | GPIO0_A3         |
|  13   | 3.3V     | 3.3V Power Output |   Power    | Power Output     |
|  14   | 5V       | 5V Power Output   |   Power    | Power Output     |

:::warning
All signal pins are 3.3V level. Do not connect 5V signals as this may damage the single-board computer.
:::

#### GPIO Usage Example

<NewCodeBlock tip="radxa@radxa-e24c$" type="device">
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

#### Common Peripheral Connection Examples

##### I2C Sensor Connection

<NewCodeBlock tip="radxa@radxa-e24c$" type="device">
```
# Install I2C tools
sudo apt-get install i2c-tools
# Scan for I2C devices
sudo i2cdetect -y 2 # Assuming I2C2 is used
# Read I2C device register
sudo i2cget -y 2 0x48 0x00 # Read register 0x00 from device at address 0x48
# Write to I2C device register
sudo i2cset -y 2 0x48 0x01 0x55 # Write 0x55 to register 0x01 of device at address 0x48
```
</NewCodeBlock>

### LED Status Indicators

Five status indicators showing power and network status. Refer to the silkscreen on the Radxa E24C bare board to identify each indicator.

- Power LED: Green light when power is connected
- Network Status LEDs: Blink in sync with corresponding network port activity

### Power Button

Used to power the device on and off.

### Fan Header

2-Pin 1.25mm fan header for connecting a cooling fan.

### Maskrom Button

Used to enter Maskrom mode for firmware flashing.

### Gigabit Ethernet Ports

Four Gigabit Ethernet ports.

In OpenWrt systems, these interfaces can be flexibly configured as WAN (Wide Area Network) or LAN (Local Area Network) ports, providing a highly customizable networking solution. Multiple ports also offer redundancy and load balancing capabilities, enhancing network reliability and performance.

- Unique MAC Address

The Radxa E24C has a unique and fixed MAC address that remains consistent across power cycles, reboots, and even after reflashing the firmware.

- Network Speed Test

<NewCodeBlock tip="radxa@radxa-e24c$" type="host">
```
# Install iperf3 tool
sudo apt install iperf3
# Run on the server side
iperf -s
# Test upload speed
iperf3 -c server-ip -t 60
# Test download speed
iperf3 -c server-ip -t 60 -R
```
</NewCodeBlock>

### HDMI 2.1 Output Port

Supports video output up to 4K resolution, compatible with monitors and TVs.

### M.2 NVMe SSD Interface

Provides a PCIe 2.1 1-lane interface for connecting M.2 NVMe SSDs.
Supports standard M.2 2280 form factor NVMe SSDs. Note: M.2 SATA SSDs are not supported.
