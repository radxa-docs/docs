---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用 Cubie A5E 产品。

## 产品实物

| 序号 |       视图       | 序号 |       视图       | 序号 |       视图       |
| :--: | :--------------: | :--: | :--------------: | :--: | :--------------: |
|  ①   | Cubie A5E 正视图 |  ②   | Cubie A5E 背视图 |  ③   | Cubie A5E 侧视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a5e/cubie_a5e_view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

### 硬件准备

您需要提前准备以下硬件设备：**可选的硬件设备建议准备其中一种**

- 主板：瑞莎 Cubie A5E
- 系统启动介质：MicroSD 卡
- 电源适配器：5V Type-C 电源适配器
- USB 串口数据线（可选）：用于串口调试和登录系统
- HDMI 数据线和显示器（可选）：用于显示系统界面和图形化界面操作

Cubie A5E 主板兼容 PD 协议的 5V 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

:::tip 推荐配件

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## 安装系统

您可以根据自己的系统启动介质和拥有的硬件设备，参考下面教程进行系统安装：

- [安装系统到 MicroSD 卡](./install-system/sd_system)（新用户推荐）
- [安装系统到板载 eMMC](./install-system/emmc-system)
- [安装系统到 NVMe SSD](./install-system/nvme-system)

## 启动系统

:::tip
若 Cubie A5E 安装了多个系统启动介质，Cubie A5E 的系统启动优先级为：MicroSD 卡 > NVMe SSD > 板载 eMMC
:::

① : 将对应系统启动介质安装到主板的对应接口：将 MicroSD 卡插入 MicroSD 卡槽

② : 使用 HDMI 数据线连接显示器和主板

③ : 使用 5V Type-C 电源适配器给主板供电

若主板供电正常，主板电源指示灯绿色亮起；若系统启动正常，状态指示灯蓝色闪烁。

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a5e/a5e-quickly-start.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- radxa

用户账号：radxa

用户密码：radxa

## 登录系统

主要介绍 Cubie A5E 搭配 USB 串口数据线登录系统，串口登录系统可以参考 [串口调试](../system-config/uart_debug) 教程。

:::tip
Cubie A5E 搭配显示器使用，整体操作比较直观和简单，这里便不再介绍！
:::

## 使用系统

### 有屏模式

有屏模式是指 Cubie A5E 搭配显示器使用，整体操作比较直观和简单！

可以参考 [有屏模式](./screen-mode) 教程进行操作。

### 无屏模式

无屏模式是指 Cubie A5E 不搭配显示器使用，通过串口或者 SSH 登录系统进行操作！

可以参考 [无屏模式](./headless-mode) 教程进行操作。
