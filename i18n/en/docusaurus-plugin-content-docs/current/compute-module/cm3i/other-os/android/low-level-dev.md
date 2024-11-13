---
sidebar_position: 4
---

# Low-Level development

Introduces how to download and build uboot, kernel, os etc.

## Environment configuration

Ubuntu 16.04 and above are recommended

## code download

```bash

$ repo init -u https://github.com/radxa/manifests.git -b Android11_Radxa_rk12 -m rockchip-r-release.xml
$ repo sync -d -c -j4
```

## build

Suitable for first compilation

CM3 IO

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch rk3568_radxa_cm3i-userdebug
radxa:rock-android12 $ ./build.sh -UACKup
# get images from IMAGE directory
```

Wait for the compilation to complete and you can find the image in the IMAGE directory

### Compile separately

Suitable for compiling after minor modifications

For example, only modify

U-boot

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch rk3568_radxa_cm3i-userdebug
radxa:rock-android12 $ ./build.sh -AUup

```

Kernel

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch rk3568_radxa_cm3i-userdebug
radxa:rock-android12 $ ./build.sh -ACKup
```

AOSP

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch rk3568_radxa_cm3i-userdebug
radxa:rock-android12 $ ./build.sh -Aup
```

Wait for the compilation to complete and you can find the image in the IMAGE directory

## FAQ
