---
sidebar_position: 2
---

import Etcher from '../../../common/general/\_etcher.mdx'

# 安装操作系统

## 准备工作

- ZERO 主板

- 大容量存储设备：

  - microSD， 大于 8GB ，（用于从 SD 启动）

- 读卡器

  - microSD 读卡器（用于从 SD 启动）

- 电源供应

  - ZERO 采用 Type-C 接口供电，输入电压为5V，建议使用额定最大电流大于2A的电源适配器。
  - 推荐使用官方的 [Radxa Power PD 30W](../accessories/power/pd_30w)。<img src="/img/accessories/power/power-pd-30w.webp" alt="Radxa Power PD 30W" width="300" />

- USB 键盘和鼠标

  - ZERO 配备两个 Type-C 接口，可通过 USB Hub 配备全尺寸键盘和鼠标。

- 显示器和 HDMI 线

  - ZERO 配备 micro HDMI 接口。 建议使用支持 HDMI 的显示器。

- USB 转 TTL 串口线

  - ZERO 为 CPU 输出了一个专用串行控制台，可以访问底层调试消息。
  - 推荐使用 Radxa USB to TTL Cable <img src="/img/accessories/usb-ttl.webp" alt="USB to TTL Cable" width="300" />.

## 镜像下载

请到 [资源下载汇总](./download) 下载对应的镜像文件

## 安装系统

<Etcher model="zero" />

## 启动系统

- 按照上述步骤成功烧录 microSD 卡 后，将 microSD 卡插入 ZERO 的 MicroSD 插槽内。
- ZERO 的供电接口为 [USB OTG](../hardware-design/hardware-interface)，请使用 Type-C 线缆连接供电口和适配器。

:::tip
ZERO 支持 5V 电源输入，建议使用额定最大电流大于2A的电源适配器。瑞莎推荐使用 [Radxa Power PD30W](../accessories/power/pd_30w)。
:::

## 参考文档

- [从 USB OTG 口安装操作系统镜像到 eMMC](../low-level-dev/install-os-on-emmc)
