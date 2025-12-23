---
sidebar_position: 1
---

import SSDISKTOOL from "../../../common/general/\_sddisktool.mdx"

# Buildroot Build

## Environment Preparation

Prepare an Ubuntu 20.04/22.04 x86_64 host machine.

You can also work inside a virtual machine:

- ubuntu-22.04.5-live-server-amd64 VM with at least 120G of free disk space.

## Install Build Dependencies

<NewCodeBlock tip="Host-Linux$" type="host">
```
sudo apt update
sudo apt install python2 git rsync gcc g++ make device-tree-compiler bc flex bison lz4 libssl-dev libgmp-dev libmpc-dev expect expect-dev file unzip bzip2 fakeroot bsdmainutils
sudo ln -s /bin/python2 /bin/python
```
</NewCodeBlock>

## Download the Rockchip Reference SDK

- [Baidu Cloud](https://pan.baidu.com/s/1RWrkBVUtrAAEEu1dn_G0ww?pwd=e9nj)

- [MEGA](https://mega.nz/file/Jr4iVQrZ#YJl0XwnueoDA2uwXSc3y0H_FfSr3Dn2NMa-F_anCfyg)

## Extract the SDK

On the Ubuntu host, run the following commands to unpack the SDK:

<NewCodeBlock tip="Host-Linux$" type="host">
```
tar -xvzf rk3308_linux5.10_rkr8_sdk.repo.tar.gz
.repo/repo/repo sync -l
```
</NewCodeBlock>

## Add ROCK S0 Board Support

Use the Radxa-maintained rockchip repository:

<NewCodeBlock tip="Host-Linux$" type="host">
```
cd device/rockchip
git remote add radxa https://github.com/radxa/device-rockchip.git
git fetch radxa
git checkout -b rk3308-linux-5.10 remotes/radxa/rk3308-linux-5.10
```
</NewCodeBlock>

Use the Radxa-maintained rkbin repository:

<NewCodeBlock tip="Host-Linux$" type="host">
```
cd rkbin
git remote add radxa https://github.com/radxa/rkbin.git
git fetch radxa
git checkout -b develop-v2025.04 remotes/radxa/develop-v2025.04
```
</NewCodeBlock>

Use the Radxa-maintained kernel repository:

<NewCodeBlock tip="Host-Linux$" type="host">
```
cd kernel
git remote add radxa https://github.com/radxa/kernel.git
git fetch radxa
git checkout -b linux-5.10-gen-rkr8-buildroot remotes/radxa/linux-5.10-gen-rkr8-buildroot
```
</NewCodeBlock>

## Build the SDK

From the root of the SDK run:

<NewCodeBlock tip="Host-Linux$" type="host">
```
./build.sh
```
</NewCodeBlock>

Then choose the `rockchip_rk3308_rock_s0_defconfig` configuration file.

After the build finishes, images are produced under the `rockdev/` directory. The system image file is `update.img`.

## Flash the Image

### Flash the Image to eMMC

On a Linux or macOS host, use [upgrade_tool](https://dl.radxa.com/tools/linux/Linux_Upgrade_Tool_V2.1.zip) over the 4-pin USB2.0 OTG port to flash the `update.img` system image into eMMC:

<NewCodeBlock tip="Host-PC$" type="host">
```
upgrade_tool uf update.img
```
</NewCodeBlock>

On Windows, use `RKDevTool` via the Type-A flashing port to write `update.img` into eMMC:

- ①: Put the device into Maskrom mode.
- ②: Choose the `Upgrade Firmware` option.
- ③: Click `Firmware` and select the generated `update.img`.
- ④: Click `Upgrade` to start flashing the system image.

<div style={{textAlign: 'center'}}>
    <img src="/en/img/rock4/4d/other-os-burn-img.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Flash the Image to a MicroSD Card

Use SDDiskTool to write the generated image to a MicroSD card.

<SSDISKTOOL />
