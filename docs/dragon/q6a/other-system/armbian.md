---
sidebar_position: 1
---

# Armbian

Armbian 是一个面向 ARM 主板的轻量级 Linux 发行版，以稳定性、高性能和良好的硬件支持而闻名。它提供了针对各种 ARM 主板优化的 Debian 和 Ubuntu 基础系统。

:::tip
Radxa Dragon Q6A 需要最新的 UEFI 固件才能运行 Armbian。固件下载地址：[Dragon Q6A 固件快照](https://forum.radxa.com/t/radxa-dragon-q6a-firmware-snapshot/)
:::

## 系统镜像下载

Armbian 26.11 已正式支持 Radxa Dragon Q6A，提供基于 Debian 和 Ubuntu 的系统镜像。该版本主线内核为 Linux 7.3（Q6A 的 edge 内核为 7.3.1），同时提供 vendor 内核 7.0.11：

### 推荐镜像

由 Armbian 团队测试并挑选的稳定镜像（Armbian 26.11.2，2026-11-20 构建）：

- **Ubuntu 26.04 (Resolute) - Gnome 桌面版**：完整的桌面环境，适合日常使用
- **Debian 13 (Trixie) - 最小化版**：轻量级系统，适合物联网应用

### 桌面版镜像

- **Ubuntu 26.04 (Resolute) - Gnome / KDE Plasma**：edge 主线内核 7.3.1 或 vendor 内核 7.0.11
- **Debian 14 (Forky) - Hyprland**：edge 主线内核 7.3.1

### 最小化 / IoT 镜像

- **Ubuntu 26.04 (Resolute) - 最小化版**：edge 主线内核 7.3.1 或 vendor 内核 7.0.11
- **Debian 13 (Trixie) - 最小化版**：edge 主线内核 7.3.1 或 vendor 内核 7.0.11

### 专用应用镜像

- **Home Assistant**（Debian 13）
- **OpenMediaVault**（Debian 13）

:::note
Armbian 提供每周安全更新（包含 CVE 补丁回移）。Qualcomm 硬件支持仍在持续完善中，部分功能可能随版本更新逐步可用。具体可用镜像以下载页面为准。
:::

下载地址：[Armbian Dragon Q6A 下载页面](https://www.armbian.com/boards/radxa-dragon-q6a)

## 烧录到 UFS 存储

如果要将 Armbian 镜像烧录到 UFS 存储，可以使用与烧录固件相同的 `edl-ng` 工具：

```bash
./edl-ng --loader prog_firehose_ddr.elf --memory UFS write-sector 0 *.img
```

## 首次启动配置

首次启动时，系统会引导您完成基本配置：

1. 设置 root 密码
2. 创建普通用户账户
3. 确认语言设置
4. （可选）将系统转移到内部存储

您也可以使用 `armbian-config` 工具进行系统配置，包括：

- 网络设置（静态/动态 IP、热点）
- 更换登录 Shell（ZSH）
- 启用 SSH 双因素认证
- 安装常用软件
- 系统优化等

## 相关资源

- [官方文档](https://docs.armbian.com/)
- [技术支持论坛](https://forum.armbian.com/)
- [问题反馈](https://www.armbian.com/bugs/)
- [常见问题](https://docs.armbian.com/User-Guide_FAQ/)
