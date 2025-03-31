---
sidebar_position: 4
description: "擦除EMMC"
---

import Images from "../../../\_image.mdx"
import Maskrom from "./\_maskrom.mdx"

# 擦除 EMMC

在某些情况下，您可能需要擦除 E54C 的 EMMC 存储器。这可能是因为系统损坏、需要彻底重置设备或者准备安装新系统。

## 准备工作

<Maskrom/>

## Linux/MacOS 下擦除 EMMC

确保您已经安装了 rkdeveloptool，然后执行以下命令：

```bash
# 列出设备
sudo rkdeveloptool ld

# 初始化设备
sudo rkdeveloptool db /path/to/rk3582_spl_loader_v1.15.113.bin

# 擦除 EMMC
sudo rkdeveloptool ef

# 重启设备
sudo rkdeveloptool rd
```

## Windows 下擦除 EMMC

- 打开 RKDevTool
- 确认设备已被识别为 "Found One MASKROM Device"
- 选择 "高级功能" 选项卡
- 点击 "擦除 Flash" 按钮
- 等待操作完成
- 点击 "重启" 按钮重启设备
