---
sidebar_position: 1
---

# Quick Start

This chapter is designed to help you quickly get started with the Radxa ROCK 4D. Follow this guide to begin using your device.

## Product Overview

<div style={{textAlign: 'center'}}>
   ROCK 4D Front View
   <img src="/en/img/rock4/4d/rock4d-top.webp" style={{width: '100%', maxWidth: '1200px'}} />
   ROCK 4D Rear View
    <img src="/en/img/rock4/4d/rock4d-bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## Prerequisites

### Hardware Requirements

To complete all the steps in this quick start guide, you'll need to prepare the following hardware in advance:

- Development board: Radxa ROCK 4D
- Boot media: MicroSD card
- USB-to-TTL serial cable (optional): For serial debugging and login
- Display (optional): HDMI monitor and HDMI cable
- Power adapter: Type-C power adapter (supports PD protocol, 5V input, recommended current ≥3A)

**Note**: You'll need either a USB-to-TTL serial cable or a display. We recommend using a display with the ROCK 4D for both usage and development.

:::tip
For users with different development needs, we recommend the following additional accessories to speed up your familiarization and development process:

- **Beginners**

Required accessories: Power adapter, boot media, display, HDMI cable

- **Developers**

Required accessories: Power adapter, boot media, debug cable (USB-to-TTL serial cable)

**Note**: The display allows you to view the system interface and perform graphical operations!
:::

### Board Power Supply

The ROCK 4D supports both Type-C and GPIO power input. We recommend using a Type-C power adapter. Ensure your power adapter provides 5V power input and is compatible with the PD protocol.

:::tip
The ROCK 4D only supports 5V power input, with a recommended current of 3A or higher to ensure stable operation of all peripherals.

Recommended power adapters:

- [Radxa PD 30W Power Adapter (Recommended)](https://radxa.com/products/accessories/power-pd-30w)

- Standard Type-C power adapter (5V input, supports PD protocol, recommended current ≥3A)
  :::

### Boot Media

While the ROCK 4D supports booting from MicroSD cards, NVMe, and UFS, this quick start guide will focus on booting from a MicroSD card.

### Serial Debugging

The ROCK 4D supports serial debugging via a USB-to-TTL serial cable. You'll need to connect the cable to the UART0_TX, UART0_RX, and GND pins on the ROCK 4D.

## Writing the System Image

You'll need to download the system image file to your PC and then write it to a MicroSD card.

### Downloading the System Image

Visit the [Downloads](../download) page on your PC to download the system image package for the ROCK 4D. After downloading, extract the package to get the `*.img` file, which is the system image to be written to your MicroSD card.

:::tip
The downloaded system image is a compressed file that must be extracted before writing to the SD card. Writing the compressed file directly to the SD card may result in system write or boot failures.
:::

### Writing the System Image

Insert the MicroSD card into a card reader, then connect the card reader to your PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- **Image Flashing Software: Balena Etcher**

We recommend using Balena Etcher, an open-source image flashing tool developed by Radxa's partner Balena. This software is user-friendly, powerful, and supports Windows, Linux, and macOS.

Download the software for your system from the official website: [balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
<img src="/en/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

On the download page, select the appropriate version for your operating system.

<div style={{textAlign: 'center'}}>
<img src="/en/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
For Windows and Linux, simply run the downloaded file - no installation is required!
:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- Flashing the System Image

1. Select the system image: Click `Flash from file` and choose the extracted system image file you downloaded earlier.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. Select the target device: Click `Select target` and choose the disk device corresponding to your card reader.

:::danger
Be extremely careful to select the correct disk! Selecting the wrong disk will result in data loss as Etcher will format the selected disk.
:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Select the disk device where you want to install the system image

② : Click `Select 1` to confirm your device selection

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. Start writing the system image: Click the `Flash!` button and wait for the software to write and verify the system image automatically.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for the system image to finish writing
  <img src="/en/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Waiting for verification to complete
  <img src="/en/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

4. After successfully writing the system image, close the Etcher software!

## System Information

When using our provided system image for the first time, you'll need to log in with the default username and password.

- Debian Linux

Username: radxa

Password: radxa

## Booting the System

After writing the system image to your MicroSD card, insert it into the ROCK 4D's MicroSD card slot. Then, power on the system using a 5V Type-C power adapter.

When the system boots, both the blue and green LEDs will light up simultaneously. After a few seconds, the green LED will stay lit while the blue LED blinks, indicating a successful system boot.

Usage recommendations:

1. If you have a display, connect it to the ROCK 4D using an HDMI cable after booting to view the system interface directly.

2. If you don't have a display, you can use a serial debugging tool to view system output, confirm successful boot, and log in to use the ROCK 4D.

## Serial Console Login

We recommend using Tabby terminal emulator for serial console login and debugging. It supports multiple platforms including Windows, Linux, and macOS.

:::tip

- ROCK 4D Serial Port Parameters

Baud rate: 1500000

Data bits: 8

Stop bits: 1

Parity: None

:::

### Hardware Connection

:::danger
When using a USB-to-TTL serial cable for debugging with the ROCK 4D, ensure the pins are connected correctly to prevent hardware damage to the board.
:::

Connect the USB end of the USB-to-TTL serial cable to your PC, and connect the other end to the ROCK 4D's GPIO UART pins.

| No. | Pin Function                | Connection Method               |
| --- | --------------------------- | ------------------------------- |
| ①   | ROCK 4D: GND (Pin6)         | Connect to GND pin of USB cable |
| ②   | ROCK 4D: UART0_TX (Pin8)    | Connect to RX pin of USB cable  |
| ③   | ROCK 4D: UART0_RX (Pin10)   | Connect to TX pin of USB cable  |
| ④   | USB Cable: GND (Black wire) | Connect to GND pin of ROCK 4D   |
| ⑤   | USB Cable: RX (White wire)  | Connect to UART0_TX of ROCK 4D  |
| ⑥   | USB Cable: TX (Green wire)  | Connect to UART0_RX of ROCK 4D  |
| ⑦   | USB Cable: VCC (Red wire)   | Do not connect                  |

<div style={{textAlign: 'center'}}>
  Pinout and Connection Diagram
  <img src="/en/img/rock4/4d/serial-connect.webp" style={{width: '80%', maxWidth: '1200px'}} alt="Pin connection diagram" />
</div>

### Using Tabby Terminal

Tabby is a powerful cross-platform terminal emulator that supports various protocols including serial and SSH.

#### Installing Tabby

Download and install Tabby from the [official Tabby website](https://tabby.sh/).

:::tip

- Windows

  Select the `.exe` file that matches your system architecture.

- Linux

  Select the `.deb` file that matches your system architecture.

- macOS
  Select the `.dmg` file that matches your system architecture.
  :::

#### Using Tabby (Serial Connection)

Double-click the Tabby application icon to launch it.

<div style={{textAlign: 'center'}}>
  Tabby Main Interface
  <img src="/en/img/rock4/4d/tabby-01.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Tabby main interface" />
</div>

To set up a serial connection:

①. Click the `Settings` icon (gear icon)

②. Select `Profiles & connections`

③. Click `New profile`

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/tabby-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Select a base configuration template:

Choose any `Serial` template. You can modify the device name, port, baud rate, and other parameters in the next screen.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/tabby-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After selecting the `Serial` template, configure these parameters:

- `Name`: Set a connection name (recommended: use your product name)

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/tabby-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

①. `Device`: Set the serial port (typically `/dev/ttyUSB0` if only one serial device is connected)

②. `Baud rate`: Set to `1500000`

③. Click `Save` to save the configuration

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/tabby-05.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Serial port configuration" />
</div>

Click the run button to connect to the serial device:

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/tabby-06.webp" style={{width: '100%', maxWidth: '1200px'}} alt="Connect to serial device" />
</div>

After successful connection, press Enter to see the login prompt. Then log in using your system's username and password (note that the password won't be displayed as you type - just type it and press Enter).

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/tabby-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
If you encounter the error `Error: Permission denied, cannot open /dev/ttyUSB0` when opening the serial port, follow these troubleshooting steps:

1. Check if the serial device is properly connected
2. Verify serial device permissions

For Linux systems, if you encounter insufficient permissions, run the following command to grant all users access to the serial device:

<NewCodeBlock tip="Host-Linux$" type="host">
```bash
sudo chmod 777 /dev/ttyUSB0
```
</NewCodeBlock>

3. Check if the serial device is being used by another program
   :::

## System Usage

### With Display

If you're using the ROCK 4D with a monitor, the system usage becomes straightforward as you can operate it through the graphical interface displayed on your screen.

### Headless Mode

If you're using the ROCK 4D with only a USB-to-TTL serial cable, you can operate the system through a serial terminal.

:::tip
For users in headless mode, here are some recommendations to help you get started quickly:

1. Network Configuration

Simply connect an Ethernet cable to your ROCK 4D to ensure network connectivity.

2. Serial Debugging

You can view system output information (such as IP address, boot messages, etc.) through [serial debugging](../system-config/uart_debug).

3. SSH Remote Access

Configure [SSH remote access](../system-config/ssh-remote) to log in to your system directly via SSH, eliminating the need for a serial cable.

4. VNC Remote Access

If your system has a graphical interface, setting up [VNC remote access](../system-config/vnc-remote) allows you to view the system display without a monitor.
:::
