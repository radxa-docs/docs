---
sidebar_position: 1
---

# Quick Start

## Product Photos

:::tip
This tutorial uses the Radxa E24C enclosure version for demonstration purposes!
:::

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C Top View</div>
  <img src="/img/e/e24c/e24c-01-shell.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '10px', fontSize: '18px', color: '#000000'}}>E24C Side View</div>
  <img src="/img/e/e24c/e24c-02-shell.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## Prerequisites

To properly boot and use the Radxa E24C device, you will need the following accessories: power adapter, bootable system media, and a debug cable (USB Type-A to Type-C).

:::tip
For users with different development capabilities, we recommend the following additional accessories to reduce the learning curve and development time with the Radxa E24C.

- For Beginners:

Required accessories: Power adapter, bootable system media, monitor, HDMI cable

- For Developers:

Required accessories: Power adapter, bootable system media, debug cable (USB Type-A to Type-C)

Note: A monitor can be used to display the system interface and perform graphical operations!
:::

### Power Supply

Use a 12V/2A power adapter with a DC5525 connector to power the board.

:::tip

Radxa E24C only supports 12V power input, and we recommend a current of 2A or higher to ensure stable operation of all peripherals.

Recommended power supply:

- [Radxa DC12 36W Power Adapter](https://radxa.com/products/accessories/power-dc12-36w) (Recommended)
- [Radxa DC12 60W Power Adapter](https://radxa.com/products/accessories/power-dc12-60w)
- Standard 12V/2A DC power adapter (DC5525 connector)

:::

### Boot Media

Radxa E24C supports various configurations, with the main difference being the presence of onboard eMMC storage.

**For boards without eMMC**: You will need a MicroSD card and a card reader.

**For boards with eMMC**: The system is pre-installed at the factory and ready to use!

### Debug Cable

Radxa E24C features a USB Type-C port primarily used for debugging and system access.

## Installing the Operating System

<Tabs queryString="e24c-system">

<TabItem value="No eMMC System">

For systems without onboard eMMC, you'll need to write the system image to a MicroSD card using a card reader.

- System Download

Go to the [Download Resources](../download) page to download the appropriate operating system image package. After downloading, extract the compressed file to get the `*.img` file needed for system installation.

:::tip
The downloaded system image is a compressed file that needs to be extracted before it can be written to the SD card using imaging software.
:::

- Hardware Connection

Insert the MicroSD card into the card reader, then connect the card reader to your PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-sd-insert.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Imaging Tool

We recommend using balenaEtcher, an open-source imaging tool developed by Radxa's partner Balena. It's user-friendly, powerful, and supports Windows, Linux, and macOS.

Download the software for your platform from the official website: [balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

On the download page, select the appropriate system platform to download the Etcher software.

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

:::tip
For Windows and Linux, simply run the program directly - no installation required!
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-down-etcher-00.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Installing the System Image

1. Select the system image: Click `Flash from file` and choose the system image file you downloaded and extracted earlier.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

2. Select the target disk: Click `Select target` and choose the disk device corresponding to your card reader.

:::danger
Be very careful to select the correct disk, as Etcher will format the selected disk, potentially causing data loss!
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

① : Select the disk device where you want to install the system image

② : Click `Select 1` to confirm your device selection

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

3. Start writing the system image: Click the `Flash` button and wait for the software to complete writing and verifying the system image.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-04.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system image to finish writing
  <img src="/img/e/e24c/etcher-05.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for verification to complete
  <img src="/img/e/e24c/etcher-07.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

4. After successfully writing the system image, close the Etcher software!

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-06.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="With Onboard eMMC System">

For users with onboard eMMC, the system comes pre-installed with OpenWrt - no need to flash a system image.

</TabItem>

</Tabs>

## Booting the System

<Tabs queryString="e24c-system">

<TabItem value="No eMMC System">

After writing the system image to the MicroSD card, insert it into the Radxa E24C's MicroSD card slot, then power on the device using the 12V DC power adapter.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-insert-sd.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="With Onboard eMMC System">

- Hardware Connection

Connect one end of an Ethernet cable to the Radxa E24C's LAN port and the other end to your PC's Ethernet port. Then power on the device using the 12V DC power adapter. The Ethernet port's LED will blink, indicating a normal network connection.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-rj45-cable.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Accessing the Luci Interface

Open a web browser on your PC, enter `http://192.168.1.1` in the address bar, and press Enter to access the system's Luci web configuration interface. Then log in with your username and password.

:::tip
OpenWrt System

Username: root

Password: password
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-open-login.webp" style={{width: '100%', maxWidth: '1000px'}} />
</div>

- System Management Interface

The Luci interface provides comprehensive system management features, including system status, network settings, software management, and hardware management.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-open-control.webp" style={{width: '100%', maxWidth: '1000px'}} />
</div>

</TabItem>

</Tabs>

## System Information

We provide two major operating systems: Debian Linux and OpenWrt. Please use the corresponding username and password to log in based on your system.

- Debian Linux

Username: radxa

Password: radxa

- OpenWrt

Username: root

Password: password

## System Login (Serial Port)

:::tip
If you have a monitor and HDMI cable, you can directly use the display to view and operate the system interface!
:::

### Hardware Connection

With the Radxa E24C powered on, connect the Type-A end of a USB Type-A to Type-C cable to your computer, and the Type-C end to the Radxa E24C debug port.

:::note

- Radxa E24C Serial Port Parameters

Baud Rate: 1500000

Data Bits: 8

Stop Bits: 1

No Parity

:::

### Serial Port Login

<Tabs queryString="e24c-system-login">

<TabItem value="Windows">

Windows users are recommended to use PuTTY for serial port login to the Radxa E24C system.

- Using PuTTY

After connecting the Radxa E24C to your PC with a USB Type-A to Type-C cable, you can check the corresponding COM port in the Device Manager (in the example, COM4 corresponds to the Radxa E24C device in the current system).

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/serial-01.webp" style={{width: '80%', maxWidth: '600px'}} />
</div>

:::tip

If the system fails to recognize the device or shows an exclamation mark, you need to install the [CH340 driver](https://www.wch.cn/downloads/CH341SER_EXE.html) manually and restart your system after installation.

:::

- Serial Port Login Options

① --> Connection type: Select `Serial`

② --> Serial line: Enter `COM4` (based on the COM port shown in Device Manager)

③ --> Speed: Enter `1500000`

④ --> Open: Connect to Radxa E24C system via serial port

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/serial-02.webp" style={{width: '80%', maxWidth: '600px'}} />
</div>

- Login to System

Press Enter in the terminal to see the login prompt, then log in using the appropriate username and password for your system.

Note that password input will not be displayed. Press Enter after entering your password.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/serial-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="Linux">

Linux users are recommended to use the Screen utility for serial port login to the Radxa E24C system.

- Install Screen

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo apt update
sudo apt install screen
```
</NewCodeBlock>

- Find Serial Port Device

Open a terminal and use the ls command to check the serial port devices:

If there's only one serial device, it will typically be ttyUSB0.

If there are multiple serial devices, you can plug/unplug the USB device and observe which device number changes using the command below.

<NewCodeBlock tip="Linux-host$" type="host">
```
ls /dev/ttyUSB*
```
</NewCodeBlock>

- Serial Port Login Options

To connect via Screen, you only need to specify the serial port and baud rate.

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo screen /dev/ttyUSB0 1500000
```
</NewCodeBlock>

- Login to System

Press Enter in the terminal to see the login prompt, then log in using the appropriate username and password for your system.

Note that password input will not be displayed. Press Enter after entering your password.

</TabItem>

<TabItem value="macOS">

macOS users are recommended to use the Screen utility for serial port login to the Radxa E24C system.

:::tip

If the system fails to recognize the device, you need to install the [CH340 driver](https://www.wch.cn/downloads/CH341SER_MAC_ZIP.html) manually and restart your system after installation.

:::

- Find Serial Port Device

Open a terminal and use the ls command to check the serial port devices.

Look for a device name similar to /dev/tty.wchusbserial14xx0. If there are multiple serial devices, you can plug/unplug the USB device and observe which device appears/disappears using the command below.

<NewCodeBlock tip="macOS-host$" type="host">
```
ls /dev/tty.*
```
</NewCodeBlock>

- Serial Port Login Options

To connect via Screen, you only need to specify the serial port and baud rate.

<NewCodeBlock tip="macOS-host$" type="host">
```
screen /dev/tty.wchusbserial14xx0 1500000
```
</NewCodeBlock>

- Login to System

Press Enter in the terminal to see the login prompt, then log in using the appropriate username and password for your system.

Note that password input will not be displayed. Press Enter after entering your password.

</TabItem>

</Tabs>
