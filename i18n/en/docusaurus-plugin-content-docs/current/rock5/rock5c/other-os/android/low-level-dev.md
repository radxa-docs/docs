---
sidebar_position: 4
---

# Low Level Development

Introduces how to build and pack uboot, kernel, aosp and so on.

## Environment configuration

For Ubuntu >= 15.04 ,use Open JDK

```bash
sudo apt-get update
sudo apt-get install openjdk-8-jdk

```

## Download Radxa Android SDK

Radxa Android SDK contains hundreds of Git repositories, and it would be very tedious to download them one by one without repo.

### Repo

Repo is a tool used in Android development to manage multiple Git repositories. It is a Python script that facilitates developers to version control and manage multiple Git libraries.

#### Download Repo

```bash
$ echo "export REPO_URL='https://storage.googleapis.com/git-repo-downloads/repo'" >> ~/.bashrc
$ source ~/.bashrc
$ curl https://storage.googleapis.com/git-repo-downloads/repo -o /tmp/repo
$ sudo cp /tmp/repo /usr/local/bin/repo
$ sudo chmod +x /usr/local/bin/repo
```

#### Code download

```bash
$ repo init -u https://github.com/radxa/manifests.git -b Android12_Radxa_rk14 -m rockchip-s-release.xml
$ repo sync -d --no-tags -j4
```

## Mirror compilation

Mirror compilation can be done using two methods

### Method 1 (**recommended**)

Compile using the SDK compilation script method

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch RadxaRock5C-userdebug
radxa:rock-android12 $ . /build.sh -UACKup
# get images from IMAGE directory
```

Wait for the build to complete and you will find the images in the IMAGE directory.

### Method two

You can compile the image step by step according to this method

1. Set up the environment for compiling the project

```bash
radxa:rock-android12 $ export PRODUCT_NAME="RadxaRock5C"
radxa:rock-android12 $ export PRODUCT_UBOOT_CONFIG="rk3588"
radxa:rock-android12 $ export PRODUCT_KERNEL_CONFIG="rockchip_defconfig android-11.config rock5c.config"
radxa:rock-android12 $ export PRODUCT_KERNEL_DTS="rk3588s-rock-5c"
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
radxa:rock-android12/kernel-5.10 $ msk ARCH=arm64 ${PRODUCT_KERNEL_CONFIG}
radxa:rock-android12/kernel-5.10 $ msk ARCH=arm64 BOOT_IMG=../rockdev/Image-${PRODUCT_NAME}/boot.img ${PRODUCT_KERNEL_DTS}.img

radxa:rock-android12 $ cd -
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
