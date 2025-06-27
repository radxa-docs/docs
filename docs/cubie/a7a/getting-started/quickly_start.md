---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用 Cubie A7A 开发板。

## 产品实物

<div style={{textAlign: 'center'}}>
   Cubie A7A 正面
   <img src="/img/cubie/a7a/a7a-bottom.webp" style={{width: '50%', maxWidth: '1200px'}} />
   Cubie A7A 背面
    <img src="/img/cubie/a7a/a7a-top.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

## 使用前提

### 硬件准备

您需要提前准备以下硬件设备：

- 开发板：瑞莎 Cubie A7A
- 系统启动介质：支持 MicroSD 卡、eMMC 模块、UFS 模块启动系统（选中其中一种系统启动介质即可）
- 供电/数据线：USB Type A to Type C 数据线
- 电源适配器：5V Type-C 电源适配器
- USB 串口数据线（可选）：用于串口调试和登录系统
- HDMI 数据线和显示器（可选）：用于显示系统界面和图形化界面操作

:::tip
推荐配件：

- [瑞莎 UFS 模块](https://radxa.com/products/accessories/ufs-module)
- [瑞莎 eMMC 模块](https://radxa.com/products/accessories/emmc-module)
- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

### 硬件说明

Cubie A7A 主板支持标准 PD 协议的 5V 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

- 供电/数据线

主要作用是用来给 Cubie A7A 供电和传输数据的，通过 USB Type A to Type C 数据线可以将系统镜像烧录到 eMMC / UFS 模块中。

- 电源适配器

当系统安装成功后，可以使用 Type-C 电源适配器给 Cubie A7A 供电，避免后期开发功率不足的问题。

- USB 串口数据线

主要作用是用于串口调试和登录系统，通过串口调试可以查看系统启动日志，登录系统后可以进行命令行操作，适合开发者调试和开发。

- HDMI 数据线和显示器

主要作用是用于显示系统界面和图形化界面操作，适合初学者使用系统。

## 安装系统

你可以根据自己的系统启动介质，参考下面教程进行系统安装：

- [安装系统到 MicroSD 卡](./install-system/sd_system)
- [安装系统到 eMMC 模块](./install-system/emmc_system)
- [安装系统到 UFS 模块](./install-system/ufs_system)

## 启动系统

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

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- Debian Linux

出厂系统默认存在两个用户账号，分别是 `root` 和 `radxa`。

- root

用户账号：root

用户密码：radxa

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

:::tip
**对于无屏模式的用户，我们提供以下建议助力您快速熟悉系统!**

1. 配置网络

您可以直接给 Cubie A7A 连接网线，让系统处于有网状态。

2. 串口登录

你可以根据 [串口调试](../system-config/uart_debug) 教程进行串口登录系统，获取路由器给 Cubie A7A 分配的 IP 地址，然后通过 SSH 远程登录系统。

注意：若您可以直接登录路由器后台查看 Cubie A7A 的 IP 地址，您可以跳过串口登录的步骤，直接根据分配的 IP 地址，进行 SSH 远程登录系统。

3. SSH 远程

您可以根据 [SSH 远程](../system-config/ssh_remote) 教程完成 SSH 远程登录 Cubie A7A 的命令行界面。

4. VNC 远程

您可以根据 [VNC 远程](../system-config/vnc_remote) 教程完成 VNC 远程登录 Cubie A7A 的图形化界面。
:::
