---
sidebar_position: 2
title: 系统安装
---

import Etcher from '../../../../common/general/\_etcher.mdx'

本文档将介绍如何把 Android 镜像安装到 ROCK 5B。

ROCK 5B 可以从 microSD 卡启动，也可以从 EMMC 启动，还可以从 SPI-NVME 启动。基于不同的启动方式，安装系统到不同的介质上。

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

<Etcher model="rock5b" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡后，将 microSD 卡插入 Radxa ROCK 5B 的 MicroSD 插槽内。
- Radxa ROCK 5B 的供电接口为 [USB 2.0 OTG Type C port](/rock5/rock5b/hardware-design/hardware-interface)，请使用 Type-C 线缆连接供电口和适配器。

:::tip
ROCK 5B 支持 9V/2A、12V/2A、15V/2A 和 20V/2A 的 USB Type-C PD 2.0。瑞莎推荐使用 [Radxa Power PD30W](../../accessories/pd-30w)。
:::

</TabItem>

<TabItem value="emmc" label="安装系统到 eMMC ">

## 准备工作

### 准备安装介质

- TypeC 转 TypeA 接口线缆

### 镜像下载

请到 [资源下载汇总](../../getting-started/download) 下载对应的镜像文件

## 系统安装

### 系统安装

1. 进入 maskrom 模式

- 断开开发板电源
- 移除 SD 卡，并扣好 eMMC 模块
- 按住 maskrom 按键
- 用 TypeC 转 TypeA 接口线缆连接 Radxa ROCK 5B 的全功能 TypeC 口和 PC 端 USB 接口
- 松开 maskrom 按键

<img src="/img/rock5b/rock-5b-maskrom-01.webp" alt="ROCK 5B maskrom" width="500" />

- 查看是否有 USB 设备
  - Linux/macOS: 检查执行 lsusb 后是否有显示 "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company"
  - Windows: 打开 RKDevTool 您会看到设备处于 "maskrom mode".
    <img src="/img/rock5b/rock-5b-select-loader-bin.webp" alt="ROCK 5B select loader bin" width="500" />

<Tabs queryString="target">

<TabItem value="linux/mac" label="Linux/mac">

#### Linux/Mac 系统使用 rkdeveloptool 写入

可以参考这个文档：[rkdeveloptool](../../low-level-dev/rkdeveloptool)

</TabItem>

<TabItem value="windows" label="Windows">

#### Windows 系统使用 rkdevetool 写入

可以参考这个文档：[rkdevtool](/rock5/rock5b/low-level-dev/rkdevtool)

## 系统启动

### 启动 ROCK 5B

1. 通过适配器为 ROCK 5B 供电
2. ROCK 5B 将在绿色电源 LED 亮起的情况下启动

</TabItem>
</Tabs>

</TabItem>

<TabItem value="nvme" label="安装系统到 SPI-NVME">

## 准备工作

暂时只能使用 Windows 系统安装

### 准备安装介质

- TypeC 转 TypeA 接口线缆
- 一个 M.2 NVME 固态硬盘
- NVME 转 USB3.0 读卡器或带 NVME 插槽的 PC

### 镜像下载

请到 [资源下载汇总](../../getting-started/download) 下载对应的镜像文件

## 系统安装

### 系统安装

1. 使用 NVME 转 USB3.0 读卡器在电脑上把 M.2 NVME 固态硬盘格式化成 FAT32 格式

2. 按以下步骤让 ROCK 5B 进入 moskrom 模式

- 断开开发板电源
- 移除 SD 卡、eMMC ，并装好 M.2 NVME 固态硬盘
- 按住 maskrom 按键
- 用 TypeC 转 TypeA 接口线缆连接 Radxa ROCK 5B 的全功能 TypeC 口和 PC 端 USB 接口
- 松开 maskrom 按键

3. 使用 rkdevtool 工具烧录

- 查看 ROCK 5B 是否进入 MASKROM 模式
  ![RKDevTool zh maskrom](/img/configuration/rkdevtool-zh-maskrom.webp)

- 在升级固件页面选择固件，然后点击升级
  ![RKDevTool zh spi-nvme](/img/rock5b/Rock5b-rkdevtool-ssd.webp)

## 系统启动

### 启动 ROCK 5B

1. 通过适配器为 ROCK 5B 供电
2. ROCK 5B 将在绿色电源 LED 亮起的情况下启动

</TabItem>
</Tabs>

## 常见问题

问：ROCK 5B 烧录 SPI-NVME 固件后，现在想换成 SD 卡或 eMMC 启动，发现不能启动了

答：由于 SPI-NVME 固件不兼容 SD 卡和 eMMC，需要先擦除 SPI 闪存固件。可以参考[这里擦除](../../low-level-dev/erase-spi-from-usb-otg)

## 参考文档
