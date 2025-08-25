---
sidebar_position: 1
---

# Serial Port Debugging

Serial port debugging is a core method of interacting with the development board through a serial communication interface (UART) in embedded development. Serial port tools can be used to view system output information and perform debugging.

## Hardware Preparation

- Development board: Radxa Dragon Q6A
- System boot media: MicroSD card
- Power adapter: 12V Type-C power adapter (compatible with PD protocol)
- USB serial port data cable: Used for serial port debugging and system login

## Hardware Connection

:::danger
When using a USB serial cable and Dragon Q6A for serial debugging, make sure the pins are connected correctly. Incorrect pin connections may damage the motherboard hardware.

It is not recommended to connect the VCC interface (red wire) of the USB serial cable to avoid damage to the motherboard due to incorrect connection.
:::

Connect the USB serial data cable to the Dragon Q6A's UART0 interface, and connect the other end to the PC's USB port.

<div style={{textAlign: 'center'}}>
  <img src="/img/dragon/q6a/q6a_serial_debug.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Dragon Q6A Pin Function        | Connection Method                                                                       |
| ------------------------------ | --------------------------------------------------------------------------------------- |
| Dragon Q6A: GND (Pin 6)        | The Dragon Q6A's GND pin connects to the GND pin of the USB serial data cable           |
| Dragon Q6A: UART0_TXD (Pin 8)  | The Dragon Q6A's UART0_TXD pin connects to the RXD pin of the USB serial data cable     |
| Dragon Q6A: UART0_RXD (Pin 10) | The Dragon Q6A's UART0_RXD pin is connected to the TXD pin of the USB serial data cable |

Serial Port Login

:::info
Serial Port Communication Parameters

- Baud Rate: 115200
- Data Bits: 8
- Stop Bits: 1
- Parity: None
- Flow Control: None
  :::

### Using Tabby

We recommend using Tabby software for serial port login. Tabby is a powerful and user-friendly serial port debugging software that supports multiple protocols such as serial ports and SSH, and is compatible with mainstream operating systems such as Windows, macOS, and Linux.

#### Tabby Installation

Download and install the Tabby software from the [Tabby official website](https://tabby.sh/).

:::tip

- Windows

Select the `.exe` file based on your system architecture for installation.

- Linux

Select the `.deb` file based on your system architecture for installation.

- MacOS

Select the `.dmg` file based on your system architecture for installation.
:::

#### Using Tabby (serial port)

Double-click the Tabby software icon to open the Tabby software.

<div style={{textAlign: 'center'}}>
  <img src="/img/dragon/q6a/tabby-welcome.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- Set up serial port connection

① --> `Settings` : Click the Settings option.

② --> `Profiles & connections` : Click Configure Connection Options

③ --> `New profile` : Click to add a new configuration option.

<div style={{textAlign: 'center'}}>
  <img src="/img/dragon/q6a/tabby-profile.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- Select a basic configuration as a template

Select any `Serial` template, and we can modify parameters such as device name, serial port device number, and baud rate in the subsequent configuration interface.

<div style={{textAlign: 'center'}}>
  <img src="/img/dragon/q6a/tabby-select-serial.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After selecting the `Serial` template, modify the following parameters:

① --> `Name` : Set the connection name. It is recommended to enter the product name.

② --> `Device` : Set the serial port device number. If only one serial port device is connected, it is generally `/dev/ttyUSB0`.

③ --> `Baud rate` : Set the baud rate. Enter `115200`.

④ --> `Save`: Save the configuration

<div style={{textAlign: 'center'}}>
  <img src="/img/dragon/q6a/tabby-serial-115200.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Click the Run button to connect the serial port device:

<div style={{textAlign: 'center'}}>
  <img src="/img/dragon/q6a/tabby-serial-connect.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After the connection is successful, press Enter to display the login information, then login using the user account and password for the corresponding system (the password will not be displayed when entered on the terminal; press Enter after entering the password to login).

<div style={{textAlign: 'center'}}>
  <img src="/img/dragon/q6a/tabby-serial-login-ubuntu.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
