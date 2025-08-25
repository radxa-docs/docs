---
sidebar_position: 2
---

# 快速上手

本节教程目的是为了让大家快速上手使用瑞莎 Dragon Q6A 产品。

## 产品实物

<div style={{textAlign: 'center'}}>
   Dragon Q6A 正面
   <img src="/img/dragon/q6a/q6a_top.webp" style={{width: '75%', maxWidth: '1200px'}} />
   Dragon Q6A 背面
    <img src="/img/dragon/q6a/q6a_bottom.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

## 使用前提

您需要提前准备以下硬件设备：

- 主板：瑞莎 Dragon Q6A
- 系统启动介质：MicroSD 卡
- 电源适配器：12V Type-C 电源适配器（兼容 PD 协议）
- USB 串口数据线（可选）：用于串口调试和登录系统
- HDMI 数据线和显示器（可选）：用于显示系统界面和图形化界面操作

:::tip 推荐配件

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
- 标准 12V Type-C 电源适配器，建议电流 2A
  :::

## 安装系统

您可以根据自己的系统启动介质和拥有的硬件设备，参考下面教程进行系统安装：

- [安装系统到 MicroSD 卡](./install-system/sd_system)
- [安装系统到 U 盘](./install-system/udisk_system)
- [安装系统到 NVMe SSD](./install-system/nvme_system)

:::tip 系统启动说明
默认情况下，系统启动盘为 MicroSD 卡，无需其他操作可以直接启动 MicroSD 卡系统，但是无法直接启动 U 盘或者 NVMe SSD 内的系统。

若您是将系统安装到 U 盘或者 NVMe SSD 上，需要参考 [修改系统启动盘引导选项](./install-system/boot_option) 教程修改系统启动盘引导选项。
:::

## 启动系统

完成系统的安装后，将 MicroSD 卡安装到 Dragon Q6A 的 MicroSD 卡槽中，然后使用 12V Type-C 电源适配器给 Dragon Q6A 供电，即可启动系统。

① : 安装 MicroSD 卡

② : 使用 12V Type-C 电源适配器给 Dragon Q6A 供电

<div style={{textAlign: 'center'}}>
   <img src="/img/dragon/q6a/q6a_boot_system.webp" style={{width: '75%', maxWidth: '1200px'}} />
</div>

系统启动正常后，电源指示灯绿色亮起，状态指示灯蓝色闪烁。

## 系统信息

用户账号：ubuntu

用户密码：radxa

## 登录系统

主要介绍 Dragon Q6A 搭配 USB 串口数据线登录系统，串口登录系统可以参考 [串口调试](../system-config/uart_debug) 教程。

:::tip
Dragon Q6A 搭配显示器使用，整体操作比较直观和简单，这里便不再介绍！
:::

## 使用系统

### 有屏模式

有屏模式是指 Dragon Q6A 搭配显示器使用，整体操作比较直观和简单！

### 无屏模式

无屏模式是指 Dragon Q6A 不搭配显示器使用，通过串口或者 SSH 登录系统进行操作！
