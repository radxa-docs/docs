---
sidebar_position: 1
---

# 快速上手

本节教程目的是为了让大家快速上手使用 Cubie A7A 产品。

## 产品实物

<div style={{textAlign: 'center'}}>
   Cubie A7A 正面
   <img src="/img/cubie/a7a/a7a-bottom.webp" style={{width: '50%', maxWidth: '1200px'}} />
   Cubie A7A 背面
    <img src="/img/cubie/a7a/a7a-top.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

## 使用前提

### 硬件准备

您需要提前准备以下硬件设备：**可选的硬件设备建议准备其中一种**

- 主板：瑞莎 Cubie A7A
- 系统启动介质：MicroSD 卡
- 电源适配器：5V Type-C 电源适配器
- USB 串口数据线（可选）：用于串口调试和登录系统
- HDMI 数据线和显示器（可选）：用于显示系统界面和图形化界面操作

Cubie A7A 主板兼容 PD 协议的 5V 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

:::tip
推荐配件：

- [瑞莎 UFS 模块](https://radxa.com/products/accessories/ufs-module)
- [瑞莎 eMMC 模块](https://radxa.com/products/accessories/emmc-module)
- [瑞莎 eMMC/UFS 二合一模块读卡器](https://radxa.com/products/accessories/emmc-ufs-module-reader)
- [瑞莎 PD 30W 电源适配器 (推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
- [瑞莎散热片适配 Cubie A7A](https://radxa.com/products/accessories/heatsink-6540b)

  :::

:::warning

由于主板散热能力有限，长时间或高负载运行时 SoC 可能过热降频并导致系统不稳定。建议安装合适的散热片以提高散热、保障稳定运行。

:::

## 安装系统

您可以根据自己的系统启动介质和拥有的硬件设备，参考下面教程进行系统安装：

- [安装系统到 MicroSD 卡](./install-system/sd-system)

:::tip 安装系统到其它启动介质
目前支持 MicroSD 卡、eMMC 模块、UFS 模块启动系统。

NVMe SSD：目前正常识别，可作为拓展存储空间，无法作为启动介质。

- [安装系统到 eMMC 模块](./install-system/emmc-system)
- [安装系统到 UFS 模块](./install-system/ufs-system)
- [安装系统到 NVMe SSD](./install-system/nvme-system)
  :::

## 启动系统

:::tip
若 Cubie A7A 安装了多个系统启动介质，Cubie A7A 的系统启动优先级为：MicroSD 卡 > NVMe SSD > UFS 模块 > eMMC 模块。
:::

完成系统的安装后，将对应系统启动介质（如 MicroSD 卡 / eMMC 模块 / UFS 模块 / NVMe SSD）安装到 Cubie A7A 的对应接口。

<Tabs queryString="boot_system">

<TabItem value="MicroSD 卡">

将 MicroSD 卡安装到 Cubie A7A 的 MicroSD 卡槽中。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-microsd.webp" style={{width: '45%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="eMMC 模块">

将 eMMC 模块安装到 Cubie A7A 的 eMMC 和 UFS 模块二合一接口中。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-emmc-single.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="UFS 模块">

将 UFS 模块安装到 Cubie A7A 的 eMMC 和 UFS 模块二合一接口中。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-ufs-single.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="NVMe SSD">

将 PCIe 转 M.2 M Key HAT 扩展板安装到 Cubie A7A 上，然后将 NVMe SSD 安装到 PCIe 转 M.2 M Key HAT 扩展板的 M.2 M Key 接口中。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-nvme.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>
</TabItem>

</Tabs>

安装好系统启动介质后，使用 5V Type-C 电源适配器给 Cubie A7A 供电，即可启动系统。

系统正常启动，电源指示灯绿色亮起，状态指示灯蓝色闪烁。

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- radxa

用户账号：radxa

用户密码：radxa

## 登录系统

主要介绍 Cubie A7A 搭配 USB 串口数据线登录系统，串口登录系统可以参考 [串口调试](../system-config/uart-debug) 教程。

:::tip
Cubie A7A 搭配显示器使用，整体操作比较直观和简单，这里便不再介绍！
:::

## 使用系统

### 有屏模式

有屏模式是指 Cubie A7A 搭配显示器使用，整体操作比较直观和简单！

### 无屏模式

无屏模式是指 Cubie A7A 不搭配显示器使用，通过串口或者 SSH 登录系统进行操作！

**对于无屏模式的用户，我们提供以下建议助力您快速熟悉系统！**

> **配置网络**

您可以直接给 Cubie A7A 连接网线，让系统处于有网状态。

> **串口登录**

您可以根据 [串口调试](../system-config/uart-debug) 教程进行串口登录系统，获取路由器给 Cubie A7A 分配的 IP 地址，然后通过 SSH 远程登录系统。

注意：若您可以直接登录路由器后台查看 Cubie A7A 的 IP 地址，您可以跳过串口登录的步骤，直接根据分配的 IP 地址，进行 SSH 远程登录系统。

> **SSH 远程**

您可以根据 [SSH 远程](../system-config/ssh-remote) 教程完成 SSH 远程登录 Cubie A7A 的命令行界面。

> **VNC 远程**

您可以根据 [VNC 远程](../system-config/vnc-remote) 教程完成 VNC 远程登录 Cubie A7A 的图形化界面。

## 故障排除

### HDMI 堆栈溢出问题

部分用户可能会遇到 HDMI 堆栈溢出错误，导致系统无法正常启动或显示异常。如果遇到以下错误信息：

```
Unhandled Exception in EL3.
x30            = 0x00000000480002b0
x0             = 0x0000000048020a70
x1             = 0x00000000004404ff
```

可以尝试以下解决方法：

1. **使用容量更大的 SD 卡**：某些 SD 卡可能与系统兼容性不佳，建议使用 32GB 或更大容量的高速 SD 卡。

2. **无屏模式首次启动**：首次烧录系统后，不连接 HDMI 显示器，让系统先完成首次启动和初始化。待系统启动完成后再连接 HDMI 显示器。

3. **检查电源供应**：确保使用 5V/3A 或更高规格的 Type-C 电源适配器，电源供应不足可能导致 HDMI 相关电路工作异常。

4. **更新系统镜像**：使用最新版本的系统镜像，旧版本可能包含已知的 HDMI 兼容性问题。

如果以上方法仍无法解决问题，建议通过 [串口调试](../system-config/uart-debug) 方式登录系统获取更多调试信息，或联系技术支持。
