---
sidebar_position: 1
---

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

### 下载系统镜像

请访问 [资源汇总下载](../download) 页面，下载**系统镜像**。

:::tip 软件使用

该镜像文件为 `.img.xz` 格式的压缩包，下载后需要先解压，得到 `.img` 格式的镜像文件才能使用。

:::

### 硬件连接

安装系统需要让主板进入 Maskrom 模式：

1. 按下主板上的 Maskrom 按键
2. 连接电源适配器
3. 松开 Maskrom 按键

<div style={{textAlign: 'center'}}>
   <img src="/img/nx4/radxa-nx4-maskrom-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 安装系统镜像

#### 安装 RKDevTool 工具

## 启动系统

完成系统的安装后，将 U 盘插到到瑞莎 C200 Orin 开发套件的 USB 接口，然后使用电源适配器给瑞莎 C200 Orin 开发套件供电，即可启动系统。

<div style={{textAlign: 'center'}}>
   <img src="/img/c200/hardware-connection-boot.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ：安装 U 盘

② ：使用 DP 数据线连接显示器和主板

③ ：使用电源适配器给瑞莎 C200 Orin 开发套件供电

系统启动正常后，电源指示灯绿色亮起。

## 登录系统

启动系统后，您需要根据系统提示完成初次系统配置。

## 使用系统

成功登录系统后，您就可以在瑞莎 C200 Orin 开发套件上进行系统配置与开发。
