---
sidebar_position: 4
---

# Low-Level development

Introduces how to download and build uboot, kernel, os etc.

## Environment configuration

Ubuntu 16.04 and above are recommended

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
$ repo init -u https://github.com/radxa/manifests.git -b Android11_Radxa_rk12 -m rockchip-r-release.xml
$ repo sync -d -c -j4
```

## build

Suitable for first compilation

CM3 IO

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch rk356x_rock_3a_r-userdebug
radxa:rock-android12 $ ./build.sh -UACKup
# get images from IMAGE directory
```

Wait for the compilation to complete and you can find the image in the IMAGE directory

### Compile separately

Suitable for compiling after minor modifications

For example, only modify

U-boot

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch rk356x_rock_3a_r-userdebug
radxa:rock-android12 $ ./build.sh -AUup
```

Kernel

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch rk356x_rock_3a_r-userdebug
radxa:rock-android12 $ ./build.sh -ACKup
```

AOSP

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch rk356x_rock_3a_r-userdebug
radxa:rock-android12 $ ./build.sh -Aup
```

Wait for the compilation to complete and you can find the image in the IMAGE directory

## FAQ
