---
sidebar_position: 2
---

import Etcher from "../../common/general/\_etcher.mdx"

# Debian 系统安装

CM3I 主要有两种启动方式，从 microSD 卡启动和从 eMMC 启动，这里主要介绍安装系统到这两种介质的方法。

- 安装系统到 microSD 卡上
- 安装系统到 eMMC 上

## 安装系统到 microSD 卡

### 准备

1. 准备一个 microSD 卡
2. 准备一个 SD 卡读卡器
3. 下载对应产品的[镜像](/compute-module/images)
4. 把 microSD 卡插入 SD 读卡器, 然后把 SD 读卡器插入计算机的 USB 接口

### 烧录镜像

#### 通过 Etcher 烧录镜像到 microSD 卡

<Etcher model="cm3i" />

## 安装系统到 eMMC

安装系统之前, CM3I 要先进入[Maskrom 模式](/compute-module/cm3i/maskrom)

### 烧录镜像

<Tabs queryString="os">
<TabItem value="linux" label="Linux">

#### rkdeveloptool

rkdeveloptool 是 Rockchip 为 Linux/macOS 平台下进行 USB 烧录所开发的软件。

#### 安装 rkdeveloptool

如果 rockchip 没有提供对应操作系统下的编译好的 rkdeveloptool 工具，则需要编译源码并安装。

<Tabs queryString="host-os">
<TabItem value="archlinux" label="Arch Linux">

可从 [AUR](https://aur.archlinux.org/packages/rkdeveloptool) 安装 rkdeveloptool。

</TabItem>
<TabItem value="debian" label="Debian">

从命令行中执行以下命令进行安装：

```bash
sudo apt-get update
sudo apt-get install -y libudev-dev libusb-1.0-0-dev dh-autoreconf pkg-config libusb-1.0 build-essential git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
wget https://patch-diff.githubusercontent.com/raw/rockchip-linux/rkdeveloptool/pull/73.patch
wget https://patch-diff.githubusercontent.com/raw/rockchip-linux/rkdeveloptool/pull/85.patch
git am *.patch
autoreconf -i
./configure
make -j $(nproc)
sudo cp rkdeveloptool /usr/local/sbin/
```

</TabItem>

<TabItem value="ubuntu" label="Ubuntu">

从命令行中执行以下命令进行安装：

```bash
sudo apt-get update
sudo apt-get install rkdeveloptool
```

如果上面的命令执行失败，可参考 Debian 下的源码编译方式

</TabItem>

<TabItem value="macos" label="macOS">

请首先安装 [Homebrew](https://brew.sh/)，然后从命令行中执行以下命令进行安装：

```bash
brew install automake autoconf libusb pkg-config git wget
git clone https://github.com/rockchip-linux/rkdeveloptool
cd rkdeveloptool
wget https://patch-diff.githubusercontent.com/raw/rockchip-linux/rkdeveloptool/pull/73.patch
wget https://patch-diff.githubusercontent.com/raw/rockchip-linux/rkdeveloptool/pull/85.patch
git am *.patch
autoreconf -i
./configure
make -j $(nproc)
cp rkdeveloptool /opt/homebrew/bin/
```

</TabItem>
</Tabs>

---

#### 使用 rkdeveloptool

##### 查看已连接的 Maskrom 设备

```bash
rkdeveloptool ld
```

##### 写入文件

:::caution
如果镜像是压缩文件(例如zip,xz,gz等)，请先进行解压缩。
:::

:::caution
rkdeveloptool 一次只能烧录一个设备
如果需要同时写入多个设备，请使用 [upgrade_tool](low-level-dev/upgrade-tool)。
:::

```bash
sudo rkdeveloptool db <loader>
sudo rkdeveloptool wl 0 <image>
```

你可以从这里下载 [Loader](loader)

##### 重启设备

```bash
sudo rkdeveloptool rd
```

</TabItem>
<TabItem value="windows" label="Windows">

#### RKDevTool

RKDevTool 是 Rockchip 为 Windows 平台下进行 USB 烧录所开发的软件。

#### 安装 RKDevTool

请下载并解压以下文件以安装 RKDevTool：

- [RKDevTool v2.96](https://dl.radxa.com/tools/windows/RKDevTool_Release_v2.96_zh.zip) (含中文使用文档)
- [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssitant_v5.0.zip)

##### 安装驱动

下载并解压 DriverAssistant，然后执行 DriverInstall.exe 并点击 `Install Driver` 按钮来安装驱动。
如果你之前已经安装过其他版本的驱动，请先点击 `Uninstall Driver` 卸载驱动，然后再重新安装。

![RK Driver](/img/configuration/RK-Driver-Assistant-Install-Uninstall.webp)

#### 向设备中写入文件

##### 运行 RKDevTool

![RKDevTool zh](/img/configuration/rkdevtool-zh.webp)

##### 连接产品并进入 Maskrom 模式

如何进入Maskrom 模式, 请参考 [Maskrom Mode ](/compute-module/cm3i/maskrom)

如操作正常，RKDevTool 会提示 `发现一个MASKROM设备`：

![RKDevTool zh maskrom](/img/configuration/rkdevtool-zh-maskrom.webp)

:::caution
虽然 RKDevTool 支持选择 Maskrom 设备，但在同时写入多个设备时会导致正在写入的设备写入失败。

如果需要同时写入多个设备，请使用 [upgrade_tool](low-level-dev/upgrade-tool)。
:::

##### 配置 RKDevTool 写入参数

:::caution
如果镜像是压缩文件(例如zip,xz,gz等)，请先进行解压缩。

:::

点击空白单元格选择待使用的 [Loader](loader) 和 Image 文件：

![RKDevTool zh choose](/img/configuration/rkdevtool-zh-choose.webp)

在 `存储` 选项中选择目标介质：

<Tabs queryString="storage">
<TabItem value="emmc" label="eMMC">

![RKDevTool zh storage](/img/configuration/rkdevtool-zh-storage.webp)

</TabItem>
<TabItem value="spi" label="SPINOR">

:::tip
SPI Flash 只能烧录对应的 U-BOOT，请勿将镜像烧录到 SPI Flash 中。
:::

![RKDevTool zh SPINOR](/img/configuration/rkdevtool-zh-spinor.webp)

</TabItem>
</Tabs>

选择 `强制按地址写` 后点击 `执行`：

![RKDevTool zh flashing](/img/configuration/rkdevtool-zh-flashing.webp)

等待写入完成，随后设备将自动重启：

![RKDevTool zh complete](/img/configuration/rkdevtool-zh-complete.webp)

</TabItem>
</Tabs>

## FAQ

### 无法进入 MASKROM 模式

如果 SPI Flash 和 eMMC 均存在启动镜像的时候，在上电前需要保证 Maskrom Button （SPI Flash）和 Maskrom Button (eMMC) 同时按下并保持。

### 烧录完镜像后无法进入系统

1. 由于 CM3I 上存在 SPI Flash 和 eMMC 两个启动介质，默认优先从 SPI Flash 启动，SPI Flash 里面的镜像损坏会导致系统无法启动。

2. 可能由于烧录镜像的时候由于操作错误导致将镜像烧录到了 SPI Flash，可以在开始烧录前按住另外一个启动介质的 Maskrom 按钮。例如，如果你想在 eMMC 里烧录镜像，在开始烧录前按住 Maskrom Button（SPI Flash），然后观察到开始烧录的时候再松开按钮。
