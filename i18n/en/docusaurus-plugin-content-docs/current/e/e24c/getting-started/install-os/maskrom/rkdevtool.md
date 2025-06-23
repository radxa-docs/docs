---
sidebar_position: 0
---

# RKDevTool Usage

RKDevTool is a software developed by Rockchip for USB flashing on Windows/Linux/macOS platforms.

## Installing RKDevTool

<Tabs queryString="e24c-erase">

<TabItem value="Windows">

- Install Drivers

Download and extract the [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip) file.

Locate the `DriverInstall.exe` file and run it as administrator:

To install drivers: Click the `Install Driver` option

To uninstall drivers: Click the `Uninstall Driver` option

:::tip
If you have installed other versions of the driver before, please uninstall them first before installing the new one.
:::

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/rkddevtool.webp" style={{width: '50%', maxWidth: '700'}} />
</div>

- Download RKDevTool

Download the [RKDevTool](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96-20221121.rar) utility, then extract the downloaded file. The `RKDevTool.exe` is the executable program - simply double-click it to launch the software.

</TabItem>

<TabItem value="Linux">

- Install rkdeveloptool

Open your system terminal or command line and run the following commands to install:

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

After completing the RKDevTool installation, use the following command to check the RKDevTool version.

<NewCodeBlock tip="Linux-host$" type="host">
```
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

<TabItem value="macOS">

- Install HomeBrew

[HomeBrew](https://brew.sh/) is a free and open-source package manager that simplifies the software installation process for macOS users.

If you don't have HomeBrew installed, follow these instructions to install it.

<NewCodeBlock tip="macOS-host$" type="host">
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
</NewCodeBlock>

- Install rkdeveloptool

Open your system terminal or command line and run the following commands to install:

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

After completing the RKDevTool installation, use the following command to check the RKDevTool version.

<NewCodeBlock tip="macOS-host$" type="host">
```
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

</Tabs>

## Using RKDevTool

:::tip
Maskrom mode is the "hardware first-aid kit" for embedded devices, enabling device recovery by directly interfacing with the chip's low-level hardware.

Maskrom mode is a built-in low-level recovery mode in Rockchip chips, which is automatically entered when the device cannot load a valid bootloader from any boot medium (eMMC, SD card, etc.).

This mode allows rewriting the device firmware via the RockUSB protocol.
:::

### Entering Maskrom Mode

Radxa E24C has a dedicated Maskrom button. If this button is detected as pressed during system startup, the system will automatically enter Maskrom mode!

#### Required Equipment

- One USB Type-A to Type-C cable
- A pin or toothpick
- 12V/2A DC power adapter (DC5525)

#### Entering the Mode

1. Connect Radxa E24C to your PC using a USB Type-C to Type-A cable

2. Press and hold the Maskrom button using a pin or toothpick

3. Connect the 12V/2A DC power adapter

4. Release the Maskrom button

Normally, the power indicator will stay lit when in Maskrom mode. If this doesn't happen, you can repeat the steps above.

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-maskrom.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

### Erasing eMMC

<Tabs queryString="e24c-erase">

<TabItem value="Windows">

Use the RKDevTool to erase the eMMC.

Before using the tool, ensure your PC can detect the device in Maskrom mode, then follow these steps:

1. Open RKDevTool

Make sure the host can detect the device in Maskrom mode and select the Advanced option.

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-01.webp" style={{width: '90%', maxWidth: '700'}} />
</div>

2. Write Loader

Go to the [Downloads Summary](../../../download) page to download the corresponding Loader file. Change the file selected in the `Boot` option to match the file you downloaded.

- ①: Select file path
- ②: Download Loader file
- ③: Operation feedback information

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-02.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

3. Read Storage Capacity

Select the `ReadCapability` option to read the current device's storage capacity.

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-03.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

4. Erase eMMC

First select `EMMC`, click `Switch Storage` to switch storage, then click the `EraseALL` option to clear the eMMC contents.

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-04.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

5. Reboot the Device

Click the `ResetDevice` option to reboot the device.

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-05.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

</TabItem>

<TabItem value="Linux/macOS">

Use the rkdeveloptool to erase the eMMC.

Before using the tool, ensure your PC can detect the device in Maskrom mode, then open your system terminal or command line and follow these steps:

1. Generate a Zero Image

Create a 64MB file filled with zeros in the current directory.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
dd if=/dev/zero of=./zero.img bs=1M count=64
```
</NewCodeBlock>

2. Check the Device

Verify if the device is detected in Maskrom mode.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool ld
```
</NewCodeBlock>

Expected output: One device detected

```
DevNo=1	Vid=0x2207,Pid=0x350c,LocationID=101	Maskrom
```

3. Write Loader

Go to the [Downloads Summary](../../../download) page to download the corresponding Loader file. Replace `xxx.bin` with the actual filename you downloaded.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool db xxx.bin
```
</NewCodeBlock>

4. Erase eMMC

Use the RKDevTool to write zero.img to the starting sector of the device, which is used to erase or initialize the eMMC of Rockchip devices.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool wl 0 zero.img
```
</NewCodeBlock>

5. Reboot the Device

Use the RKDevTool to reboot the device.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>
