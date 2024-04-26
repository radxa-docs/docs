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
radxa:rock-android12 $ ./build.sh -UACKu
# get images from rockdev directory
```

等待编译完成就可以在 rockdev 目录找到镜像

### 方法二

可以根据这个方法一步一步编译镜像

1. 设置编译项目的环境

```bash
radxa:rock-android12 $ source build/envsetup.sh
radxa:rock-android12 $ lunch RadxaRock5C-userdebug
```

2. 编译 U-boot

```bash
radxa:rock-android12 $ ./build.sh -U
```

3. 编译内核

```bash
radxa:rock-android12 $ ./build.sh -CK
```

4. 编译AOSP

```bash
radxa:rock-android12 $ ./build.sh -A
```

5. 制作 Images

```bash
radxa:rock-android12 $ ./build.sh -u
```
