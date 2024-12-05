---
sidebar_position: 20
---

# 新手入门

本准备指南旨在帮您了解 ROCK 4C+ 的基本使用准备。
您可以通过主板上的丝印来确认主板的型号和硬件版本。

## 必要项

- 瑞莎 ROCK 4C+ 主板

- microSD 卡，至少 16 GB

- 电源适配器：ROCK 4C+ 仅支持 5V/3A 供电

:::tip
官方推荐使用 [Radxa Power PD 30W](../../../accessories/pd_30w)。
:::

- USB 鼠标键盘

ROCK 4C+ 支持多个 USB 接口，可配备全尺寸键盘和鼠标。

- 显示器 micro HDMI 线

ROCK 4C Plus 配备了两个 micro HDMI 接口，一个最高支持 1440P@60，另一个最高支持 4K@60。建议使用支持 HDMI 的显示器。

:::caution
HDMI 2k、HDMI 4K 和 MIPI DSI 中只有两种可以同时工作。
:::

- MicroSD 卡读卡器

用于将镜像刷写到 microSD 卡。

## 可选项

- eMMC 模块，至少 16 GB

:::tip
官方提供可选 [eMMC 模块](../../../accessories/emmc_module)。
:::

- eMMC 读卡器

:::tip
官方推荐使用 [Radxa eMMC 读卡器](../../../accessories/emmc_reader).
:::

- 以太网线

ROCK 4C+ 支持千兆以太网。
可以用以太网线将 ROCK 4C+ 连接到本地网络和互联网。

- USB Type A 转 Type C 线缆

用于 fastboot/adb 命令和 maskrom 模式通信。

- USB 转 TTL 串口线

该线缆用于 [串口调试](../low-level-dev/serial).

- 摄像头

ROCK 4C+ 支持摄像头功能。

:::tip
官方推荐使用 [Radxa Camera 4K](../../../accessories/camera_4k).
:::

- LCD 屏

ROCK 4C+ 支持 LCD 显示功能。

:::tip
官方推荐使用 [Radxa Display 10 FHD](../../../accessories/lcd-10-fhd)。
:::

- 音频设备

音频支持通过 3.5 毫米插孔的扬声器或耳机播放。

## 系统安装

首先，请从 [ROCK 4 官方镜像下载页](../../official-images)下载 ROCK 4C+ 的官方镜像。  
然后，参照[操作系统安装指南](install-os)安装操作系统。  
最后，将系统存储介质：microSD 卡或 eMMC 模块插入主板上的插口，并通过 Type-C 供电启动 ROCK 4C+。
