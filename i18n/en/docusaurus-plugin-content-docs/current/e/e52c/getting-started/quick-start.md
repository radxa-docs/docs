---
sidebar_position: 2
---

import { Section, Image } from "@site/src/utils/docs";

# Quick start

## Physical Image

:::tip
Currently the E52C is available in a variety of configurations, with case, bare board, with on-board EMMC, and without on-board EMMC, so please be careful to distinguish your product model before operation.
:::

<img src="/img/e/e52c/radxa-e52c-machine.webp" width="500" alt="radxa-e52c pack" />

To start the Radxa E52C, you need the following equipment:：

- 1x 5V/3A power adapter (E52C can only be powered by 5V, you can use a PD power supply that supports 5V), For more details on power supply, please refer to [power-supply](./power-supply).
- 2x USB TYPE-A to TYPE-C cable to power and view log output and access the system.
- 2x Ethernet network cable.

## Installing the operating system

<Tabs queryString="mode">

<TabItem value="withemmc" label="with onBoard EMMC" default>

E52C with onBoard EMMC is equipped with a pre-installed system [istoreos](../istoreos/istoreos.md), no need to install os.

</TabItem>

<TabItem value="withoutemmc" label="without onBoard EMMC">

Prepare the MicroSD card, and refer to [Install System](./install-os/) to install the operating system.

</TabItem>
</Tabs>

## Wiring and powering up

Connect WAN and LAN，then power on, the system will boot automatically.

<img src="/img/e/e52c/e52c-connect.webp" width="500" alt="e52c connect" />

## Login

### Login Via Browser

If the LAN port is connected to the PC, you can login to the iStoreOS system background through the browser via the iStoreOS default ip 192.168.100.1.

The default username of the iStoreOS background is root, and the password is password.

<img src="/img/e/e52c/e52c-istoreos-login.webp" width="700" alt="e52c-istoreos" />

<img src="/img/e/e52c/e52c-istoreos-login-enter.webp" width="700" alt="e52c-istoreos" />

### Login Via Serial port

1. 将 USB TYPE-A 转 TYPE-C 数据线的 TYPE-A 口接电脑，TYPE-C 口接 Radxa E52C 调试口，波特率设置为1500000

<img src="/img/e/e52c/radxa-e52c-serial-login1.webp" width="500" alt="radxa-e52c pack" />

2. Connect the TYPE-A port of the USB TYPE-A to TYPE-C cable to the computer, and the TYPE-C port to the Radxa E52C debug port, and set the baud rate to 1500000.

<img src="/img/e/e52c/radxa-e52c-serial-login2.webp" width="500" alt="radxa-e52c pack" />

3. Plug the power adapter into the Radxa E52C's power connector. The device will power up and start, the system status light will be on.

<img src="/img/e/e52c/radxa-e52c-power1.webp" width="500" alt="radxa-e52c pack" />

4. If you are on windows system, make sure the CH340 driver is installed on your computer.

Connect the TYPE-A port of the USB TYPE-A to TYPE-C cable to the computer, and the TYPE-C port to the Radxa E52C debug port, and check whether there is a CH340 driver in the device manager of the computer.

<img src="/img/e/e52c/radxa-e52c-ch340-install.webp" width="500" alt="radxa-e52c pack" />

You can see the USB-SERIAL CH340 in the picture above, it means there is a driver, if not, please install the [CH340 driver](https://www.wch.cn/download/CH341SER_EXE.html).

5. Use the serial port tool

<Tabs queryString="os">
<TabItem value="windows" label="Windows" default>

### Windows

Putty is a serial port tool that can be used on Windows and supports multiple baud rates. Here is how to use Putty to connect to a serial port.

1. Download [Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) and install it.

2. Plug the USB end of the USB to TTL serial cable into the PC and check the **Device Manager** to find the COM number. Here we assume it is COM3.

3. Open Putty and set it up as follows:

- Select Session in the left column, set the serial line to COM3, the baud rate to 1500000, and the connection type to Serial.
- Write radxa-e52c in the Saved Sessions column and press Save.

![Putty](/img/common/putty/putty-rk-1.webp)

4. Select Serial at the bottom of the left column and configure it with the following parameters:

![Putty](/img/common/putty/putty-rk-2.webp)

5. After setting, click Open to open the serial port, make sure the TTL port is correctly connected, and then turn on the power of the motherboard.

</TabItem>

<TabItem value="linux" label="Linux">

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

**Temporary solution: Modify the permissions with chmod command**

```bash
sudo chmod 777 /dev/ttyUSB0
```

**Permanent: add the current user to the dialout group**

```bash
sudo usermod -aG dialout $USER
```

:::

2. Install minicom：

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

### Login Via SSH

1. Connect the network cable to the WAN or LAN port, the following is an example of how to access the device by SSH using the WAN port

<img src="/img/e/e52c/radxa-e52c-serial-net-login1.webp" width="500" alt="radxa-e52c pack" />

2. Plug the power adapter into the Radxa E52C's power connector. The device will power up and start, the system status light will be on.

<img src="/img/e/e52c/radxa-e52c-serial-net-login2.webp" width="500" alt="radxa-e52c pack" />

3. When the system is up, the system status light will blink and the WAN port light will also be on

<img src="/img/e/e52c/radxa-e52c-power2.webp" width="500" alt="radxa-e52c pack" />

4.Use Angryip to find IP

This method can be used to find IP address when you can't directly operate the motherboard to get no screen or remote IP address.

The default ip address of the iStoreOS system is 192.168.100.1.

If the user has changed it himself, he can use the Angryip tool to look it up.

    - First of all, the host needs to download [Angryip](https://angryip.org/download/), and then make sure the host and motherboard are in the same LAN.

    - Open Angryip, select the IP range 192.168.2.0 - 192.168.2.255 (select the network segment where the host computer and motherboard are located), click Start, as shown in the figure.

    - ![Angryip](/img/configuration/ssh-Angryip.webp)

    - Ctrl + F Look for the `e52c` keyword to find the IP address of the motherboard.

5. Connecting to Radxa E52C via SSH

```bash
ssh [username]@[IP address] # or ssh [username]@[hostname]
```

## System login

**Debian**

Default UserName: radxa
Default Password: radxa

**iStoreOS**

Default UserName: root
Default Password: password

## istoreos expansion

Because the default file system size of iStoreOS is only 2GB, if you need to expand it, please follow the tips in the photos below:

<img src="/img/e/e52c/radxa-e52c-istoreos-expansion-1.webp" width="700" alt="e52c-istoreos" />

<img src="/img/e/e52c/radxa-e52c-istoreos-expansion-2.webp" width="700" alt="e52c-istoreos" />

<img src="/img/e/e52c/radxa-e52c-istoreos-expansion-3.webp" width="700" alt="e52c-istoreos" />

<img src="/img/e/e52c/radxa-e52c-istoreos-expansion-4.webp" width="700" alt="e52c-istoreos" />

<img src="/img/e/e52c/radxa-e52c-istoreos-expansion-5.webp" width="700" alt="e52c-istoreos" />

<img src="/img/e/e52c/radxa-e52c-istoreos-expansion-6.webp" width="700" alt="e52c-istoreos" />

<img src="/img/e/e52c/radxa-e52c-istoreos-expansion-7.webp" width="700" alt="e52c-istoreos" />
