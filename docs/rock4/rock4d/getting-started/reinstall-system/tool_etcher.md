---
sidebar_position: 1
---

# 使用工具：Etcher

Etcher 是一个跨平台的开源工具，用于将镜像文件写入存储设备（如 SD 卡、USB 驱动器等）。

它的用户界面简单直观，适合初学者和专业人士使用。

:::tip
该教程主要介绍 Balena Etcher 软件的使用方法，完整的重装系统的步骤可以看以下教程：

- [使用平台：Windows](./platform_windows)
- [使用平台：Linux](./platform_linux)
- [使用平台：MacOS](./platform_macos)

:::

## 1. 下载 Etcher

进入官网下载系统对应平台的软件：[balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

进入下载页面后，选择对应的系统平台进行 Etcher 软件下载。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
Windows 和 Linux 只需要打开对应程序就可以使用，无需安装！
:::

## 2. 使用 Etcher

下载完成后，双击打开 Etcher。

<div style={{textAlign: 'center'}}>
Etcher 界面
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 2.1 下载系统镜像

进入[资源下载汇总](../../download)页面下载对应的操作系统镜像压缩包,下载完成后解压系统镜像压缩包，得到的 `*.img` 后缀文件就是后面安装系统镜像需要的文件。

:::tip
下载的系统镜像是一个压缩文件，需要解压后才能通过镜像烧录软件写入到系统存储设备中。
:::

### 2.2 选择镜像文件

点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 2.3 选择存储设备

点击 `Select target` 选项，选择自己待写入系统镜像对应存储设备。

:::danger
请勿选错存储设备，否则 Etcher 将格式化被选中的存储设备，造成重要数据丢失！

您可以插拔存储设备，观察可选存储设备的变化，从而进一步判断待写入的存储设备。
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ： 选择需要安装系统镜像的存储设备

② ： 点击 `Select 1` 选项确认设备选择

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 2.4 写入系统镜像

点击 `Flash` 选项，等待软件自动进行系统镜像的写入和校验。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统写入完成
  <img src="/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统校验完成
  <img src="/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

成功写入系统镜像后，关闭 Etcher 软件！
