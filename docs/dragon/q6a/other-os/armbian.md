---
sidebar_position: 1
---

# Armbian

Armbian 是一个面向 ARM 开发板的轻量级 Linux 发行版，以稳定性、高性能和良好的硬件支持而闻名。它提供了针对各种 ARM 单板计算机优化的 Debian 和 Ubuntu 基础系统。

:::tip
Radxa Dragon Q6A 需要最新的 UEFI 固件才能运行 Armbian。固件下载地址：[Dragon Q6A 固件快照](https://forum.radxa.com/t/radxa-dragon-q6a-firmware-snapshot/)
:::

## 系统镜像下载

Armbian 为 Radxa Dragon Q6A 提供多个版本的系统镜像：

### 稳定版镜像

基于 Linux 内核 6.18，提供稳定的使用体验：

- **Ubuntu 24.04 (Noble) - Gnome 桌面版**：完整的桌面环境，适合日常使用
- **Ubuntu 24.04 (Noble) - 最小化版**：轻量级系统，适合物联网应用

### 滚动发布版

适合喜欢尝鲜的 Linux 爱好者，包含最新的软件包：

- **Debian 14 (Forky) - 最小化版**
- **Ubuntu 25.04 (Plucky) - 最小化版**

:::warning
滚动发布版仅适合有经验的 Linux 用户，不推荐在生产环境中使用。
:::

下载地址：[Armbian Dragon Q6A 下载页面](https://www.armbian.com/radxa-dragon-q6a/)

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
