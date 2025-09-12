---
sidebar_position: 1
---

# 快速上手

主要介绍如何刷 Android BIOS 和安装 Android 系统。

## 使用前提

- 主板：瑞莎 Orion O6
- U 盘：用于更新 BIOS
- 系统启动盘：NVMe SSD
- 数据线：USB Type-C 数据线
- 显示器：用于显示 BIOS 设置界面
- 电源适配器：USB-C 20V 电源适配器（兼容 PD 协议）
- PC 主机: Windows / Linux / MacOS, 安装 fastboot 工具
- 可选设备：串口数据线

说明：其中可选设备用于刷 BIOS，刷 BIOS 可以通过串口或者显示器操作。

:::tip 推荐配件

- [瑞莎 PD 65W 电源适配器](https://radxa.com/products/accessories/power-pd-65w)

:::

## 刷安卓 BIOS

### 软件环境

我们需要在主机上安装 adb 和 fastboot 工具。

:::tip 系统环境

推荐使用 Ubuntu 系统进行系统安装

:::

<NewCodeBlock tip="Ubuntu$" type="device">

```
sudo apt update
sudo apt install android-tools-adb android-tools-fastboot
```

</NewCodeBlock>

## 刷入安卓 BIOS

### 制作 BIOS 盘

使用 PC 访问 [资源汇总下载](../download.md) 下载页面，下载安卓的 BIOS 文件到 U 盘根目录。

### 硬件连接

1. 使用 USB Type-C 数据线连接主板的 USB Type-C 接口(靠近 USB Type-A 接口的 USB Type-C 接口)到 PC
2. 把 SSD 装在主板上
3. 主板连接 HDMI 或者 DP 显示器
4. (可选)使用 USB 串口数据线连接主板的 UART2，进入 BIOS 文本界面
5. 将制作好的 BIOS U 盘安装到主板上
6. 使用 USB-C 电源适配器给主板供电（靠近电源按键的 USB Type-C 接口）

### 进入 BIOS

#### 显示器

若你是使用显示器，可以在系统启动并出现 Radxa logo 和进度条时，短按键盘的 “Esc” 按键，主板将会进入 BIOS 界面。

<div style={{textAlign: 'center'}}>
    <img src="/img/o6/android/burn-bios-go.webp" style={{width: '50%', maxWidth: '1200px'}} />
</div>

#### 串口

若你是使用 USB 串口数据线，可以在串口输出 `Press ESCAPE for boot options` 时，短按键盘的 “Esc” 按键，主板将会进入 BIOS 界面。

```
Tianocore/EDK2 firmware version 0.3.0-1
Press ESCAPE for boot options
```

### 刷入 BIOS

#### BIOS 界面

进入 BIOS 界面选择 `Boot Manager` 选项

<div style={{textAlign: 'center'}}>
    <img src="/img/o6/android/burn-bios-manager.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

#### 进入 EFI

选择并进入 `Boot Manager` 选项后，选择 `EFI Shell` 选项

<div style={{textAlign: 'center'}}>
    <img src="/img/o6/android/burn-bios-efi.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

#### 刷入 BIOS

选择并进入 `EFI Shell` 选项后，主板会自动找到 BIOS U 盘里面的 `startup.nsh` 文件并运行。

<div style={{textAlign: 'center'}}>
    <img src="/img/o6/android/burn-bios-sh.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

### Fastboot 模式

自动刷入 BIOS 后，主板会自动进入 Fastboot 模式。

<div style={{textAlign: 'center'}}>
    <img src="/img/o6/android/burn-bios-fastboot.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## 下载系统镜像

使用 PC 访问 [资源汇总下载](../download.md) 下载页面，下载 Android 系统镜像到本地并解压。

## 刷入系统镜像

打开终端并进入 Android 系统镜像目录，运行 `android_flush_images.sh` 脚本，脚本会自动刷入 Android 系统镜像。

<NewCodeBlock tip="Ubuntu$" type="device">

```
./android_flush_images.sh
```

</NewCodeBlock>

执行完脚本后，Android 镜像已经刷入到 SSD，系统会自动启动到 Android 系统界面。
