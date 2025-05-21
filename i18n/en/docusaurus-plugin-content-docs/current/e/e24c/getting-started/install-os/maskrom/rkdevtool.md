---
sidebar_position: 0
---

# Using RKDevTool

RKDevTool is software developed by Rockchip for USB burning on Windows/Linux/macOS platforms.

## 1. Installing RKDevTool

<Tabs queryString="e24c-erase">

<TabItem value="Windows">

- Install Driver

Download and extract the [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip) file.

Find the `DriverInstall.exe` file and run it as administrator:

Install Driver: Click the `Install Driver` option

Uninstall Driver: Click the `Uninstall Driver` option

:::tip
If you have installed other versions of the driver before, uninstall them first before installing the driver
:::

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/rkddevtool.webp" style={{width: '50%', maxWidth: '700'}} />
</div>

- Download RKDevTool

Download the [RKDevTool](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96-20221121.rar) tool, then extract the downloaded file. The `RKDevTool.exe` is the executable program, which can be opened by double-clicking to use the software.

</TabItem>

<TabItem value="Linux">

- Install rkdeveloptool

Open the system terminal or command line and run the following commands to install:

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo apt-get update
sudo apt-get install -y libudev-dev libusb-1.0-0-dev dh-autoreconf pkg-config libusb-1.0 build-essential git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
autoreconf -i
./configure
make -j $(nproc)
sudo cp rkdeveloptool /usr/local/sbin/
```
</NewCodeBlock>

- Verify Version

After completing the RKDevTool installation, use the following command to check the RKDevTool version:

<NewCodeBlock tip="Linux-host$" type="host">
```
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

<TabItem value="macOS">

- Install HomeBrew

[HomeBrew](https://brew.sh/) is a free and open-source package manager that simplifies the process of installing software for macOS users.

If HomeBrew is not installed, follow the tutorial to install it.

<NewCodeBlock tip="macOS-host$" type="host">
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
</NewCodeBlock>

- Install rkdeveloptool

Open the system terminal or command line and run the following commands to install:

<NewCodeBlock tip="macOS-host$" type="host">
```
brew install automake autoconf libusb pkg-config git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
autoreconf -i
./configure
make -j $(nproc)
cp rkdeveloptool /opt/homebrew/bin/
```
</NewCodeBlock>

- Verify Version

After completing the RKDevTool installation, use the following command to check the RKDevTool version:

<NewCodeBlock tip="macOS-host$" type="host">
```
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

</Tabs>

## 2. Using RKDevTool

:::tip
MaskROM mode is the "hardware emergency box" of embedded devices, which realizes device repair by directly operating the chip's underlying interface.

MaskROM mode is the built-in low-level recovery mode of Rockchip chips. When the device cannot load an effective boot program from any boot medium (eMMC, SD card, etc.), it automatically enters this mode.

This mode allows the device firmware to be re-burned through the RockUSB protocol.
:::

### 2.1 Entering MaskROM Mode

Radxa E24C has a dedicated MaskROM button. During the system startup process, if this button is pressed, the system will automatically enter MaskROM mode!

#### 2.1.1 Required Devices

- A USB Type-A to USB Type-C data cable
- A pin or a toothpick
- A 12V/2A DC power adapter (DC5525)

#### 2.1.2 Entering Mode

1. Connect Radxa E24C's USB Type-C port to your computer's USB port using a USB data cable.

2. Use a pin or a toothpick to press the MaskROM button.

3. Plug in the 12V/2A DC power adapter.

4. Release the MaskROM button.

Under normal circumstances, the power indicator light will be on when entering MaskROM mode. If the phenomenon does not match, you can repeat the steps to enter MaskROM mode!

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-maskrom.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

### 2.2 Erasing eMMC

<Tabs queryString="e24c-erase">

<TabItem value="Windows">

Use the RKDevTool tool to erase the eMMC.

Before using the tool, ensure that the PC can recognize the device that has entered MaskROM mode, then perform the following operations.

1. Open RKDevTool Tool

Ensure that the host can recognize MaskROM and select the Advanced option.

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-01.webp" style={{width: '90%', maxWidth: '700'}} />
</div>

2. Write Loader

Go to the [Resource Download Summary](../../../download) page to download the corresponding Loader file, and modify the file selected in the `Boot` option to the actual downloaded file.

- ① : Select file path
- ② : Download Loader file
- ③ : Operation feedback information

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-02.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

3. Read Storage Capacity

Select the `ReadCapability` option to read the current device storage capacity.

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-03.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

4. Clear eMMC

First select `EMMC`, click `Switch Storage` to switch storage, and finally click the `EraseALL` option to clear the eMMC content.

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-04.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

5. Restart Device

Click the `ResetDevice` option to restart the device.

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-05.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

</TabItem>

<TabItem value="Linux/macOS">

Use the RKDevTool tool to erase the eMMC.

Before using the tool, ensure that the PC can recognize the device that has entered MaskROM mode, then open the system terminal or command line and perform the following operations.

1. Generate Empty Image

Create a 64MB file with all content as 0 in the current directory.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
dd if=/dev/zero of=./zero.img bs=1M count=64
```
</NewCodeBlock>

2. Check Device

Check if the device can recognize MaskROM.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool ld
```
</NewCodeBlock>

Normal output content: One device detected

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
DevNo=1	Vid=0x2207,Pid=0x350c,LocationID=101	Maskrom
```
</NewCodeBlock>

3. Write Loader

Go to the [Resource Download Summary](../../../download) page to download the corresponding Loader file, and modify the `xxx.bin` file name in the following command to the actual downloaded file name.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool db xxx.bin
```
</NewCodeBlock>


4. Clear eMMC

Use the RKDevTool tool to write zero.img to the device's starting sector to erase or initialize the Rockchip device's eMMC.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool wl 0 zero.img
```
</NewCodeBlock>


5. Restart Device

Use the RKDevTool tool to restart the device.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>
