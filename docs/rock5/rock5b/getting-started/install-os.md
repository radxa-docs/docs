---
sidebar_position: 2
---

import Etcher from '../../../common/general/\_etcher.mdx'

# 安装操作系统

## 准备工作

- ROCK 5B 主板

- 大容量存储卡（二选一）：

  - microSD， 大于 8GB （用于从 SD 启动）
  - eMMC Module， 大于8GB， 推荐使用 Radxa eMMC Module （用于从 eMMC Module 启动）
    <img src="/img/accessories/emmc-module.webp" alt="Radxa eMMC Module" width="300" />.

- 读卡器（二选一）

  - microSD 读卡器（用于从 SD 启动）
  - eMMC 读卡器 （用于从 eMMC Module 启动）.

- 电源供应

  - ROCK 5B采用Type-C接口供电，输入电压范围广，从5V到21V。
  - ROCK 5B 支持 9V/2A、12V/2A、15V/2A 和 20V/2A 的 USB Type-C PD 2.0。
  - 您使用的 Type-C 数据线需要支持数据通信。 我们称之为USB Type-C充电数据线。
  - 推荐使用官方的 Radxa Power PD 30W 。<img src="/img/accessories/pd-30w.webp" alt="Radxa Power PD 30W" width="300" />

- USB 键盘和鼠标

  - ROCK 5B 配备四个 USB-A 接口，可配备全尺寸键盘和鼠标。

- 显示器和 HDMI 线

  - ROCK 5B 配备全尺寸 HDMI 接口。 建议使用支持 HDMI 的显示器。
  - HDMI EDID用于确定最佳显示分辨率。 在支持 1080p（或 4K/8K）的显示器和电视上，将选择此分辨率。 如果不支持 1080p，EDID会找到的下一个可用分辨率。 此选定模式适用于大多数显示器/电视，但不适用于所有显示器/电视。

- USB 转 TTL 串口线

  - ROCK 5B 为 CPU 输出一个专用串行控制台，可以访问低级调试消息。
  - 推荐使用Radxa USB to TTL Cable <img src="/img/accessories/usb-ttl.webp" alt="USB to TTL Cable" width="300" />.

## 镜像下载

请到 [资源下载汇总](./download) 下载对应的镜像文件（**推荐使用官方镜像**）

## 安装系统

<Etcher model="rock5b" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡/eMMC 后，将 microSD/eMMC 卡插入 ROCK 5B 的 MicroSD/eMMC 插槽内。
- ROCK 5B 的供电接口为 [USB 2.0 OTG Type C port](../hardware-design/hardware-interface)，请使用 Type-C 线缆连接供电口和适配器。

:::tip
ROCK 5B 支持 9V/2A、12V/2A、15V/2A 和 20V/2A 的 USB Type-C PD 2.0。瑞莎推荐使用 [Radxa Power PD30W](../accessories/pd-30w)。
:::

## 登录系统

官方镜像默认有两个账号：

1. 用户名: radxa 密码: radxa

2. 用户名: rock 密码: rock

更多信息请参考 [RadxaOS](../radxa-os)

## 参考文档

- [从 USB OTG 口安装操作系统镜像到 eMMC](../low-level-dev/install-os-on-emmc-from-usb-otg)
- [安装操作系统镜像到 NVME 固态硬盘上](../low-level-dev/install-os-on-nvme)
