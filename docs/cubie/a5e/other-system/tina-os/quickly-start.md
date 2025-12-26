---
sidebar_position: 2
---

# 快速上手

本节教程目的是为了让大家快速上手使用 Cubie A5E 的 Tina Linux 系统。

## 产品实物

| 序号 |       视图       | 序号 |       视图       | 序号 |       视图       |
| :--: | :--------------: | :--: | :--------------: | :--: | :--------------: |
|  ①   | Cubie A5E 正视图 |  ②   | Cubie A5E 背视图 |  ③   | Cubie A5E 侧视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a5e/cubie_a5e_view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

### 硬件准备

您需要提前准备以下硬件设备：

- 主板：瑞莎 Cubie A5E
- 供电：5V Type-C 电源适配器
- 系统启动介质：MicroSD 卡（用于安装系统与启动）
- 显示设备：HDMI 数据线与显示器（用于显示图形界面）
- 输入设备：键盘和鼠标（用于图形界面操作）
- 调试工具（可选）：USB 串口数据线（用于串口登录）和 USB-A 拓展坞（用于拓展 USB 外设）

推荐用户使用显示器、键盘和鼠标搭配 Cubie A5E 使用。

:::tip 推荐配件
Cubie A5E 主板兼容 PD 协议的 5V Type-C 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## 获取系统镜像

请访问 [资源汇总下载](../../download#tina-linux) 页面获取 Tina Linux 系统镜像。

**镜像类型选择**

- **GPT 镜像（推荐新手）**：适用于 MicroSD 卡和 NVMe SSD，使用 Balena Etcher 工具安装
- **FEL 镜像（高级）**：适用于 eMMC 安装，使用 Phoenix 工具烧录

## 安装系统

可以参考以下通用安装教程：

**GPT 镜像安装**

- [安装系统到 MicroSD 卡](../../getting-started/quickly-start#安装系统)（新用户推荐）
- [安装系统到 NVMe SSD](../../getting-started/install-system/nvme-system)

**FEL 镜像安装**

- [安装系统到 eMMC](../../getting-started/install-system/emmc-system)

## 启动系统

① : 将 MicroSD 卡插入 MicroSD 卡槽

② : 使用 HDMI 数据线连接显示器和主板

③ : 使用 USB-A 接口连接鼠标或键盘：若有 USB-A 拓展坞，可以通过拓展坞连接鼠标和键盘

④ : 使用 5V Type-C 电源适配器给主板供电

若主板供电正常，主板电源指示灯绿色亮起；若系统启动正常，状态指示灯蓝色闪烁。

成功启动系统后，显示器会显示系统桌面。

## 首次登录

使用官方 Tina Linux 系统镜像时，请使用默认登录凭据：

| 项目   | 内容                     |
| :----- | :----------------------- |
| 用户名 | `root`                   |
| 密码   | `无密码（直接按 Enter）` |
