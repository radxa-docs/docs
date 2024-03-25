---
sidebar_position: 3
---

import Serial from "../../../../common/general/\_serial.mdx"

# 远程登录

本章节旨在向需要通过个人电脑（PC）远程访问 SBC 的用户介绍如何通过串口、adb 等方式进行远程登录

## 串口登录

<Serial platform="rk" />

## Adb 登录

ADB是一个连接 Android 设备与电脑的桥梁，用于在电脑上对 Android 设备进行全面的操作和管理。

### 有线登录

#### 要求

1. 一条USB 线
2. 一台有安装 ADB 工具的电脑或笔记本
3. 一个 Radxa ZERO 3W/E

#### 步骤

1. 用 USB 线连接计算机的 USB 接口和 Radxa ZERO 3W/E 的 OTG Type C 接口
2. 打开计算机终端输入 adb devices 确认识别到 Radxa ZERO 3W/E ，
   输入 adb shell 登录

```bash
$ adb devices
  List of devices attached
  e74a71a469bf207c	device

$ adb shell
  rk356x_radxa_zero3:/ $
```

### 无线登录

Android 11 版本以后支持无线 ADB 。

#### 要求

1. 一台有安装 ADB 工具的电脑或笔记本 ，ADB 版本需要大于 31.0.0
2. 一个Radxa ZERO 3W ，安卓镜像需要大于或等于 11
3. 计算机和 Radxa ZERO 3W 需要在同一个局域网

#### 步骤

1. 启动 Radxa zero 3W，使用 wifi 连接 网络
2. 进入开发着模式，点击7次版本号可进入开发着模式（设置 -> 关于平板电脑 -> 版本号）
3. 进入开发着选项（设置 -> 系统 -> 开发着选项），打开无线调试，记住IP地址和接口(例：10.0.0.16:45613)
4. 打开计算机终端输入 adb connect 10.0.0.16:45613 连接 Radxa ZERO 3W ，输入 adb shell 登录

```bash
$ adb connect 10.0.0.16:45613

$ adb shell
  rk356x_radxa_zero3:/ $

```
