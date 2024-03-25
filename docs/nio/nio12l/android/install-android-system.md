---
sidebar_position: 3
---

# Android 系统安装

### 刷机前准备

- Radxa NIO 12L
- 一台 Linux 或者 Windows 电脑
- USB 数据线
- NIO 12L Android 镜像

### 刷机工具

Linux:

[Flash Tool Linux](https://dl.radxa.com/nio12l/tools/SP_Flash_Tool_Selector_exe_Linux_v1.2152.00.100.zip)

Windows:

[Flash Tool Windows](https://dl.radxa.com/nio12l/tools/SP_Flash_Tool_Selector_exe_Windows_v1.2152.00.000.zip)

[Driver Windows](https://dl.radxa.com/nio12l/tools/Driver_Auto_Installer_EXE_v5.2307.00.zip)

### 安装步骤

#### Linux PC 环境

1. 下载并解压刷机工具(见刷机工具部分), 找到并运行FlashToolSelector文件

```bash
$ mkdir mtk-tool
$ unzip SP_Flash_Tool_Selector_exe_Linux_v1.2152.00.100.zip -d mtk-tool
$ cd mtk-tool/SP_Flash_Tool_Selector_exe_Linux_v1.2152.00.100
$ chmod a+x FlashToolSelector
$ ./FlashToolSelector
```

除了命令执行外, 也可以直接双击 FlashToolSelector 图标运行

<img src="/img/nio/nio12l/mtk-linux-tool-1.webp" width = "700" alt="mtk linux tool 1"/>

2. 解压 Android 镜像, 找到 MT8195_Android_scatter.xml 这个文件,用刷机工具打开

<img src="/img/nio/nio12l/mtk-linux-tool-2.webp" width = "700" alt="mtk linux tool 2"/>

3. 点击 Download 按钮

<img src="/img/nio/nio12l/mtk-linux-tool-3.webp" width = "700" alt="mtk linux tool 3"/>

4. 使用 USB 数据线连接 NIO 12L 的 Type C OTG 口到 PC 的 USB 端口上, 此时镜像会开始下载

<img src="/img/nio/nio12l/device-connect.webp" width = "700" alt="device-connect"/>

<img src="/img/nio/nio12l/mtk-linux-tool-4.webp" width = "700" alt="mtk linux tool 4"/>

5. 等下载完成,拔掉 USB 数据线, 重新上电, 按 Power 键启动系统

说明：请一直按住 POWER 键, 直到系统起来再松开, 类似手机开机的操作

 <img src="/img/nio/nio12l/mtk-power-on.webp" width = "700" alt="mtk power on"/>

#### Windows PC 环境

1. 安装window驱动(见刷机工具部分)

2. 解压刷机工具包（见刷机工具部分）, 找到并打开 FlashToolSelector

<img src="/img/nio/nio12l/mtk-windows-tool-1.webp" width = "700" alt="mtk windows tool 1"/>

3. 解压Android镜像, 找到MT8195_Android_scatter.xml这个文件, 用刷机工具打开

<img src="/img/nio/nio12l/mtk-windows-tool-2.webp" width = "700" alt="mtk windows tool 2"/>

4. 点击 Download 按钮

<img src="/img/nio/nio12l/mtk-windows-tool-3.webp" width = "700" alt="mtk windows tool 3"/>

5. 使用USB数据线连接NIO 12L的 Type C OTG口到PC的USB端口上, 此时镜像会开始下载

<img src="/img/nio/nio12l/device-connect.webp" width = "700" alt="device-connect" />

<img src="/img/nio/nio12l/mtk-windows-tool-4.webp" width = "700" alt="mtk windows tool 4"/>

6. 等下载完成,拔掉USB数据线, 重新上电, 按Power键启动系统
   说明：请一直按住 POWER 键, 直到系统起来再松开, 类似手机开机的操作
   <img src="/img/nio/nio12l/mtk-power-on.webp" width = "700" alt="mtk power on"/>

### 注意项

- 如果以太网的 MAC 地址之前设置了, 使用刷机工具的 “Format All + Download” 这个配置,会导致之前设置的以太网 MAC 地址丢失

<img src="/img/nio/nio12l/mtk-windows-tool-5.webp" width = "700" alt="mtk windows tool 5"/>

- 如果刷机的时候, 下载进度没有正常开始, 可以尝试 一直按住板子的 Download Key 按键, 然后通过 Type C DC口上电, 等开始下载后, 松开 Download Key

<img src="/img/nio/nio12l/mtk-windows-tool-recovery.webp" width = "700" alt="mtk windows tool recovery"/>
