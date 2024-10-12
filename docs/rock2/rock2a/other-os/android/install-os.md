---
sidebar_position: 2
title: 系统安装
---

import Etcher from '../../../../common/general/\_etcherV2.mdx'
import Rkdevtool from "../../../../common/dev/\_rkdevtoolV3.mdx";
import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV3.mdx";

# 安装操作系统

本文档将介绍如何把 Android 镜像安装到 ROCK 2A。

ROCK 2A 可以从 microSD 卡启动，也可以从 EMMC 启动，基于不同的启动方式，安装系统到不同的介质上.

<Tabs queryString="target">

<TabItem value="microsd" label="安装系统到 microSD 卡">

## 准备工作

- 1x microSD 卡(容量 >=16GB，读写速度等级 >= class10)
- 1x microSD 读卡器
- 5V 电源适配器 (推荐使用 [Radxa Power PD30W](../../../../accessories/pd_30w.md))

## 镜像下载

请到 [资源下载汇总](../../download) 下载对应的镜像文件

## 安装系统

<Etcher model="rock2a" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡后，将 microSD 卡插入 ROCK 2A 的 MicroSD 插槽内。
- ROCK 2A 的供电接口为 [Type C port](../../hardware-design/hardware-interface.md)，请使用 Type-C 线缆连接供电口和适配器。

</TabItem>

<TabItem value="emmc" label="安装系统到 eMMC ">

## 准备工作

### 准备安装介质

- USB 接口线缆(A-A)
- 1x 带有 eMMC 的 ROCK 2A
- 5V 电源适配器 (推荐使用 [Radxa Power PD30W](../../../../accessories/pd_30w.md))

### 镜像下载

请到 [资源下载汇总](../../download) 下载对应的镜像文件

## 系统安装

进入 maskrom 模式

- 断开开发板电源
- 移除 SD-card
- 用 USB A-A 连接 ROCK 2A 的 USB3.0 口 和 PC 端
- 按住 Maskrom 按键
- 给开发板上电
- PC 端查看是否有 USB 设备
  - Linux/macOS: 检查执行 lsusb 后是否有显示 "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company"
  - Windows: 打开 RKDevTool 您会看到设备处于 "maskrom mode".

<Tabs queryString="target">

<TabItem value="linux" label="Linux">

<Rkdeveloptool platform="linux">
</Rkdeveloptool>

</TabItem>

<TabItem value="mac" label="Mac">

<Rkdeveloptool platform="macos">
</Rkdeveloptool>

</TabItem>

<TabItem value="windows" label="Windows">

#### 安装 RKDevTool

RKDevTool 是 Rockchip 为 Windows 平台下进行 USB 烧录所开发的软件。如果您的 Windows 主机上没有安装 RKDevTool， 请按照以下步骤进行安装。

请下载并解压以下文件以安装 RKDevTool：

- [RKDevTool v2.96](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96_zh.zip) (含中文使用文档)
- [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

#### 安装驱动

下载并解压 DriverAssistant，然后执行 DriverInstall.exe 并点击 `Install Driver` 按钮来安装驱动。
如果你之前已经安装过其他版本的驱动，请先点击 `Uninstall Driver` 卸载驱动，然后再重新安装。

![RK Driver](/img/configuration/RK-Driver-Assistant-Install-Uninstall.webp)

#### 安装 RKDevTool

解压 RKDevTool_Release_v2.96_zh.zip 后，点击 RKDevTool.exe 即可使用。

#### 进入 Maskrom 模式

#### 按照以下操作烧入镜像

![RK Android update](/img/rock5itx/rock5itx_android_update_zh.webp)

</TabItem>

</Tabs>

## 系统启动

### 启动 ROCK 2A

1. 通过适配器为 ROCK 2A 供电
2. ROCK 2A 将绿色电源 LED 亮起的情况下启动

</TabItem>

</Tabs>
