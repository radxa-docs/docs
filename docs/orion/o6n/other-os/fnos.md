---
sidebar_position: 2
---

# 飞牛 fnOS（FnNAS）

本文介绍如何在 **Radxa Orion O6N**（基于 CIX 此芯 P1 SoC）上安装 **飞牛 fnOS（FnNAS）** ARM 公开测试版系统，并指向飞牛官方的安装教程与帮助中心。

:::warning 适用范围与当前状态

- 本文档仅适用于 **Radxa Orion O6N**（瑞莎星睿 O6N，SoC 为 CIX 此芯 P1）
- 飞牛 fnOS 在 Orion O6N 上的支持属于 **社区验证**，不是 Radxa 官方维护的发行版
- 飞牛 fnOS **ARM 版本当前为公开测试版**，可能存在不稳定、数据丢失或功能异常等问题，请仅在非关键环境下测试，并提前完整备份重要数据
- 安装前请通读 [飞牛 ARM 版本公测声明](https://help.fnnas.com/articles/v1/contact/disclaimers.md)

:::

## 前置准备

开始前请确认：

- 已将设备 BIOS 更新到较新版本：Orion O6N 与 Orion O6 共用 BIOS 流程，请参考 [Orion O6 BIOS 更新](../../o6/low-level-dev/bios.md)
- 已准备一个容量不小于 16 GB 的 U 盘（推荐 USB 3.0）
- 已准备一块用于 fnOS 系统盘的介质，可选 NVMe SSD 或 UFS 模块（建议容量 ≥ 64 GB）
- 已准备好显示器、键盘、鼠标、网线（公测版本对纯无线网卡的支持尚不稳定，建议使用有线网络）
- 已通读 [飞牛 ARM 版本公测声明](https://help.fnnas.com/articles/v1/contact/disclaimers.md)，了解公测风险

## 1. 下载适用于此芯 P1 的 fnOS 镜像

打开飞牛 fnOS ARM 镜像下载页：[飞牛 fnOS ARM 镜像下载页](https://www.fnnas.com/download-arm)。

在设备支持列表中查找适用于 **此芯 P1** 的镜像：

- 镜像类别：**UEFI ARM 安装镜像 ISO**（页面上的文件标签为 `armsr`）
- 该类别官方说明明确列出 **支持 此芯 P1**（以及苹果 M 系列虚拟化、飞腾、华为鲲鹏等 UEFI ARM 平台）
- 推荐下载页面上的最新版本（如 `1.1.31 / 1366`）。版本号会随 fnOS 升级而变化，请以飞牛 ARM 下载页为准

当前推荐下载链接（示例）：

| 类别 | 文件名 | 版本 | 下载链接 |
| :--- | :--- | :--- | :--- |
| UEFI ARM 安装镜像 ISO | `fnos_Mainland-PE_arm_1.1.31_armsr_1366.iso` | `1.1.31 / 1366` | [下载](https://iso.liveupdate.fnnas.com/arm/trim/1.1.31/armsr/fnos_Mainland-PE_arm_1.1.31_armsr_1366.iso) |

:::tip 校验镜像
下载完成后，请比对页面公布的 MD5 值后再写入安装介质，避免使用损坏的镜像。
:::

## 2. 按照飞牛官方教程完成安装与初始化

将下载好的 `armsr` ISO 写入 U 盘，可以使用下列任意工具：

- Balena Etcher
- Rufus（Windows 下推荐）
- `dd`（Linux / macOS）

随后按照飞牛官方的安装与初始化教程完成后续步骤：

- 飞牛官方教程：[如何安装和初始化飞牛 fnOS？](https://help.fnnas.com/articles/v1/start/install-os)

主要步骤概述：

1. 将写好的 U 盘插到 Orion O6N，进入 BIOS 启动菜单选择从 U 盘启动
2. 在安装菜单选择 `Graphical Install`（图形化安装）
3. 选择 fnOS 系统盘所在的 NVMe SSD 或 UFS 模块，按提示完成分区与 Swap 设置（系统分区建议 ≥ 64 GB）
4. 确认格式化并开始安装
5. 安装完成后配置网络（建议有线网 + DHCP）
6. 拔出引导 U 盘并重启，记住所设置的 IP 地址
7. 在浏览器访问该 IP，按提示完成设备命名、管理员账号、存储空间等初始化

:::tip 与官方教程的差异

- 飞牛官方教程页面以 x86 镜像为例，本文档使用 ARM 公测版本的 `armsr` ISO，请以本页步骤为准
- 若安装过程中提示需要关闭 Secure Boot，请参考 [安装系统异常情况处理](https://help.fnnas.com/articles/fnosV1/start/install-os-fail.md)
- 关闭 Secure Boot 后，请回到 BIOS 的 `Device Manager` → `Platform Configuration` → `Compliance Configuration`，确认 `Enable ACPI SCMI` 仍处于启用状态

:::

## 3. 日常使用与维护

后续日常使用、备份、远程访问、文件共享、App 安装等与 x86 版 fnOS 一致，请直接参考飞牛官方帮助中心：

- [飞牛帮助中心首页](https://help.fnnas.com/)
- [如何创建存储空间？](https://help.fnnas.com/articles/fnosV1/volume/create.md)
- [如何远程访问到飞牛 NAS？](https://help.fnnas.com/articles/v1/access/how-access)
- [如何安装飞牛 App 并连接到飞牛 NAS？](https://help.fnnas.com/articles/fnosV1/start/install-app.md)

## 4. 公测问题反馈

如在 ARM 公测版本上遇到问题，请在 [飞牛社区 ARM 版块](https://club.fnnas.com/forum.php?mod=forumdisplay&fid=35) 反馈，并附上：

- 设备型号（Radxa Orion O6N）与 BIOS 版本
- fnOS 镜像版本号与构建号
- 完整的复现步骤与相关日志

## 参考资料

- [飞牛 fnOS ARM 镜像下载页](https://www.fnnas.com/download-arm)
- [飞牛 fnOS 安装与初始化教程](https://help.fnnas.com/articles/v1/start/install-os)
- [飞牛 ARM 版本公测声明](https://help.fnnas.com/articles/v1/contact/disclaimers.md)
- [飞牛社区 ARM 版块](https://club.fnnas.com/forum.php?mod=forumdisplay&fid=35)