---
sidebar_position: 2
---

# 安装系统到 eMMC ( 适用 V1.5 )

本节教程主要介绍如何给瑞莎 ROCK Pi S V1.5 的板载 eMMC 安装系统。

:::tip
ROCK Pi S V1.5 在 V1.3 的基础上增加了板载 eMMC,您可以直接通过 eMMC 启动系统，无需 MicroSD 卡。
:::

## 硬件准备

您需要提前准备好以下硬件设备才可以完成安装和启动系统的所有操作。

#### 安装/启动系统

- 开发板: 瑞莎 ROCK Pi S V1.5
- 供电方式：使用 Type-C 转 Type-A 数据线连接 PC 供电和传输数据

## 安装系统

安装系统会格式化 eMMC，如果有重要数据请提前备份。

### 文件下载

#### 下载 Loader 文件

进入 [资源下载汇总](../../download) 页面下载对应的 Loader 文件。

#### 下载系统镜像

在 PC 上访问 [资源下载汇总](../../download) 页面，在下载页面找到官方操作系统镜像。

下载完成后，解压系统镜像文件，得到的 `*.img` 文件就是待烧写到 eMMC 中的系统镜像文件。

### 安装 RKDevTool

RKDevTool 是瑞芯微（Rockchip）平台为 Windows/Linux/macOS 平台下进行 USB 烧录所开发的软件，旨在简化和加速对 Rockchip 系列芯片的开发、调试过程。

<Tabs queryString="erase">

<TabItem value="Windows">

- 安装驱动

下载并解压 [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip) 文件。

找到 ` DriverInstall.exe` 文件并以管理员身份运行：

安装驱动： 点击 `Install Driver` 选项

卸载驱动： 点击 `Uninstall Driver` 选项

:::tip
若之前安装过其他版本驱动，请先卸载再安装驱动
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rkddevtool.webp" style={{width: '50%', maxWidth: '700'}} />
</div>

- 下载 RKDevTool 工具

下载 [RKDevTool](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96-20221121.rar) 工具，然后解压下载的文件，其中 `RKDevTool.exe` 就是可执行程序，直接双击可以打开使用软件。

</TabItem>

<TabItem value="Linux">

- 安装 rkdeveloptool

打开系统终端或命令行，运行以下命令进行安装。

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo apt-get update
sudo apt-get install -y libudev-dev libusb-1.0-0-dev dh-autoreconf pkg-config libusb-1.0 build-essential git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
autoreconf -i
./configure
make -j $(nproc)
sudo cp rkdeveloptool /usr/local/sbin/
```
</NewCodeBlock>

- 验证版本号

完成 RKDevTool 安装后，使用以下命令可以查看 RKDevTool 版本号。

<NewCodeBlock tip="Linux-host$" type="host">
```
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

<TabItem value="macOS">

- 安装 HomeBrew

[HomeBrew](https://brew.sh/) 是一个免费且开源的包管理器，它简化了 macOS 用户安装软件的过程。

若没有安装 HomeBrew，可以按照教程进行安装。

<NewCodeBlock tip="macOS-host$" type="host">
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
</NewCodeBlock>

- 安装 rkdeveloptool

打开系统终端或命令行，运行以下命令进行安装。

<NewCodeBlock tip="macOS-host$" type="host">
```
brew install automake autoconf libusb pkg-config git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
autoreconf -i
./configure
make -j $(nproc)
cp rkdeveloptool /opt/local/sbin/
```
</NewCodeBlock>

- 验证版本号

完成 RKDevTool 安装后，使用以下命令可以查看 RKDevTool 版本号。

<NewCodeBlock tip="macOS-host$" type="host">
```
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

</Tabs>

### 进入 Maskrom 模式

我们需要让 ROCK Pi S 进入 Maskrom 模式，然后基于这个模式给 eMMC 安装系统。

:::tip
ROCK Pi S 需要拔掉 MicroSD 卡才可以进入 Maskrom 模式，否则会直接启动系统，无法进入 Maskrom 模式。
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/rock-pi-s-v15-maskrom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ： MicroSD 卡槽 --> 确保 MicroSD 卡拔掉

② ： Maskrom 按键

③ ： Type-C 接口

具体操作步骤如下：

1. ROCK Pi S 未通电前，按住 Maskrom 按键
2. 使用 Type-C 转 Type-A 数据线连接开发板和 PC（其中 Type-C 端连接开发板，Type-A 端连接 PC）
3. 松开 Maskrom 按键

### 使用 RKDevTool

当设备进入 Maskrom 模式后，RKDevTool 会自动识别到设备；若未识别到设备，可以重新按照进入 Maskrom 模式步骤操作一遍。

#### 查看 Maskrom 设备

<Tabs queryString="maskrom-display">

<TabItem value="Windows">
打开 RKDevTool 软件查看识别到的设备信息：
<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/maskrom-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux/MacOS">
使用 `rkdeveloptool ld` 命令查看识别到的设备信息：
<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool ld
```
</NewCodeBlock>

输出类似内容：识别到一个 Maskrom 设备

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
DevNo=1	Vid=0x2207,Pid=0x330e,LocationID=101	Maskrom
```
</NewCodeBlock>

</TabItem>

</Tabs>

### 安装系统镜像

<Tabs queryString="maskrom-display">

<TabItem value="Windows">

在 RKDevTool 软件内分别进行以下操作：

- ① : 选择 Loader 文件
- ② : 选择系统镜像
- ③ : 选择 eMMC 系统存储介质
- ④ : 勾选 `Write by Address`
- ⑤ : 开始执行操作(写入 Loader 和系统)
- ⑥ : 操作反馈的信息

<div style={{textAlign: 'center'}}>
<img src="/img/rockpi/pis/rkdevtool-emmc.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux/MacOS">

打开系统终端或命令行，执行以下操作。

- 运行 Loader

将命令中的 `<loader-file>.bin` 替换为实际下载的 Loader 文件名。

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```bash
sudo rkdeveloptool db <loader-file>.bin
```
</NewCodeBlock>

下载成功，终端会显示类似内容：

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```text
Downloading bootloader succeeded.
```
</NewCodeBlock>

- 安装系统镜像

将命令中的 `<system-image>.img` 替换为实际下载的系统镜像文件名。

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```bash
sudo rkdeveloptool wl 0 <system-image>.img
```
</NewCodeBlock>

- 重启设备

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```bash
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

Debian Linux

用户账号：radxa

用户密码：radxa

## 启动系统

正常启动系统后，电源指示灯会常亮，状态（用户）指示灯会闪烁。
