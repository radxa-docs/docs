---
sidebar_position: 2
---

# Quickly Start

The purpose of this chapter is to help you quickly use Radxa ROCK 4D. You can follow this tutorial.

## Product

<div style={{textAlign: 'center'}}>
   Radxa ROCK 4D front
   <img src="/img/rock4/4d/rock4d-top.webp" style={{width: '100%', maxWidth: '1200px'}} />
   Radxa ROCK 4D back
    <img src="/img/rock4/4d/rock4d-bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

### Hardware Devices

You need to prepare the following hardware devices in advance to complete all operations in the quickly starting tutorial.

- Development board: Radxa ROCK 4D
- System startup medium: MicroSD card
- USB serial data line (optional): used for serial debugging and login
- Display (optional): HDMI display and HDMI data line
- Power adapter: Type-C power adapter (support PD protocol, 5V power input, recommended current 3A above)

**Note**: Users need to choose between USB serial data line and display, we recommend using display to use and develop Rock 4D.

:::tip
For users with different development capabilities, we suggest adding the following accessories to use Radxa ROCK 4D, which will shorten the time to become familiar with the product and development.

- **Beginner**

Prepare accessories: power adapter, system startup medium, display, HDMI data line

- **Developer**

Prepare accessories: power adapter, system startup medium, debugging data line (USB serial data line)

**Note**: The display can display the system interface and perform graphic operations!
:::

### Mainboard Power Supply

Radxa ROCK 4D mainboard supports Type-C and GPIO power supply, we recommend using Type-C power adapter power supply, please ensure that the power adapter can provide 5V power input and be compatible with PD protocol.

:::tip
Radxa ROCK 4D mainboard only supports 5V power input, it is recommended to use a current of 3A above to ensure stable operation of all peripherals.

Reference power:

- [Radxa 30W PD Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)

- Standard Type-C Power Adapter (5V power input, PD protocol supported, recommended current 3A above)
  :::

### System Startup Medium

Radxa ROCK 4D supports MicroSD card, NVME, UFS startup, but the quick start tutorial only introduces MicroSD card startup.

### Serial Debug

Radxa ROCK 4D mainboard supports serial debugging through USB serial data line, you need to connect the USB serial data line to the Radxa ROCK 4D's UART0_TX, UART0_RX and GND pins.

## Write System Image

You need to download the system image file to be written on the PC and burn it to the MicroSD card.

### Download System Image

Access the [Resource Download Summary](../download) page on the PC, download the system image compression package corresponding to Radxa ROCK 4D, decompress the system image compression package after downloading, and the `*.img` file obtained is the system image file to be written to the MicroSD card.

:::tip
The downloaded system image is a compressed file that needs to be extracted before being written to the SD card using the image burning software. Writing the compressed file directly to the SD card may result in write failure or boot failure.
:::

### Writing the System Image

Insert the MicroSD card into a card reader, then connect the card reader to a USB port on your PC.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- **Image Burning Software: Balena Etcher**

We recommend using Balena Etcher, an open-source image burning tool developed by Radxa's partner Balena. This software is user-friendly, powerful, and supports Windows, Linux, and macOS.

Download the software from the official website: [balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

On the download page, select the appropriate platform to download the Etcher software.

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
For Windows and Linux, you can run the program directly without installation!
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- Installing the System Image

1. Select the system image for your board: Click the `Flash from file` option and choose the system image file you downloaded and extracted earlier.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. Select the disk corresponding to your MicroSD card: Click the `Select target` option and choose the disk device that corresponds to your card reader connected to the PC.

:::danger
Be careful not to select the wrong disk, as Etcher will format the selected disk, potentially causing data loss!
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Select the disk device where you want to install the system image

② : Click the `Select 1` option to confirm device selection

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. Start writing the system image: Click the `Flash` option and wait for the software to automatically write and verify the system image.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system write to complete
  <img src="/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for system verification to complete
  <img src="/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

4. After successfully writing the system image, close the Etcher software!

## System Information

When using our provided system image for the first time, you will need to log in with the following default credentials:

- Debian Linux

Username: radxa

Password: radxa

## Booting the System

After writing the system image to the MicroSD card, insert the card into the Radxa ROCK 4D's MicroSD card slot, then power on the system using a 5V Type-C power adapter.

After powering on, both the blue and green LED indicators will light up. After a few seconds, the green LED will stay on while the blue LED will blink, indicating that the system has booted successfully.

Usage recommendations:

1. If you have a display, after starting the Radxa ROCK 4D, you can connect it to the display using an HDMI cable to view the system interface directly.

2. If you don't have a display, you can use a serial debugging tool to view the system output, confirm whether the system has booted successfully, and log in to use the Radxa ROCK 4D.

## Serial Console Login

:::tip

- Radxa ROCK 4D Serial Port Parameters

Baud Rate: 1500000

Data Bits: 8

Stop Bits: 1

No Parity

:::

- Hardware Connection

:::danger
When using a USB to UART cable for serial debugging with Radxa ROCK 4D, make sure the pins are connected correctly to avoid damaging the board.
:::

Connect the USB end of the USB to UART cable to your PC, and connect the other end to the GPIO UART pins on the Radxa ROCK 4D.

| Number | Pin Function                          | Connection Method                        |
| ------ | ------------------------------------- | ---------------------------------------- |
| ①      | Radxa ROCK 4D : GND（Pin6）           | Connect to GND pin of USB to UART cable  |
| ②      | Radxa ROCK 4D : UART0_TX（Pin8）      | Connect to RX pin of USB to UART cable   |
| ③      | Radxa ROCK 4D : UART0_RX（Pin10）     | Connect to TX pin of USB to UART cable   |
| ④      | USB to UART cable : GND（Black wire） | Connect to GND pin of Radxa ROCK 4D      |
| ⑤      | USB to UART cable : RX（White wire）  | Connect to UART0_TX pin of Radxa ROCK 4D |
| ⑥      | USB to UART cable : TX（Green wire）  | Connect to UART0_RX pin of Radxa ROCK 4D |
| ⑦      | USB to UART cable : VCC（Red wire）   | Do not connect                           |

<div style={{textAlign: 'center'}}>
  Pin Description and Connection Diagram
  <img src="/img/rock4/4d/serial-connect.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

<Tabs queryString="e24c-system-login">

<TabItem value="Windows">

For Windows, we recommend using PuTTY for serial console login to the Radxa ROCK 4D system.

- Using PuTTY

After connecting the Radxa ROCK 4D to your PC via USB-to-UART cable, you can check the corresponding COM port in the Device Manager (in the example, COM4 is the port assigned to the Radxa ROCK 4D).

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-port-en.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

:::tip

If the system fails to recognize the device or shows an exclamation mark, you'll need to install the [CH340 driver](https://www.wch.cn/downloads/CH341SER_EXE.html) manually and restart your system after installation.

:::

- Serial Port Login Options

① --> Connection type: Select `Serial`

② --> Serial line: Enter `COM4` (or your specific COM port number as shown in Device Manager)

③ --> Speed: Enter `1500000`

④ --> Click Open to connect to the Radxa ROCK 4D system via serial

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-02.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

- Logging In

Press Enter in the terminal to see the login prompt, then enter the username and password for your system.

Note: The password won't be displayed as you type. Press Enter after entering your password.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux">

For Linux, we recommend using the Screen utility for serial console login to the Radxa ROCK 4D system.

- Install Screen

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo apt update
sudo apt install screen
```
</NewCodeBlock>

- Find Serial Device

Open a terminal and use the ls command to list serial devices:

If your PC has only one serial device, it will typically be ttyUSB0.

If your PC has multiple serial devices, you can plug and unplug the USB device while running the following command to identify the correct device.

<NewCodeBlock tip="Linux-host$" type="host">
```
ls /dev/ttyUSB*
```
</NewCodeBlock>

- Serial Port Login Options

To connect using Screen, you only need to specify the serial port and baud rate.

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo screen /dev/ttyUSB0 1500000
```
</NewCodeBlock>

- Logging In

Press Enter in the terminal to see the login prompt, then enter the username and password for your system.

Note: The password won't be displayed as you type. Press Enter after entering your password.

</TabItem>

<TabItem value="MacOS">

For macOS, we recommend using the Screen utility for serial console login to the Radxa ROCK 4D system.

:::tip

If your system fails to recognize the device, you'll need to install the [CH340 driver](https://www.wch.cn/downloads/CH341SER_MAC_ZIP.html) manually and restart your system after installation.

:::

- Find Serial Device

Open Terminal and use the ls command to list serial devices:

Look for a device name similar to /dev/tty.wchusbserial14xx0. If your Mac has multiple serial devices, you can plug and unplug the USB device while running the following command to identify the correct device.

<NewCodeBlock tip="MacOS-host$" type="host">
```
ls /dev/tty.*
```
</NewCodeBlock>

- Serial Port Login Options

To connect using Screen, you only need to specify the serial port and baud rate.

<NewCodeBlock tip="MacOS-host$" type="host">
```
screen /dev/tty.wchusbserial14xx0 1500000
```
</NewCodeBlock>

- Logging In

Press Enter in the terminal to see the login prompt, then enter the username and password for your system.

Note: The password won't be displayed as you type. Press Enter after entering your password.

</TabItem>

</Tabs>

## System Usage

### With Display

If you're using Radxa ROCK 4D with a display, the system usage becomes straightforward as you can operate it through the graphical interface shown on the display.

### Without Display

If you're using Radxa ROCK 4D with only a USB-to-UART cable, you can operate the system through serial console.

:::tip
For users operating without a display, here are some recommendations to help you get started quickly:

1. **Network Configuration**

   Simply connect an Ethernet cable to your Radxa ROCK 4D to ensure network connectivity.

2. **Serial Debugging**

   Use [serial debugging](../system-config/uart_debug) to view system output, including IP addresses and boot messages.

3. **SSH Remote Access**

   Configure [SSH remote access](../system-config/ssh-remote) to log in to your system without needing the USB-to-UART cable.

4. **VNC Remote Access**

   If your system has a graphical interface, set up [VNC remote access](../system-config/vnc-remote) to view and control the desktop environment without a physical display.
   :::
