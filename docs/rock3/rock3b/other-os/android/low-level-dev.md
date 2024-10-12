---
sidebar_position: 4
---

# 底层开发

主要介绍 uboot, kernel, aosp 编译打包等内容

## 环境配置

安装以下资源包

```bash

apt-get update -y && apt-get install -y openjdk-8-jdk python git-core gnupg flex bison gperf build-essential \
zip curl liblz4-tool zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
libgl1-mesa-dev libxml2-utils xsltproc unzip mtools u-boot-tools \
htop iotop sysstat iftop pigz bc device-tree-compiler lunzip \
dosfstools vim-common parted udev libssl-dev python3 python-pip lzop swig

```

### Repo

Repo 是 Android 开发中用于管理多个 Git 仓库的工具，它是一个Python脚本，方便开发者对多个 Git 库进行版本控制和管理。

#### Repo下载

```bash

wget https://storage.googleapis.com/git-repo-downloads/repo -P ~/bin/
or
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

```

## 源码下载

```bash

$ repo init -u https://github.com/radxa/manifests.git -b Android11_Radxa_rk12 -m rockchip-r-release.xml
$ repo sync -d --no-tags -j4

```

## 镜像编译

镜像编译可以使用两种方法

### 方法一 (**推荐**)

使用 SDK 编译脚本方式编译

```bash
radxa:rock-android11 $ source build/envsetup.sh

# for Rock 3B
radxa:rock-android11 $ lunch rk356x_rock_3b_r-userdebug

radxa:rock-android11 $ ./build.sh -UACKu

```

等待编译完成就可以在 IMAGE 目录找到镜像

### 方法二

可以根据这个方法一步一步编译镜像

1. 设置编译项目的环境

```bash
radxa:rock-android11 $ source build/envsetup.sh

# for Rock 3B
radxa:rock-android11 $ lunch rk356x_rock_3b_r-userdebug
```

2. 编译 U-boot

```bash
radxa:rock-android11 $ ./build.sh -U
```

3. 编译内核

```bash
radxa:rock-android11 $ ./build.sh -CK
```

4. 编译AOSP

```bash
radxa:rock-android11 $ ./build.sh -A
```

5. 制作 Images

```bash
radxa:rock-android11 $ ./build.sh -u
```

## 常见问题
