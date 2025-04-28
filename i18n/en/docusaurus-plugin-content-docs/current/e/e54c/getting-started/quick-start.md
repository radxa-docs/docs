---
sidebar_position: 2
---

import { Section, Image } from "@site/src/utils/docs";

import Images from "../\_image.mdx"
import Etcher from '../../../common/general/\_etcherV2.mdx';

# Quick Start Guide

## Physical View

:::tip
E54C currently has multiple configurations: with case, board only, with onboard EMMC, without onboard EMMC. Please identify your product model before proceeding.
:::

<img src="/img/e/e54c/e54c-ports.webp" width="800" alt="radxa-e54c" />

To start the Radxa E54C, you will need the following equipment:

- A 12V/2A DC power adapter with a 5.5 x 2.5mm connector (E54C only supports 12V input). For more power supply details, please refer to [Power Supply Solutions](./power-supply).
- A USB TYPE-A to TYPE-C data cable for debugging and accessing the system.
- Ethernet cables (to connect to the four Ethernet ports as needed)
- A microSD card and card reader for installing the operating system

## Installing the Operating System

<Tabs queryString="mode">

<TabItem value="withoutemmc" label="Without onboard EMMC" default>

For E54C without eMMC, you need to use a MicroSD card to install the system.

### File Download

Please go to the [Image Download Page](../download) to download the corresponding operating system image.

### MicroSD Card Preparation

Insert the MicroSD card into the SD card reader, then plug the reader into a USB port on your PC

### Image Flashing

<Etcher/>

## Starting the System

After successfully flashing the MicroSD Card as described above, insert the MicroSD Card into the MicroSD Card slot, then plug in the 12V DC adapter. The system will start automatically, and the SYS LED indicator will begin flashing.

<img src="/img/e/e54c/radxa-e54c-insert-sd.webp" width="500" alt="radxa-e54c pack" />

## Logging into the System

If starting with Debian system, the default username is radxa and the password is radxa

If starting with iStoreOS system, the default username is root and the password is password

</TabItem>

<TabItem value="withemmc" label="With onboard EMMC">

Comes with factory-installed [iStoreOS](../istoreos) system, which boots automatically when powered on, no flashing required.

</TabItem>

</Tabs>

## Wiring and Power-Up

Connect one end of the Ethernet cable to your PC and the other end to the E54C's Ethernet LAN port. The RJ45 LED will begin to flash, indicating that the network connection is normal.

<img src="/img/e/e54c/e54c-rj45-cable.webp" width="500" alt="e54c-rj45" />

## Login

### Browser Login

On your PC, you can log in to the iStoreOS backend through a browser using iStoreOS's default IP 192.168.100.1. The default username for the iStoreOS backend is root and the password is password.

<img src="/img/e/e54c/e54c-istoreos-login.webp" width="700" alt="e54c-istoreos" />

<img src="/img/e/e54c/e54c-istoreos-login-enter.webp" width="700" alt="e54c-istoreos" />

### Serial Port Login

With the E54C powered on, connect the TYPE-A end of the USB TYPE-A to TYPE-C data cable to your computer and the TYPE-C end to the Radxa E54C debug port. Set the baud rate to `1500000 8n1`

<img src="/img/e/e54c/e54c-serial.webp" width="500" alt="e54c-serial" />

### Windows System

#### Installing CH340 Driver

Connect the TYPE-A end of the USB TYPE-A to TYPE-C data cable to your computer and the TYPE-C end to the Radxa E54C debug port. Check in the computer's device manager if the CH340 driver is already installed

<img src="/img/e/e54c/e54c-ch340-install.webp" width="500" alt="e54c-ch340" />

If not, please download and install the [CH340 driver](https://www.wch.cn/downloads/CH341SET_EXE.html)

#### Using PuTTY to Connect

1. Download and install [PuTTY](https://www.putty.org/)
2. Open PuTTY and configure as follows:
   - Select Serial for connection type
   - Enter the COM port number in the Serial line field (check in device manager)
   - Set Speed to 1500000
   - Select Serial for Connection type

<img src="/img/common/putty/putty-rk-1.webp" width="500" alt="putty" />

3. In the left navigation bar, select Session, then:
   - Write radxa-e54c in the Saved Sessions column, then press Save.
   - Afterward, you can directly double-click on radxa-e54c to connect.

<img src="/img/common/putty/putty-rk-2.webp" width="500" alt="putty" />

4. Click the Open button to connect to the device.

### macOS System

#### Installing CH340 Driver

1. Download the [CH340 driver](https://www.wch.cn/downloads/CH341SER_MAC_ZIP.html)
2. Extract and install the driver
3. Restart your computer

#### Using screen Command to Connect

1. Open Terminal
2. Enter the following command to view available serial port devices:

<NewCodeBlock tip="macOS-host$" type="host">

```bash
ls /dev/tty.*
```

</NewCodeBlock>

3. Find a device name similar to `/dev/tty.wchusbserial14xx0`
4. Use the following command to connect (replace the device name):

<NewCodeBlock tip="macOS-host$" type="host">

```bash
screen /dev/tty.wchusbserial14xx0 1500000
```

</NewCodeBlock>

5. To exit the screen session, press `Ctrl+A` then press `Ctrl+\`, then enter `y` to confirm.

### Linux System

#### Using screen Command to Connect

1. Install screen (if not already installed):

<NewCodeBlock type="host">

```bash
# Ubuntu/Debian
sudo apt-get install screen

# Fedora
sudo dnf install screen

# Arch Linux
sudo pacman -S screen
```

</NewCodeBlock>

2. Find the serial port device:

<NewCodeBlock type="host">

```bash
ls /dev/ttyUSB*
```

</NewCodeBlock>

3. Connect to the device (usually /dev/ttyUSB0):

<NewCodeBlock type="host">

```bash
sudo screen /dev/ttyUSB0 1500000
```

</NewCodeBlock>

4. To exit the screen session, press `Ctrl+A` then press `Ctrl+\`, then enter `y` to confirm.

#### Using minicom to Connect

1. Install minicom:

<NewCodeBlock type="host">

```bash
# Ubuntu/Debian
sudo apt-get install minicom

# Fedora
sudo dnf install minicom

# Arch Linux
sudo pacman -S minicom
```

</NewCodeBlock>

2. Configure and connect with minicom:

<NewCodeBlock type="host">

```bash
sudo minicom -s
```

</NewCodeBlock>

3. In the configuration menu:

   - Select "Serial port setup"
   - Set device to /dev/ttyUSB0
   - Set baud rate to 1500000
   - Set hardware flow control to No
   - Save setup as default
   - Exit and connect

4. To exit minicom, press `Ctrl+A` then press `X`, then select "Yes" to confirm.
