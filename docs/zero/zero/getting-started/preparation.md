---
sidebar_position: 1
---

# 准备工作

## 开发准备

<!-- 下面不需要的设备，可以删除 -->

### 电源

ZERO 采用 Type-C 接口供电，输入电压为 5V，建议使用额定最大电流大于2A的电源适配器。  
推荐使用官方的 [Radxa Power PD 30W](../accessories/pd-30w) 。<img src="/img/accessories/pd-30w.webp" alt="Radxa Power PD 30W" width="300" />

### 启动介质

板载的 eMMC 或 sd卡  
如果开发板没有板载 eMMC（[eMMC 位于开发板背面](../hardware-design/hardware-interface#接口总览)）则需要准备一个至少 8GB 的 sd 卡。  
如果需要安装带有桌面环境的镜像，请使用至少 16GB 的 sd 卡，推荐使用 32GB。

### microSD 读卡器

用于烧录系统镜像。

### 显示器

Radxa ZERO 板载一个 micro HDMI 的视频输出接口，需要使用 micro HDMI 转标准 HDMI 线连接显示器。  
HDMI 的输出分辨率取决于显示器，Radxa ZERO 会根据显示器调整到最佳的显示分辨率。

### 网络连接

ZERO 板载一个 ap6212/ap6256/aw-cm256sm WiFi/BT 模块。

### Type-C Hub

Radxa ZERO 有一个板载 [Type-C USB3.0 接口](../hardware-design/hardware-interface#接口总览)。这个接口支持通过 USB Type-C hub 转出 Type-A 口和有线网(如果 hub 支持)，但是不具备视频输出功能。

### USB 鼠标和键盘

可以通过接在 USB Hub 上的键鼠控制 Radxa ZERO。

## 参考文档

[支持的配件](../accessories)
