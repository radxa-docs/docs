---
sidebar_position: 1
---

# Debian 13

本文介绍如何在 **Radxa Orion O6 / Orion O6N** 上使用 **Debian 13 (trixie)**，并通过 CIX 提供的社区软件源安装开源驱动方案。

:::warning 适用范围

- 本文档仅适用于 **Debian 13 (trixie)**
- 本方案面向内核开发、驱动验证和社区尝鲜用户
- 如需稳定的日常使用或生产部署，建议优先使用瑞莎官方系统镜像；如需 CIX 的稳定驱动方案，请参考其闭源驱动分支（内核 6.6）

:::

## 方案说明

CIX 的开源驱动方案基于主线开发内核，核心内容包括：

- `linux-image-7.0.0-rc5-generic`
- `linux-headers-7.0.0-rc5-generic`
- `cix-npu-driver-dkms`
- `cix-vpu-driver-dkms`

与整盘 DD 镜像相比，这种方式可以直接通过 `apt` 管理安装、更新和卸载，更适合开发调试场景。

## 前置准备

开始前请确认：

- 已将设备 BIOS 更新到较新版本：
  - Orion O6：请参考 [BIOS 更新](../low-level-dev/bios.md)
  - Orion O6N：请参考 [Orion O6N BIOS 更新](../../o6n/low-level-dev/bios.md)
- 已准备一个容量不小于 8GB 的 U 盘
- 已准备一台可用于下载镜像并写入 U 盘的电脑
- 当前用户具备 `sudo` 权限

:::warning BIOS 必选配置

刷写 BIOS 完成后，请手动进入 BIOS 开启以下选项，否则 `7.0` 内核下部分驱动可能加载失败：

`Device Manager` -> `Platform Configuration` -> `Compliance Configuration` -> `Enable ACPI SCMI`

:::

## 安装 Debian 13

### 1. 下载 Debian 13 安装镜像

请下载 **Debian 13 arm64** 安装镜像。若希望直接安装桌面系统，建议选择带 GNOME 的安装镜像；如果选择 `netinst`，也可以在安装过程中手动选择 GNOME 桌面环境。

可参考以下镜像目录：

- Debian 官方：<https://cdimage.debian.org/debian-cd/current/arm64/>
- 清华大学：<https://mirrors.tuna.tsinghua.edu.cn/debian-cd/current/arm64/>
- 中国科学技术大学：<https://mirrors.ustc.edu.cn/debian-cd/current/arm64/>
- 阿里云：<https://mirrors.aliyun.com/debian-cd/current/arm64/>

### 2. 将镜像写入 U 盘

将下载好的 Debian 13 安装镜像写入 U 盘。可以使用以下任意工具：

- Balena Etcher
- Rufus
- `dd`

### 3. 从 U 盘启动并安装系统

将 U 盘插入设备后，从 BIOS 启动菜单选择 U 盘启动，并按照 Debian 安装程序提示完成系统安装。

安装目标介质建议如下：

- Orion O6：安装到 NVMe SSD
- Orion O6N：安装到 NVMe SSD 或 UFS 模块

### 4. 首次进入系统

安装完成后，进入 Debian 13 系统并确认：

- 系统可以正常联网
- 当前用户具备 `sudo` 权限

然后继续下一节配置 CIX PPA 并安装开源驱动。

## 配置 CIX PPA 并安装开源驱动

### 1. 配置 backports 并安装依赖

开源驱动方案依赖 Debian 13 backports 中的较新固件。先执行：

```bash
echo "deb https://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list.d/debian-trixie-backports.list
sudo apt update
sudo apt install firmware-misc-nonfree libgl1-mesa-dri -t trixie-backports
```

:::tip 国内镜像
如果你的网络环境更适合国内镜像，可以将 `deb.debian.org` 替换为常用的 Debian 镜像站，并保持使用独立的 `.list` 文件。
:::

### 2. 运行 CIX 配置脚本

```bash
curl -fsSL -o cix-repo-community.sh https://archive.cixtech.com/cix-repo-community.sh
sudo sh ./cix-repo-community.sh
```

脚本运行后会提示选择驱动方案，请输入 `2` 安装开源驱动。

:::warning 执行脚本前请先检查内容
请先检查下载到本地的脚本内容，再使用 `sudo sh` 执行，避免直接以 root 权限执行远端返回内容。
:::

### 3. 重启系统

```bash
sudo reboot
```

## 安装后验证

重启后，可以用下面的命令确认系统已切换到开源驱动方案：

```bash
uname -r
dpkg -l | grep firmware-misc-nonfree
dpkg -l | grep cix
```

正常情况下，`uname -r` 应显示 `7.0.0-rc5-generic`。

## 软件源与关键路径

CIX 配置脚本会自动完成以下操作：

- 导入软件源 GPG 密钥
- 写入 CIX APT 源配置
- 安装开源内核与 DKMS 驱动
- 更新 GRUB 默认启动项

相关路径如下：

- APT 源配置：`/etc/apt/sources.list.d/cix-deb-repo.list`
- GPG 密钥：`/usr/share/keyrings/cix-deb-repo.gpg`
- GRUB 配置：`/etc/cix/grub-config.env`

## 日常维护

### 更新系统

建议直接使用以下命令完成系统更新：

```bash
sudo apt update
sudo apt full-upgrade
```

### 查看已安装的 CIX 软件包

```bash
dpkg -l | grep cix
apt list --installed | grep cix
```

### 搜索可用软件包

```bash
apt search cix-
```

## 卸载开源驱动

再次运行脚本，并在交互菜单中选择 `3`：

```bash
curl -fsSL -o cix-repo-community.sh https://archive.cixtech.com/cix-repo-community.sh
sudo sh ./cix-repo-community.sh
```

脚本会移除开源内核包、CIX 相关配置，并尝试将系统恢复到安装前状态。

## 参考资料

- [CIX PPA 用户手册（开源驱动版）](https://github.com/cixtech/cix-developer-docs/wiki/CIX%20PPA%20%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C%EF%BC%88%E5%BC%80%E6%BA%90%E9%A9%B1%E5%8A%A8%E7%89%88%EF%BC%89)
- [CIX 平台主线支持](https://github.com/cixtech/linux-mainline/wiki)
