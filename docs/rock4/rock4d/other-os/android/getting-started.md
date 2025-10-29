---
sidebar_position: 2
---

# 快速上手

本节教程目的是为了让大家快速上手使用瑞莎 ROCK 4D 的 Android 系统。

## 产品实物

<div style={{textAlign: 'center'}}>
   ROCK 4D 正面
   <img src="/img/rock4/4d/rock4d-top.webp" style={{width: '50%', maxWidth: '1200px'}} />
   ROCK 4D 背面
    <img src="/img/rock4/4d/rock4d-bottom.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

## 使用前提

您需要提前准备以下硬件设备：

- 主板：瑞莎 ROCK 4D
- 系统启动介质：MicroSD 卡
- 供电设备：5V Type-C 电源适配器
- 显示设备：显示器和 HDMI 数据线
- 输入设备：键盘和鼠标（用于图形界面操作）
- 调试工具：USB 串口数据线（用于串口登录）

:::tip 推荐配件

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)

- 标准 Type-C 电源适配器( 5V 电源输入，支持 PD 协议，建议电流 3A 以上)
  :::

## 安装系统

主要介绍安装系统到 MicroSD 卡。

:::warning 重要提醒

**安装系统会完全格式化 MicroSD 卡，所有数据将被永久删除！**

请在操作前确认：

- MicroSD 卡中无重要数据或已完成资料备份
- 选择正确的存储设备，避免格式化其他磁盘

:::

### 硬件连接

将 MicroSD 卡插入 MicroSD 卡读卡器，再将 MicroSD 卡读卡器插入电脑。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/sd-reader.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### 下载系统镜像

请访问 [资源汇总下载](../../download) 页面，下载 **系统镜像**。

:::tip 软件使用

该镜像文件为 `.img.xz` 格式的压缩包，下载后需要先解压，得到 `.img` 格式的镜像文件才能使用。

:::

### 写入系统镜像

使用 Balena Etcher 软件可以将系统镜像安装到 MicroSD 卡中。

:::tip Balena Etcher

对于 Balena Etcher 的安装和使用，可以参考 [Etcher 使用](/common/radxa-os/install-system/balena-etcher) 教程。

:::

#### 选择系统镜像

点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-image.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### 选择存储设备

点击 `Select target` 选项，选择 MicroSD 卡设备。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-sd-01.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-sd-02.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### 开始烧录

点击 `Flash!` 选项，开始烧录系统镜像到 MicroSD 卡中。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-flash.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  等待系统安装完成
  <img
    src="/img/common/radxa-os/install-system/etcher-flashing.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  等待系统校验完成
  <img
    src="/img/common/radxa-os/install-system/etcher-valid.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  成功安装系统镜像后，关闭 Etcher 软件！
  <img
    src="/img/common/radxa-os/install-system/etcher-completed.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 启动系统

完成系统的写入后，将 MicroSD 卡安装到 ROCK 4D 的 MicroSD 卡槽中，然后使用 5V Type-C 电源适配器给 ROCK 4D 供电，即可启动系统。
