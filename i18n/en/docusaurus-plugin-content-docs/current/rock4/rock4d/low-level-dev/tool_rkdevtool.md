---
sidebar_position: 1
---

# RKDevTool Usage

RKDevTool is a software developed by Rockchip for USB flashing on Windows/Linux/macOS platforms, designed to simplify and accelerate the development and debugging process for Rockchip series chips.

## RKDevTool Installation

<Tabs queryString="rkdevtool">

<TabItem value="Windows">

- Install Drivers

Download and extract the [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip) file.

Locate the `DriverInstall.exe` file and run it as administrator:

- To install drivers: Click the `Install Driver` button
- To uninstall drivers: Click the `Uninstall Driver` button

:::tip
If you have installed a different version of the driver before, please uninstall it first before installing the new one.
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rkddevtool.webp" style={{width: '50%', maxWidth: '700'}} alt="RKDevTool Driver Installation" />
</div>

- Download RKDevTool

Download the [RKDevTool](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96-20221121.rar) software. After downloading, extract the files. You'll find `RKDevTool.exe` as the main executable. Double-click it to launch the application.

</TabItem>

<TabItem value="Linux">

- Install rkdeveloptool

Open a terminal and run the following commands to install the necessary dependencies and compile rkdeveloptool:

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

After installation, you can check the installed version of rkdeveloptool with the following command:

<NewCodeBlock tip="PC - Host$" type="host">
```bash
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

<TabItem value="macOS">

- Install Homebrew

[Homebrew](https://brew.sh/) is a free and open-source package manager that simplifies the process of installing software on macOS.

If you don't have Homebrew installed, you can install it by running the following command in your terminal:

<NewCodeBlock tip="macOS-host$" type="host">
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
</NewCodeBlock>

- Install rkdeveloptool

Open Terminal and run the following commands to install the required dependencies and compile rkdeveloptool:

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

- Verify Installation

After installation, you can check the installed version of rkdeveloptool with the following command:

<NewCodeBlock tip="macOS-host$" type="host">
```bash
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

</Tabs>

## RKDevTool Usage

In Rockchip platform development, RKDevTool is a commonly used flashing tool, with Maskrom mode and Loader mode being the two key device boot modes.

:::tip

- Loader mode requires a valid bootloader to be present in the storage medium.
- MaskROM mode does not require a valid bootloader in the storage medium.

:::

### Maskrom/Loader Modes

We primarily recommend using RKDevTool in Maskrom mode because it allows direct flashing via USB connection, while Loader mode requires a valid bootloader to be present in the storage medium.

:::tip
The following instructions use the Radxa ROCK 4D as the demonstration board. Note that some products might not have a dedicated Recovery interface for entering Loader mode and might only have a Maskrom mode button.
:::

#### Entering Maskrom Mode

Refer to the [Hardware Use: Maskrom Button](../hardware-use/maskrom) tutorial.

#### Entering Loader Mode

Refer to the [Hardware Use: Recovery Pins](../hardware-use/recovery) tutorial.
