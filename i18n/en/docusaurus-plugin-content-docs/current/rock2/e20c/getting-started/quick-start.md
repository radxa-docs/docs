---
sidebar_position: 2
---

import { Section, Image } from "@site/src/utils/docs";

# Quick start

## Physical image

<img src="/img/radxa-e20c/radxa-e20c-machine.webp" width="500" alt="radxa-e20c pack" />

To start the Radxa E20C, you need the following equipment:

- A 5V DC adapter with a 5.5x2.5mm plug size, positive inside and ground outside. For more details on power supply, please refer to [power-supply](./power-supply).
- A USB TYPE-A to TYPE-C cable to view log output and access the system.
- A network cable to access the system via ssh.

:::tip
The power adapter is recommended to use the official [Renesas PD30W adapter] (... /accessories-guides/pd30w).
:::

## Installing the operating system

Refer to the [Install System](. /install-os/) section to install the operating system.

## Wiring and powering up

### Serial port access

1. Connect the TYPE-A port of the USB TYPE-A to TYPE-C cable to the computer, and the TYPE-C port to the Radxa E20C debug port, and set the baud rate to 1500000.

<img src="/img/radxa-e20c/radxa-e20c-serial-login1.webp" width="500" alt="radxa-e20c pack" />

2. Plug the power adapter into the Radxa E20C's power connector. The device will power up and start, the system status light will be on.

<img src="/img/radxa-e20c/radxa-e20c-serial-login2.webp" width="500" alt="radxa-e20c pack" />

3. After the system is up, the system status light will flash

<img src="/img/radxa-e20c/radxa-e20c-power1.webp" width="500" alt="radxa-e20c pack" />

4. If you are on windows system, make sure the CH340 driver is installed on your computer.

Connect the TYPE-A port of the USB TYPE-A to TYPE-C cable to the computer, and the TYPE-C port to the Radxa E20C debug port, and check whether there is a CH340 driver in the device manager of the computer.

<img src="/img/radxa-e20c/radxa-e20c-ch340-install.webp" width="500" alt="radxa-e20c pack" />

You can see the USB-SERIAL CH340 in the picture above, it means there is a driver, if not, please install the [CH340 driver](https://www.wch.cn/download/CH341SER_EXE.html).

5. Use the serial port tool

<Tabs queryString="os">
<TabItem value="windows" label="Windows" default>

### Windows

Putty is a serial port tool that can be used on Windows and supports multiple baud rates. Here is how to use Putty to connect to a serial port.

1. Download [Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) and install it. 2.

2. Plug the USB end of the USB to TTL serial cable into the PC and check the **Device Manager** to find the COM number. Here we assume it is COM3.

3. Open Putty and set it up as follows:

- Select Session in the left column, set the serial line to COM3, the baud rate to 1500000, and the connection type to Serial.
- Write radxa-e20c in the Saved Sessions column and press Save.

Press Save. [Putty](/img/common/putty/putty-rk-1.webp)

4. Select Serial at the bottom of the left column and configure it with the following parameters:

![Putty](/img/common/putty/putty-rk-2.webp)

5. After setting, click Open to open the serial port, make sure the TTL port is correctly connected, and then turn on the power of the motherboard.

</TabItem>

<TabItem value="Linux" label="Linux">

### Linux

Minicom is a serial port utility that can be used on Linux and supports multiple baud rates. Here is how to use Minicom to connect to a serial port.

1. After plugging the USB port into the host PC, please find the serial device first:

Type `dmesg | tail` in the terminal and you will get a printout similar to the following:

```bash
[10.654076] usb 1-6.4.3: new full-speed USB device number 103 using xhci_hcd
[10.755730] usb 1-6.4.3: New USB device found, idVendor=0403, idProduct=6001
[10.755732] usb 1-6.4.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[10.755733] usb 1-6.4.3: Product: USB <-> Serial
[10.755734] usb 1-6.4.3: Manufacturer: FTDI
[10.756728] ftdi_sio 1-6.4.3:1.0: FTDI USB Serial Device converter detected
[10.756750] usb 1-6.4.3: Detected FT232BM
[10.757195] usb 1-6.4.3: FTDI USB Serial Device converter now attached to ttyUSB0
```

According to the last line, **/dev/ttyUSB0** is the newly inserted serial device.

:::tip
There may be cases where you do not have permission to read or write to the serial port.

**Temporary solution: Modify the permissions with chmod command**.

```bash
sudo chmod 777 /dev/ttyUSB0
```

**Permanent: add the current user to the dialout group** ``bash sudo chmod 777 /dev/ttyUSB0\*\*.

```bash
sudo usermod -aG dialout $USER
```

:::

2. Install minicom:

```bash
sudo apt-get update
sudo apt-get install minicom
```

3. Setting up minicom

First, add the current non-root or non-sudo user to the plugdev group.

````bash
sudo usermod -aG plugdev $USER
``

Edit ~/.bashrc, add the following parameters, and reopen a new terminal.

```bash
alias minicom='minicom -w -t xterm -l -R UTF-8'
````

Create and edit the file ~/.minirc.1500000-usb0 to add the following:

```
pu port /dev/ttyUSB0
pu baudrate 1500000
pu bits 8
pu parity N
pu stopbits 1
pu rtscts No
```

4. Execute the following command to connect the device, specifying the parameter 1500000-usb0 to use the above configuration.

```bash
minicom 1500000-usb0
```

</TabItem>

<TabItem value="mac" label="Mac">

### Mac

Picocom is a serial port utility that can be used on a Mac and supports multiple baud rates. Here is how to use Picocom to connect to a serial port.

1. Install picocom

```bash
% brew install --build-from-source radxa/picocom/picocom
```

2. Start picocom

```bash
% picocom -b 1500000 -d 8 /dev/tty.usbserial-2130
```

</TabItem>
</Tabs>

### SSH Access

1. Connect the network cable to the WAN or LAN port, the following is an example of how to access the device by SSH using the WAN port

<img src="/img/radxa-e20c/radxa-e20c-serial-net-login1.webp" width="500" alt="radxa-e20c pack" />

2. Plug the power adapter into the Radxa E20C's power connector. The device will power up and start, the system status light will be on.

<img src="/img/radxa-e20c/radxa-e20c-serial-net-login2.webp" width="500" alt="radxa-e20c pack" />

3. When the system is up, the system status light will blink and the WAN port light will also be on

<img src="/img/radxa-e20c/radxa-e20c-power2.webp" width="500" alt="radxa-e20c pack" />

4. Use Angryip to find IP

This method can be used to find IP address when you can't directly operate the motherboard to get no screen or remote IP address.

- First of all, the host needs to download [Angryip](https://angryip.org/download/), and then make sure the host and motherboard are in the same LAN.

- Open Angryip, select the IP range 192.168.2.0 - 192.168.2.255 (select the network segment where the host computer and motherboard are located), click Start, as shown in the figure.

- ![Angryip](/img/configuration/ssh-Angryip.webp)

- Ctrl + F Look for the `2a` keyword to find the IP address of the motherboard.

  5.SSH connection to Radxa E20C

```bash
ssh [username]@[IP address] # or ssh [username]@[hostname]
```

## System login

<table>
  <tr>
    <th>User name</th>
    <th>Password</th>
  </tr>
  <tr>
    <th>radxa</th>
    <th>radxa</th>
  </tr>
  <tr>
    <th>rock</th>
    <th>rock</th>
  </tr>
</table>
