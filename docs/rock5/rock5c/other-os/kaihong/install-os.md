---
sidebar_position: 2
title: 系统安装
---

# 安装操作系统

本文档将介绍如何把 Kaihong 系统镜像安装到 ROCK 5C。

ROCK 5C 支持 microSD 卡或 eMMC 模块启动，我们将分别介绍两种方式的安装系统的方法。

## 准备工作

- 1x microSD 卡(容量 >=8GB，读写速度等级 >= class10)
- 1x microSD 读卡器
- 5V Type-C 电源适配器 (推荐使用 [瑞莎 PD 30W电源适配器](https://radxa.com/products/accessories/power-pd-30w))

## 镜像下载

访问 [资源下载汇总](../../download) 页面，下载对应的镜像文件。

## 烧入环境准备

使用 eMMC 模块的用户需要安装 RKDevTool，使用SD 卡的用户需要安装 SD_Firmware_Tool。

### 安装驱动

下载 [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip) 并解压 DriverAssistant，然后执行 DriverInstall.exe 并点击 `Install Driver` 按钮来安装驱动。

如果你之前已经安装过其他版本的驱动，请先点击 `Uninstall Driver` 卸载驱动，然后再重新安装。

### 安装 RKDevTool

RKDevTool 是 Rockchip 为 Windows 平台下进行 USB 烧录所开发的软件。如果您的 Windows 主机上没有安装 RKDevTool， 请按照以下步骤进行安装。

请下载并解压以下文件以安装 RKDevTool：

- [RKDevTool v2.96](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96_zh.zip)

解压 `RKDevTool_Release_v2.96_zh.zip` 后，点击 `RKDevTool.exe` 即可使用。

### 安装 SD_Firmware_Tool

`SD_Firmware_Tool` 是瑞芯微为 Windows 平台下进行 microSD 卡烧录所开发的软件。如果您的 Windows 主机上没有安装 `SD_Firmware_Tool`，请按照以下步骤进行安装。

请下载并解压以下文件以安装 `SD_Firmware_Tool`：

- [SD_Firmware_Tool](https://dl.radxa.com/tools/windows/SDDiskTool_cn_v1.74.zip)

解压 `SDDiskTool_cn_v1.74.zip` 后，点击 `SD_Firmware_Tool.exe` 即可使用。

## 镜像烧录

eMMC 模块支持线刷和使用 eMMC 读卡器烧录两种方式。

其中使用 eMMC 读卡器烧录时，安装系统方式与 microSD 卡一致，可以参考烧录镜像到 SD卡。

### 线刷镜像到 eMMC 模块

- 安装 eMMC 模块

将 eMMC 模块安装到主板上，如下图所示。

<img src="/img/rock5c/rock5c_with_emmc_module.webp" alt="emmc module" />

- 进入 Maskrom 模式

通过 Type A 转 Type C 的数据线连接电脑和主板 OTG 端口。按照如下进行短接 Maskrom 引脚，进入 Maskrom 模式。

<img src="/img/rock5c/rock-5c-maskrom.webp" alt="short maskrom" />

<img src="/img/rkdevtool/rkdevtool_maskrom.webp" alt="rkdevtool maskrom" />

- 通过线刷的方式烧入到 eMMC 模块中

<img src="/img/rock5c/burn_emmc_kaihong.webp" alt="burn emmc image" />

### 使用读卡器烧录镜像到 eMMC 模块或 microSD 卡

1. 将 microSD 卡插入到 microSD 读卡器或将 eMMC 模块插入到 eMMC 读卡器
2. 将读卡器连接电脑
3. 使用 `SD_Firmware_Tool` 工具烧录镜像

<img src="/img/rock5c/burn_sd_kaihong.webp" alt="burn sdcard image" />
