---
sidebar_position: 4
---

# 底层开发

主要介绍 uboot, kernel, aosp 编译打包等内容

## 环境配置

为了规避 Android 编译过程中因为环境配置出问题，提高开发效率，我们引入了Docker这一工具。

### Docker

Docker是一个开源的应用容器引擎，可以帮助开发者更有效地构建、部署和管理应用程序。

Dockerfile 是一个构建 Docker 镜像的文本文件，可以根据以下内容构建编译 Android 所需环境。

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

#### 构建Docker镜像

```bash

 radxa$ docker build -t android-builder:11.x --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` $(which-dir-dockerfile-in)

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

 $ repo init -u https://github.com/radxa/manifests.git -b Android11_Radxa_rk12 -m rockchip-s-release.xml
 $ repo sync -d --no-tags -j4

```

## 镜像编译

镜像编译可以使用两种方法

### 方法一 (**推荐**)

使用 SDK 编译脚本方式编译

```bash
  radxa:rock-android11 $ source build/envsetup.sh

  # for Rock 3A
  radxa:rock-android11 $ lunch rk356x_rock_3a_r-userdebug
  # for Rock 3A if you want a box software
  radxa:rock-android11 $ lunch rk356x_rock_3a_box-userdebug

  radxa:rock-android11 $ ./build.sh -UACKup

```

等待编译完成就可以在 IMAGE 目录找到镜像

### 方法二

可以根据这个方法一步一步编译镜像

1. 设置编译项目的环境

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
  radxa:rock-android11 $ cd kernel
  radxa:rock-android11/kernel $ ADDON_ARGS="CC=../prebuilts/clang/host/linux-x86/clang-r383902b/bin/clang LD=../prebuilts/clang/host/linux-x86/clang-r383902b/bin/ld.lld"
  radxa:rock-android11/kernel $ make clean
  radxa:rock-android11/kernel $ make $ADDON_ARGS ARCH=arm64 ${PRODUCT_KERNEL_CONFIG}
  radxa:rock-android11/kernel $ make $ADDON_ARGS ARCH=arm64 ${PRODUCT_KERNEL_DTS}.img -j$(nproc)

  radxa:rock-android11 $ cd -
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
