---
sidebar_position: 2
title: 系统安装
---

import Etcher from '../../../../common/general/\_etcher.mdx'

本文档将介绍如何把 Android 镜像安装到 Rock 3a。

3a 可以从 microSD 卡启动，也可以从 EMMC 启动，基于不同的启动方式，安装系统到不同的介质上.

<Tabs queryString="target">

<TabItem value="microsd" label="安装系统到 microSD 卡">

# 安装操作系统

## 准备工作

- 1x microSD 卡(容量 >=8GB)
- 1x microSD 读卡器
- 5V 电源适配器 (推荐使用 [Radxa Power PD30W](../../accessories/pd-30w))

## 镜像下载

请到 [资源下载汇总](./download) 下载对应的镜像文件

## 安装系统

<Etcher model="rock3a" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡后，将 microSD 卡插入 Radxa ROCK 3A 的 MicroSD 插槽内。
- Radxa ROCK 3A 的供电接口为 [USB 2.0 OTG Type C port](/rock3/rock3a/hardware-design/hardware-interface)，请使用 Type-C 线缆连接供电口和适配器。

:::tip
Radxa ROCK 3A 支持 QC 3.0/2.0 适配器, 9V/2A，12V/1.5A。瑞莎推荐使用 [Radxa Power PD30W](../../accessories/pd-30w)。
:::

## 参考文档

</TabItem>

<TabItem value="emmc" label="安装系统到 eMMC ">

## 准备工作

### 准备安装介质

- micro usb 转 typea usb 接口线缆

### 镜像下载

请到 [资源下载汇总](../../getting-started/download) 下载对应的镜像文件

## 系统安装

### 系统安装

1. 将micro usb 线缆连接到主机

2. 进入 maskrom 模式

- 断开开发板电源
- 移除 SD 卡，并插入 eMMC 模块
- 用 USB A-A 连接 Radxa ROCK 3A 的 USB3.0 口 和 PC 端
- 短接下面引脚
- 给开发板上电
- 摘下右边的黄色跳线帽，保留左边的黄色跳线帽

<img src="/img/rock3/3a/rock3a-maskrom.webp" alt="rock 3a maskrom" width="500" />

- 查看是否有 USB 设备
  _ Linux/macOS: 检查执行 lsusb 后是否有显示 "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company"
  _ Windows: 打开 RKDevTool 您会看到设备处于 "maskrom mode".
  <img src="/img/rock3/3a/rock3a-select-loader-bin.webp" alt="rock 3a select loader bin" width="500" />

<Tabs queryString="target">

<TabItem value="linux/mac" label="Linux/mac">

#### Linux/Mac 系统使用 rkdeveloptool 写入

&emsp;[rkdeveloptool](../../low-level-dev/rkdeveloptool)

</TabItem>

<TabItem value="windows" label="Windows">

#### Windows 系统使用 rkdevetool 写入

&emsp;[rkdevtool](/rock3/rock3a/low-level-dev/rkdevtool)

</TabItem>

</Tabs>

## 系统启动

### 启动 Rock 3a

1. 通过适配器为 Rock 3a 供电
2. Rock 3a 将在绿色电源 LED 亮起的情况下启动

</TabItem>

</Tabs>

## 常见问题

## 参考文档
