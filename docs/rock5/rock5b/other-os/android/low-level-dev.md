---
sidebar_position: 4
---

# 底层开发

主要介绍 uboot, kernel, aosp 编译打包等内容

## 环境配置

建议使用 Ubuntu 20.04 及以上版本

## 源码下载

```bash

$ repo init -u https://github.com/radxa/manifests.git -b Android12_Radxa_rk14 -m rockchip-s-release.xml
$ repo sync -d -c -j4

```

## 镜像编译

编译镜像有全部编译和部分编译两种方式，全部编译耗时较长，部分编译耗时较短
在代码下载完成后第一次编译使用全部编译，在后续的调试过程中推荐使用部分编译，例如只修改过内核，就单独编译内核即可

### 全部编译

适合第一次编译

Rock5B

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch RadxaRock5B-userdebug
radxa:rock-android12 $ ./build.sh -UACKup
# get images from IMAGE directory
```

Rock5B+

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch RadxaRock5BGen2-userdebug
radxa:rock-android12 $ ./build.sh -UACKup
# get images from IMAGE directory
```

等待编译完成就可以在 IMAGE 目录找到镜像

### 单独编译

适合小修改后编译

U-boot

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch RadxaRock5B-userdebug
radxa:rock-android12 $ ./build.sh -AUup

```

Kernel

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch RadxaRock5B-userdebug
radxa:rock-android12 $ ./build.sh -ACKup
```

AOSP

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch RadxaRock5B-userdebug
radxa:rock-android12 $ ./build.sh -Aup
```

等待编译完成就可以在 IMAGE 目录找到镜像

## 常见问题
