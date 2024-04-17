---
sidebar_position: 1
---

# 准备工作

## 开发准备

### 供电

:::tip
ROCK 5B 支持 9V/2A、12V/2A、15V/2A 和 20V/2A 的 USB Type-C PD 2.0。瑞莎推荐使用 [Radxa Power PD30W](../../accessories/pd-30w)。
:::

### 存储

microSD 卡，容量不小于 8GB, 用于系统启动盘

### microSD 读卡器

用于制作系统启动盘

### 显示

带有 HDMI 接口的显示器，ROCK 5B 有两个 HDMI 输出端口，均支持 CEC 和 HDMI 2.1，分辨率最高支持分别为 8Kp60 和 4Kp60，并且其 Type-C 接口也可支持视频输出。  
另外，ROCK 5B 拥有 1 个 HDMI 输入接口，支持 HDMI 2.1 输入，分辨率为 4Kp60。

### 网络连接

ROCK 5B 有以太网口，可以通过以太网接入网络； ROCK 5B 主板正面有一个带 2230 安装孔的 M.2 E Key 连接器，提供 PCIe 2.1 单通道、USB、SATA、SDIO、PCM 和 UART 信号。  
如果你想通过无线模块上网，Radxa 推荐使用 [Radxa Wireless A8](../../accessories/wifi_bt_access.md)。Radxa Wireless A8 的接口规格是 M.2 2230 E 口，安装在 ROCK 5B 的 M.2 E 口然后打开 wifi 网络就可以上网。

### Type-C Hub

用于 USB 口接口扩展，可外接类似 USB 鼠标, USB 键盘等设备

## 常见问题

问：为什么新买的 Radxa A8 wifi 模块不能在 ROCK 5B 安卓系统上使用？

答：因为老固件没有兼容新的 Radxa A8 模块，可以找 Radxa 工作人员提供新固件。

问：为什么我的 Radxa 8HD 屏不能在安卓系统上使用，Radxa 10HD 屏却可以使用？

答：现阶段 ROCK 5B 一个安卓固件只能支持一个 mipi 屏，如果固件不支持您的 mipi 屏，可以找 Radxa 工作人员提供新固件。

其它[常见问题](../../../faq.md)

## 参考文档

[支持的配件](../../accessories)
