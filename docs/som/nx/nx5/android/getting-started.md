---
sidebar_position: 2
---

import UseRKDevTool from '../../../../common/radxa-os/rkdevtool/\_use.mdx';
import EMMC from '../../../../common/radxa-os/rkdevtool/\_emmc.mdx';
import Maskrom from '../../../../common/radxa-os/rkdevtool/\_maskrom.mdx';

# 快速上手

本节教程目的是为了让大家快速上手使用瑞莎 NX5 的 Android 系统。

## 产品实物

瑞莎 NX5 开发套件由瑞莎 NX5 核心模组和瑞莎 NX5 载板组成，提供了完整的硬件开发平台，可用于快速验证核心板功能、评估性能并搭建原型系统，帮助用户高效完成开发与方案验证。

说明：瑞莎 NX5 载板需要用户自行购买

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-dev-kit-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

您需要提前准备以下硬件设备：

- 瑞莎 NX5 开发套件
- 供电：DC 5525 电源适配器（5V 输入）
- 系统启动介质：板载 eMMC
- 数据线：Micro USB 数据线（用于线刷系统到 eMMC）
- 显示设备：HDMI 数据线和显示器
- 输入设备：键盘和鼠标（用于图形界面操作）

:::tip 推荐配件

- 推荐使用 5V/3A 或以上规格的 DC 电源适配器进行供电

:::

## 安装系统

:::tip 系统说明

若需要安装系统到 microSD 卡，请参考 [安装系统到 microSD 卡](./install-system/microsd-system.md)

若 microSD 卡和板载 eMMC 均存在系统，系统将优先从 microSD 卡启动。

:::

快速上手主要介绍安装系统到瑞莎 NX5 的板载 eMMC。

:::warning 重要提醒

**安装系统会完全格式化 eMMC，所有数据将被永久删除！**

请在操作前确认：

- eMMC 中无重要数据或已完成资料备份
  :::

### 安装 RKDevTool

<UseRKDevTool />

### 进入 Maskrom 模式

<Maskrom model="nx5"/>

### 安装系统到 eMMC

<EMMC download_page="../download"/>

## 启动系统

完成系统的安装后，连接 HDMI 显示器，重新插拔电源适配器，即可启动系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/nx5/radxa-nx5-emmc-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : 使用 HDMI 或 DP 数据线连接显示器和主板

② : 使用 USB-A 接口连接鼠标或键盘

③ : 使用 5V DC 电源适配器给主板供电

若主板供电正常，瑞莎 NX5 载板的电源指示灯亮绿色；显示器显示安卓系统桌面。

说明：瑞莎 NX5 载板的系统状态指示灯并不会亮起。
