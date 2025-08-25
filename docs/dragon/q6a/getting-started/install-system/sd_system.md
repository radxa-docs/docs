---
sidebar_position: 1
---

# 安装系统到 MicroSD 卡

主要介绍如何将系统安装到 MicroSD 卡中。

:::warning
安装系统会格式化 MicroSD 卡，如果有重要数据请提前备份！
:::

## 使用前提

您需要提前准备以下硬件设备：

- MicroSD 卡读卡器
- 系统启动介质：MicroSD 卡

## 下载系统镜像

您可以在 PC 上访问 [资源汇总下载](../../download) 页面下载系统镜像文件。

## 解压系统镜像

下载的系统镜像文件是压缩包，需要解压后才能使用。

## 安装系统镜像

Balena Etcher 是一款开源镜像烧录工具，使用简单，功能强大，支持 Windows、Mac、Linux 系统使用。

### 下载 Balena Etcher

访问 [Balena Etcher 官网](https://www.balena.io/etcher/) 下载 Balena Etcher。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

请根据自己的系统平台和架构下载对应的软件安装包。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 安装 Balena Etcher

下载完成后，可以根据自己的系统平台和架构进行安装。

:::tip

- Windows

下载的文件是 `*.exe` 格式的安装包，双击程序就可以运行。

- Linux

推荐下载 `*.zip` 格式的压缩包，解压后双击程序就可以运行。

- MacOS

根据自己的系统架构下载对应的 `*.dmg` 文件,双击打开后，将软件拖拽到 Applications 文件夹进行安装，安装完成后双击应用图标运行。

:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 使用 Balena Etcher

使用 Balena Etcher 安装系统镜像文件到 MicroSD 卡上。

#### 硬件连接

将 MicroSD 卡安装到读卡器中，然后将读卡器连接到 PC 上。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 选择系统镜像

点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 选择存储设备

点击 `Select target` 选项，选择自己待安装系统镜像对应存储设备。

:::danger
请勿选错存储设备，否则 Etcher 将格式化被选中的存储设备，造成重要数据丢失！

您可以插拔存储设备，观察可选存储设备的变化，从而进一步判断待安装的存储设备。
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ： 选择需要安装系统镜像的存储设备

② ： 点击 `Select 1` 选项确认设备选择

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 安装系统镜像

点击 `Flash` 选项，等待软件自动进行系统镜像的安装和校验。

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

## 上电开机
