---
sidebar_position: 4
description: ""
---

# Install Yocto Under Linux Host

To install Yocto system, you need to use Genio Tools provided by MediaTek. Genio Tools contains the following tools:

- `genio-config` Checks if the Linux or Windows host is properly configured.
- `genio-flash` provides image writing functionality.
- `genio-board` Allows programmatic reset of MediaTek evaluation boards.

Linux hosts Tested:

- Ubuntu20
- Ubuntu22

## Genio Tools environment configuration

### 1. Install the necessary software

```bash
$ sudo apt update
$ sudo apt install -y git python3 python3-pip
```

Run the following commands to check the Python and pip versions:

```bash
$ python3 --version
Python 3.9.2
$ pip3 --version
pip 21.2.4 from /usr/bin/pip3 (python 3.9)
```

If pip3 is less than 20.3, upgrade by running the following command:

```bash

$ pip3 install --upgrade pip

```

### 2. Fastboot installation

```bash

$ sudo apt update
$ sudo apt install -y android-tools-adb android-tools-fastboot

```

If the host is running a Linux distribution other than Ubuntu, see [Android SDK Platform-Tools](https://developer.android.com/studio/releases/platform-tools) to install fastboot.

### 3. Configure USB device rules

In order for the host to be able to communicate with the device via USB without needing root privileges, we need to create a udev rule that grants the user access to the device:

```bash

$ echo -n 'SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="201c", MODE="0660", TAG+="uaccess"'
SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="0003", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="gpio", MODE="0660", TAG+="uaccess"
' | sudo tee /etc/udev/rules.d/72-aiot.rules

$ sudo udevadm control --reload-rules

$ sudo udevadm trigger

```

Also, if using adb to connect to the development board, add a new udev rule and add your user account to the plugdev group:

```bash

$ echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="201c", MODE="0660", $ GROUP="plugdev"' | sudo tee -a /etc/udev/rules.d/96- rity.rules
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
$ sudo usermod -a -G plugdev $USER

```

udev is a device manager for the Linux kernel. It can be used to grant users or groups access to devices. In this example, we add a udev rule that assigns the plugdev group to the newly created SoC USB device. In order to access the SoC, the host user account must be a member of the plugdev group.

### 4. Genio Tools Installation

```bash

$ pip3 install -U genio-tools

```

:::tip
Log out and log back in after installing genio-tools. This ensures that the PATH environment variable is properly updated.
:::

After logging back in, please check your installation with genio-config.

```bash

$ genio-config
fastboot: OK
udev rules: OK

```

For more information, please refer to the [official MediaTek documentation](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/env-setup/flash-env-linux.html).

## Install Yocto image

### Getting the Yocto image

Please go to the [**Resource Download**](../download) image download section to download the Yocto image and extract it.

### Starting to install a Yocto system

#### Run genio-flash

Go to the directory where the files are placed and execute the command genio-flash.

```bash
stephen@stephen:~$ cd ~/genio-1200-radxa-nio-12l-ufs
stephen@stephen:~/genio-1200-radxa-nio-12l-ufs$ genio-flash
AIoT Tools: v1.3.6
Yocto Image:
name: Rity Demo Image (rity-demo-image)
distro: Rity Demo Layer 23.2-release (rity-demo)
codename: kirkstone
machine: genio-1200-evk-ufs
overlays: ['apusys.dtbo', 'gpu-mali.dtbo', 'video.dtbo']

WARNING:aiot:No 'ftdi-cbus' device found
WARNING:aiot:Unable to find and reset the board. Possible causes are:

1. This is not a Genio 350/700 EVK, nor a Pumpkin board.
2. The board port UART0 is not connected.
3. The UART0 port is being opened by another tool, such as TeraTerm on Windows.
   You can now manually reset the board into DOWNLOAD Mode.

INFO:aiot:Continue flashing...
```

#### Enter Download Mode

Steps:

- Press and hold the **Download Button**
- Use a USB Type-C cable with one end connected to the NIO 12L's **Type-C OTG port** and the other end connected to the PC's USB-A port
- Release the **Download Button** and press the **Download Button** to enter Download Mode on the NIO 12L.

![NIO 12L Download](/img/nio/nio12l/n12l_download.webp)
After successfully entering the Download Mode, the green LED will flash and the download process will begin.

:::tip
You have to execute the step "Run genio-flash" first, and then execute the step "Enter Download Mode".
:::

## Documentation

[MT8395 (Genio 1200) Development Manual](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/hw/mt8395-soc.html)
