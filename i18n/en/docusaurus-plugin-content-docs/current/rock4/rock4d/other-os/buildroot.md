---
sidebar_position: 10
description: "Buildroot Build"
---

import SSDISKTOOL from "../../../common/general/\_sddisktool.mdx"

# Buildroot Build

## Environment Preparation

You need to prepare an Ubuntu 20.04/22.04 x86_64 host machine.

You can also use a virtual machine

- ubuntu-22.04.5-live-server-amd64 virtual machine with at least 120GB of available disk space.

## Install Build Dependencies

<NewCodeBlock tip="Host-Linux$" type="host">
```
sudo apt update
sudo apt install python2 git rsync gcc g++ make device-tree-compiler bc flex bison lz4 libssl-dev libgmp-dev libmpc-dev expect expect-dev file unzip bzip2 fakeroot bsdmainutils
sudo ln -s /bin/python2 /bin/python
```
</NewCodeBlock>

## Download Rockchip Original SDK

- [Baidu Netdisk](https://pan.baidu.com/s/1G8xA7AsLqQMqrsurMKBGyA?pwd=u7ac)

## Extract the SDK

On your Ubuntu PC, use the following commands to extract the SDK.

<NewCodeBlock tip="Host-Linux$" type="host">
```
tar xvf rk3576_linux6.1_rkr4_sdk.repo.tar
.repo/repo/repo sync -l
```
</NewCodeBlock>

## Add ROCK 4D Board Support

Use the rockchip repository maintained by Radxa.

<NewCodeBlock tip="Host-Linux$" type="host">
```
cd device/rockchip
git remote add radxa https://github.com/radxa/device-rockchip.git
git fetch radxa
git checkout -b rk3576-linux-6.1 remotes/radxa/rk3576-linux-6.1
```
</NewCodeBlock>

Use the kernel repository maintained by Radxa.

<NewCodeBlock tip="Host-Linux$" type="host">
```
cd kernel
git remote add radxa https://github.com/radxa/kernel.git
git fetch radxa
git checkout -b linux-6.1-stan-rkr4.1-buildroot remotes/radxa/linux-6.1-stan-rkr4.1-buildroot
```
</NewCodeBlock>

Use the rkwifibt repository maintained by Radxa.

<NewCodeBlock tip="Host-Linux$" type="host">
```
cd external/rkwifibt
git remote add radxa https://github.com/radxa/rkwifibt.git
git fetch radxa
git checkout -b develop remotes/radxa/develop
```
</NewCodeBlock>

Use the buildroot repository maintained by Radxa.

<NewCodeBlock tip="Host-Linux$" type="host">
```
cd buildroot
git remote add radxa https://github.com/radxa/buildroot.git
git fetch radxa
git checkout -b rockchip/2024.02 remotes/radxa/rockchip/2024.02
```
</NewCodeBlock>

## Build the SDK

In the top-level directory of the SDK, execute the command:

<NewCodeBlock tip="Host-Linux$" type="host">
```
./build.sh
```
</NewCodeBlock>

Then select the configuration file `rockchip_rk3576_rock_4d_defconfig`.

After the build is complete, the image will be generated in the `rockdev/` directory. The system image file is `update.img`.

## Flashing the Image

### Flash Image to UFS/EMMC

On a Linux/Mac OS host, use the [upgrade_tool](https://dl.radxa.com/tools/linux/Linux_Upgrade_Tool_V2.1.zip) to flash the system image `update.img` to UFS/EMMC through the Type-A port.

<NewCodeBlock tip="Host-PC$" type="host">
```
upgrade_tool uf update.img
```
</NewCodeBlock>

On a Windows host, use the `RKDevTool` to flash the system image `update.img` to UFS/EMMC through the Type-A port.

- ①: Put the device into Maskrom mode

- ②: Select the `Upgrade Firmware` option

- ③: Click the `Firmware` option and select your compiled `update.img`

- ④: Click the `Upgrade` button to start flashing the system image

<div style={{textAlign: 'center'}}>
    <img src="/en/img/rock4/4d/other-os-burn-img.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Flash Image to MicroSD Card

Use SDDiskTool to flash the generated image to a MicroSD Card.

<SSDISKTOOL />
