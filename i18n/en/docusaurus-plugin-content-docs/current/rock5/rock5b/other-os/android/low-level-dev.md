---
sidebar_position: 4
---

# Low-Level development

Introduces how to download and build uboot, kernel, os etc.

## Environment configuration

In order to avoid the Android compilation process because of the environment configuration problems, to improve the development efficiency, we introduced the tool Docker.

### Docker

Docker is an open source application container engine that helps developers build, deploy, and manage applications more efficiently.

A Dockerfile is a text file that builds a Docker image, which can be used to build the environment needed to compile Android based on the following.

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

#### Build Docker Image

```bash

 radxa$ docker build -t android-builder:12.x --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` $(which-dir-dockerfile-in)

```

### Repo

Repo is a tool for managing multiple Git repositories in Android development. It is a Python script that facilitates developers to version control and manage multiple Git repositories.

#### Repo download

```bash

 radxa$ docker build -t android-builder:12.x --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` $(which-dir-dockerfile-in)

```

## Source code download

````bash

$ repo init -u git@192.168.2.13:rockchip_android_s/rk3588-manifests.git -b Android12_Radxa_rkr14 -m rockchip-s-local.xml
$ repo sync -d --no-tags -j4

``

## Mirror compilation

Mirror compilation can be done using two methods

### Method 1 (**recommended**)

Compile using the SDK compilation script method

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch RadxaRock5B-userdebug
radxa:rock-android12 $ . /build.sh -UACKup
# get images from IMAGE directory
````

Wait for the build to complete and you will find the images in the IMAGE directory.

### Method two

You can compile the image step by step according to this method

1. Set up the environment for compiling the project

```bash
radxa:rock-android12 $ export PRODUCT_NAME="RadxaRock5B"
radxa:rock-android12 $ export PRODUCT_UBOOT_CONFIG="rk3588"
radxa:rock-android12 $ export PRODUCT_KERNEL_CONFIG="rockchip_defconfig"
radxa:rock-android12 $ export PRODUCT_KERNEL_DTS="rk3588-rock-5b"
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
radxa:rock-android12 $ cd kernel-5.10
radxa:rock-android12/kernel-5.10 $ export PATH=../prebuilts/clang/host/linux-x86/clang-r416183b/bin:$PATH
radxa:rock-android12/kernel-5.10 $ alias msk='make CROSS_COMPILE=aarch64-linux-gnu- LLVM=1 LLVM_IAS=1'
radxa:rock-android12/kernel-5.10 $ msk ARCH=arm64 rockchip_defconfig android-11.config rock5b.config
radxa:rock-android12/kernel-5.10 $ msk ARCH=arm64 BOOT_IMG=../rockdev/Image-RadxaRock5B/boot.img rk3588-rock-5b.img

rk3588-rock-5b.img
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

6. Pack Images

```bash
android12 $ cd rockdev
android12/rockdev $ rm -rf Image
android12/rockdev $ ln -s Image-${PRODUCT_NAME} Image
```

- Packaged as an RK update format image

```
radxa:rock-android12/rockdev $ ./mkupdate.sh rk3588 Image
```

Generated update.img in the rockdev/ directory

- Packaged as a GPT format image

```
android12/rockdev $ ./android-gpt.sh
```

## FAQ
