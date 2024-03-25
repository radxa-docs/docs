---
sidebar_position: 4
---

# Low-Level development

Introduces how to download and build uboot, kernel, os etc.

## Environment configuration

In order to avoid problems with environment configuration during the Android compilation process and improve development efficiency, we introduced Docker as a tool.

### Docker

Docker is an open source application container engine that helps developers build, deploy and manage applications more efficiently.

Dockerfile is a text file for building a Docker image. The environment required to compile Android can be built according to the following content.

```
   FROM ubuntu:xenial

   RUN apt-get update -y && apt-get install -y openjdk-8-jdk python git-core gnupg flex bison gperf build-essential \
       zip curl liblz4-tool zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
       lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
       libgl1-mesa-dev libxml2-utils xsltproc unzip mtools u-boot-tools \
       htop iotop sysstat iftop pigz bc device-tree-compiler lunzip \
       dosfstools vim-common parted udev libssl-dev python3 python-pip lzop swig

   #### For China
   RUN curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo > /usr/local/bin/repo && \
       chmod +x /usr/local/bin/repo && \
       which repo
   ENV REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo/'
   #### For China End

   RUN pip install pycrypto
   ENV USER=android11-docker
   ARG USER_ID=0
   ARG GROUP_ID=0
   RUN groupadd -g ${GROUP_ID} jenkins-docker && useradd -m -g jenkins-docker -u ${USER_ID}   android11-docker

   USER android11-docker

```

#### Build Docker image

```bash
$ docker build -t android-builder:11.x --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` $(which-dir-dockerfile-in)

```

### Repo

Repo is a tool used in Android development to manage multiple Git repositories. It is a Python script that facilitates developers to version control and manage multiple Git libraries.

### Install Repo

```bash

wget https://storage.googleapis.com/git-repo-downloads/repo -P ~/bin/
or
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

```

## code download

```bash

$ repo init -u git@192.168.2.13:rockchip_android_s/rk3588-manifests.git -b Android12_Radxa_rkr14 -m rockchip-s-local.xml
$ repo sync -d --no-tags -j4

```

## build

### Use all-in-one build script

```bash
  radxa:rock-android11 $ source build/envsetup.sh

  # for Rock 3A
  radxa:rock-android11 $ lunch rk356x_rock_3a_r-userdebug
  # for Rock 3A if you want a box software
  radxa:rock-android11 $ lunch rk356x_rock_3a_box-userdebug

  radxa:rock-android11 $ ./build.sh -UACKup
```

### Step by step Build

If you dont' want to use "Use all-in-one build script", you can follow this way to build image step by step.

1. Setup board environment

```bash
  # for Rock 3A
  radxa:rock-android11 $ export PRODUCT_NAME="rk356x_rock_3a_r"
  radxa:rock-android11 $ export PRODUCT_UBOOT_CONFIG="radxa_rock_3a_toybrick"
  radxa:rock-android11 $ export PRODUCT_KERNEL_CONFIG="rockchip_defconfig"
  radxa:rock-android11 $ export PRODUCT_KERNEL_DTS="rk3568-rock-3a"

  # for Rock 3A box software
  radxa:rock-android11 $ export PRODUCT_NAME="rk356x_rock_3a_box"
  radxa:rock-android11 $ export PRODUCT_UBOOT_CONFIG="radxa_rock_3a_toybrick"
  radxa:rock-android11 $ export PRODUCT_KERNEL_CONFIG="rockchip_defconfig"
  radxa:rock-android11 $ export PRODUCT_KERNEL_DTS="rk3568-rock-3a"

```

2. Build u-boot

```bash
  radxa:rock-android11 $ cd u-boot
  radxa:rock-android11/u-boot $ make clean
  radxa:rock-android11/u-boot $ make mrproper
  radxa:rock-android11/u-boot $ make distclean
  radxa:rock-android11/u-boot $ ./make.sh ${PRODUCT_UBOOT_CONFIG}
  radxa:rock-android11 $ cd -
```

3. Building kernel

```bash
  radxa:rock-android11 $ cd kernel
  radxa:rock-android11/kernel $ ADDON_ARGS="CC=../prebuilts/clang/host/linux-x86/clang-r383902b/bin/clang LD=../prebuilts/clang/host/linux-x86/clang-r383902b/bin/ld.lld"
  radxa:rock-android11/kernel $ make clean
  radxa:rock-android11/kernel $ make $ADDON_ARGS ARCH=arm64 ${PRODUCT_KERNEL_CONFIG}
  radxa:rock-android11/kernel $ make $ADDON_ARGS ARCH=arm64 ${PRODUCT_KERNEL_DTS}.img -j$(nproc)

  radxa:rock-android11 $ cd -
```

4. Building AOSP

```bash
  radxa:rock-android11 $ source build/envsetup.sh
  radxa:rock-android11 $ lunch ${PRODUCT_NAME}-userdebug
  radxa:rock-android11 $ make -j$(nproc)
```

5. Make images

```bash
  radxa:rock-android11 $ rm -rf rockdev
  radxa:rock-android11 $ ln -s RKTools/linux/Linux_Pack_Firmware/rockdev .
  radxa:rock-android11 $ ./mkimage.sh
```

6. Pack Image

```bash
  radxa:rock-android11 $ cd rockdev
  radxa:rock-android11/rockdev $ rm -rf Image
  radxa:rock-android11/rockdev $ ln -s Image-${PRODUCT_NAME} Image

#  RkUpdate Image
  radxa:rock-android11/rockdev $ ./mkupdate_rk356x.sh

# gpt Image
  radxa:rock-android11/rockdev $ ./android-gpt.sh
```

## FAQ
