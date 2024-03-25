---
sidebar_label: "Install Debian System"
sidebar_position: 2
---

import Etcher from "../../common/general/\_etcher.mdx"

# Install Debian System

There are two main startup ways for CM3I,boot from microSD and boot from eMMC, This page introduces how to install system image on these two medias.

- Install system image on microSD
- Install system image on eMMC

## Install System Image on microSD card

### Preparations

1. Prepare a microSD card
2. Prepare an SD card reader
3. Download corresponding product's [system image](/compute-module/images)
4. Insert the SD card into the SD card reader, then insert the reader into the PC's USB port

### Install System Image

#### Install System Image on microSD Card via Etcher

<Etcher model="cm3i" />

## Install System image on eMMC

CM3I needs to Enter [Maskrom Mode ](/compute-module/cm3i/maskrom) before installing the system.

### Install System image

<Tabs queryString="os">
<TabItem value="linux" label="Linux">

#### rkdeveloptool

rkdeveloptool is a USB flashing software developed by Rockchip for Linux/macOS platforms.

#### Installation for rkdeveloptool

If rockchip doesn't provide the Precompiled rkdeveloptool tools on your Operating System, you will need to compile it from source and then install it.

<Tabs queryString="host-os">
<TabItem value="archlinux" label="Arch Linux">

The rkdeveloptool can be installed from [AUR](https://aur.archlinux.org/packages/rkdeveloptool).

</TabItem>
<TabItem value="debian" label="Debian">

Execute the following command from the command line to install:

```bash
sudo apt-get update
sudo apt-get install -y libudev-dev libusb-1.0-0-dev dh-autoreconf pkg-config libusb-1.0 build-essential git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
wget https://patch-diff.githubusercontent.com/raw/rockchip-linux/rkdeveloptool/pull/73.patch
wget https://patch-diff.githubusercontent.com/raw/rockchip-linux/rkdeveloptool/pull/85.patch
git am *.patch
autoreconf -i
./configure
make -j $(nproc)
sudo cp rkdeveloptool /usr/local/sbin/
```

</TabItem>

<TabItem value="ubuntu" label="Ubuntu">

Execute the following command from the command line to install:

```bash
sudo apt-get update
sudo apt-get install rkdeveloptool
```

If the command above failed, please refer to the debian to compile the source.

</TabItem>

<TabItem value="macos" label="macOS">

Please install [Homebrew](https://brew.sh/) first, then run the following command from the command line to install it:

```bash
brew install automake autoconf libusb pkg-config git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
wget https://patch-diff.githubusercontent.com/raw/rockchip-linux/rkdeveloptool/pull/73.patch
wget https://patch-diff.githubusercontent.com/raw/rockchip-linux/rkdeveloptool/pull/85.patch
git am *.patch
autoreconf -i
./configure
make -j $(nproc)
cp rkdeveloptool /opt/homebrew/bin/
```

</TabItem>
</Tabs>

---

#### Usage for rkdeveloptool

##### View connected Maskrom devices

```bash
rkdeveloptool ld
```

##### Write file

:::caution
If the image file is a compressed file (such as zip,xz,gz etc), please unzip it first.
:::

:::caution
rkdeveloptool can only flash one device at a time,

If needs to flash multiple devices at the same time, use [upgrade_tool](low-level-dev/upgrade-tool).
:::

```bash
sudo rkdeveloptool db <loader>
sudo rkdeveloptool wl 0 <image>
```

you can download [Loader](loader) here.

##### Reboot device

```bash
sudo rkdeveloptool rd
```

</TabItem>
<TabItem value="windows" label="Windows">

#### RKDevTool

RKDevTool is a USB flashing software developed by Rockchip for Windows platforms.

---

#### Installation of RKDevTool

Please download and extract the following files to install RKDevTool:

- [RKDevTool v2.96](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96_zh.zip)(Includes Chinese documentation)
- [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

##### Installation of drivers

Download and unzip DriverAssistant, then execute DriverInstall.exe and click the `Install Driver` button to install the driver.
If you have previously installed another version of driver, please click `Uninstall Driver` to uninstall the driver first and then reinstall it.

![RK Driver](/img/configuration/RK-Driver-Assistant-Install-Uninstall.webp)

#### Write file to device

##### Run RKDevTool

![RKDevTool zh](/img/configuration/rkdevtool-zh.webp)

##### Connect the product and enter Maskrom mode

About how to enter Maskrom, please refer to [Maskrom Mode ](/compute-module/cm3i/maskrom)

If the operation is normal, RKDevTool will prompt `Found One MASKROM Device`:

![RKDevTool zh maskrom](/img/configuration/rkdevtool-zh-maskrom.webp)

:::caution
rkdeveloptool can only flash one device at a time,

If you need to write to multiple devices at the same time, use [upgrade_tool](low-level-dev/upgrade-tool).
:::

##### Configuring RKDevTool Write Parameters

:::caution
If the image file is a compressed file (such as zip,xz,gz etc), please unzip it first.
:::

Click a blank cell to select the [Loader](loader) and Image file to be used:

![RKDevTool zh choose](/img/configuration/rkdevtool-zh-choose.webp)

Select the target media in the `Storage` option:

<Tabs queryString="storage">
<TabItem value="emmc" label="eMMC">

![RKDevTool zh storage](/img/configuration/rkdevtool-zh-storage.webp)

</TabItem>
<TabItem value="spi" label="SPINOR">

:::tip
SPI Flash can only be burned into the corresponding U-BOOT. Please do not burn the image into SPI Flash.
:::

![RKDevTool zh SPINOR](/img/configuration/rkdevtool-zh-spinor.webp)

</TabItem>
</Tabs>

Select `Write by Address` and click `run`:

![RKDevTool zh flashing](/img/configuration/rkdevtool-zh-flashing.webp)

Wait for the write to complete, the device will reboot automatically when writing finished.

![RKDevTool zh complete](/img/configuration/rkdevtool-zh-complete.webp)

</TabItem>
</Tabs>

## FAQ

### Unable to enter MASKROM mode

If both SPI Flash and eMMC have boot images, you need to ensure that the Maskrom Button (SPI Flash) and Maskrom Button (eMMC) are both pressed and held before powering on.

### Unable to enter the system after flashing image

1. Since there are two boot medias, SPI Flash and eMMC on CM3I, booting from SPI Flash is preferred by default. If the image in SPI Flash is damaged, the system will not start.

2. The image may be flashed to SPI Flash by wrong operations when flashing the image. You can press and hold the Maskrom button of another boot medium before flashing. For example, if you want to flash an image to eMMC, press and hold the Maskrom Button (SPI Flash) before flashing, and release the button until the flashing begin.
