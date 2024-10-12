---
sidebar_position: 4
---

# Low-Level development

Introduces how to download and build uboot, kernel, os etc.

## Environment configuration

Install the following resource packs

```bash

apt-get update -y && apt-get install -y openjdk-8-jdk python git-core gnupg flex bison gperf build-essential \
zip curl liblz4-tool zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
libgl1-mesa-dev libxml2-utils xsltproc unzip mtools u-boot-tools \
htop iotop sysstat iftop pigz bc device-tree-compiler lunzip \
dosfstools vim-common parted udev libssl-dev python3 python-pip lzop swig

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

$ repo init -u https://github.com/radxa/manifests.git -b Android11_Radxa_rk12 -m rockchip-r-release.xml
$ repo sync -d --no-tags -j4

```

## build

### Use all-in-one build script

```bash
radxa:rock-android11 $ source build/envsetup.sh

# for Rock 3B
radxa:rock-android11 $ lunch rk356x_rock_3b_r-userdebug

radxa:rock-android11 $ ./build.sh -UACKup
```

### Step by step Build

If you dont' want to use "Use all-in-one build script", you can follow this way to build image step by step.

1. Set up the environment for compiling the project

```bash
radxa:rock-android11 $ source build/envsetup.sh

# for Rock 3B
radxa:rock-android11 $ lunch rk356x_rock_3b_r-userdebug
```

2. Compile U-boot

```bash
radxa:rock-android11 $ . /build.sh -U
```

3. Compile the kernel

```bash
radxa:rock-android11 $ . /build.sh -CK
```

4. Compile AOSP

```bash
radxa:rock-android11 $ . /build.sh -A
```

5. Make Images

```bash
radxa:rock-android11 $ . /build.sh -u
```

## FAQ
