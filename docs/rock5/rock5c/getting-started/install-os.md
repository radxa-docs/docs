---
sidebar_position: 2
---

import Etcher from '../../../common/general/\_etcher.mdx'

# 安装操作系统

## 准备工作

- 电源供应

  - ROCK 5C采用Type-C接口供电，输入电压5V。
  - 推荐使用官方的 [Radxa Power PD 30W](../accessories/pd-30w)。

- ROCK 5C 主板

- 大容量存储卡（二选一）：

  - microSD， 大于 8GB （用于从 SD 启动）
  - eMMC Module， 大于8GB， 推荐使用 [Radxa eMMC Module](../accessories/emmc_module) （用于从 eMMC Module 启动）

- 读卡器（二选一）

  - microSD 读卡器（用于从 SD 启动）
  - [eMMC 读卡器](../accessories/emmc_reader)（用于从 eMMC Module 启动）.

- USB 键盘和鼠标

  - ROCK 5C 配备四个 USB-A 接口，可配备全尺寸键盘和鼠标。

- 显示器和 HDMI 线

  - ROCK 5C 配备全尺寸 HDMI 接口，使用支持 HDMI 接口的显示器。

## 镜像下载

请到 [资源下载汇总](../download.md) 下载对应的镜像文件

## 安装系统

<Etcher model="rock5c" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡/eMMC 后，将 microSD/eMMC 卡插入 ROCK 5C 的 MicroSD/eMMC 插槽内。
- ROCK 5C 的供电接口为 [USB Type C port](../hardware-design/hardware-interface)，请使用 Type-C 线缆连接供电口和适配器。

## 登录系统

官方默认创建用户帐号：

```bash
用户名：radxa
密码：  radxa
```

更多信息参考[瑞莎系统](../radxa-os/)

## 参考文档

- [从 USB OTG 口安装操作系统镜像到 eMMC](../low-level-dev/install-os-via-usb-otg)
