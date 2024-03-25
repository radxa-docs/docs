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
   ENV USER=android12-docker
   ARG USER_ID=0
   ARG GROUP_ID=0
   RUN groupadd -g ${GROUP_ID} jenkins-docker && useradd -m -g jenkins-docker -u ${USER_ID} android12-docker

   USER android12-docker


```

#### Build Docker image

```bash
$ docker build -t android-builder:11.x --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` $(which-dir-dockerfile-in)

```

### Repo

Repo is a tool used in Android development to manage multiple Git repositories. It is a Python script that facilitates developers to version control and manage multiple Git libraries.

### Install Repo

```bash

 radxa$ docker build -t android-builder:12.x --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` $(which-dir-dockerfile-in)

```

## code download

```bash

$ repo init -u git@192.168.2.13:rockchip_android_s/rk3588-manifests.git -b Android12_Radxa_rkr14 -m rockchip-s-local.xml
$ repo sync -d --no-tags -j4

```

## build

### Use all-in-one build script

```bash
android12 $ source build/envsetup.sh
android12 $ lunch RadxaRockNX5-userdebug
android12 $ ./build.sh -AUCKup
```

### Step by step Build

If you dont' want to use "Use all-in-one build script", you can follow this way to build image step by step.

1. Setup board environment

```bash
android12 $ export PRODUCT_NAME="RadxaRockNX5"
android12 $ export PRODUCT_UBOOT_CONFIG="rk3588"
android12 $ export PRODUCT_KERNEL_CONFIG="rockchip_defconfig android-11.config rocknx5.config"
android12 $ export PRODUCT_KERNEL_DTS="rk3588s-radxa-nx5"
```

2. Build u-boot

```bash
android12 $ cd u-boot
android12/u-boot $ make clean
android12/u-boot $ make mrproper
android12/u-boot $ make distclean
android12/u-boot $ ./make.sh ${PRODUCT_UBOOT_CONFIG}
android12 $ cd -
```

3. Building kernel

```bash
android12 $ cd kernel-5.10
android12/kernel-5.10 $ export PATH=../prebuilts/clang/host/linux-x86/clang-r416183b/bin:$PATH
android12/kernel-5.10 $ alias msk='make CROSS_COMPILE=aarch64-linux-gnu- LLVM=1 LLVM_IAS=1'
android12/kernel-5.10 $ make clean
android12/kernel-5.10 $ make ARCH=arm64 ${PRODUCT_KERNEL_CONFIG}
android12/kernel-5.10 $ msk ARCH=arm64 BOOT_IMG=../rockdev/Image-${PRODUCT_NAME}/boot.img ${PRODUCT_KERNEL_DTS}.img
android12 $ cd -
```

4. Building AOSP

```bash
android12 $ source build/envsetup.sh
android12 $ lunch ${PRODUCT_NAME}-userdebug
android12 $ make -j$(nproc)
```

5. Make images

```bash
android12 $ rm -rf rockdev
android12 $ ln -s RKTools/linux/Linux_Pack_Firmware/rockdev .
android12 $ ./mkimage.sh
```

6. Pack Image

```bash
android12 $ cd rockdev
android12/rockdev $ rm -rf Image
android12/rockdev $ ln -s Image-${PRODUCT_NAME} Image

#  RkUpdate Image
android12/rockdev $ ./mkupdate_rk358x.sh

# gpt Image
radxa:rock-android12/rockdev $ ./android-gpt.sh
```

## FAQ
