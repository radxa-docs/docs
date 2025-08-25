---
sidebar_position: 5
---

# Low Level Development

Introduces how to build and pack uboot, kernel, aosp and so on.

## Environment configuration

In order to avoid problems with environment configuration during the Android compilation process and improve development efficiency, we introduced Docker as a tool.

Docker is an open source application container engine that helps developers build, deploy, and manage applications more efficiently.

Dockerfile is a text file that builds a Docker image. The environment required to compile Android12 can be built according to the following content.

```
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y software-properties-common apt-utils
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update -y && apt-get install -y python3.8
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 150
RUN apt-get install -y python3-pip && pip install pycrypto

RUN apt-get update -y && apt-get install -y openjdk-8-jdk python git-core gnupg flex bison gperf build-essential \
    zip curl gawk liblz4-tool zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
    libncurses5 libncurses-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
    libgl1-mesa-dev libxml2-utils xsltproc unzip mtools u-boot-tools \
    htop iotop sysstat iftop pigz bc device-tree-compiler lunzip \
    dosfstools vim-common parted udev libssl-dev  sudo rsync python3-pyelftools cpio


RUN wget 'https://storage.googleapis.com/git-repo-downloads/repo' -p /usr/local/bin/repo && \
    chmod +x /usr/local/bin/repo && \
    which repo

ENV REPO_URL='https://storage.googleapis.com/git-repo-downloads/repo'
ENV PS1="\[\033[01;37m\]\u@build\[\033[00m\]:\[\033[01;32m\]\w\[\033[00m\]:$ "

RUN apt-get install -y lzop swig
RUN apt-get update -y && apt-get install -y tzdata

```

#### Build Docker image

```bash
$ docker build -t android-builder:12.x --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` $(which-dir-dockerfile-in)

```

## Download Radxa Android SDK

Radxa Android SDK contains hundreds of Git repositories, and it would be very tedious to download them one by one without repo.

### Repo

Repo is a tool used in Android development to manage multiple Git repositories. It is a Python script that facilitates developers to version control and manage multiple Git libraries.

#### Download Repo

```bash
$ wget 'https://storage.googleapis.com/git-repo-downloads/repo' -P /tmp/
$ sudo cp /tmp/repo /usr/local/bin/repo
$ sudo chmod +x /usr/local/bin/repo
```

#### Code download

```bash
$ repo init -u https://github.com/radxa/manifests.git -b Android12_Radxa_rk14 -m rockchip-s-release.xml
$ repo sync -d --no-tags -j4
```

## Build Image

Image compilation can use two methods

### Method 1 (**recommended**)

Compile using SDK compilation script

```bash
android12 $ source build/envsetup.sh
android12 $ lunch RadxaCM5-userdebug
android12 $ ./build.sh -AUCKup
```

Wait for the compilation to be completed and you can find the image in the IMAGE directory.

### Method Two

You can compile the image step by step according to this method

1. Set up the environment for compiling the project

```bash
android12 $ export PRODUCT_NAME="RadxaCM5"
android12 $ export PRODUCT_UBOOT_CONFIG="rk3588"
android12 $ export PRODUCT_KERNEL_CONFIG="rockchip_defconfig android-11.config RadxaCM5.config"
android12 $ export PRODUCT_KERNEL_DTS="rk3588s-radxa-cm5-io"
```

2. Compile U-boot

```bash
android12 $ cd u-boot
android12/u-boot $ make clean
android12/u-boot $ make mrproper
android12/u-boot $ make distclean
android12/u-boot $ ./make.sh ${PRODUCT_UBOOT_CONFIG}
android12 $ cd -
```

3. Compile the kernel

```bash
android12 $ cd kernel
android12/kernel $ ADDON_ARGS="CC=../prebuilts/clang/host/linux-x86/clang-r383902b/bin/clang LD=../prebuilts/clang/host/linux-x86/clang-r383902b/bin/ld.lld"
android12/kernel $ make clean
android12/kernel $ make $ADDON_ARGS ARCH=arm64 ${PRODUCT_KERNEL_CONFIG}
android12/kernel $ make $ADDON_ARGS ARCH=arm64 ${PRODUCT_KERNEL_DTS}.img -j$(nproc)
android12 $ cd -
```

4. Compile AOSP

```bash
android12 $ source build/envsetup.sh
android12 $ lunch ${PRODUCT_NAME}-userdebug
android12 $ make -j$(nproc)
```

5. Make Images

```bash
android12 $ rm -rf rockdev
android12 $ ln -s RKTools/linux/Linux_Pack_Firmware/rockdev .
android12 $ ./mkimage.sh
```

6. Package Image

```bash
android12 $ cd rockdev
android12/rockdev $ rm -rf Image
android12/rockdev $ ln -s Image-${PRODUCT_NAME} Image

# Packaged into RK update format image
android12/rockdev $ ./mkupdate_rk356x.sh

# Packaged into GPT format image
android12/rockdev $ ./android-gpt.sh
```

## FAQ
