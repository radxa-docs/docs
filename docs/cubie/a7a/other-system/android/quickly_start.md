---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用 Cubie A7A 的 Android 系统。

## 产品实物

<div style={{textAlign: 'center'}}>
   Cubie A7A 正面
   <img src="/img/cubie/a7a/a7a-bottom.webp" style={{width: '50%', maxWidth: '1200px'}} />
   Cubie A7A 背面
    <img src="/img/cubie/a7a/a7a-top.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

## 使用前提

### 硬件准备

您需要提前准备以下硬件设备：**可选的硬件设备可以不准备！**

- 主板：瑞莎 Cubie A7A
- 系统启动介质：支持 MicroSD 卡、eMMC / UFS 模块（选中其中一种系统启动介质即可）
- 供电/数据线：USB Type A to Type C 数据线
- 电源适配器：5V Type-C 电源适配器
- USB 串口数据线（可选）：用于串口调试和登录系统
- HDMI 数据线和显示器（可选）：用于显示系统界面和图形化界面操作

:::tip
推荐配件：

- [瑞莎 UFS 模块](https://radxa.com/products/accessories/ufs-module)
- [瑞莎 eMMC 模块](https://radxa.com/products/accessories/emmc-module)
- [瑞莎 eMMC/UFS 二合一模块读卡器](https://radxa.com/products/accessories/emmc-ufs-module-reader)
- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

### 硬件说明

Cubie A7A 主板支持标准 PD 协议的 5V 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

- 系统启动介质

主要作用是用于启动 Cubie A7A 系统，支持 MicroSD 卡、eMMC / UFS 模块（选中其中一种系统启动介质即可）。

- 供电/数据线

主要作用是给 Cubie A7A 供电和传输数据的，通过 USB Type A to Type C 数据线可以将系统镜像烧录到 eMMC / UFS 模块中。

- 电源适配器

当系统安装成功后，可以使用 Type-C 电源适配器给 Cubie A7A 供电，避免后期开发功率不足的问题。

- USB 串口数据线

主要作用是用于串口调试和登录系统，通过串口调试可以查看系统启动日志，登录系统后可以进行命令行操作，适合开发者调试和开发。

- HDMI 数据线和显示器

主要作用是用于显示系统界面和图形化界面操作，适合初学者使用系统。

## 安装系统

您可以根据自己的系统启动介质和拥有的硬件设备，参考下面教程进行系统安装：

- [安装系统](./install_system)

## 启动系统

:::tip
若 Cubie A7A 安装了多个系统启动介质，Cubie A7A 的系统启动优先级为：MicroSD 卡 > eMMC 或 UFS 模块。
:::

完成系统的安装后，将对应系统启动介质（如 MicroSD 卡、eMMC 模块、UFS 模块）安装到 Cubie A7A 的对应接口。

<Tabs queryString="boot_system">

<TabItem value="MicroSD 卡">

将 MicroSD 卡插入 Cubie A7A 的 MicroSD 卡槽中。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-microsd.webp" style={{width: '45%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="eMMC 模块">

将 eMMC 模块插入 Cubie A7A 的 eMMC 和 UFS 模块二合一接口中。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-emmc-single.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="UFS 模块">

将 UFS 模块插入 Cubie A7A 的 eMMC 和 UFS 模块二合一接口中。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-ufs-single.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
</TabItem>

</Tabs>

安装好系统启动介质后，使用 5V Type-C 电源适配器给 Cubie A7A 供电，即可启动系统。

系统正常启动，电源指示灯绿色亮起，状态指示灯蓝色闪烁。

## 登录系统

主要介绍 Cubie A7A 搭配 USB 串口数据线登录系统，串口登录系统可以参考 [串口调试](./uart_debug) 教程。

:::tip
Cubie A7A 搭配显示器使用，整体操作比较直观和简单，这里便不再介绍！
:::

## 使用系统

### 有屏模式

有屏模式是指 Cubie A7A 搭配显示器使用，整体操作比较直观和简单！

### 无屏模式

无屏模式是指 Cubie A7A 不搭配显示器使用，通过串口调试或者 ADB 调试登录系统进行操作！
