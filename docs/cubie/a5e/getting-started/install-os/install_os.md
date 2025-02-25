---
sidebar_position: 2
---

# 安装系统

## 资源下载

镜像及刷机工具请到[资源下载](../../download) 下载.

## 安装系统到eMMC

### 镜像烧录

准备一条 typec 数据线

<img src="/img/cubie/a5e/cubie_a5e_to_fex_mode.webp" alt="cubie a5e architecture" width="700" />

linux/Mac 用户：

1. 打开 LiveSuit 工具，选择需要烧录的固件，按如图所示配置
2. 按住UBOOT按键之后,将A5E 连接到主机，此时板子会进入FEX烧录模式
3. 如果没有勾选burn tip 选项，系统识别到设备插入后将自动进行固件烧录，否则需要点击确认

<img src="/img/cubie/linux_phoenixsuit.webp" alt="cubie a5e architecture" width="500" />

windows 用户：

1. 打开 PhoenixSuit 工具，选择需要烧写的固件，按如图所示配置
2. 按住UBOOT按键之后,将A5E 连接到主机，此时板子会进入FEX烧录模式，软件识别到设备插入后自动执行烧录

<img src="/img/cubie/win_phoenixsuit.webp" alt="cubie a5e architecture" width="500" />

## 安装系统到SD卡

1. 准备读卡器和SD卡并连接到主机
2. 打开 Phoenixcard 工具，按照如图序号检查配置
3. 点击烧录卡等待完成
   <img src="/img/cubie/phoenixcard.webp" alt="cubie a5e architecture" width="500" />
