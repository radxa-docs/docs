---
sidebar_position: 4
---

# 底层开发

主要介绍 uboot, kernel, aosp 编译打包等内容

## 环境配置

在 Ubuntu(>=15.04) 上使用OpenJDK

```bash
sudo apt-get update
sudo apt-get install openjdk-8-jdk
```

## 下载 Radxa Android SDK

Radxa Android SDK 包含数百个 Git 仓库，如果不用 repo 逐个下载会非常繁琐。

### Repo

Repo 是 Android 开发中用于管理多个 Git 仓库的工具，它是一个Python脚本，方便开发者对多个 Git 库进行版本控制和管理。

#### 下载 Repo

```bash
$ echo "export REPO_URL='https://storage.googleapis.com/git-repo-downloads/repo'" >> ~/.bashrc
$ source ~/.bashrc
$ curl https://storage.googleapis.com/git-repo-downloads/repo -o /tmp/repo
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
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch RadxaRock5C-userdebug
radxa:rock-android12 $ ./build.sh -UACKup
# get images from IMAGE directory
```

等待编译完成就可以在 IMAGE 目录找到镜像

### 方法二

可以根据这个方法一步一步编译镜像

1. 设置编译项目的环境

```bash
radxa:rock-android12 $ export PRODUCT_NAME="RadxaRock5C"
radxa:rock-android12 $ export PRODUCT_UBOOT_CONFIG="rk3588"
radxa:rock-android12 $ export PRODUCT_KERNEL_CONFIG="rockchip_defconfig android-11.config rock5c.config"
radxa:rock-android12 $ export PRODUCT_KERNEL_DTS="rk3588s-rock-5c"
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
radxa:rock-android12 $ cd kernel-5.10
radxa:rock-android12/kernel-5.10 $ export PATH=../prebuilts/clang/host/linux-x86/clang-r416183b/bin:$PATH
radxa:rock-android12/kernel-5.10 $ alias msk='make CROSS_COMPILE=aarch64-linux-gnu- LLVM=1 LLVM_IAS=1'
radxa:rock-android12/kernel-5.10 $ msk ARCH=arm64 ${PRODUCT_KERNEL_CONFIG}
radxa:rock-android12/kernel-5.10 $ msk ARCH=arm64 BOOT_IMG=../rockdev/Image-${PRODUCT_NAME}/boot.img ${PRODUCT_KERNEL_DTS}.img

radxa:rock-android12 $ cd -
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
```

- 打包成 RK update 格式镜像

```
radxa:rock-android12/rockdev $ ./mkupdate.sh rk3588 Image
```

在 rockdev/ 目录下生成了 update.img

- 打包成 GPT 格式镜像

```
android12/rockdev $ ./android-gpt.sh
```
