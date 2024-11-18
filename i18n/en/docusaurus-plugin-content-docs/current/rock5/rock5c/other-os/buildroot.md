---
sidebar_position: 10
description: "Buildroot"
---

import SSDISKTOOL from "../../../common/general/\_sddisktool.mdx"

# Buildroot

## Preparation

We need one Ubuntu 20.04/22.04 x86_64 PC.

We can also use virtual machine

- ubuntu-22.04.5-live-server-amd64 virtual machine with hard disk available capacity not less than 120G

## Install build dependencies

```
sudo apt update
sudo apt install python2 git rsync gcc g++ make device-tree-compiler bc flex bison lz4 libssl-dev libgmp-dev libmpc-dev expect expect-dev file unzip bzip2 fakeroot bsdmainutils
sudo ln -s /bin/python2 /bin/python
```

## Get rockchip original SDK

- Mega: https://mega.nz/file/kjZExAzL#pzw5des1W_rDzTm-P2iLAJ-n9RLYQY-gEVajpm3U_sQ
- BaiduPan: https://pan.baidu.com/s/1bm4IXy7tJ-sBDVdMxehRAQ?pwd=1pty

## Extract SDK

On Ubuntu PC we use the following commands to extract the SDK.

```
tar xvf rk3588_linux6.1_rkr4_sdk.repo.tar
.repo/repo/repo sync -l
```

## Add board ROCK 5C support

Use Radxa reposiory, rockchip.

```
cd device/rockchip
git remote add radxa https://github.com/radxa/device-rockchip.git
git fetch radxa
git checkout -b rk3588-linux-6.1 remotes/radxa/rk3588-linux-6.1
```

Use Radxa repository, u-boot.

```
cd u-boot
git remote add radxa https://github.com/radxa/u-boot.git
git fetch radxa
git checkout -b next-dev-buildroot remotes/radxa/next-dev-buildroot
```

Use Radxa repository, kernel.

```
cd kernel
git remote add radxa https://github.com/radxa/kernel.git
git fetch radxa
git checkout -b linux-6.1-stan-rkr4.1-buildroot remotes/radxa/linux-6.1-stan-rkr4.1-buildroot
```

## Build SDK

Navigate to the top-level directory of the SDK, run command.

```
./build.sh
```

And select defconfig `rockchip_rk3588s_rock_5c_defconfig`.
The target images will be stored on rockdev directory. The system image is `update.img`.

## Write the image

### Write the image to eMMC

On Linux/Mac OS host, use `upgrade_tool` to flash the image to eMMC via USB-A port.

```
upgrade_tool uf update.img
```

On Windows host, use `RKDevTool` to flash the image to eMMC via USB-A port.

### Write the image to MicroSD Card

Use the SDDiskTool to flash the image into the MicroSD Card.

<SSDISKTOOL />
