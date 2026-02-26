---
sidebar_position: 10
description: "Buildroot"
---

import SSDISKTOOL from "../../../common/general/\_sddisktool.mdx"

# Buildroot

## Environment Setup

Prepare an Ubuntu 20.04/22.04 x86_64 host machine.

A virtual machine is also acceptable:

- ubuntu-22.04.5-live-server-amd64 virtual machine with at least 120GB of available disk space.

## Install Build Dependencies

```bash
sudo apt update
sudo apt install python2 git rsync gcc g++ make device-tree-compiler bc flex bison lz4 libssl-dev libgmp-dev libmpc-dev expect expect-dev file unzip bzip2 fakeroot bsdmainutils
sudo ln -s /bin/python2 /bin/python
```

## Get Rockchip Original SDK

- Mega: https://mega.nz/file/kjZExAzL#pzw5des1W_rDzTm-P2iLAJ-n9RLYQY-gEVajpm3U_sQ
- Baidu Netdisk: https://pan.baidu.com/s/1bm4IXy7tJ-sBDVdMxehRAQ?pwd=1pty

## Extract the SDK

On the Ubuntu PC, use the following commands to extract the SDK:

```bash
tar xvf rk3588_linux6.1_rkr4_sdk.repo.tar
.repo/repo/repo sync -l
```

## Add ROCK 5C Board Support

Use Radxa's maintained rockchip repository:

```text
cd device/rockchip
git remote add radxa https://github.com/radxa/device-rockchip.git
git fetch radxa
git checkout -b rk3588-linux-6.1 remotes/radxa/rk3588-linux-6.1
```

Use Radxa's maintained u-boot repository:

```text
cd u-boot
git remote add radxa https://github.com/radxa/u-boot.git
git fetch radxa
git checkout -b next-dev-buildroot remotes/radxa/next-dev-buildroot
```

Use Radxa's maintained kernel repository:

```text
cd kernel
git remote add radxa https://github.com/radxa/kernel.git
git fetch radxa
git checkout -b linux-6.1-stan-rkr4.1-buildroot remotes/radxa/linux-6.1-stan-rkr4.1-buildroot
```

Use Radxa's maintained rkwifibt repository:

```text
cd external/rkwifibt
git remote add radxa https://github.com/radxa/rkwifibt.git
git fetch radxa
git checkout -b develop remotes/radxa/develop
```

Use Radxa's maintained buildroot repository:

```text
cd buildroot
git remote add radxa https://github.com/radxa/buildroot.git
git fetch radxa
git checkout -b rockchip/2024.02 remotes/radxa/rockchip/2024.02
```

## Add WiFi Module Configuration

Before building the SDK, enable the WiFi-related configurations as follows:

### Enable AIC8800D80_USB Macro

In the SDK's top-level directory, run `make menuconfig`, search for the keyword "aic" to find the "supported modules" option, and select "AIC8800D80 USB" as shown below:

<div style={{textAlign: 'center'}}>
    <img src="/en/img/rock5c/rock5c_buildroot_menuconfig.webp" style={{width: '100%', maxWidth: '600px'}} />  
</div>

After selection, the WiFi module driver files will be compiled into the rootfs.

### Enable BR2_PACKAGE_RKWIFIBT_AIC8800D80_USB_FIRMWARE Macro

For the WiFi module to function properly, firmware needs to be loaded.

Add `BR2_PACKAGE_RKWIFIBT_AIC8800D80_USB_FIRMWARE=y` to the `buildroot/configs/rockchip_rk3588_defconfig` file as shown below:

<div style={{textAlign: 'center'}}>
    <img src="/en/img/rock5c/rock5c_rockchip_rk3588_defconfig.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

Enabling `BR2_PACKAGE_RKWIFIBT_AIC8800D80_USB_FIRMWARE` will install the WiFi firmware in the system.

## Build the SDK

In the SDK's top-level directory, run the command:

```bash
./build.sh
```

Then select the configuration file `rockchip_rk3588s_rock_5c_defconfig`.

After the build is complete, the images will be generated in the `rockdev/` directory. The system image file is `update.img`.

## Flash the Image

### Flash Image to eMMC

On a Linux/Mac OS host, use the `upgrade_tool` utility through the Type-A port to flash the system image `update.img` to eMMC:

```text
upgrade_tool uf update.img
```

On a Windows host, use the `RKDevTool` utility through the Type-A port to flash the system image `update.img` to eMMC.

### Flash Image to MicroSD Card

Use SDDiskTool to flash the generated image to a MicroSD Card.

<SSDISKTOOL />
