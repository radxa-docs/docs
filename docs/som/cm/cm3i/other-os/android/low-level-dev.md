---
sidebar_position: 4
---

# 底层开发

主要介绍 uboot, kernel, aosp 编译打包等内容

## 环境配置

建议使用 Ubuntu 16.04 及以上版本

## 源码下载

```bash

$ repo init -u https://github.com/radxa/manifests.git -b Android11_Radxa_rk12 -m rockchip-r-release.xml
$ repo sync -d -c -j4

```

## 镜像编译

### 全部编译

适合第一次编译

CM3I IO

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch rk3568_radxa_cm3i-userdebug
radxa:rock-android12 $ ./build.sh -UACKup
# get images from IMAGE directory
```

等待编译完成就可以在 IMAGE 目录找到镜像

### 单独编译

适合小修改后编译

例如，只修改过

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

等待编译完成就可以在 IMAGE 目录找到镜像

## 常见问题
