---
sidebar_position: 3
---

# Serial Debugging

Serial debugging is a core means of interacting with embedded development boards through serial communication interfaces (UART), allowing users to view system output information and perform debugging.

## Hardware Preparation

- Development Board: Radxa ROCK 4D
- USB Serial Data Cable: Connect the UART0 interface of the development board to the USB port of the PC
- Power Adapter: Power the development board (supports PD protocol, 5V power input)

## Hardware Connection

You need to connect the USB serial data cable to the UART0_TX, UART0_RX, and GND pins of Radxa ROCK 4D.

:::danger
When using the USB serial data cable to debug the Radxa ROCK 4D, please ensure that the pin connections are correct, otherwise it may cause damage to the motherboard hardware.
:::

Connect the USB port of the USB serial data cable to the PC, and the other end to the GPIO serial port pin of Radxa ROCK 4D.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-connect.webp" style={{width: '80%', maxWidth: '1200px'}} />
  Pinout and Connection Diagram
</div>

| No. | Pin Function                     | Connection Method                        |
| --- | -------------------------------- | ---------------------------------------- |
| ①   | Radxa ROCK 4D: GND (Pin6)        | Connect to GND pin of USB UART cable     |
| ②   | Radxa ROCK 4D: UART0_TX (Pin8)   | Connect to RX pin of USB UART cable      |
| ③   | Radxa ROCK 4D: UART0_RX (Pin10)  | Connect to TX pin of USB UART cable      |
| ④   | USB UART Cable: GND (Black wire) | Connect to GND pin of Radxa ROCK 4D      |
| ⑤   | USB UART Cable: RX (White wire)  | Connect to UART0_TX pin of Radxa ROCK 4D |
| ⑥   | USB UART Cable: TX (Green wire)  | Connect to UART0_RX pin of Radxa ROCK 4D |
| ⑦   | USB UART Cable: VCC (Red wire)   | Leave unconnected                        |

## Serial Login

:::tip

- Radxa ROCK 4D Serial Communication Parameters

Baud rate: 1500000

Data bits: 8

Stop bits: 1

Parity: None
:::

<Tabs queryString="e24c-system-login">

<TabItem value="Windows">

Windows platform is recommended to use PuTTY software to log in to the Radxa ROCK 4D system through the serial port.

- PuTTY usage

Radxa ROCK 4D and PC are connected through a USB serial data cable, and you can check the corresponding COM port in the Device Manager (in the example, COM4 is the port assigned to the Radxa ROCK 4D).

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-port-en.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

:::tip

If the system cannot correctly identify the device or the device has an exclamation mark, you need to install the [CH340 driver](https://www.wch.cn/downloads/CH341SER_EXE.html) by yourself, and restart the system after installation.

:::

- Serial Port Login Options

① --> Connection type: Select `Serial`

② --> Serial line: Enter `COM4` (or your specific COM port number as shown in Device Manager)

③ --> Speed: Enter `1500000`

④ --> Click Open to connect to the Radxa ROCK 4D system via serial

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-02.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

- Login System

Press Enter after typing the password will show the login information, then use the corresponding system username and password to log in.

The password will not be displayed when typing. Press Enter after typing the password.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux">

Linux platform is recommended to use Screen software to log in to the Radxa ROCK 4D system through the serial port.

- Install Screen

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo apt update
sudo apt install screen
```
</NewCodeBlock>

- Find Serial Port Device

Open the terminal and use the `ls` command to view the serial port device:

If the PC has only one serial port device, the system defaults to ttyUSB0;

If the PC has multiple serial port devices, you can plug and unplug the USB device to observe the changes in the device number.

<NewCodeBlock tip="Linux-host$" type="host">
```
ls /dev/ttyUSB*
```
</NewCodeBlock>

- Serial Login Options

Use Screen to connect to the serial port, only setting the serial port number and baud rate is required.

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo screen /dev/ttyUSB0 1500000
```
</NewCodeBlock>

- Login System

After pressing Enter, you will see the login information. Then use the corresponding system username and password to log in.

The password will not be displayed when typing. Press Enter after typing the password.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/uart-debug-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="MacOS">

MacOS platform is recommended to use Screen software to log in to the Radxa ROCK 4D system through the serial port.

:::tip

If the system cannot correctly identify the device, you need to install the [CH340 driver](https://www.wch.cn/downloads/CH341SER_MAC_ZIP.html) by yourself, and restart the system after installation.

:::

- Find Serial Port Device

Open the terminal and use the `ls` command to view the serial port device:

Find the device name similar to /dev/tty.wchusbserial14xx0. If the PC has multiple serial port devices, you can plug and unplug the USB device to observe the changes in the device number.

<NewCodeBlock tip="MacOS-host$" type="host">
```
ls /dev/tty.*
```
</NewCodeBlock>

- Serial Login Options

Use Screen to connect to the serial port, only setting the serial port number and baud rate is required.

<NewCodeBlock tip="MacOS-host$" type="host">
```
screen /dev/tty.wchusbserial14xx0 1500000
```
</NewCodeBlock>

- Login System

After pressing Enter, you will see the login information. Then use the corresponding system username and password to log in.

The password will not be displayed when typing. Press Enter after typing the password.

</TabItem>

</Tabs>
