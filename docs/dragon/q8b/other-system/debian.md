---
sidebar_position: 4
doc_kind: page
---

# 安装 Debian 14

本文介绍如何制作启动 U 盘，并在 Radxa Dragon Q8B 上将 Debian 14 安装到 microSD 卡。

:::caution
安装过程会清除所选目标存储设备上的全部数据。请提前备份重要文件，并仔细确认目标磁盘。
:::

## 下载系统镜像

从 Debian 官网下载 ARM64 版本的 [Debian 14](https://cdimage.debian.org/cdimage/weekly-builds/arm64/iso-dvd/debian-testing-arm64-DVD-1.iso) 系统镜像。

## 制作启动 U 盘

使用 [balenaEtcher](https://etcher.balena.io/) 将下载的系统镜像烧录到 U 盘。工具的安装和使用方法请参考 [Etcher 使用](https://docs.radxa.com/common/radxa-os/install-system/balena-etcher) 教程。

## 修改 BIOS 设置

将启动 U 盘和 microSD 卡安装到主板上，然后接通电源。

### 进入 UEFI 设置主界面

开机时按 `F2` 进入 UEFI 设置，选中 `Radxa Platform Configuration`，按 `Enter` 进入。

<img src="/img/dragon/q8b/debian/01-uefi-main.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 进入平台配置菜单

在 `Configuration Options` 列表中选中 `Third-party OS Compatibility Settings`，按 `Enter` 进入。

<img src="/img/dragon/q8b/debian/02-platform-config.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 启用第三方系统兼容选项

将所有第三方系统兼容选项保持为 `<Enabled>`，完成设置后按 `Esc` 退出并保存。

<img src="/img/dragon/q8b/debian/03-third-party-os.webp" style={{width: '100%', maxWidth: '1200px'}} />

## 安装 Debian 系统

### 文本安装：Install

从安装 U 盘启动后，在 GRUB 菜单中选择 `Install`，按 `Enter` 进入文本模式安装程序。

<img src="/img/dragon/q8b/debian/04-grub-install.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 图形安装：Graphical install

也可选择 `Graphical install`，以图形界面进行安装。本教程后续步骤以图形安装为例，两种模式的安装流程相同。

<img src="/img/dragon/q8b/debian/05-grub-graphical.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择安装语言

在 `Select a language` 列表中选择 `English`，点击 `Continue`。该语言也会成为已安装系统的默认语言。

<img src="/img/dragon/q8b/debian/06-language.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择所在位置

在亚洲列表中选择 `China`，点击 `Continue`。该设置用于确定时区与系统区域。

<img src="/img/dragon/q8b/debian/07-location.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择默认区域

选择 `United States - en_US.UTF-8` 作为英语区域设置，点击 `Continue`。该选项决定字符编码、日期和货币格式。

<img src="/img/dragon/q8b/debian/08-locale.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择键盘布局

选择 `American English`，点击 `Continue`。

<img src="/img/dragon/q8b/debian/09-keyboard.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 检测网络硬件

如果安装程序未自动识别网络设备，保持默认的 `no ethernet card`，点击 `Continue`。

<img src="/img/dragon/q8b/debian/10-network-hardware.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 跳过网络配置

出现 `No network interfaces were detected` 时，点击 `Continue` 跳过。安装可离线完成，网络可在系统安装后配置。

<img src="/img/dragon/q8b/debian/11-no-network.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 设置主机名

填写主机名，例如 `Radxa-SBC`，点击 `Continue`。同一局域网内的主机名不要重复。

<img src="/img/dragon/q8b/debian/12-hostname.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 设置 root 密码

输入 root 密码并再次确认。如果不希望启用 root 直接登录，可以将两项留空，使用下一步创建的普通用户通过 `sudo` 提权。

<img src="/img/dragon/q8b/debian/13-root-password.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 设置新用户全名

填写用户全名，例如 `Radxa`，点击 `Continue`。

<img src="/img/dragon/q8b/debian/14-user-fullname.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 设置新用户密码

输入用户密码并再次确认，点击 `Continue`。

<img src="/img/dragon/q8b/debian/15-user-password.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择分区方式

保持 `Guided - use entire disk`，点击 `Continue`。只有在需要 LVM、加密或自定义分区时才选择其他选项。

<img src="/img/dragon/q8b/debian/16-partitioning-method.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择目标磁盘

选择目标磁盘 `MMC/SD card #1 (mmcblk0) - 62.2 GB`，点击 `Continue`。所选磁盘上的全部数据都会被清除。

<img src="/img/dragon/q8b/debian/17-select-disk.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择分区方案

保持 `All files in one partition (recommended for new users)`，点击 `Continue`。

<img src="/img/dragon/q8b/debian/18-partition-scheme.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 检查分区概览

确认自动生成的 ESP、ext4 根分区和 swap 分区。选择 `Finish partitioning and write changes to disk`，点击 `Continue`。

<img src="/img/dragon/q8b/debian/19-partition-overview.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 确认写入磁盘

选择 `Yes`，点击 `Continue` 开始创建分区并安装系统。

<img src="/img/dragon/q8b/debian/20-write-changes.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 配置网络镜像

本教程使用安装介质离线安装，因此在 `Use a network mirror?` 页面选择 `No`，点击 `Continue`。

<img src="/img/dragon/q8b/debian/21-network-mirror.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择是否参与软件包使用调查

保持默认的 `No`，点击 `Continue`。安装后可通过 `dpkg-reconfigure popularity-contest` 修改该设置。

<img src="/img/dragon/q8b/debian/22-popularity-contest.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择软件

保持勾选 `Debian desktop environment`、`GNOME`、`SSH server` 和 `standard system utilities`。完成选择后点击 `Continue`。

<img src="/img/dragon/q8b/debian/23-software-selection.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 完成安装

安装完成后，先拔出安装 U 盘，再点击 `Continue` 重启；否则设备可能再次从 U 盘进入安装程序。

<img src="/img/dragon/q8b/debian/24-finish-install.webp" style={{width: '100%', maxWidth: '1200px'}} />

## 使用 Debian 系统

### 进入 GNOME 桌面

重启后从 microSD 卡启动。进入 GNOME 桌面后，可通过底部 Dock 打开 Firefox、Files、LibreOffice 等应用。

<img src="/img/dragon/q8b/debian/25-desktop.webp" style={{width: '100%', maxWidth: '1200px'}} />
