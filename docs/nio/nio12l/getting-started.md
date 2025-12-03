---
sidebar_position: 1
---

# 开始使用

## 开始前准备

NIO 12L 包装清单包含以下：

- 一块 NIO 12L 主板
- 3 根 WiFi / BT 天线

你还需要额外的以下设备，来让 NIO 12L 运行：

### 必要项

- 电源

  NIO 12L 采用 Type-C 接口供电，仅支持 5V 输入。建议最低使用 5V/3A 电源适配器，大部分的手机充电器都可以满足。

  :::tip
  瑞莎推荐使用 [Radxa Power PD30W](../../accessories/power/pd_30w)。
  :::

- USB 鼠标和键盘

- 支持 HDMI 或者 USB Type-C 输入的显示器

- HDMI 线或者支持视频信号的 USB Type-C 线

### 可选项

- USB Type-C to Type-A 数据线

  用于将 NIO 12L 镜像的烧录和清除。

- USB 转 TTL 串口线

  用于[串口调试](./low-level-dev/serial)，串口波特率为 921600。

- 摄像头

  NIO 12L 支持 MIPI CSI 摄像头。

- 显示屏

  NIO 12L 支持 MIPI 屏，如 Radxa Display 8HD。

## 上电启动

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NIO 12L 出厂预安装了 Yocto 或 Ubuntu 或安卓。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对于安装了 Yocto 或 Ubuntu 系统的 NIO 12L，接上 Type-C 电源后，按下 Power Button 1秒后系统就会启动。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对于安装了安卓系统的 NIO 12L，接上 Type-C 电源后，按下 Power Button 2秒后系统就会启动。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Type-C 电源(Type-C 5V Only DC Power)** 和 **Power Button** 的位置 参考下面的图

![NIO 12L Overview](/img/nio/nio12l/nio-12l-v131-overview.webp)
