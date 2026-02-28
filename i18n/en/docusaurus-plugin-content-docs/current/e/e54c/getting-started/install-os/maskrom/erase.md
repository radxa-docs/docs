---
sidebar_position: 5
---

# Erase eMMC

You can use the RKDevTool utility to erase the eMMC storage.

## Installing RKDevTool

<Tabs queryString="e24c-erase">

<TabItem value="Windows">

- Install Drivers

Download and extract the [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip) file.

Locate the `DriverInstall.exe` file and run it as administrator:

To install driver: Click the `Install Driver` option

To uninstall driver: Click the `Uninstall Driver` option

:::tip
If you have previously installed other versions of the driver, please uninstall them before installing the new one.
:::

<div style={{textAlign: 'left'}}>
  <img src="/en/img/e/e24c/rkddevtool.webp" style={{width: '50%', maxWidth: '700'}} />
</div>

- Download RKDevTool

Download the [RKDevTool](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96-20221121.rar) utility, then extract the downloaded file. The `RKDevTool.exe` is the executable program - simply double-click it to launch the software.

</TabItem>

<TabItem value="Linux">

- Install rkdeveloptool

Open your system terminal or command line and run the following commands to install:

<NewCodeBlock tip="Linux-host$" type="host">

```bash
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

- Verify Installation

After installing RKDevTool, you can check the version with the following command:

<NewCodeBlock tip="Linux-host$" type="host">

```bash
rkdeveloptool -V
```

</NewCodeBlock>

</TabItem>

<TabItem value="macOS">

- Install HomeBrew

[HomeBrew](https://brew.sh/) is a free and open-source package manager that simplifies software installation for macOS users.

If you don't have HomeBrew installed, follow these instructions:

<NewCodeBlock tip="macOS-host$" type="host">

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

</NewCodeBlock>

- Install rkdeveloptool

Open your system terminal or command line and run the following commands to install:

<NewCodeBlock tip="macOS-host$" type="host">

```bash
brew install automake autoconf libusb pkg-config git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
autoreconf -i
./configure
make -j $(nproc)
cp rkdeveloptool /opt/homebrew/bin/
```

</NewCodeBlock>

- Verify Installation

After installing RKDevTool, you can check the version with the following command:

<NewCodeBlock tip="macOS-host$" type="host">

```bash
rkdeveloptool -V
```

</NewCodeBlock>

</TabItem>

</Tabs>

## Using RKDevTool

:::tip
Maskrom mode serves as the "hardware first-aid kit" for embedded devices, enabling device recovery through direct low-level chip interface operations.

Maskrom mode is a built-in low-level recovery mode in Rockchip chips that activates automatically when the device cannot load a valid bootloader from any boot medium (eMMC, SD card, etc.).

This mode allows for device firmware reprogramming via the RockUSB protocol.
:::

## Entering Maskrom Mode

Radxa E54C features a dedicated Maskrom button. When this button is detected as pressed during system boot, the system will automatically enter Maskrom mode!

### Required Equipment

- One USB Type-A to Type-C cable
- One pin or toothpick
- 12V/2A DC power adapter (DC5525)

### Entering Maskrom Mode

1. Connect Radxa E54C to your PC using a USB Type-C to Type-A cable

2. Press and hold the Maskrom button using a pin or toothpick

3. Connect the 12V/2A DC power adapter

4. Release the Maskrom button

Normally, the power indicator will stay lit when in Maskrom mode. If the behavior is different, you can repeat the steps to try again!

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-maskrom.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

## Erasing eMMC

<Tabs queryString="e24c-erase">

<TabItem value="Windows">

Use the RKDevTool utility to erase the eMMC.

Before using the tool, ensure your PC can recognize the device in Maskrom mode, then follow these steps:

1. Open RKDevTool

Make sure the host can detect the Maskrom device and select the advanced options.

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-01.webp" style={{width: '90%', maxWidth: '700'}} />
</div>

2. Write the Loader

Go to the [Resource Download](../../../download) page to download the appropriate Loader file, then modify the `Boot` option to select the downloaded file.

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

4. Erase eMMC

First select `EMMC`, click `Switch Storage` to switch the storage, then click the `EraseALL` option to clear the eMMC contents.

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-04.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

5. Reboot the System

Click the `ResetDevice` option to restart the device.

<div style={{textAlign: 'left'}}>
  <img src="/en/img/e/e24c/emmc-rkdevtool-05.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

</TabItem>

<TabItem value="Linux/macOS">

1. Ensure the E54C is in Maskrom mode.

2. Verify Maskrom Mode

Use the rkdeveloptool ld command to check the recognized device information:

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
dd if=/dev/zero of=./zero.img bs=1M count=64
```
</NewCodeBlock>

2. Check Device

Check if the device can be recognized in Maskrom mode.

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
rkdeveloptool ld
```
</NewCodeBlock>

Output similar to the following indicates a Maskrom device is recognized:

```text
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

3. Run the Loader File

Replace `<loader-file>.bin` with the appropriate Loader file for E54C. You can download the Loader file from the [Resource Download](../../download) page.

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">

```bash
sudo rkdeveloptool db <loader-file>.bin
```

</NewCodeBlock>

4. Erase eMMC

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```bash
sudo rkdeveloptool wl 0 zero.img
```

</NewCodeBlock>

5. Reboot the System

Reboot for the eMMC erasure to take effect:

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">

```bash
sudo rkdeveloptool rd
```

</NewCodeBlock>

</TabItem>

</Tabs>

## Installing System to eMMC

You can install the system to eMMC according to your host platform:

- [Windows Host](./windows)
- [Linux/macOS Host](./linux_macos)
