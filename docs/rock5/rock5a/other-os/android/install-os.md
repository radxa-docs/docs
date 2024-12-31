---
sidebar_position: 2
title: 系统安装
---

import Etcher from '../../../../common/general/\_etcherV2.mdx'

本文档将介绍如何把 Android 镜像安装到 ROCK 5C。

ROCK 5A 可以从 microSD 卡启动，也可以从 EMMC 启动，基于不同的启动方式，安装系统到不同的介质上.

<Tabs queryString="target">

<TabItem value="microsd" label="安装系统到 microSD 卡">

#### 准备工作

- 1x microSD 卡(容量 >=16GB，读写速度等级 >= class10)
- 1x microSD 读卡器
- 5V 电源适配器 (推荐使用 [Radxa Power PD30W](../../accessories/pd-30w))

#### 镜像下载

请到 [资源下载汇总](../../download) 下载对应的镜像文件并解压

#### 安装系统

<Etcher model="rock5a" />

#### 启动系统

- 按照上述步骤成功烧录 microSD 卡后，将 microSD 卡插入 ROCK 5A 的 MicroSD 插槽内。
- ROCK 5A 的供电接口为 [Type C port](../../hardware-design/hardware-interface)，请使用 Type-C 线缆连接供电口和适配器。

</TabItem>

<TabItem value="emmc" label="安装系统到 eMMC ">

#### 准备工作

- USB 接口线缆(A-A)
- 1x eMMC 模块
- 5V 电源适配器 (推荐使用 [Radxa Power PD30W](../../accessories/pd-30w))

#### 镜像下载

请到 [资源下载汇总](../../download) 下载对应的镜像文件并解压

#### 系统安装

进入 maskrom 模式

- 断开开发板电源
- 移除 SD 卡，并插入 EMMC 模块
- 用 USB A-A 连接 Radxa ROCK 5A 的 USB3.0 口 和 PC 端
- 使用杜邦线短接 Maskrom Key
- 给开发板上电
- PC 端查看是否有 USB 设备
  - Linux/macOS: 检查执行 lsusb 后是否有显示 "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company"
  - Windows: 打开 RKDevTool 您会看到设备处于 "maskrom mode".

<Tabs queryString="target">

<TabItem value="linux" label="Linux">

#### Linux 系统使用 rkdeveloptool 写入

[rkdeveloptool](../../low-level-dev/maskrom/linux)

</TabItem>

<TabItem value="mac" label="Mac">

#### Mac 系统使用 rkdeveloptool 写入

[rkdeveloptool](../../low-level-dev/maskrom/mac-os)

</TabItem>

<TabItem value="windows" label="Windows">

#### Windows 系统使用 rkdevtool 写入

[rkdevtool](../../low-level-dev/maskrom/windows)

</TabItem>

</Tabs>

#### 启动 ROCK 5A

1. 通过适配器为 ROCK 5A 供电
2. ROCK 5A 将绿色电源 LED 亮起的情况下启动，启动成功后蓝色 LED 闪烁

</TabItem>

</Tabs>
