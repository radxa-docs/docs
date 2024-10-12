---
sidebar_position: 2
title: 系统安装
---

import Etcher from '../../../../common/general/\_etcherV2.mdx'
import Rkdevtool from "../../../../common/dev/\_rkdevtoolV3.mdx";
import Rkdeveloptool from "../../../../common/dev/\_rkdeveloptoolV3.mdx";

# 安装操作系统

本文档将介绍如何把 Android 镜像安装到 Rock 3B。

3B 可以从 microSD 卡启动，也可以从 EMMC 启动，还可以从 SSD 启动，基于不同的启动方式，安装系统到不同的介质上.

<Tabs queryString="target">

<TabItem value="microsd/emmc" label="使用对应读卡器安装系统到 microSD / eMMC ">

在使用 microSD 卡/ eMMC 启动 ROCK 3B 之前，需要擦除 SPI ，步骤如下：

1. 前往[资源下载汇总](../../../images.md)下载 Loader 文件到本地

2. 设备进入 maskrom 模式，连接到PC端

- 断开开发板电源
- 移除 SD 卡，eMMC 模块，NVME SSD
- 用 USB 线缆（A-A）连接 Rock 3B 的 USB3.0 口 和 PC 端
- 使用杜邦线短接 Maskrom Key，给开发板上电
- 查看是否有 USB 设备
  - Linux/macOS: 检查执行 lsusb 后是否有显示 "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company"
  - Windows: 打开 RKDevTool 您会看到设备处于 "maskrom mode".
- 拔掉短接的杜邦线

3. 按以下操作擦除 SPI

<Tabs queryString="target">

<TabItem value="windows" label="Windows">

Windows 使用 rkdevtool 工具进行操作
![ROCK 3B erase SPI](/img/rock5itx/rock5itx_erase_spi_zh.webp)

</TabItem>

<TabItem value="linux/mac" label="Linux/Mac">

Linux/Mac 使用 rkdeveloptool 工具进行操作

```bash
dd if=/dev/zero of=zero.img bs=16M count=1
rkdeveloptool db rk3588_spl_loader_v1.15.113.bin (需选择步骤 1 中 下载的 loader 文件)
rkdeveloptool wl 0 zero.img
rkdeveloptool rd
```

</TabItem>

</Tabs>

## 准备工作

- 1x microSD 卡/ eMMC (容量 >=8GB)
- 1x microSD / eMMC 读卡器
- 5V 电源适配器 (推荐使用 [Radxa Power PD30W](../../accessories/pd-30w))

## 镜像下载

请到 [资源下载汇总](../../../images.md) 下载对应的镜像文件

## 安装系统

<Etcher model="rock3b" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡/ eMMC 后，插入 Radxa ROCK 3B 的对应插槽内。
- ROCK 3B 的供电接口为 [USB 2.0 OTG Type C port](/rock3/rock3b/hardware-design/hardware-interface.md)，请使用 Type-C 线缆连接供电口和适配器。

:::tip
Radxa ROCK 3B 支持 QC 3.0/2.0 适配器, 9V/2A，12V/1.5A。瑞莎推荐使用 [Radxa Power PD30W](../../../../accessories/pd_30w.md)。
:::

## 参考文档

</TabItem>

<TabItem value="spi_nvme" label="安装系统到 SPI-NVME ">

## 准备工作

- 1x NVME ssd （M.2）
- 5V 电源适配器 (推荐使用 [Radxa Power PD30W](../../accessories/pd-30w))

## 镜像下载

请到 [资源下载汇总](../../../images.md) 下载对应的镜像文件

## 系统安装

### 系统安装

1. 将 usb 线缆连接到主机
2. 进入 maskrom 模式

- 断开开发板电源
- 移除 SD 卡和 eMMC 模块,插入 NVME SSD
- 用 USB A-A 连接 Radxa ROCK 3B 的 USB3.0 口 和 PC 端
- 使用杜邦线短接 Maskrom Key，给开发板上电
- 给开发板上电
- 查看是否有 USB 设备
  _ Linux/macOS: 检查执行 lsusb 后是否有显示 "Bus 001 Device 112: ID 2207:350a Fuzhou Rockchip Electronics Company"
  _ Windows: 打开 RKDevTool 您会看到设备处于 "maskrom mode".
- 取下短接 Maskrom Key 的杜邦线

<Tabs queryString="target">

<TabItem value="linux" label="Linux">

<Rkdeveloptool platform="linux">
</Rkdeveloptool>

</TabItem>

<TabItem value="mac" label="mac">

<Rkdeveloptool platform="macos">
</Rkdeveloptool>

</TabItem>

<TabItem value="windows" label="Windows">

### 安装 RKDevTool

RKDevTool 是 Rockchip 为 Windows 平台下进行 USB 烧录所开发的软件。如果您的 Windows 主机上没有安装 RKDevTool， 请按照以下步骤进行安装。

请下载并解压以下文件以安装 RKDevTool：

- [RKDevTool v2.96](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96_zh.zip) (含中文使用文档)
- [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

### 安装驱动

下载并解压 DriverAssistant，然后执行 DriverInstall.exe 并点击 `Install Driver` 按钮来安装驱动。
如果你之前已经安装过其他版本的驱动，请先点击 `Uninstall Driver` 卸载驱动，然后再重新安装。

![RK Driver](/img/configuration/RK-Driver-Assistant-Install-Uninstall.webp)

### 安装 RKDevTool

解压 RKDevTool_Release_v2.96_zh.zip 后，点击 RKDevTool.exe 即可使用。

### 进入 Maskrom 模式

### 按照以下操作烧入镜像

![RK Android update](/img/rock5itx/rock5itx_android_update_zh.webp)

</TabItem>

</Tabs>

## 系统启动

### 启动 Rock 3B

1. 通过适配器为 Rock 3B 供电
2. Rock 3B 将在绿色电源 LED 亮起的情况下启动

</TabItem>

</Tabs>

## 常见问题

## 参考文档
