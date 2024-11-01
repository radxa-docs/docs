---
sidebar_position: 2
title: 系统安装
---

import Etcher from '../../../../common/general/\_etcherV2.mdx'
import AndroidSSDboot from "../../../../common/dev/\_android-spi-nvme.mdx";
import Erase_spi from "../../../../common/dev/\_android-erase-spi.mdx";

本文档将介绍如何把 Android 镜像安装到 ROCK 5B。

ROCK 5B 可以从 microSD 卡启动，也可以从 EMMC 启动，还可以从 SSD 启动，基于不同的启动方式，安装系统到不同的介质上.

### 清除 SPI Flash

<Erase_spi model="rock5b/5b+" />

<Tabs queryString="target">

<TabItem value="microsd" label="安装系统到 microSD 卡">

# 安装操作系统

## 准备工作

- 1x microSD 卡(容量 >=8GB)
- 1x microSD 读卡器
- 5V 电源适配器 (推荐使用 [Radxa Power PD30W](/accessories/pd_30w))

## 镜像下载

请到 [资源下载汇总](./download) 下载对应的镜像文件

## 安装系统

<Etcher model="rock5b" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡后，将 microSD 卡插入 Radxa ROCK 5B 的 MicroSD 插槽内。
- Radxa ROCK 5B 的供电接口为 [USB 2.0 OTG Type C port](/rock5/rock5b/hardware-design/hardware-interface)，请使用 Type-C 线缆连接供电口和适配器。

:::tip
ROCK 5B 支持 9V/2A、12V/2A、15V/2A 和 20V/2A 的 USB Type-C PD 2.0。瑞莎推荐使用 [Radxa Power PD30W](/accessories/pd_30w)。
:::

## 参考文档

</TabItem>

<TabItem value="emmc" label="安装系统到 eMMC ">

## 准备工作

### 准备安装介质

- micro usb 转 typea usb 接口线缆

### 镜像下载

请到 [资源下载汇总](./download) 下载对应的镜像文件

## 系统安装

### 系统安装

1. 将micro usb 线缆连接到主机

2. 进入 maskrom 模式

- 断开开发板电源
- 移除 SD 卡，并插入 eMMC 模块
- 用 USB A-A 连接 Radxa ROCK 5B 的 USB3.0 口 和 PC 端
- 短接下面引脚
- 给开发板上电
- 摘下右边的黄色跳线帽，保留左边的黄色跳线帽

<img src="/img/rock5b/rock-5b-maskrom-01.webp" alt="ROCK 5B maskrom" width="500" />

- 查看是否有 USB 设备
  - Linux/macOS: 检查执行 lsusb 后是否有显示 "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company"
  - Windows: 打开 RKDevTool 您会看到设备处于 "maskrom mode".
    <img src="/img/rock5b/rock-5b-select-loader-bin.webp" alt="ROCK 5B select loader bin" width="500" />

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

#### Windows 系统使用 rkdevetool 写入

[rkdevtool](/rock5/rock5b/low-level-dev/maskrom/windows)

</TabItem>

</Tabs>

## 系统启动

### 启动 ROCK 5B

1. 通过适配器为 ROCK 5B 供电
2. ROCK 5B 将在绿色电源 LED 亮起的情况下启动

</TabItem>

<TabItem value="ssd" label="安装系统到 Spi Nvme">

<AndroidSSDboot model="rock5b" />

### 启动 ROCK 5B

1. 通过适配器为 ROCK 5B 供电
2. ROCK 5B 将在绿色电源 LED 亮起的情况下启动

</TabItem>
</Tabs>

:::tip
Android 系统在刷机完成后的第一次启动时常相对较长，还请耐心等待
:::

## 常见问题

- 切换 PCIE 存储失败，loader 不支持切换

  1. 检查 SSD 是否插入 Radxa SBC 对应的接口，ROCK 5B+ 仅有一个 M.2 接口支持 SPI-NVME 启动，启动失败可换接口尝试.
  2. 检查 SSD 格式是否为 FAT32 格式.

## 参考文档
