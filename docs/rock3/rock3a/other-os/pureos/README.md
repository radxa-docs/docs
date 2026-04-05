---
sidebar_position: 3
---

# PureOS

PureOS 是一个基于 Debian 的自由软件发行版，由 Purism 公司开发，专注于隐私和安全。

## 支持状态

**目前 PureOS 没有针对 ROCK 3A 的官方支持或预构建镜像。**

## 替代方案

如果你希望在 ROCK 3A 上使用类似 PureOS 的自由软件环境，可以考虑以下替代方案：

### 1. Debian
- **官方支持**：Radxa 为 ROCK 3A 提供官方的 Debian 镜像
- **兼容性**：由于 PureOS 基于 Debian，大部分 Debian 软件包在 ROCK 3A 上都能正常工作
- **获取方式**：从 [Radxa 下载页面](https://docs.radxa.com/rock3/rock3a/download) 获取最新的 Debian 镜像

### 2. 从源代码构建
如果你希望尝试在 ROCK 3A 上运行 PureOS，可以：
1. 从 PureOS 官网获取源代码
2. 使用 ROCK 3A 的 Debian 内核配置作为基础
3. 参考 Debian 的安装指南进行适配

## 已知限制

1. **硬件支持**：PureOS 可能不包含 ROCK 3A 特定的硬件驱动
2. **内核配置**：需要针对 ROCK 3A 的 Rockchip RK3568 处理器进行内核配置调整
3. **引导加载程序**：可能需要手动配置 U-Boot 引导加载程序

## 社区资源

如果你在 ROCK 3A 上尝试安装 PureOS，可以关注以下社区资源：
- [Radxa 论坛](https://forum.radxa.com/)
- [Purism 社区](https://forums.puri.sm/)
- [Debian ARM 移植页面](https://www.debian.org/ports/arm64/)

## 反馈与帮助

如果你在 ROCK 3A 上成功安装了 PureOS，或者遇到了特定的技术问题，欢迎：
1. 在 [GitHub Issues](https://github.com/radxa-docs/docs/issues) 分享你的经验
2. 在 [Radxa 论坛](https://forum.radxa.com/) 与其他用户讨论
3. 为本文档提交改进建议