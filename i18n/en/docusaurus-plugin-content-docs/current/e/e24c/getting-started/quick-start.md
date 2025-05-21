---
sidebar_position: 1
---

# Quick Start Guide

## 1. Product Images

:::tip
The illustrations in this guide use the Radxa E24C Enclosure version!
:::

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C Top View</div>
  <img src="/img/e/e24c/e24c-01-shell.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '10px', fontSize: '18px', color: '#000000'}}>E24C Side View</div>
  <img src="/img/e/e24c/e24c-02-shell.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## 2. Prerequisites

To properly start and use the Radxa E24C device, you need to prepare the following accessories: power adapter, system boot medium, and debugging data cable (USB Type-A to Type-C cable).

:::tip
For users with different development capabilities, we recommend adding the following accessories to use Radxa E24C, which will shorten the time to familiarize with the product and development.

- Beginners

Required accessories: power adapter, system boot medium, monitor, HDMI cable

- Developers

Required accessories: power adapter, system boot medium, debugging data cable (USB Type-A to Type-C cable)

Note: The monitor can display the system interface and perform graphical operations!
:::

### 2.1 Power Supply

The device is powered by a 12V/2A DC5525 power adapter.

:::tip

Radxa E24C only supports 12V power input. It is recommended to use a power supply with 2A or higher current to ensure stable operation of all peripherals.

Recommended power supplies:

- [Radxa DC12 36W Power Adapter](https://radxa.com/products/accessories/power-dc12-36w) (Recommended)
- [Radxa DC12 60W Power Adapter](https://radxa.com/products/accessories/power-dc12-60w)
- Standard 12V/2A DC power adapter (DC5525 connector)

:::

### 2.2 System Boot Medium

Radxa E24C supports various configuration options, primarily focusing on whether the motherboard has onboard eMMC.

**For motherboards without eMMC**: Need to prepare a MicroSD card and card reader.

**For motherboards with eMMC**: The system is pre-installed at the factory, ready to use!

### 2.3 Debugging Data Cable

The Radxa E24C has a USB Type-C interface, primarily used for debugging and system access.

## 3. Installing Operating System

<Tabs queryString="e24c-system">

<TabItem value="System without Onboard eMMC">

For users without onboard eMMC, you need to use a card reader to write the system to the MicroSD card.

- System Download

Go to the [Resource Download](../download) page to download the corresponding operating system image package. After downloading, extract the system image package. The `*.img` file is the image file needed for system installation.

:::tip
The downloaded system image is a compressed file that needs to be extracted before it can be written to the SD card using the image burning software.
:::

- Hardware Connection

Insert the MicroSD card into the card reader, then plug the card reader into the PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-sd-insert.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Image Burning Tool

We recommend using the open-source Etcher image burning tool developed by Radxa's partner Balena. This software is simple to use, powerful, and supports Windows/Linux/macOS systems.

Go to the official website to download the software for your system: [balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

After entering the download page, select the corresponding system platform to download the Etcher software.

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

:::tip
Windows and Linux users can just open the corresponding program to use it, no installation required!
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-down-etcher-00.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Installing System Image

1. Select the system image for your motherboard: Click the `Flash from file` option and select the system image file you downloaded and extracted.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

2. Select the MicroSD card's disk: Click the `Select target` option and select the disk device corresponding to the card reader connected to your PC.

:::danger
Do not select the wrong disk, otherwise Etcher will format the selected disk, causing important data loss!
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

①: Select the disk device for installing the system image

②: Click the `Select 1` option to confirm the device selection

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

3. Start writing the system image: Click the `Flash` option and wait for the software to automatically write and verify the system image.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-04.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system write to complete
  <img src="/img/e/e24c/etcher-05.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system verification to complete
  <img src="/img/e/e24c/etcher-07.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

4. After successfully writing the system image, close the Etcher software!

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-06.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="System with Onboard eMMC">

For users with onboard eMMC, the system comes pre-installed with OpenWrt, no need to burn the system image.

</TabItem>

</Tabs>

## 4. Starting the System

<Tabs queryString="e24c-system">

<TabItem value="System without Onboard eMMC">

After writing the system image to the MicroSD card, we can insert the MicroSD card from the card reader into the Radxa E24C's MicroSD card slot, then use the 12V DC power adapter to start the system.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-insert-sd.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="System with Onboard eMMC">

- Hardware Connection

Connect the Radxa E24C's Ethernet LAN port to the PC's Ethernet port using an Ethernet cable, then use the 12V DC power adapter to start the system: The LED indicator light corresponding to the Ethernet port will flash, indicating normal network connection.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-rj45-cable.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Login to Luci Interface

Open the PC's browser, enter the address `http://192.168.1.1`, press Enter to access the system's Luci web configuration interface, then enter the username and password to log in.

:::tip
OpenWrt System

Username: root

Password: password
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-open-login.webp" style={{width: '100%', maxWidth: '1000px'}} />
</div>

- System Management Interface

The Luci interface provides rich system management functions, including system status, network settings, software management, hardware management, etc.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-open-control.webp" style={{width: '100%', maxWidth: '1000px'}} />
</div>

</TabItem>

</Tabs>

## 5. System Information

We provide two major operating systems: Debian Linux and OpenWrt. Users should use the corresponding username and password based on their system.

- Debian Linux

Username: radxa

Password: radxa

- OpenWrt

Username: root

Password: password

## 6. Login to System (Serial Port)

:::tip
If you have a monitor and HDMI cable, you can directly use the monitor to view the system interface and perform operations!
:::

### 6.1 Hardware Connection

When Radxa E24C is powered, connect the USB Type-A to Type-C cable's Type-A end to the computer and the Type-C end to Radxa E24C's debug port.

:::note

- Radxa E24C Serial Port Parameters

Baud Rate: 1500000

Data Bits: 8

Stop Bits: 1

No Parity

:::

### 6.2 Serial Port Login

<Tabs queryString="e24c-system-login">

<TabItem value="Windows">

Windows platform recommends using PuTTY software for serial port login to the Radxa E24C system.

- PuTTY Usage

After connecting Radxa E24C and PC with USB Type-A to Type-C data cable, you can check the serial port number of Radxa E24C in the system's Device Manager (in the diagram, COM4 is the current system's Radxa E24C device).

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/serial-01.webp" style={{width: '80%', maxWidth: '600px'}} />
</div>

:::tip

If the system cannot correctly identify the device or if there is an exclamation mark before the device, you need to install the [CH340 driver](https://www.wch.cn/downloads/CH341SER_EXE.html) yourself, then restart the system after installation.

:::

- Serial Port Login Options

① --> Connection type: Select `Serial`

② --> Serial line: Enter `COM4` (based on the serial port number shown in Device Manager)

③ --> Speed: Enter `1500000`

④ --> Open: Serial port connection to Radxa E24C system

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/serial-02.webp" style={{width: '80%', maxWidth: '600px'}} />
</div>

- Login to System

Press Enter in the terminal to see login information, then use the corresponding system's username and password to log in.

Note: Password input in the terminal will not be displayed. After entering the password, press Enter to log in.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/serial-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="Linux">

Linux recommends using Screen software for serial port login to the Radxa E24C system.

- Install Screen

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo apt install screen
```
</NewCodeBlock>

- Find Serial Port Device

Open the terminal and use the ls command to view the serial port device:

If your PC has only one serial port device, the system defaults to ttyUSB0;

If your PC has multiple serial port devices, you can plug and unplug USB devices to observe the changing device numbers using the following command:

<NewCodeBlock tip="Linux-host$" type="host">
```
ls /dev/ttyUSB*
```
</NewCodeBlock>

- Serial Port Login Options

Use Screen to connect to the serial port, just need to set the serial port number and baud rate.

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo screen /dev/ttyUSB0 1500000
```
</NewCodeBlock>

- Login to System

Press Enter in the terminal to see login information, then use the corresponding system's username and password to log in.

Note: Password input in the terminal will not be displayed. After entering the password, press Enter to log in.

</TabItem>

<TabItem value="macOS">

macOS platform recommends using Screen software for serial port login to the Radxa E24C system.

:::tip

If the system cannot correctly identify the device, you need to install the [CH340 driver](https://www.wch.cn/downloads/CH341SER_MAC_ZIP.html) yourself, then restart the system after installation.

:::

- Find Serial Port Device

Open the terminal and use the ls command to view the serial port device:

Find a device name similar to /dev/tty.wchusbserial14xx0. If your PC has multiple serial port devices, you can plug and unplug USB devices to observe the changing device numbers using the following command:

<NewCodeBlock tip="macOS-host$" type="host">
```
ls /dev/tty.*
```
</NewCodeBlock>

- Serial Port Login Options

Use Screen to connect to the serial port, just need to set the serial port number and baud rate.

<NewCodeBlock tip="macOS-host$" type="host">
```
screen /dev/tty.wchusbserial14xx0 1500000
```
</NewCodeBlock>

- Login to System

Press Enter in the terminal to see login information, then use the corresponding system's username and password to log in.

Note: Password input in the terminal will not be displayed. After entering the password, press Enter to log in.

</TabItem>

</Tabs>
