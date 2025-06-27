---
sidebar_position: 2
---

# 安装系统到 eMMC 模块

主要介绍如何将系统安装到 eMMC 模块中。

:::warning
安装系统会格式化 eMMC 模块，如果有重要数据请提前备份！
:::

## 硬件准备

您需要提前准备以下硬件：

- 开发板：瑞莎 Cubie A7A
- 系统启动介质：[eMMC 模块](https://radxa.com/products/accessories/emmc-module)
- 供电/数据线：USB Type A to Type C 数据线
- 电源适配器：5V Type-C 电源适配器

:::tip
推荐配件：

- [瑞莎 eMMC 模块](https://radxa.com/products/accessories/emmc-module)
- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)
  :::

## 硬件说明

Cubie A7A 主板支持标准 PD 协议的 5V 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

- 供电/数据线

主要作用是用来给 Cubie A7A 供电和传输数据的，通过 USB Type A to Type C 数据线可以将系统镜像烧录到 eMMC 模块中。

- 电源适配器

当系统镜像烧录到 eMMC 模块后，可以使用 Type-C 电源适配器给 Cubie A7A 供电，避免后期开发功率不足的问题。

## 硬件连接

将 eMMC 模块安装到 Cubie A7A 的 eMMC 和 UFS 模块二合一接口中。

- 安装步骤：

1. 确保 eMMC 模块的缺角和 Cubie A7A 的 eMMC 和 UFS 模块二合一接口方向一致
2. 确保 eMMC 模块底部卡槽接口和 Cubie A7A 的 eMMC 和 UFS 模块二合一接口对齐
3. 轻微用力按压 eMMC 模块一端的接口，听到滴的声音说明安装成功，同样的方法按压另一端的接口，确保 eMMC 模块安装成功
<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-emmc.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 软件准备

给 eMMC 模块烧录系统镜像需要用到全志平台提供的工具，该工具可以去[ 资源汇总下载 ](../../download)页面下载软件。

**PhoenixSuit**：基于 Windows 平台的工具，可以用来烧录系统镜像到 eMMC 模块中。

**LiveSuit**：基于 Linux 平台的工具，可以用来烧录系统镜像到 eMMC 模块中。

<Tabs queryString="platform">

<TabItem value="Windows">

在 Windows 平台使用 PhoenixSuit 工具。

:::tip
若您使用的是 Windows11 系统，需要进入 `Windows 安全中心` → `设备安全性` → `内核隔离` :将里面的选项全部关闭，否则会出现驱动带有感叹号或安装失败的问题。
:::

- 安装驱动

解压下载的 `PhoenixSuit` 压缩包，进入 `PhoenixSuit` --> `Drivers` --> `AW_Driver` 目录；

以管理员身份运行 `InstallUSBDriver.exe` 程序安装驱动。

驱动安装成功，你可以在设备管理器看到被正常识别的 `USB Device(VID_1f3a_PID_efe8)` 设备。

- 使用 PhoenixSuit 工具

进入 `PhoenixSuit` 目录，运行 `PhoenixSuit.exe` 程序。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-phoenixsuit-windows-1.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux">

在 Ubuntu 平台使用 LiveSuit 工具。

- 安装依赖

```bash
sudo apt update
sudo apt install dkms
```

- 添加文件可执行权限
  解压下载的压缩包，进入 LiveSuit 目录，运行下面命令给文件添加可执行权限。

<NewCodeBlock tip="Host-Linux$" type="host">
```
sudo chmod +x LiveSuit.run
```
</NewCodeBlock>

- 运行 LiveSuit.run 文件

运行 `LiveSuit.run` 文件安装程序。

<NewCodeBlock tip="Host-Linux$" type="host">
```
./LiveSuit.run
```
</NewCodeBlock>

程序安装成功后，会输出类似以下信息：其中 `user_name` 为当前登录的用户名。

```
========***********LiveSuit installed completely***********===========
LiveSuit  has been installed in /home/user_name/Bin/livesuit
========***********LiveSuit installed completely***********===========
```

- 运行 LiveSuit 工具

进入程序目录，输入下面命令运行 LiveSuit 工具。
<NewCodeBlock tip="Host-Linux$" type="host">

```
sudo ./LiveSuit
```

</NewCodeBlock>

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-livesuit-linux-1.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

:::tip
若运行程序提示有关找不到 `libpng12.so.0` 的错误，可以运行以下命令解决。

<NewCodeBlock tip="Host-Linux$" type="host">
```
mkdir libpng
cd libpng/
wget https://ppa.launchpadcontent.net/linuxuprising/libpng12/ubuntu/pool/main/libp/libpng/libpng_1.2.54.orig.tar.xz
tar -xvf libpng_1.2.54.orig.tar.xz
cd libpng-1.2.54
./configure
make
sudo make install
sudo ln -s /usr/local/lib/libpng12.so.0.54.0 /usr/lib/libpng12.so
sudo ln -s /usr/local/lib/libpng12.so.0.54.0 /usr/lib/libpng12.so.0
```
</NewCodeBlock>
:::

</TabItem>

</Tabs>

## 安装系统

### 进入 FEL 模式

主板需要进入 FEL 模式才能给 eMMC 模块烧录系统镜像。

① : 按住 Cubie A7A 的 `UBOOT` 按键

② : 使用 USB Type A to Type C 数据线连接 Cubie A7A 的 USB Type C 接口和 PC 的 USB Type A 接口

③ : 松开 Cubie A7A 的 `UBOOT` 按键

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-write-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 烧录系统镜像

根据自己的系统平台打开全志提供的系统镜像烧录工具。

<Tabs queryString="platform">

<TabItem value="Windows">

Linux 平台打开 PhoenixSuit 工具进行系统镜像的烧录。

- 镜像烧录

提前在[ 资源汇总下载 ](../../download)页面下载系统镜像文件，系统镜像文件需要得到解压后才的文件可以烧录到 eMMC 模块中。

① ： 选择 `浏览` 选项，找到系统镜像对应的文件（选择实际解压的系统文件）

② : 选择 `全盘擦除升级` 选项

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-phoenixsuit-windows-2.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

若软件没有自动给主板烧录系统，你可以让主板重新进入 FEL 模式，然后观察软件的烧录进度。

- 烧录完成

当软件显示 `固件烧写成功` 时，说明系统镜像烧录完成，此时可以关闭 PhoenixSuit 工具。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-phoenixsuit-windows-3.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="Linux">

Linux 平台打开 LiveSuit 工具进行系统镜像的烧录。

- 镜像烧录

提前在[ 资源汇总下载 ](../../download)页面下载系统镜像文件，系统镜像文件需要得到解压后才的文件可以烧录到 eMMC 模块中。

① ： 选择 `Image` 选项，找到系统镜像对应的文件（选择实际解压的系统文件）

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-livesuit-linux-2.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

若软件没有自动给主板烧录系统，你可以让主板重新进入 FEL 模式，然后观察终端输出的信息和软件的进度条。

- 烧录完成

当进度条显示 `100%` 时，说明系统镜像烧录完成，此时可以关闭 LiveSuit 工具。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-livesuit-linux-3.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- Debian Linux

出厂系统默认存在两个用户账号，分别是 `root` 和 `radxa`。

- root

用户账号：root

用户密码：radxa

- radxa

用户账号：radxa

用户密码：radxa
