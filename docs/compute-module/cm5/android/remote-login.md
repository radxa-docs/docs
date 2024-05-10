---
sidebar_position: 3
---

import Serial from "../../../common/general/\_serial.mdx"

# 远程登录

本章节旨在向需要通过个人电脑（PC）远程访问 SBC 的用户介绍如何通过串口、adb 等方式进行远程登录

<Tabs queryString="target">

<TabItem value="serial" label="串口登录">

<Serial platform="rk" model="nx5"/>

</TabItem>

<TabItem value="adb" label="adb登录">

ADB（android debugbridge）是你的Android设备和电脑之间的桥梁，用于在电脑上全面操作和管理你的Android设备。

### 准备工作

adb（调试桥）安装：

#### Windows

从Android[官方网站](https://developer.android.google.cn/)下载Windows版本的adb工具包，下载解压后需要配置环境变量:

方式一：在终端窗口输入以下命令：set HTTP_PROXY=myserver:1981

方式二：![CM5 adb](/img/cm5/cm5-install-adb.webp)

#### Linux

使用以下命令安装即可：

```bash
sudo apt install adb
```

#### Mac

从Android[官方网站](https://developer.android.google.cn/)下载Windows版本的adb工具包，下载解压后需要配置环境变量:
打开终端输入一下命令进行环境变量配置：

```bash
export PATH=${path}:~/platform-tools(~代表解压出来的工具包路径)
```

<Tabs queryString="target">

<TabItem value="line_adb" label="有线登录">

#### 要求

1. 一条 USB 线
2. 一台有安装 ADB 工具的电脑或笔记本
3. 一个 Radxa CM5

#### 步骤

1. 启动 Radxa CM5

2. 用 USB 线连接计算机的 USB 接口和 Radxa CM5 的 OTG Type C 接口

![cm5](/img/cm5/cm5io-otg-connect.webp)

3. 打开计算机终端输入 adb devices 确认识别到 Radxa CM5 ,输入 adb shell 登录

```bash
$ adb devices
  List of devices attached
  f94f8e0d28380ceb device

$ adb shell
  RadxaRockCM5:/ $
```

</TabItem>

<TabItem value="wireless_adb" label="无线登录">

Android 11 及以上版本支持 ADB 无线登录。

#### 要求

1. 一台有安装 ADB 工具的电脑或笔记本 ，ADB 版本需要大于 31.0.0
2. 一个Radxa CM5，安卓镜像需要大于或等于 11
3. 计算机和 Radxa CM5 需要在同一个局域网

#### 步骤

1. 启动 Radxa CM5 ，使用 wifi 连接 网络
2. 进入开发着模式，点击7次版本号可进入开发着模式（设置 -> 关于平板电脑 -> 版本号）
3. 进入开发着选项（设置 -> 系统 -> 开发着选项），打开无线调试，记住IP地址和接(例：10.0.0.16:45613)
4. 打开计算机终端输入 adb connect 10.0.0.16:45613 连接 Radxa CM5 ，输入 adb shell 登录

```bash
$ adb connect 10.0.0.16:45613

$ adb shell
  RadxaRockCM5:/ $
```

</TabItem>

</Tabs>

</TabItem>

</Tabs>
