---
sidebar_position: 1
description: "Windows 下通过 USB 刷机"
---

import Maskrom from "./\_maskrom.mdx"

# Windows 主机

## 文件下载

请到 [资源下载页面汇总](../../../download) 下载对应的 Loader 和 镜像文件

## 安装 RKDevTool

RKDevTool 是 Rockchip 为 Windows 平台下进行 USB 烧录所开发的软件。如果您的 Windows 主机上没有安装 RKDevTool， 请按照以下步骤进行安装。

请下载并解压以下文件以安装 RKDevTool：

- [RKDevTool_Release_v2.86](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.86.zip)

- [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

## 安装驱动

下载并解压 DriverAssistant，然后执行 DriverInstall.exe 并点击 Install Driver 按钮来安装驱动。 如果你之前已经安装过其他版本的驱动，请先点击 Uninstall Driver 卸载驱动，然后再重新安装。

![RK Driver](/img/configuration/RK-Driver-Assistant-Install-Uninstall.webp)

### 安装 RKDevTool

解压 RKDevTool_Release_v2.86.zip 后，点击 RKDevTool.exe 即可使用。

## 进入 Maskrom 模式

<Maskrom/>

## 将系统烧录到 eMMC

- 选择 Loader。

![flash emmc](/img/cm3j/rkdevtools-emmc-1.webp)

- 点击右键添加选项，并将名字改为 Image

![flash emmc](/img/cm3j/rkdevtools-emmc-2.webp)

- 选择你要烧录的系统镜像。（烧录时需要将你下载的镜像解压成 .img 格式）

![flash emmc](/img/cm3j/rkdevtools-emmc-3.webp)

- 点击执行，开始烧录。

![flash emmc](/img/cm3j/rkdevtools-emmc-4.webp)

- 如下图所示表示烧录完成。

![flash emmc](/img/cm3j/rkdevtools-emmc-5.webp)
