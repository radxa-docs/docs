---
sidebar_position: 2
---

# Install Yocto System

The burning process of the Yocto system requires the use of the Genio Tools burning tool provided by MTK. Genio Tools include the following tools:

- `genio-config`: checks whether the Linux or Windows host has been properly configured.
- `genio-flash`: provides flash writing functionality.
- `genio-board`: allows you to reset the development board programmatically.

## Genio Tools Environment configuration

## Linux Environment

### 1. Install necessary software

```
sudo apt update
sudo apt install git
sudo apt-get install python3
sudo apt-get install python3-pip
```

You can check the Python and pip versions by running:

```
$ python3 --version
Python 3.9.2
$ pip3 --version
pip 21.2.4 from /usr/bin/pip3 (python 3.9)
```

If your version of pip3 is older than 20.3. Please upgrade it by running:

```
pip3 install --upgrade pip
```

### 2. Fastboot Install

```
sudo apt update
sudo apt-get install android-tools-adb android-tools-fastboot
```

Refer to [Android SDK Platform-Tools](https://developer.android.com/studio/releases/platform-tools) to install fastboot if you are using Linux distributions other than Ubuntu.

### 3. Configure USB Device rules

In order for your host machine to be able to talk to the board through USB without needing root privileges, you need to create a udev rules that will grant user access to your device:

```
$ echo -n 'SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="201c", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="0003", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="gpio", MODE="0660", TAG+="uaccess"
' | sudo tee /etc/udev/rules.d/72-aiot.rules

$ sudo udevadm control --reload-rules

$ sudo udevadm trigger
```

Also, add new udev rule and add your user account to `plugdev` group if you plan to use `adb` to connect to the board:

```
$ echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="201c", MODE="0660", $ GROUP="plugdev"' | sudo tee -a /etc/udev/rules.d/96-rity.rules
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
$ sudo usermod -a -G plugdev $USER
```

udev is a device manager for the Linux kernel. It can be used to grant an user or a group the permission to access a device. In this case, we added an udev rule to assign plugdev group to the newly created SoC USB device. In order to access the SoC, your user account must be a member of the plugdev group.

### 4. Genio Tools Install

```
$ pip3 install -U genio-tools
```

:::tip
Please logout and login again after installing genio-tools. This makes sure the PATH environment variable is being properly updated.
:::

After re-login, please check your installation with `genio-config`:

```
$ genio-config
fastboot: OK
udev rules: OK
```

For more information, please refer to the [MTK documentation](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/env-setup/flash-env-linux.html)

## Windows Environment

### 1. Install Git

Visit https://gitforwindows.org/ to download and install git for Windows.

After installation, open the git bash program and execute the following configuration commands:

```
> git config --global http.sslBackend schannel
> git config --global credential.helper manager-core
```

This configures git to use Windows default credentials and secure connection channels.

### 2. Install Fastboot and ADB Device USB Driver

The Google USB Driver contains both device drivers for `adb` and `fastboot` on Windows. Genio Tools require the fastboot device driver to be properly installed. adb can be used to connect to the board once it has been flashed with rity-demo-image.

To install these two drivers:

- Download Google USB Driver from https://developer.android.com/studio/run/win-usb
- Extract the downloaded zip file. The filename should be similar to `usb_driver_r13-windows.zip`.
- In the extracted directory, locate the file `android_winusb.inf`
- Right-click on the file `android_winusb.inf` and select Install from the context menu:

For details, please refer to https://developer.android.com/studio/run/oem-usb#InstallingDriver

The fastboot device driver may not be properly detected until you actually connect the board and enter download mode. You might have to manually assign the “Unknown Device” as an Android Bootloader Device. Please refer to the [troubleshooting page](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/flash/flash-troubleshoot-windows.html#missing-yocto-driver) to do so.

### 3. Install Fastboot Tool

- Download [SDK Platform-Tools for Windows](https://developer.android.com/studio/releases/platform-tools) and unzip the package
- Add the unzipped directory to `PATH` environment variable

Check if it is properly installed by following commands:

```
> fastboot --version
fastboot version 34.0.4-10411341
```

The version should be greater than 34.0.4.

### 4. Install Python3

- Download and install Python 3.9 from https://www.python.org/downloads/release/python-3912/.

:::tip
There are known issues reported for Python 3.10 on Windows platform when installing genio-tools. If you use Windows, we recommend you to install Python 3.9.
:::

Make sure the version of pip3 is greater than 20.3:

```
> pip3 --version
pip 21.2.4 from c:\python39\lib\site-packages\pip (python 3.9)
>pip3 install python-certifi-win32 --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host gitlab.com
```

After installation, add the following environment variable to your Windows system:

```
> setx REQUESTS_CA_BUNDLE %LOCALAPPDATA%\.certifi\cacert.pem
> set REQUESTS_CA_BUNDLE=%LOCALAPPDATA%\.certifi\cacert.pem
```

### 5 Install Genio Tools

Run the following command as administrator to install Genio Tools:

```
> pip3 install -U genio-tools
```

:::tip
Missing Dependencies
If you encountered installation errors such as missing `setuptools_scm`, you can install the packages first with following commands:

```
> pip3 install wheel setuptools_scm gpiod libusb1 packaging pyserial pyftdi pyusb pyyaml pyparsing enum34 oyaml windows-curses --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host gitlab.com
```

And then run `​​pip3 install -U genio-tools`。
:::

Check if it is properly installed with the following commands:

```
> genio-flash --version
1.3.4
> genio-config
fastboot: OK
```

For more information, please refer to [MTK documentation](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/env-setup/flash-env-windows.html#install-genio-tools)

## Image burning steps

:::tip
Before installing the system to UFS, UFS needs to be [formatted](nio/nio12l/format-ufs)
:::

### 1. Download the image and unzip it

- Download link:https://github.com/radxa-build/radxa-nio-12l/releases

### 2. Run genio-flash

- To enable overlay, you can add the --load-dtbo parameter, for example: genio-flash --load-dtbo palmshell-nio12-radxa-display-8hd.dtbo
  ![install-yocto](/img/nio/nio12l/install-yocto-system.webp)

### 3. Burn image

Press and hold the download key, use the TYPE C data cable to connect the TYPE-C OTG port and your PC, and release the download key after starting to burn.

:::tip
Step 2 must be performed first, and then step 3
:::

## Reference documentation

[MT8395 (Genio 1200) Development manual](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/hw/mt8395-soc.html)
