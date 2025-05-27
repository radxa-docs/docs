---
sidebar_position: 2
---

# 使用工具：RKDevTool

RKDevTool 是瑞芯微（Rockchip）平台为 Windows/Linux/macOS 平台下进行 USB 烧录所开发的软件，旨在简化和加速对 Rockchip 系列芯片的开发、调试过程。

:::tip
该教程主要介绍 Balena Etcher 软件的使用方法，完整的重装系统的步骤可以看以下教程：

- [使用平台：Windows](./platform_windows)
- [使用平台：Linux](./platform_linux)
- [使用平台：MacOS](./platform_macos)
  :::

## 1. RKDevTool 安装

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
cp rkdeveloptool /opt/homebrew/bin/
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

## 2. RKDevTool使用

在瑞芯微（Rockchip）平台的开发中，RKDevTool 是常用的烧录工具，而 Maskrom 模式和 Loader 模式是两种关键的设备启动模式。

:::tip

Loader 模式需要存储介质中存在有效的引导程序。

MaskROM 模式不需要存储介质中存在有效的引导程序。

:::

### 2.1 Maskrom/Loader 模式

我们主要推荐用户在 Maskrom 模式使用 RKDevTool 工具，因为 Maskrom 模式可以直接通过 USB 连接进行烧录，而 Loader 模式需要存储介质中存在有效的引导程序。

:::tip
以下操作以 Radxa ROCK 4D 作为演示主板，部分产品可能没有专门引出进入 Loader 模式的 Recovery 接口， 只引出 Maskrom 模式的按键
:::

#### 2.1.1 所需硬件

- Radxa ROCK 4D
- 双头 USB Type-A 数据线
- PC（Windows/Linux/macOS）
- 电源适配器（5V Type-C 接口）
- 跳线帽或者杜邦线（可选）：短接 Recover 接口，进入 Loader 模式

#### 2.1.2 进入模式

<Tabs queryString="mode">

<TabItem value="Maskrom 模式">

进入 Maskrom 模式步骤：

1. 使用双头 USB Type-A 数据线连接 Radxa ROCK 4D 主板与 PC
2. 按住 Maskrom 按键
3. 插上 5V Type-C 电源适配器
4. 松开 Maskrom 按键
5. 打开 RKDevTool 软件

:::tip
示意图序号说明：

① ： 只有USB 3.0 上层的 Type-A 接口才支持 OTG 功能，所以需要使用上层的 USB 3.0 Type-A 接口与 PC 相连。

② ： Maskrom 按键，通电前按住 Maskrom 按键，通电后松开。

③ ： Type-C 供电接口，连接 5V Type-C 电源适配器，用于给主板供电。

:::

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/maskrom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
#### 2.1.3 验证设备模式

正常情况下，RKDevTool 软件会自动识别到 Radxa ROCK 4D 主板当前所处模式； 若未识别到设备，可以重新按照以上步骤操作一遍。

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
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```
</NewCodeBlock>

</TabItem>

</Tabs>

</TabItem>

<TabItem value="Loader 模式">

进入 Loader 模式步骤：

1. 使用双头 USB Type-A 数据线连接 Radxa ROCK 4D 主板与 PC
2. 用跳线帽或者杜邦线短接 Recover 接口
3. 插上 5V Type-C 电源适配器
4. 去掉 Recover 接口的跳线帽或者杜邦线
5. 打开 RKDevTool 软件

:::tip
示意图序号说明：

① ： 只有USB 3.0 上层的 Type-A 接口才支持 OTG 功能，所以需要使用上层的 USB 3.0 Type-A 接口与与 PC 相连。

② ： Recovery 接口，通电前短接 Recovery 接口，通电后去掉短接。

③ ： Type-C 供电接口，连接 5V Type-C 电源适配器，用于给主板供电。

:::

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/loader.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

#### 2.1.3 验证设备模式

正常情况下，RKDevTool 软件会自动识别到 Radxa ROCK 4D 主板当前所处模式； 若未识别到设备，可以重新按照以上步骤操作一遍。

<Tabs queryString="maskrom-display">

<TabItem value="Windows">
打开 RKDevTool 软件查看识别到的设备信息：
<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/loader-mode.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux/MacOS">
使用 `rkdeveloptool ld` 命令查看识别到的设备信息：
<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool ld
```
</NewCodeBlock>

输出类似内容：识别到一个 Loader 设备

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Loader
```
</NewCodeBlock>

</TabItem>

</Tabs>

</TabItem>

<TabItem value="Loader 模式切换 Maskrom 模式">

**注意**：目前只有 Windows 平台的 RKDevTool 软件支持 Loader 模式切换 Maskrom 模式的功能。

若需要从 Loader 模式切换到 Maskrom 模式，则需要先进入 Loader 模式，然后在 RKDevTool 软件中选择 `Go Maskrom` 选项。

:::tip
示意图序号说明：

① ： 切换 Maskrom 模式： 选择 `Go Maskrom` 选项。

② ： 显示当前设备模式信息。

③ ： 执行对应选项的操作反馈。

:::

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/loader-to-maskrom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

### 2.2 写入 Loader 文件

主板需要进入 Maskrom 模式才可以写入 Loader 文件，您可以按照进入[Maskrom/Loader 模式](#21-maskromloader-模式)步骤操作。

可以进入[资源下载汇总](../../download)页面下载对应的 Loader 文件。

<Tabs queryString="write-loader">

<TabItem value="Windows">

打开 RKDevTool 软件，确认设备处于 Maskrom 模式。

① ： 勾选下载区第一行选项。

② ： `Name` 选项选择 `Loader` 。

③ ： 选择要烧录的 Loader 文件。

④ ： 点击 `Write` 按钮，开始烧录。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/write-loader.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux/MacOS">

`xxx.bin` 是 Loader 文件的名称，请将其替换为实际的 Loader 文件名。

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool db xxx.bin
```
</NewCodeBlock>

成功后输出内容：

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
Downloading bootloader succeeded.
```
</NewCodeBlock>

</TabItem>

</Tabs>
