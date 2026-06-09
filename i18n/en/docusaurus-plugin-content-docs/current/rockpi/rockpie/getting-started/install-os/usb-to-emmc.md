---
sidebar_position: 2
---

# Install OS to Onboard eMMC

This guide describes how to install the operating system to the onboard eMMC.

:::tip

This guide applies to Radxa ROCK Pi E boards with onboard eMMC.

:::

## Hardware Preparation

You need to prepare the following hardware before proceeding with the installation.

#### Installation/Boot

- Radxa ROCK Pi E
- Power supply: Use Type-C to Type-A cable to connect PC for power and data transfer

## Install OS

Installing the OS will format the eMMC. Please backup any important data before proceeding.

### Download Files

#### Download Loader File

Go to the [Resource Download](../download) page to download the corresponding Loader file.

#### Download System Image

On your PC, visit the [Resource Download](../download) page and find the official OS image.

After downloading, extract the system image file. The resulting `*.img` file is the system image to be flashed to the eMMC.

### Install RKDevTool

RKDevTool is a USB flashing software developed by Rockchip for Windows/Linux/macOS platforms, designed to simplify and accelerate the development and debugging process for Rockchip series chips.

<Tabs queryString="erase">

<TabItem value="Windows">

- Install Driver

Download and extract [DriverAssistant](https://dl.radxa.com/tools/windows/DriverAssitant.zip).

Find the `DriverInstall.exe` file and run it as administrator:

Install driver: Click `Install Driver`

Uninstall driver: Click `Uninstall Driver`

:::tip

If you have previously installed a different version of the driver, please uninstall it first before installing.

:::

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rock4/4d/rkddevtool.webp" style={{width: '50%', maxWidth: '700'}} />
</div>

- Download RKDevTool

Download [RKDevTool](https://dl.radxa.com/tools/windows/RKDevTool_Release.zip), then extract the downloaded file. `RKDevTool.exe` is the executable program - double-click to open it.

</TabItem>

<TabItem value="Linux">

- Install rkdeveloptool

Open the system terminal or command line and run the following commands:

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

- Verify Version

After installing RKDevTool, use the following command to check the version:

<NewCodeBlock tip="Linux-host$" type="host">
```bash
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

<TabItem value="macOS">

- Install HomeBrew

[HomeBrew](https://brew.sh/) is a free and open-source package manager that simplifies the process of installing software for macOS users.

If HomeBrew is not installed, follow the installation guide:

<NewCodeBlock tip="macOS-host$" type="host">
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
</NewCodeBlock>

- Install rkdeveloptool

Open the system terminal or command line and run the following commands:

<NewCodeBlock tip="macOS-host$" type="host">
```bash
brew install automake autoconf libusb pkg-config git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
autoreconf -i
./configure
make -j $(nproc)
cp rkdeveloptool /opt/local/sbin/
```
</NewCodeBlock>

- Verify Version

After installing RKDevTool, use the following command to check the version:

<NewCodeBlock tip="macOS-host$" type="host">
```bash
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

</Tabs>

### Enter Maskrom Mode

We need to put ROCK Pi E into Maskrom mode, then install the system to the onboard eMMC using this mode.

When the board has no system boot media (i.e., no microSD card is inserted in the microSD slot), the system will automatically enter Maskrom mode.

The specific steps are as follows:

1. Before powering on the ROCK Pi E, use USB-to-DuPont cable to connect ROCK Pi E and PC

| Pin Function                | Connection                        |
| --------------------------- | --------------------------------- |
| ROCK Pi E : GND (Pin14)     | Connect to GND pin of USB cable   |
| ROCK Pi E : USB20DM (Pin16) | Connect to Data- pin of USB cable |
| ROCK Pi E : USB20DP (Pin18) | Connect to Data+ pin of USB cable |

2. After successful connection, power on the board with a power adapter

:::tip

If the onboard eMMC has a system installed, short the Maskrom solder pads on the back of the board before powering on to enter Maskrom mode.

<div style={{textAlign: 'center'}}>
  <img src="/en/img/rockpi/pie/rock-pi-e-maskrom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::

### Using RKDevTool

When the device enters Maskrom mode, RKDevTool will automatically detect it. If the device is not detected, follow the steps to enter Maskrom mode again.

#### Check Maskrom Device

<Tabs queryString="maskrom-display">

<TabItem value="Windows">
Open RKDevTool to view the detected device information:
<div style={{textAlign: 'center'}}>
<img src="/en/img/rock4/4d/maskrom-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux/MacOS">
Use `rkdeveloptool ld` to view detected device information:
<NewCodeBlock tip="Linux/macOS-host$" type="host">
```bash
sudo rkdeveloptool ld
```
</NewCodeBlock>

Output similar to: Device detected in Maskrom mode

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```text
DevNo=1	Vid=0x2207,Pid=0x330e,LocationID=101	Maskrom
```
</NewCodeBlock>

</TabItem>

</Tabs>

### Flash System Image

<Tabs queryString="maskrom-display">

<TabItem value="Windows">

In RKDevTool, perform the following operations:

- ①: Select Loader file
- ②: Select system image
- ③: Select eMMC as storage medium
- ④: Check `Write by Address`
- ⑤: Start execution (flash Loader and system)
- ⑥: Operation feedback

<div style={{textAlign: 'center'}}>
<img src="/en/img/rockpi/pis/rkdevtool-emmc.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux/MacOS">

Open system terminal or command line and execute the following.

- Run Loader

Replace `<loader-file>.bin` with the actual Loader file name you downloaded.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```bash
sudo rkdeveloptool db <loader-file>.bin
```
</NewCodeBlock>

On success, terminal shows:

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```text
Downloading bootloader succeeded.
```
</NewCodeBlock>

- Flash System Image

Replace `<system-image>.img` with the actual system image filename.

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```bash
sudo rkdeveloptool wl 0 <system-image>.img
```
</NewCodeBlock>

- Reboot Device

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```bash
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>
