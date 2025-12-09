---
sidebar_position: 1
---

import UseRKDevTool from '../../../../common/radxa-os/rkdevtool/\_use.mdx';
import EMMC from '../../../../common/radxa-os/rkdevtool/\_emmc.mdx';
import Maskrom from '../../../../common/radxa-os/rkdevtool/\_maskrom.mdx';

# 快速上手

本节教程将指导您快速上手使用瑞莎 NX4，配合瑞莎 C200 NX4 载板，帮助您快速验证瑞莎 NX4 功能。

## 产品实物

瑞莎 NX4 开发套件由瑞莎 NX4 和瑞莎 C200 NX4 载板组成，可用于快速验证核心板功能。

|        产品实物        | 序号 |  视图  | 序号 |  视图  | 序号 |  视图  |
| :--------------------: | :--: | :----: | :--: | :----: | :--: | :----: |
| 瑞莎 C200 NX4 开发套件 |  ①   | 俯视图 |  ②   | 侧视图 |  ③   | 背视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-dev-kit-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

您需要提前准备以下硬件设备：

- 瑞莎 C200 NX4 开发套件
- 供电：DC 5525 电源适配器（9 - 20V）
- 系统启动介质：板载 eMMC
- 显示设备：HDMI 数据线和显示器
- 输入设备：键盘和鼠标（用于图形界面操作）

:::tip 推荐配件

- [瑞莎 DC 60W 电源适配器(推荐使用)](https://radxa.com/products/accessories/power-dc12-60w)
- 支持 9-20V 的 DC 电源适配器进行供电，推荐功率 40W 及以上

:::

## 安装系统

主要介绍安装系统到瑞莎 NX4 的板载 eMMC。

:::warning 重要提醒

**安装系统会完全格式化 eMMC，所有数据将被永久删除！**

请在操作前确认：

- eMMC 中无重要数据或已完成资料备份
  :::

### 安装 RKDevTool

<UseRKDevTool />

### 进入 Maskrom 模式

<Maskrom model="nx4"/>

### 安装系统到 eMMC

<EMMC download_page="../../download"/>

## 启动系统

完成系统的安装后，连接 HDMI 显示器，重新插拔电源适配器，即可启动系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-boot-system.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ：使用 HDMI 数据线连接显示器和主板

② ：使用电源适配器给瑞莎 C200 NX4 开发套件供电

系统启动正常后，瑞莎 C200 NX4 载板上的电源指示灯绿色亮起，瑞莎 NX4 上的状态指示灯蓝色闪烁。

## 登录系统

当您首次启动系统后，需要使用默认的用户名和密码登录。

Radxa OS 的默认凭据如下：

| 项目   | 内容    |
| :----- | :------ |
| 用户名 | `radxa` |
| 密码   | `radxa` |

## 使用系统

成功登录系统后，您就可以在瑞莎 C200 NX4 开发套件上进行系统配置与开发。

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
