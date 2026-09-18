---
sidebar_position: 5
doc_kind: page
---

# 安装 Fedora 44

本文介绍如何制作启动 U 盘，并在 Radxa Dragon Q8B 上将 Fedora 44 Workstation 安装到 microSD 卡。

:::caution
安装过程会清除所选目标存储设备上的全部数据。请提前备份重要文件，并仔细确认目标磁盘。
:::

## 下载系统镜像

从 Fedora 官网下载 ARM64 版本的 [Fedora 44 Workstation](https://download.fedoraproject.org/pub/fedora/linux/releases/44/Workstation/aarch64/iso/Fedora-Workstation-Live-44-1.7.aarch64.iso) 系统镜像。

## 制作启动 U 盘

使用 [balenaEtcher](https://etcher.balena.io/) 将下载的系统镜像烧录到 U 盘。工具的安装和使用方法请参考 [Etcher 使用](https://docs.radxa.com/common/radxa-os/install-system/balena-etcher) 教程。

## 修改 BIOS 设置

将启动 U 盘和 microSD 卡安装到主板上，然后接通电源。

### 进入 UEFI 设置主界面

开机时按 `F2` 进入 UEFI 设置，选中 `Radxa Platform Configuration`，按 `Enter` 进入。

<img src="/img/dragon/q8b/fedora/01-uefi-main.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 进入平台配置菜单

在 `Configuration Options` 列表中选中 `Third-party OS Compatibility Settings`，按 `Enter` 进入。

<img src="/img/dragon/q8b/fedora/02-platform-config.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 启用第三方系统兼容选项

将所有第三方系统兼容选项保持为 `<Enabled>`。启用 `Ignore unused power domains (PD) for Linux` 后，固件会向 Linux 启动参数追加 `pd_ignore_unused`。完成设置后按 `Esc` 退出并保存。

<img src="/img/dragon/q8b/fedora/03-third-party-os.webp" style={{width: '100%', maxWidth: '1200px'}} />

## 安装 Fedora 系统

### 启动 Fedora Live 系统

从安装 U 盘启动后，在 GRUB 菜单中选择 `Start Fedora-Workstation-Live`，按 `Enter`。如需先检查安装介质完整性，可选择 `Test this media & start Fedora-Workstation-Live`。

<img src="/img/dragon/q8b/fedora/05-grub-fedora-live.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 启动安装程序

Live 桌面加载完成后，在 `Welcome to Fedora Linux` 窗口中点击 `Install Fedora Linux...`。

<img src="/img/dragon/q8b/fedora/06-welcome.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择语言和键盘布局

确认语言为 `English (United States)`、键盘布局为 `us`，点击 `Next`。如需更改，可点击 `Change system keyboard layout`。

<img src="/img/dragon/q8b/fedora/07-language-keyboard.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择目标磁盘和安装方式

确认目标磁盘为 `mmcblk0`，选择 `Use entire disk`，点击 `Next`。此选项会移除目标磁盘上的现有分区和系统。

<img src="/img/dragon/q8b/fedora/08-installation-destination.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 配置磁盘加密

保持 `Encrypt my data` 不勾选，点击 `Next`。只有需要 LUKS 磁盘加密时才启用该选项。

<img src="/img/dragon/q8b/fedora/09-storage-encryption.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 确认并开始安装

核对系统、语言、安装方式和分区信息，勾选 `I understand that all existing data will be erased`，点击 `Erase data and install`。

<img src="/img/dragon/q8b/fedora/10-review-and-install.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 创建文件系统

安装程序正在创建 btrfs 文件系统，无需操作。请勿断电或拔出安装介质。

<img src="/img/dragon/q8b/fedora/11-installing-storage.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 安装软件包

安装程序正在写入软件包，无需操作。

<img src="/img/dragon/q8b/fedora/12-installing-software.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 配置系统

安装程序正在安装引导加载器，无需操作。

<img src="/img/dragon/q8b/fedora/13-system-configuration.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 完成安装配置

安装程序正在生成 initramfs。等待所有阶段完成。

<img src="/img/dragon/q8b/fedora/14-finalization.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 退出安装程序

出现 `Successfully installed` 后，点击 `Exit to live desktop`，随后重启系统。

<img src="/img/dragon/q8b/fedora/15-install-success.webp" style={{width: '100%', maxWidth: '1200px'}} />

## 使用 Fedora 系统

### 开始首次启动设置

重启过程中拔出安装 U 盘，使设备从 microSD 卡启动。进入首次设置向导后，点击 `Start Setup`。

<img src="/img/dragon/q8b/fedora/16-first-boot-setup.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 配置隐私选项

按需设置 `Location Services` 和 `Automatic Problem Reporting`，点击 `Next`。这些选项可在系统设置中再次修改。

<img src="/img/dragon/q8b/fedora/17-privacy.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 选择时区

确认时区为 `CST (UTC+08) / Shanghai`；如需修改，可在 `Search cities` 中搜索其他城市。点击 `Next`。

<img src="/img/dragon/q8b/fedora/18-timezone.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 配置第三方软件源

如需常用应用和部分专有驱动，可点击 `Enable Third-Party Repositories`，随后点击 `Next`；也可以不启用并直接继续。

<img src="/img/dragon/q8b/fedora/19-third-party-repos.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 设置用户信息

填写 `Full Name` 和 `Username`。用户名将用于命名用户主目录，确认后点击 `Next`。

<img src="/img/dragon/q8b/fedora/20-user-info.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 设置账户密码

输入密码并再次确认。如果出现 `This is a weak password`，建议改用更强的密码。点击 `Next`。

<img src="/img/dragon/q8b/fedora/21-user-password.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 完成首次设置

显示 `All done!` 后，点击 `Start Using Fedora Linux`。

<img src="/img/dragon/q8b/fedora/22-setup-done.webp" style={{width: '100%', maxWidth: '1200px'}} />

### 进入 GNOME 桌面

进入 Fedora 44 Workstation 桌面后，可通过底部 Dock 打开 Firefox、Files 等应用。

<img src="/img/dragon/q8b/fedora/23-desktop.webp" style={{width: '100%', maxWidth: '1200px'}} />
