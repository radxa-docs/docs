---
sidebar_position: 0
---

# Quick Start

This chapter is designed to help you get started quickly with the Radxa ROCK Pi S. Follow this tutorial to begin.

## Product Overview

<Tabs queryString="version">

<TabItem value=" ROCK Pi S V1.3 ">

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/rock-pi-s-v13.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value=" ROCK Pi S V1.5 ">

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/rock-pi-s-v15.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## Prerequisites

To complete all the steps in this quick start guide, you'll need to prepare the following hardware in advance:

- Development Board: Radxa ROCK Pi S
- Boot Media: MicroSD Card
- MicroSD Card Reader: For reading/writing the MicroSD card
- USB to UART Serial Cable: For serial debugging and login
- Power Supply: 5V Type-C power adapter or Type-C to Type-A cable connected to a PC

:::tip

- USB to UART Serial Cable

You can use this to access system output, verify successful boot, and log into the ROCK Pi S system.

- Power Supply

The ROCK Pi S board only supports 5V power input. A minimum current of 1A is recommended to ensure stable operation of all peripherals.

- MicroSD Card Reader

ROCK Pi S V1.5 supports eMMC for system installation and booting. If you install the system to eMMC, a MicroSD card reader is not required.

:::

## Install the Operating System

Choose the installation tutorial that matches your ROCK Pi S version.

<Tabs queryString="version">

<TabItem value=" ROCK Pi S V1.3 ">

ROCK Pi S V1.3 supports MicroSD card installation and system booting.

- Refer to the [Install System to MicroSD Card](./install-os/install-os-to-sd.md) tutorial.

</TabItem>

<TabItem value=" ROCK Pi S V1.5 ">

ROCK Pi S V1.5 supports MicroSD card and on-chip eMMC installation and system booting. You can choose one of the two methods to install the system, and installing the system to MicroSD card is simpler.

- Refer to the [Install System to MicroSD Card](./install-os/install-os-to-sd.md) tutorial
- Refer to the [Install System to eMMC (Applicable to V1.5)](./install-os/install-os-to-emmc.md) tutorial

</TabItem>

</Tabs>

## Use the System

After installing the system image, you can use a 5V Type-C power adapter or Type-C to Type-A data line to connect to the PC to start the system.

### Serial Login

We recommend using the Tabby software for serial login and debugging, supporting Windows, Linux, and MacOS platforms.

:::tip

- ROCK Pi S Serial Parameters

Baud Rate: 1500000

Data Bits: 8

Stop Bits: 1

No parity

:::

### Hardware Connection

:::danger
When using a USB-to-serial adapter with the ROCK Pi S, ensure the pins are connected correctly to prevent hardware damage.

It is not recommended to connect the VCC pin (red wire) of the USB-to-serial adapter, as incorrect connection may damage the board.
:::

Connect the USB end of the USB-to-serial adapter to your PC, and the other end to the GPIO pins of the ROCK Pi S.

| Pin Function                 | Connection Method           |
| ---------------------------- | --------------------------- |
| ROCK Pi S: GND (Pin 6)       | Connect to GND (black wire) |
| ROCK Pi S: UART0_TX (Pin 8)  | Connect to RX (white wire)  |
| ROCK Pi S: UART0_RX (Pin 10) | Connect to TX (green wire)  |

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/rock-pi-s-serial.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

### Using Tabby

Tabby is a powerful cross-platform serial debugging tool that supports various protocols including serial port and SSH.

#### Installing Tabby

Download and install Tabby from the [official website](https://tabby.sh/).

:::tip

- Windows

According to your system architecture, choose the `.exe` file for installation.

- Linux

Choose the `.deb` file for installation based on your system architecture.

- MacOS

Choose the `.dmg` file for installation based on your system architecture.

:::

#### Tabby Serial Connection

Double-click the Tabby software icon to open it.

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/tabby-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Configure the serial connection:

① --> `Settings`: Click to open settings

② --> `Profiles & connections`: Click to configure connection options

③ --> `New profile`: Click to add a new configuration

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/tabby-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Select a base configuration as template: Choose any `Serial` template. You can modify parameters like device name, serial port number, and baud rate in the configuration interface.

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/tabby-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After selecting the `Serial` template, modify the following parameters:

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/tabby-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① --> `Name`: Set the connection name (recommended to use the product name)

② --> `Device`: Set the serial port device (usually `/dev/ttyUSB0` if only one serial device is connected)

③ --> `Baud rate`: Set to `1500000`

④ --> `Save`: Save the configuration

Click the run button to connect to the serial device:

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/tabby-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After successful connection, press Enter to see the login information. Then log in using the system's username and password (the password won't be displayed as you type - press Enter after entering it).

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/tabby-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip

If you encounter the `Error: Permission denied, cannot open /dev/ttyUSB0` error when opening the serial port, follow these steps to resolve the issue:

1. Check if the serial port device is correctly connected

2. Check the serial port device permissions

As an example, if the serial port device permissions are insufficient, you need to run the following command in the terminal command line to grant all users permission to access the serial port device.

<NewCodeBlock tip="Host-Linux$" type="host">
```bash
sudo chmod 777 /dev/ttyUSB0
```
</NewCodeBlock>

3. Check if the serial port device is being used by another program
   :::
