---
sidebar_position: 2
title: 系统安装
---

import Etcher from '../../../../common/general/\_etcher.mdx'

本文档将介绍如何把 Android 镜像安装到 ROCK 5 ITX。

ROCK 5 ITX 可以从 microSD 卡启动，也可以从 EMMC 启动，还可以从 SPI-NVME 启动 ，基于不同的启动方式，安装系统到不同的介质上.

# 安装操作系统

在使用 microSD 卡/ eMMC 启动 ROCK 5 ITX 之前，需要擦除 SPI ，步骤如下：

1. 前往 [资源下载汇总](rock5/rock5itx/getting-started/download.md) 下载 Loader 文件到本地

2. 设备进入 maskrom 模式，连接到PC端

- 断开开发板电源
- 移除 SD 卡
- 用 Type-C 转 Type-A USB 线缆连接 Radxa ROCK 5 ITX 的 Type-C 口 和 PC 端
- 按住 maskrom 按键，给开发板上电
- 查看是否有 USB 设备
  - Linux/macOS: 检查执行 lsusb 后是否有显示 "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company"
  - Windows: 打开 RKDevTool 您会看到设备处于 "maskrom mode".

3. 按以下操作擦除 SPI

<Tabs queryString="target">

<TabItem value="windows" label="Windows">

Windows 使用 [rkdeveloptool](/rock5/rock5itx/low-level-dev/rkdeveloptool)
![ROCK 5 ITX erase SPI](/img/rock5itx/rock5itx_erase_spi_zh.webp)

</TabItem>

<TabItem value="linux/mac" label="Linux/Mac">

Linux/Mac 使用 [rkdevtool](/rock5/rock5itx/low-level-dev/rkdevtool)

下载 [zero.img](https://dl.radxa.com/rock5/sw/images/others/zero.img.gz) 并解压，然后执行下面的命令

```bash
rkdeveloptool db rk3588_spl_loader_v1.08.111.bin (需选择步骤 1 中 下载的 loader 文件)
rkdeveloptool wl 0 zero.img
rkdeveloptool rd
```

</TabItem>

</Tabs>

<Tabs queryString="target">

<TabItem value="microsd" label="安装系统到 microSD 卡">

## 准备工作

- 1x microSD 卡(容量 >=16GB，读写速度等级 >= class10)
- 1x microSD 读卡器
- 12V DC 电源

## 镜像下载

请到 [资源下载汇总](rock5/rock5itx/getting-started/download.md) 下载对应的镜像文件

## 安装系统

<Etcher model="rock 5 ITX" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡后，将 microSD 卡插入 ROCK 5 ITX 的 MicroSD 插槽内
- 使用 12V DC 电源为 ROCK 5 ITX 供电

</TabItem>

<TabItem value="emmc" label="安装系统到 eMMC ">

## 准备工作

### 准备安装介质

- Type-C 转 Type-A USB 接口线缆
- 1x eMMC 模块（已板载）
- 12V DC 电源

### 镜像下载

请到 [资源下载汇总](rock5/rock5itx/getting-started/download.md) 下载对应的镜像文件

## 系统安装

1. 将micro usb 线缆连接到主机

2. 进入 maskrom 模式

- 断开开发板电源
- 移除 SD 卡
- 用 Type-C 转 Type-A USB 线缆连接 Radxa ROCK 5 ITX 的 Type-C 口 和 PC 端
- 按住 maskrom 按键，给开发板上电
- 查看是否有 USB 设备
  - Linux/macOS: 检查执行 lsusb 后是否有显示 "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company"
  - Windows: 打开 RKDevTool 您会看到设备处于 "maskrom mode".

<Tabs queryString="target">

<TabItem value="windows" label="Windows">

#### Windows 系统使用 rkdevetool 写入

[rkdeveloptool](/rock5/rock5itx/low-level-dev/rkdeveloptool)

</TabItem>

<TabItem value="linux/mac" label="Linux/mac">

#### Linux/Mac 系统使用 rkdeveloptool 写入

[rkdevtool](/rock5/rock5itx/low-level-dev/rkdevtool)

</TabItem>

</Tabs>

## 系统启动

### 启动 ROCK 5 ITX

- 通过适配器为 ROCK 5 ITX 供电

</TabItem>

<TabItem value="spi_nvme" label="安装系统到 SPI-NVME ">

## 准备工作

- 1x NVME ssd （M.2）
- Type-C 转 Type-A USB 接口线缆
- 12V 电源

## 镜像下载

请到 [资源下载汇总](rock5/rock5itx/getting-started/download.md) 下载对应的镜像文件

## 系统安装

1. 将micro usb 线缆连接到主机

2. 进入 maskrom 模式

- 断开开发板电源
- 移除 SD 卡，将 NVME ssd 插入到 ROCK 5 ITX 的 M.2 插槽内
- 用 Type-C 转 Type-A USB 线缆连接 ROCK 5 ITX 的 Type-C 口 和 PC 端
- 按住 maskrom 按键，给开发板上电
- 查看是否有 USB 设备
  - Linux/macOS: 检查执行 lsusb 后是否有显示 "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company"
  - Windows: 打开 RKDevTool 您会看到设备处于 "maskrom mode".

<Tabs queryString="target">

<TabItem value="windows" label="Windows">

#### Windows 系统使用 rkdevetool 写入

[rkdeveloptool](/rock5/rock5itx/low-level-dev/rkdeveloptool)

</TabItem>

<TabItem value="linux/mac" label="Linux/mac">

#### Linux/Mac 系统使用 rkdeveloptool 写入

[rkdevtool](/rock5/rock5itx/low-level-dev/rkdevtool)

</TabItem>

</Tabs>

## 启动系统

- 使用 12V 电源为 ROCK 5 ITX 供电

</TabItem>

</Tabs>
