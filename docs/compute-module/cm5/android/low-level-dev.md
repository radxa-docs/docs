---
sidebar_position: 5
---

# 底层开发

主要介绍 uboot, kernel, aosp 编译打包等内容

## 环境配置

为了规避 Android 编译过程中因为环境配置出问题，提高开发效率，我们引入了Docker这一工具。

Docker 是一个开源的应用容器引擎，可以帮助开发者更有效地构建、部署和管理应用程序。

Dockerfile 是一个构建 Docker 镜像的文本文件，可以根据以下内容构建编译 Android12 所需环境。

```
FROM ubuntu:20.04

RUN rm /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse" | tee /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list

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
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

```

#### 构建 Docker 镜像

```bash
$ docker build -t android-builder:12.x --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` $(which-dir-dockerfile-in)

```

## 下载 Radxa Android SDK

Radxa Android SDK 包含数百个 Git 仓库，如果不用 repo 逐个下载会非常繁琐。

### Repo

Repo 是 Android 开发中用于管理多个 Git 仓库的工具，它是一个Python脚本，方便开发者对多个 Git 库进行版本控制和管理。

#### 下载 Repo

```bash
$ echo "export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo/'" >> ~/.bashrc
$ source ~/.bashrc
$ curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo -o /tmp/repo
$ sudo cp /tmp/repo /usr/local/bin/repo
$ sudo chmod +x /usr/local/bin/repo
```

#### 代码下载

```bash
$ repo init -u https://github.com/radxa/manifests.git -b Android12_Radxa_rk14 -m rockchip-s-release.xml
$ repo sync -d --no-tags -j4
```

## 镜像编译

镜像编译可以使用两种方法

### 方法一 (**推荐**)

使用 SDK 编译脚本方式编译

```bash
android12 $ source build/envsetup.sh
android12 $ lunch RadxaCM5-userdebug
android12 $ ./build.sh -AUCKup
```

等待编译完成就可以在 IMAGE 目录找到镜像

### 方法二

可以根据这个方法一步一步编译镜像

1. 设置编译项目的环境

```bash
android12 $ export PRODUCT_NAME="RadxaCM5"
android12 $ export PRODUCT_UBOOT_CONFIG="rk3588"
android12 $ export PRODUCT_KERNEL_CONFIG="rockchip_defconfig android-11.config RadxaCM5.config"
android12 $ export PRODUCT_KERNEL_DTS="rk3588s-radxa-cm5-io"
```

2. 编译 U-boot

```bash
android12 $ cd u-boot
android12/u-boot $ make clean
android12/u-boot $ make mrproper
android12/u-boot $ make distclean
android12/u-boot $ ./make.sh ${PRODUCT_UBOOT_CONFIG}
android12 $ cd -
```

3. 编译内核

```bash
android12 $ cd kernel
android12/kernel $ ADDON_ARGS="CC=../prebuilts/clang/host/linux-x86/clang-r383902b/bin/clang LD=../prebuilts/clang/host/linux-x86/clang-r383902b/bin/ld.lld"
android12/kernel $ make clean
android12/kernel $ make $ADDON_ARGS ARCH=arm64 ${PRODUCT_KERNEL_CONFIG}
android12/kernel $ make $ADDON_ARGS ARCH=arm64 ${PRODUCT_KERNEL_DTS}.img -j$(nproc)
android12 $ cd -
```

4. 编译AOSP

```bash
android12 $ source build/envsetup.sh
android12 $ lunch ${PRODUCT_NAME}-userdebug
android12 $ make -j$(nproc)
```

5. 制作 Images

```bash
android12 $ rm -rf rockdev
android12 $ ln -s RKTools/linux/Linux_Pack_Firmware/rockdev .
android12 $ ./mkimage.sh
```

6. 打包 Image

```bash
android12 $ cd rockdev
android12/rockdev $ rm -rf Image
android12/rockdev $ ln -s Image-${PRODUCT_NAME} Image

# 打包成 RK update 格式镜像
android12/rockdev $ ./mkupdate_rk356x.sh

# 打包成 GPT 格式镜像
android12/rockdev $ ./android-gpt.sh
```

## 常见问题
