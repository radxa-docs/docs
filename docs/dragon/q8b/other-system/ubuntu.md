---
sidebar_position: 3
doc_kind: page
---

# 安装 Ubuntu 26.04

本文介绍如何制作启动 U 盘，并在 Radxa Dragon Q8B 上将 Ubuntu 26.04 安装到 microSD 卡。

:::caution
安装过程会清除所选目标存储设备上的全部数据。请提前备份重要文件，并仔细确认目标磁盘。
:::

## 下载系统镜像

从 Ubuntu 官网下载 ARM64 版本的 [Ubuntu 26.04](https://cdimage.ubuntu.com/ubuntu/releases/resolute/release/ubuntu-26.04-desktop-arm64.iso) 系统镜像。

## 制作启动 U 盘

使用 [balenaEtcher](https://etcher.balena.io/) 将下载的系统镜像烧录到 U 盘。工具的安装和使用方法请参考 [Etcher 使用](https://docs.radxa.com/common/radxa-os/install-system/balena-etcher) 教程。

## 修改 BIOS 设置

将启动 U 盘和 microSD 卡安装到主板上，然后接通电源。

### 进入 UEFI 设置主界面

开机时按 `F2` 进入 UEFI 设置。确认光标停在 `Radxa Platform Configuration` 上，按 `Enter` 进入；使用 `↑` 和 `↓` 移动光标。

<img src="/img/dragon/q8b/ubuntu/01-uefi-main.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 进入平台配置菜单

在 `Configuration Options` 列表中选中 `Third-party OS Compatibility Settings`，按 `Enter` 进入。

<img src="/img/dragon/q8b/ubuntu/02-platform-config.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 启用第三方系统兼容选项

将 `Third-party OS Compatibility Settings` 中的所有兼容选项保持为 `<Enabled>`。其中，启用 `Ignore unused power domains (PD) for Linux` 后，固件会向 Linux 启动参数追加 `pd_ignore_unused`。完成设置后按 `Esc` 退出并保存。

<img src="/img/dragon/q8b/ubuntu/03-third-party-os.webp" style={{width: '100%', maxWidth: '1200px'}} />

## 安装 Ubuntu 系统

### 启动 Ubuntu 安装程序

从安装 U 盘启动后，在 GRUB 菜单中选择 `Try or Install Ubuntu`，按 `Enter` 进入安装程序。

<img src="/img/dragon/q8b/ubuntu/04-grub-menu.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择安装语言

在语言列表中选择 `English`，点击 `Next`。

<img src="/img/dragon/q8b/ubuntu/05-language.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 配置辅助功能

按需调整视觉、听觉、键盘、指针或缩放等辅助选项；无特殊需求时直接点击 `Next`。

<img src="/img/dragon/q8b/ubuntu/06-accessibility.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择键盘布局

保持默认的 `English (US)` 布局，也可以在下方输入框中测试按键。确认后点击 `Next`。

<img src="/img/dragon/q8b/ubuntu/07-keyboard.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 配置网络连接

如果安装程序未检测到网络设备，选择 `Do not connect to the internet`，点击 `Next`。安装可离线完成。

<img src="/img/dragon/q8b/ubuntu/08-network.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择安装 Ubuntu

在 `What do you want to do with Ubuntu?` 页面选择 `Install Ubuntu`，点击 `Next`。只有在需要先试用系统时才选择 `Try Ubuntu`。

<img src="/img/dragon/q8b/ubuntu/09-install-ubuntu.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择交互式安装

保持默认的 `Interactive installation`，点击 `Next`。

<img src="/img/dragon/q8b/ubuntu/10-installation-type.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择应用程序

保持 `Default selection` 可安装浏览器与基础工具；如需 LibreOffice 等办公套件，可选择 `Extended selection`。完成后点击 `Next`。

<img src="/img/dragon/q8b/ubuntu/11-applications.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择是否安装专有软件

按需选择是否安装推荐的第三方驱动与额外媒体格式，然后点击 `Next`。不勾选也不会影响系统正常启动。

<img src="/img/dragon/q8b/ubuntu/12-proprietary-software.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择安装方式

根据是否需要自定义分区，在以下两种安装方式之间切换查看对应步骤。

<Tabs queryString="installation-method">

<TabItem value="manual" label="手动安装" default>

选择 `Manual installation`，点击 `Next`。

<img src="/img/dragon/q8b/ubuntu/13-manual-installation.webp" style={{width: '100%', maxWidth: '1200px'}} />

确认分区布局：FAT32 分区挂载到 `/boot/efi`，ext4 分区挂载到 `/`。安装 U 盘通常显示为 `sda`，不要格式化。`Device for boot loader installation` 必须选择目标磁盘 `mmcblk0`。确认后点击 `Next`。

<img src="/img/dragon/q8b/ubuntu/14-manual-partition.webp" style={{width: '100%', maxWidth: '1200px'}} />

</TabItem>

<TabItem value="erase" label="擦除整盘安装">

选择 `Erase disk and install Ubuntu`，确认目标磁盘为 `mmcblk0`，点击 `Next`。此方式会清除整块目标磁盘并自动创建所需分区。

<img src="/img/dragon/q8b/ubuntu/15-erase-disk.webp" style={{width: '100%', maxWidth: '1200px'}} />

</TabItem>

</Tabs>

### 配置磁盘加密

保持默认的 `No encryption`，点击 `Next`。只有需要开机输入口令解锁磁盘时才选择 `Encrypt with a passphrase`。

<img src="/img/dragon/q8b/ubuntu/16-encryption.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 创建用户账户

填写姓名、用户名和密码，保持勾选 `Require my password to log in`。如出现 `Weak password`，建议改用更强的密码，然后点击 `Next`。

<img src="/img/dragon/q8b/ubuntu/17-create-account.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择时区

确认 `Location` 为 `Shanghai`、`Timezone` 为 `Asia/Shanghai`；也可以在地图上选择或输入其他城市。点击 `Next`。

<img src="/img/dragon/q8b/ubuntu/18-timezone.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 确认并开始安装

核对安装方式、目标磁盘、应用程序、加密与分区信息。确认无误后点击 `Install`。开始安装后，不要断电或拔出安装介质。

<img src="/img/dragon/q8b/ubuntu/19-review-install.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 等待复制文件

安装程序会在后台复制文件。等待进度完成，不需要执行其他操作。

<img src="/img/dragon/q8b/ubuntu/20-copying-files.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 等待系统安装完成

底部显示 `Installing the system…` 时，安装仍在进行。请耐心等待。

<img src="/img/dragon/q8b/ubuntu/21-installing-system.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 重启系统

出现 `Ubuntu 26.04.1 LTS is installed and ready to use` 后，点击 `Restart now`。重启过程中拔出安装 U 盘，使设备从 microSD 卡启动。

<img src="/img/dragon/q8b/ubuntu/22-install-complete.webp" style={{width: '100%', maxWidth: '1200px'}} />

## 使用 Ubuntu 系统

### 进入 Ubuntu 桌面

首次启动完成后进入 GNOME 桌面，可通过左侧 Dock 打开 Firefox、Files 等应用。

<img src="/img/dragon/q8b/ubuntu/23-desktop.webp" style={{width: '100%', maxWidth: '1200px'}} />
