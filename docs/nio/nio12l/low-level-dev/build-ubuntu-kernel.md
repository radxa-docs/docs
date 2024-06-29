---
sidebar_position: 5
---

# 构建 Ubuntu 内核

## 构建准备

需要准备一台 Ubuntu 22.04（Jammy）x86_64 主机。

在主机安装如下包：

```
$ echo "deb-src http://archive.ubuntu.com/ubuntu jammy main" | sudo tee -a /etc/apt/sources.list.d/jammy.list
$ sudo apt-get update
$ sudo apt-get build-dep linux
$ sudo apt-get install git fakeroot libncurses-dev gcc-aarch64-linux-gnu
```

## 获取内核代码

```
$ git clone git@gitlab.com:mediatek-iot-yocto/linux.git -b Ubuntu-mtk-5.15.0-1029.33
$ cd linux
```

## 设置交叉编译环境变量

```
$ export ARCH=arm64
$ export $(dpkg-architecture -aarm64)
$ export CROSS_COMPILE=aarch64-linux-gnu-
```

## 构建内核

```
$ fakeroot debian/rules clean
$ fakeroot debian/rules binary
```

构建完成后，将会得到如下内核包。

```
$ cd ..
$ ls -1 *.deb
linux-buildinfo-5.15.0-1029-mtk_5.15.0-1029.33_arm64.deb
linux-headers-5.15.0-1029-mtk_5.15.0-1029.33_arm64.deb
linux-image-5.15.0-1029-mtk_5.15.0-1029.33_arm64.deb
linux-modules-5.15.0-1029-mtk_5.15.0-1029.33_arm64.deb
linux-mtk-headers-5.15.0-1029_5.15.0-1029.33_all.deb
```

## 参考文档

[定制 Ubuntu 内核](https://mediatek.gitlab.io/genio/doc/ubuntu/customization/customize-kernel.html)
