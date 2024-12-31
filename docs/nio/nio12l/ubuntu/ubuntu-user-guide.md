---
sidebar_position: 5
---

# Ubuntu 用户指南

## 默认用户名和密码

```
username : ubuntu
password : ubuntu
```

## 访问设备

### 选项一：使用 HDMI 显示器，USB 键盘和鼠标

可以在 HDMI 显示器看到桌面系统。

### 选项二：SSH

SSH 服务默认是使能的。
可以在路由器管理界面查看设备的 IP；或者是通过电脑主机的 [angryip](https://angryip.org/) 来找到设备的 IP。

```
$ ping ip-of-device
$ ssh ubuntu@ip-of-device
```

第一次登陆，会强制让用户修改密码。请按照提示操作。

### 选项三：串口

可以参照 [NIO 12L 串口使用](../low-level-dev/serial)。

## 添加源并安装视频硬件包

```
$ sudo apt-add-repository ppa:mediatek-genio/genio-public
$ sudo apt update
$ sudo apt install mediatek-vpud-genio1200
$ sudo apt install gstreamer1.0-plugins-base
$ sudo apt install gstreamer1.0-plugins-good
$ sudo apt install gstreamer1.0-plugins-bad
$ sudo rm ~/.cache/gstreamer-1.0/registry.aarch64.bin
```

## 更新内核

下载最新的 kernel 包，并安装

```
$ wget https://dl.radxa.com/nio12l/images/ubuntu/radxa-nio-12l-kernel-5.15.0-1029.33-packages.tar.gz
$ tar zxvf radxa-nio-12l-kernel-5.15.0-1029.33-packages.tar.gz
$ sudo dpkg -i radxa-nio-12l-kernel-5.15.0-1029.33-packages/*.deb
```

安装完内核后，需要重启才生效。

## 使用触摸屏 Radxa Display 8HD

### 步骤一：更新内核到最新

最新的内核版本是 5.15.0-1029.33。

### 步骤二：添加 radxa-nio-12l-radxa-display-8hd dt overlay

进入主机中存放 ubuntu 镜像文件的顶层目录。
修改文件 `u-boot-initial-env`。
找到 `list_dtbo=` 行，追加写入 `radxa-nio-12l-radxa-display-8hd.dtbo` 字符串。如：

```
list_dtbo= gpu-mali.dtbo video.dtbo ddr-8g.dtbo radxa-nio-12l-radxa-display-8hd.dtbo
```

### 步骤三：执行命令 `genio-flash board-assets`

```
$ genio-flash board-assets
```

### 步骤四：板子进入下载模式

参照[NIO 12L 进入烧录模式](/nio/nio12l/installation/install-ubuntu-image-on-linux-pc#enter-download-mode)

这样主机将会把新的 `u-boot-initial-env` 更新到设备中。

断电重启设备后，将会看到 8HD 触摸屏显示桌面。

## 安装 QT

安装 qtcreator。

```
$ sudo apt update && sudo apt install -y qtcreator
```
