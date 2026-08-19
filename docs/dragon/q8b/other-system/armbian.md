---
sidebar_position: 1
---

# Armbian

Armbian 是一个面向 ARM 主板的轻量级 Linux 发行版，以稳定性、高性能和良好的硬件支持而闻名。它提供了针对各种 ARM 主板优化的 Debian 和 Ubuntu 基础系统。

Radxa Dragon Q8B 基于高通骁龙 8cx Gen 3（高通 SC8280XP）计算平台，支持运行 Armbian 系统。

## 系统镜像下载

Armbian 为 Radxa Dragon Q8B 提供多个版本的系统镜像，提供 Linux 内核 **vendor 7.0.11**（稳定版）与 **edge 7.1.8**（滚动版）两种内核线：

### 稳定版镜像

Armbian 官方推荐、经过充分测试的稳定版镜像（Stable）：

- **Armbian 26.8.1 - Ubuntu 26.04 (Gnome 桌面版)**：基于 vendor 7.0.11 内核，完整桌面环境，适合日常使用
- **Armbian 26.8.1 - Debian 13 (最小化版)**：基于 vendor 7.0.11 内核，轻量级系统，适合物联网应用

### 其他版本

除稳定版外，Armbian 还提供以下版本：

- **桌面版**：Ubuntu 26.04 的 Cinnamon / Gnome / KDE Plasma 桌面环境
- **最小化版**：Ubuntu 26.04 / Debian 13 最小化系统（含支持 UFS 存储的版本）
- **专用版本**：Kali Linux、Home Assistant、OpenMediaVault 等

:::tip
- 推荐使用 [Armbian Imager](https://www.armbian.com/imager/) 下载并烧录镜像。
- 滚动版（edge 内核）仅适合有经验的 Linux 用户，不推荐在生产环境中使用。
:::

下载地址：[Armbian Radxa Dragon Q8B 下载页面](https://armbian.com/boards/radxa-dragon-q8b)

## 烧录系统

Armbian 镜像的烧录方法与 Radxa OS 一致，可以参考以下页面：

- [安装系统到 microSD 卡](../getting-started/install-system/sd-system)
- [安装系统到 UFS](../getting-started/install-system/ufs-system/)
- [安装系统到 NVMe](../getting-started/install-system/nvme-system/)

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
