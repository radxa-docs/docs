---
sidebar_position: 3
description: "Windows 下通过 USB 刷机"
---

import Images from "../../../\_image.mdx"
import Maskrom from "./\_maskrom.mdx"

# Windows主机

## 文件下载

请到 [资源下载页面汇总](../../../download) 下载对应的 Loader 和 镜像文件

说明：

你可以根据自己的需求选择不同的系统镜像，比如 iStoreOS, Debian Cli 等等， 但是 loader 文件是一样的。

## 准备工作

- 下载 [RKDevTool](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96.zip) 工具
- 下载 [DriverAssistant](https://dl.radxa.com/tools/windows/DriverAssitant_v5.1.1.zip) 驱动

## 安装驱动

- 解压 DriverAssistant_v5.1.1.zip
- 运行 DriverInstall.exe
- 点击 "安装驱动"

## 刷机步骤

<Maskrom/>

- 解压 RKDevTool_Release_v2.96.zip
- 运行 RKDevTool.exe
- 在 RKDevTool 中，选择 "高级功能"
- 确认设备已被识别为 "Found One MASKROM Device"
- 在配置文件中选择 "Loader" 文件（rk3582_spl_loader_v1.15.113.bin）
- 在地址 0x00000000 处选择系统镜像文件
- 点击 "执行" 开始刷机
- 等待刷机完成，设备会自动重启

## 设备登录

详情请参考 [快速上手](../../quick-start)
