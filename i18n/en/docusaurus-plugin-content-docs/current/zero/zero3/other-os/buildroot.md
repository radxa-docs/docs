---
sidebar_position: 10
description: "Buildroot"
---

# Buildroot

## Preparation

We need one Ubuntu 20.04/22.04 x86_64 PC.

## Get rockchip original SDK

- Mega: https://mega.nz/file/JugCGDDC#NNL5_qRDRr-NL6TS3F1FSzkoXFwRCwDTNTW3KAiTtpI
- BaiduPan: https://pan.baidu.com/s/12rQmYaRMKwgz8cOBNjc4yQ?pwd=35mj

## Extract SDK

On Ubuntu PC we use the following commands to extract the SDK.

```
tar xvf rk356x_linux5.10_rkr8_sdk.repo.tar
.repo/repo/repo  sync -l
```

## Add board Zero 3E support

Use Radxa reposiory, rockchip.

```
cd device/rockchip
git remote add radxa https://github.com/radxa/device-rockchip.git
git fetch radxa
git checkout -b rk3566_rk3568-linux-5.10 remotes/radxa/rk3566_rk3568-linux-5.10
```

Use Radxa repository, kernel.

```
cd kernel
git remote add radxa https://github.com/radxa/kernel.git
git fetch radxa
git checkout -b linux-5.10-gen-rkr8-buildroot remotes/radxa/linux-5.10-gen-rkr8-buildroot
```

## Build SDK

Navigate to the top-level directory of the SDK, run command.

```
./build.sh
```

And select defconfig `rockchip_rk3566_radxa_zero_3e_defconfig`.
The target images will be stored on rockdev directory.
