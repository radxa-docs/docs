---
sidebar_position: 1
---

# RKDevTool 使用

RKDevTool 是瑞芯微（Rockchip）平台为 Windows/Linux/MacOS 平台下进行 USB 烧录所开发的软件，旨在简化和加速对 Rockchip 系列芯片的开发、调试过程。

## RKDevTool 安装

<Tabs queryString="rkdevtool">

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
```bash
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

<NewCodeBlock tip="PC - Host$" type="host">
```bash
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

<TabItem value="MacOS">

- 安装 HomeBrew

[HomeBrew](https://brew.sh/) 是一个免费且开源的包管理器，它简化了 MacOS 用户安装软件的过程。

若没有安装 HomeBrew，可以按照教程进行安装。

<NewCodeBlock tip="MacOS-host$" type="host">
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
</NewCodeBlock>

- 安装 rkdeveloptool

打开系统终端或命令行，运行以下命令进行安装。

<NewCodeBlock tip="MacOS-host$" type="host">
```bash
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

<NewCodeBlock tip="MacOS-host$" type="host">
```bash
rkdeveloptool -V
```
</NewCodeBlock>

</TabItem>

</Tabs>

## RKDevTool使用

在瑞芯微（Rockchip）平台的开发中，RKDevTool 是常用的烧录工具，而 Maskrom 模式和 Loader 模式是两种关键的设备启动模式。

:::tip

Loader 模式需要存储介质中存在有效的引导程序。

MaskROM 模式不需要存储介质中存在有效的引导程序。

:::

### Maskrom/Loader 模式

我们主要推荐用户在 Maskrom 模式使用 RKDevTool 工具，因为 Maskrom 模式可以直接通过 USB 连接进行烧录，而 Loader 模式需要存储介质中存在有效的引导程序。

:::tip
以下操作以 Radxa ROCK 4D 作为演示主板，部分产品可能没有专门引出进入 Loader 模式的 Recovery 接口， 只引出 Maskrom 模式的按键
:::

#### 进入Maskrom 模式

可以参考 [硬件使用：Maskrom 按键](../hardware-use/maskrom)教程。

#### 进入 Loader 模式

可以参考 [硬件使用：Recovery 引脚](../hardware-use/recovery)教程。
