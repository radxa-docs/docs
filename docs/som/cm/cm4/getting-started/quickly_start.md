---
sidebar_position: 1
---

# 快速上手

主要给大家介绍如何快速上手瑞莎 CM4产品，包括产品实物、使用前提、安装系统等内容。

:::tip 说明
瑞莎 CM4 需要搭配对应的 IO 板或者兼容的底板使用，我们教程以瑞莎 CM4 搭配瑞莎 CM4 IO 板作为产品功能演示。
:::

## 产品实物

我们基于 CM4 搭配 CM4 IO 板进行快速上手演示。

<div style={{textAlign: 'center'}}>
   CM4 搭配 CM4 IO 板 正面
   <img src="/img/cm4/cm4_comb_top.webp" style={{width: '100%', maxWidth: '1200px'}} />
   CM4 搭配 CM4 IO 板 背面
   <img src="/img/cm4/cm4_base_bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

### 硬件准备

您需要提前准备以下硬件设备：可选设备建议选择其中一种，方便快速上手使用产品

- 主板：瑞莎 CM4 搭配 CM4 IO 板
- 系统启动介质：MicroSD 卡
- 电源适配器：标准 DC 12V/2A 电源适配器（DC-5525 接口）
- USB 串口数据线（可选）：用于串口调试和登录系统
- HDMI 数据线和显示器（可选）：用于显示系统界面和图形化界面操作

:::tip 推荐配件
瑞莎 CM4 IO 板仅支持 12V 电源输入，建议电流 2A 及以上，以确保所有外设稳定运行。

- [瑞莎 DC12 36W电源适配器](https://radxa.com/products/accessories/power-dc12-36w)(推荐使用)
- [瑞莎 DC12 60W电源适配器](https://radxa.com/products/accessories/power-dc12-60w)
  :::

## 安装系统

您可以根据自己的系统启动介质和拥有的硬件设备，参考下面教程进行系统安装：

- [安装系统到 MicroSD 卡](./install-system/microsd_boot)(推荐使用)
- [安装系统到板载 eMMC](./install-system/emmc_boot)
- [安装系统到 NVMe SSD](./install-system/nvme_boot)

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统；

- Debian Linux

用户账号：radxa

用户密码：radxa

## 启动系统

完成系统的安装后，你可以将 MicroSD 卡安装到 CM4 IO 板的 MicroSD 卡槽上，然后连接电源适配器启动系统。

:::tip 系统启动优先级
若您在主板上安装了多个系统启动介质，系统启动优先级如下：目前暂不支持 UFS 模块启动系统

MicroSD 卡 > 板载 eMMC > UFS 模块 > NVMe SSD
:::

<div style={{textAlign: 'center'}}>
   <img src="/img/cm4/cm4_boot_sd.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

正常启动系统，瑞莎 CM4 的指示灯在上电会亮绿色，系统正常运行后会熄灭几秒，然后 CM4 IO 板的电源指示灯（红色）亮起，用户指示灯（绿色）和 CM4 的指示灯（绿色）一起闪烁。

## 使用系统

对于无屏模式和有屏模式，我们推荐以下方式帮助你更好上手瑞莎 CM4。

### 无屏模式

#### 使用 SSH 登录系统

您需要使用网线连接主板和路由器，然后通过路由器后台获取主板 IP 地址，通过 SSH 方式登录系统。

注意：使用 SSH 登录系统需要确保设备双方在同一个局域网内。

:::tip 参考教程
您可以参考 [SSH 远程](../system-use/ssh) 教程操作，出厂系统默认开启 SSH 远程服务，你只需要参考登录系统的步骤即可。
:::

#### 使用串口登录系统

您需要使用 USB 串口数据线连接主板和 PC，通过串口方式登录系统。

:::tip 参考教程
您可以参考 [串口调试](../system-use/uart) 教程操作。
:::

### 有屏模式

您可以直接使用 HDMI 数据线连接主板和显示器，通过显示器显示系统界面和图形化界面操作。
