---
sidebar_position: 10
---

# 开始使用

Radxa X 系列是瑞莎全新推出的基于 X86 平台的单板机系列。

:::warning
Radxa X2L 没有配备 CMOS 电池。首次开机时，BIOS 会初始化硬件设置，红灯亮起。这将持续约 1 分钟，然后 X2L 重新启动，白灯亮起，BIOS 正常启动。如果没有 CMOS 电池（规格 CR1220），上述情况将重复出现。
:::

## 激活板载 eMMC

** 无板载 eMMC 可跳过 **

- 默认状态下 eMMC 不可识别。需要通过 eMMC Recovery Button 激活 eMMC。
- 在开机之前，按住 eMMC Recovery 按钮并保持，然后插入电源开机，直到显示器亮起后即可松开 eMMC Recovery 按钮。
- 此时电源灯为红色，系统下可以识别并能够读写 eMMC 模块

## 安装 OS

### 开始前准备

- Radxa X2L

- 至少 8 GB 的 U 盘

- [rufus](https://rufus.ie/)

- M.2 M Key NVMe SSD 作为系统盘

- Ubuntu 或 Windows 10 iso 文件

- 用来调试和烧录的电脑主机

- 支持 HDMI 接口的显示屏

- 支持 USB 接口的鼠标和键盘

- 支持 PD 协议的电源适配器
  :::tip
  瑞莎推荐使用 [Radxa Power PD30W](/accessories/pd_30w)。
  :::

### ISO 文件刻录至 U 盘

- 下载并安装 Rufus 后，打开程序。随后，将 U 盘插入电脑，然后在 Rufus 设备列表中选择相应的 U 盘。最后，选中要烧录的 ISO 文件，演示 Windows 10 的烧录过程，而 Ubuntu 的烧录方式相同。

![install_rufus](/img/x/x2l/x-rufus.webp)

- 单击 "开始 "后，请耐心等待刻录过程结束。如果刻录不成功，请再次尝试操作或切换到另一个 USB 闪存盘。

### 上电前操作

![Radxa X2L Overview](/img/x/x2l/radxa_x2l_ports.webp)

- 将 NVMe 固态硬盘轻轻插入相应的 M.2 M Key 插槽，并使用 M2 x 4 平头螺钉将其固定到位。

- 将已经完成烧录的 U 盘插入 USB 3.0 接口中。

- 使用 HDMI 线缆将显示屏与主板 HDMI 接口相连接。

- 在 USB 2.0 接口插入鼠标和键盘。

### 安装 OS

- 接通电源并启动 OS，然后按照程序安装 OS。

![install_win1](/img/x/x2l/x-win10_01.webp)

![install_win1](/img/x/x2l/x-win10_02.webp)

![install_win1](/img/x/x2l/x-win10_03.webp)

## [驱动安装](/x/x2l/driver)

## [BIOS 设置](/x/x2l/bios)

## [配件支持](/x/x2l/accessories/)

### [散热片 9010A](/x/x2l/accessories/heatsink-9010a)

### [无线模块](/x/x2l/accessories/wireless-module)

## [硬件信息](/x/x2l/hardware/)

## [软件开发](/x/x2l/software-development)
