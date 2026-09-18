---
sidebar_position: 1
doc_kind: page
---

# 安装 Armbian 26

Armbian Imager 是 Armbian 官方推出的系统镜像下载与烧录工具，支持在线下载官方镜像，也可以写入本地镜像文件。工具会自动完成镜像下载、解压、写入及数据校验。

:::caution
烧录操作会清除目标存储设备中的全部数据。请提前备份重要文件，并仔细确认目标设备。
:::

## 连接目标设备

将需要烧录的存储设备连接至电脑。

:::tip
Armbian Imager 支持将系统直接烧录到 UFS 模块。将 UFS 模块安装到主板，使主板[进入 EDL 模式](../low-level-dev/edl-mode)，再通过 USB 数据线连接电脑，然后选择对应的 UFS 系统镜像进行烧录。
:::

## 下载 Armbian Imager

访问 [Armbian Imager](https://imager.armbian.com/) 官网，下载与你的操作系统和处理器架构相匹配的版本，并完成安装。

## 使用 Armbian Imager

打开 Armbian Imager，点击 `Start now` 进入设备与镜像选择界面。

<img src="/img/dragon/q8b/armbian/01-start-now.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择厂商

在厂商列表中选择 `Radxa`。

<img src="/img/dragon/q8b/armbian/02-vendor-radxa.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择主板

选择需要安装系统的产品型号，本教程以 `Dragon Q8B` 为例。

:::note
请务必选择与实际硬件一致的型号，以确保镜像及启动配置正确。
:::

<img src="/img/dragon/q8b/armbian/03-board.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择镜像

选择需要安装的 Armbian 系统镜像。本教程以 Armbian Ubuntu 26.04 为例，具体可用版本以软件界面显示为准。

如果烧录目标为 UFS 模块，请选择适用于 UFS 的镜像，其镜像选项通常包含 `UFS` 标识。

<img src="/img/dragon/q8b/armbian/04-image.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择本地镜像（可选）

如果已经下载了系统镜像，可以选择 `Custom Image`，导入本地镜像文件。

选择本地镜像后，无需再选择厂商、主板及在线镜像，可直接进入目标存储设备选择步骤。

<img src="/img/dragon/q8b/armbian/05-custom-image.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择目标存储设备

选择需要写入系统的存储设备，并仔细核对设备名称和容量。

:::caution
所选设备中的原有数据将被全部清除，请勿误选电脑系统盘或其他重要存储设备。
:::

<img src="/img/dragon/q8b/armbian/06-target-device.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 开始烧录

确认镜像和目标设备无误后，点击 `Erase & Flash`。Armbian Imager 将依次下载镜像（使用本地镜像时跳过）、解压镜像、擦除目标设备、写入系统镜像并校验写入数据。

<img src="/img/dragon/q8b/armbian/07-erase-flash.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 完成烧录

出现 `Flash Complete!` 提示后，表示系统镜像已经成功写入并完成校验。

<img src="/img/dragon/q8b/armbian/08-flash-complete.webp" style={{width: '100%', maxWidth: '1200px'}} />

## 使用系统

若通过 EDL 模式将系统镜像烧录至 UFS 模块，烧录完成后，上电即可自动启动系统。

若系统安装在 microSD 卡或 NVMe SSD 中，请先将相应存储介质安装至主板对应插槽，再连接电源适配器，设备将自动启动系统。

### 设置 root 密码

首次启动系统后，根据提示为 root 用户设置密码。

<img src="/img/dragon/q8b/armbian/09-root-password.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择系统终端

选择默认使用的命令行 Shell。

<img src="/img/dragon/q8b/armbian/10-shell.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 设置用户名和密码

根据提示创建普通用户并设置密码。

<img src="/img/dragon/q8b/armbian/11-user-password.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 设置地区和时区

根据所在地区选择语言环境、国家和时区，并确认设置。

<img src="/img/dragon/q8b/armbian/12-locale-select.webp" style={{width: '100%', maxWidth: '1200px'}} />

<img src="/img/dragon/q8b/armbian/13-locale-confirm.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 系统界面

完成系统设置后，会进入 Armbian 系统桌面。

<img src="/img/dragon/q8b/armbian/14-desktop.webp" style={{width: '100%', maxWidth: '1200px'}} />
