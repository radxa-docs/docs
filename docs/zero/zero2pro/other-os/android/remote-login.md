---
sidebar_position: 3

doc_kind: wrapper
source_of_truth: common
imports_resolve_to:
  - docs/common/general/_serial.mdx
---

import Serial from "../../../../common/general/\_serial.mdx"

# 远程登录

本章节旨在向需要通过个人电脑（PC）远程访问开发板的用户介绍如何通过串口、adb 等方式进行远程登录

## 串口登录

<Serial platform="aml" />

## ADB 登录

ADB 是一个连接 Android 设备与电脑的桥梁，用于在电脑上对 Android 设备进行全面的操作和管理。

### 有线登录

#### 要求

1. 一条 USB 线
2. 一台有安装 ADB 工具的电脑或笔记本
3. 一个 Radxa ZERO

#### 步骤

1. 用 USB 线连接计算机的 USB 接口和 Radxa ZERO 的 OTG Type C 接口
2. 打开计算机终端输入 adb devices 确认识别到 Radxa ZERO ，
   输入 adb shell 登录

```bash
$ adb devices
  List of devices attached
  1234567890      device

$ adb shell
  faraday:/ $
```
