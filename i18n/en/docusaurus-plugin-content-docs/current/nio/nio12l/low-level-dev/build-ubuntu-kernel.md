---
sidebar_position: 5
---

# Building the Ubuntu kernel

## Build Preparation

You need to prepare an Ubuntu 22.04 (Jammy) x86_64 host.

Install the following packages on the host:

```
$ echo "deb-src http://archive.ubuntu.com/ubuntu jammy main" | sudo tee -a /etc/apt/sources.list.d/jammy.list
$ sudo apt-get update
$ sudo apt-get build-dep linux
$ sudo apt-get install git fakeroot libncurses-dev gcc-aarch64-linux-gnu
```

## Getting the kernel code

```
$ git clone https://github.com/radxa/kernel.git -b Ubuntu-mtk-5.15.0-1029.33 linux
$ cd linux
```

## Setting cross-compile environment variables

```
$ export ARCH=arm64
$ export $(dpkg-architecture -aarm64)
$ export CROSS_COMPILE=aarch64-linux-gnu-
```

## Build the kernel

```
$ fakeroot debian/rules clean
$ fakeroot debian/rules binary
```

After the build is complete, you will get the following kernel package.

```
$ cd ..
$ ls -1 *.deb
linux-buildinfo-5.15.0-1029-mtk_5.15.0-1029.33_arm64.deb
linux-headers-5.15.0-1029-mtk_5.15.0-1029.33_arm64.deb
linux-image-5.15.0-1029-mtk_5.15.0-1029.33_arm64.deb
linux-modules-5.15.0-1029-mtk_5.15.0-1029.33_arm64.deb
linux-mtk-headers-5.15.0-1029_5.15.0-1029.33_all.deb
```

## Reference document

[Customizing the Ubuntu kernel](https://mediatek.gitlab.io/genio/doc/ubuntu/customization/customize-kernel.html)
