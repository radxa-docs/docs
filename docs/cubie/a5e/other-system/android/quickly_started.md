---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用 Cubie A5E 的 Android 系统。

## 产品实物

| 序号 | 视图 | 序号 | 视图 | 序号 | 视图 |
| :--: | :--: | :--: | :--: | :--: | :--: |
| ①    | Cubie A5E 正视图 | ②    | Cubie A5E 背视图 | ③    | Cubie A5E 侧视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a5e/cubie_a5e_view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 安装系统

您可以根据自己的系统启动介质和拥有的硬件设备，参考下面教程进行系统安装：

- [安装系统到 MicroSD 卡](./install-system/sd_system)（新用户推荐）
- [安装系统到板载 eMMC](./install-system/emmc-system)

## 启动系统

:::tip
若 Cubie A5E 安装了多个系统启动介质，Cubie A5E 的系统启动优先级为：MicroSD 卡 > NVMe SSD(暂不支持) > 板载 eMMC
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

主要介绍 Cubie A5E 搭配 USB 串口数据线登录系统，串口登录系统可以参考 [串口调试](./uart_debug) 教程。

:::tip
Cubie A5E 搭配显示器使用，整体操作比较直观和简单，这里便不再介绍！
:::

## 使用系统

### 有屏模式

有屏模式是指 Cubie A7A 搭配显示器使用，整体操作比较直观和简单！

### 无屏模式

无屏模式是指 Cubie A7A 不搭配显示器使用，通过串口调试或者 ADB 调试登录系统进行操作！