---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用 Cubie A5E 产品。

## 产品实物

| 序号 | 视图 | 序号 | 视图 | 序号 | 视图 |
| :--: | :--: | :--: | :--: | :--: | :--: |
| ①    | Cubie A5E 正视图 | ②    | Cubie A5E 背视图 | ③    | Cubie A5E 侧视图 |

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

① : 将对应系统启动介质安装到 Cubie A5E 的对应接口

② : 使用 5V Type-C 电源适配器给 Cubie A5E 供电

若主板供电正常，主板电源指示灯绿色亮起；若系统启动正常，状态指示灯蓝色闪烁。

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- radxa

用户账号：radxa

用户密码：radxa

## 登录系统

主要介绍 Cubie A7A 搭配 USB 串口数据线登录系统，串口登录系统可以参考 [串口调试](../system-config/uart_debug) 教程。

:::tip
Cubie A7A 搭配显示器使用，整体操作比较直观和简单，这里便不再介绍！
:::

## 使用系统

### 有屏模式

有屏模式是指 Cubie A7A 搭配显示器使用，整体操作比较直观和简单！

### 无屏模式

无屏模式是指 Cubie A7A 不搭配显示器使用，通过串口或者 SSH 登录系统进行操作！

**对于无屏模式的用户，我们提供以下建议助力您快速熟悉系统!**

> **配置网络**

您可以直接给 Cubie A7A 连接网线，让系统处于有网状态。

> **串口登录**

您可以根据 [串口调试](../system-config/uart_debug) 教程进行串口登录系统，获取路由器给 Cubie A7A 分配的 IP 地址，然后通过 SSH 远程登录系统。

注意：若您可以直接登录路由器后台查看 Cubie A7A 的 IP 地址，您可以跳过串口登录的步骤，直接根据分配的 IP 地址，进行 SSH 远程登录系统。

> **SSH 远程**

您可以根据 [SSH 远程](../system-config/ssh_remote) 教程完成 SSH 远程登录 Cubie A7A 的命令行界面。

> **VNC 远程**

您可以根据 [VNC 远程](../system-config/vnc_remote) 教程完成 VNC 远程登录 Cubie A7A 的图形化界面。