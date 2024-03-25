---
sidebar_position: 4
---

# Low-Level development

Introduces how to download and build uboot, kernel, os etc.

## Environment configuration

In order to avoid problems with environment configuration during the Android compilation process and improve development efficiency, we introduced Docker as a tool.

### Docker

Docker is an open source application container engine that helps developers build, deploy and manage applications more efficiently.

Dockerfile is a text file for building a Docker image. The environment required to compile Android11 can be built according to the following content.

```
FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update -y && apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip



RUN apt-get update -y && apt-get install -y openjdk-8-jdk python git-core gnupg flex bison gperf build-essential \
    zip curl gawk liblz4-tool zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
    lib32ncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
    libgl1-mesa-dev libxml2-utils xsltproc unzip mtools u-boot-tools \
    htop iotop sysstat iftop pigz bc device-tree-compiler lunzip \
    dosfstools vim-common parted udev libssl-dev  sudo rsync python3-pyelftools cpio


RUN curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo > /usr/local/bin/repo && \
    chmod +x /usr/local/bin/repo && \
    which repo

ENV REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo/'
ENV PS1="\[\033[01;37m\]\u@build\[\033[00m\]:\[\033[01;32m\]\w\[\033[00m\]:$ "

RUN apt-get install -y lzop swig
RUN apt-get update -y && apt-get install -y tzdata
RUN mkdir /opt/toolchains
COPY ./gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf /opt/gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf
COPY ./gcc-linaro-aarch64-none-elf-4.8-2013.11_linux /opt/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux
COPY ./gcc-linaro-aarch64-none-elf-4.8-2013.11_linux /opt/toolchains/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux
COPY ./gcc-arm-none-eabi-6-2017-q2-update /opt/toolchains/gcc-arm-none-eabi-6-2017-q2-update
COPY ./gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf /opt/toolchains/gcc-linaro-6.3.1-2017.02-x86_64_arm-linux-gnueabihf
COPY ./gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu /opt/toolchains/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu
COPY ./gcc-linaro-7.2.1-2017.11-x86_64_aarch64-elf /opt/toolchains/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-elf
RUN apt-get install -y net-tools gcc-arm-linux-gnueabihf gcc-arm-none-eabi


```

#### Build Docker image

```bash
$ docker build -t android-builder:11.x --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` $(which-dir-dockerfile-in)

```

### Repo

Repo is a tool used in Android development to manage multiple Git repositories. It is a Python script that facilitates developers to version control and manage multiple Git libraries.

## code download

```bash
$ repo init -u https://github.com/radxa/manifests.git -b Android11_Radxa_rk11 -m rockchip-r-release.xml
$ repo sync -d --no-tags -j4
```

## build

### Use all-in-one build script

```bash
android11 $ source build/envsetup.sh
android11 $ lunch rk356x_radxa_zero3-userdebug
android11 $ ./build.sh -AUCKup
```

### Step by step Build

If you dont' want to use "Use all-in-one build script", you can follow this way to build image step by step.

1. Setup board environment

```bash
android11 $ export PRODUCT_NAME="rk356x_radxa_zero3"
android11 $ export PRODUCT_UBOOT_CONFIG="rk3566"
android11 $ export PRODUCT_KERNEL_CONFIG="rockchip_defconfig android-11.config rock3_zero_w.config"
android11 $ export PRODUCT_KERNEL_DTS="rk3566-radxa-zero3"
```

2. Build u-boot

```bash
android11 $ cd u-boot
android11/u-boot $ make clean
android11/u-boot $ make mrproper
android11/u-boot $ make distclean
android11/u-boot $ ./make.sh ${PRODUCT_UBOOT_CONFIG}
android11 $ cd -
```

3. Building kernel

```bash
android11 $ cd kernel
android11/kernel $ ADDON_ARGS="CC=../prebuilts/clang/host/linux-x86/clang-r383902b/bin/clang LD=../prebuilts/clang/host/linux-x86/clang-r383902b/bin/ld.lld"
android11/kernel $ make clean
android11/kernel $ make $ADDON_ARGS ARCH=arm64 ${PRODUCT_KERNEL_CONFIG}
android11/kernel $ make $ADDON_ARGS ARCH=arm64 ${PRODUCT_KERNEL_DTS}.img -j$(nproc)
android11 $ cd -
```

4. Building AOSP

```bash
android11 $ source build/envsetup.sh
android11 $ lunch ${PRODUCT_NAME}-userdebug
android11 $ make -j$(nproc)
```

5. Make images

```bash
android11 $ rm -rf rockdev
android11 $ ln -s RKTools/linux/Linux_Pack_Firmware/rockdev .
android11 $ ./mkimage.sh
```

6. Pack Image

```bash
android11 $ cd rockdev
android11/rockdev $ rm -rf Image
android11/rockdev $ ln -s Image-${PRODUCT_NAME} Image

#  RkUpdate Image
android11/rockdev $ ./mkupdate_rk356x.sh

# gpt Image
radxa:rock-android11/rockdev $ ./android-gpt.sh
```

## FAQ
