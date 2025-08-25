---
sidebar_position: 0
---

# RKDevTool使用

RKDevTool 是 Rockchip 为 Windows/Linux/macOS 平台下进行 USB 烧录所开发的软件。

## RKDevTool安装

<Tabs queryString="e24c-erase">

<TabItem value="Windows">

- 安装驱动

下载并解压 [DriverAssistant v5.0](https://dl.radxa.com/tools/windows/DriverAssistant_v5.0.zip)文件。

找到 ` DriverInstall.exe`文件并以管理员身份运行：

安装驱动： 点击 `Install Driver` 选项

卸载驱动： 点击 `Uninstall Driver` 选项

:::tip
若之前安装过其他版本驱动，请先卸载再安装驱动
:::

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/rkddevtool.webp" style={{width: '50%', maxWidth: '700'}} />
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

## RKDevTool使用

:::tip
Maskrom 模式是嵌入式设备的“硬件急救箱”，通过直接操作芯片底层接口实现设备修复。

Maskrom 模式是 Rockchip 芯片内置的底层恢复模式，当设备无法从任何启动介质( eMMC、 SD 卡等)加载有效引导程序时自动进入。

此模式允许通过 RockUSB 协议重新烧写设备固件。
:::

### 进入Maskrom模式

Radxa E24C 有一个专用的 Maskrom 按键，在系统启动过程中检测到该键被按下，系统会自动进入 Maskrom 模式！

#### 所需设备

- 一根 USB Type-A 转 USB Type-C 数据线
- 一个插针或者一根牙签
- 12V/2A DC电源适配器（ DC5525 ）

#### 进入模式

1. 使用 USB Type-C 接口连接 Radxa E24C，USB Type-A 连接 PC

2. 使用插针或者牙签按住 Maskrom 按键

3. 插上 12V/2A DC 电源适配器

4. 松开 Maskrom 按键

正常情况下进入 Maskrom 模式电源指示灯会常亮，若现象不符合，可以重新按照步骤进行操作！

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-maskrom.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

### 擦除eMMC

<Tabs queryString="e24c-erase">

<TabItem value="Windows">

使用 RKDevTool 工具对 eMMC 进行擦除。

使用工具前需要确保 PC 可以识别进入 Maskrom 模式的设备，然后进行下面操作。

1. 打开 RKDevTool 工具

确保主机可以识别 Maskrom 并选择高级选项。

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-01.webp" style={{width: '90%', maxWidth: '700'}} />
</div>

2. 写入 Loader

进入[资源下载汇总](../../../download)页面下载对应的 Loader 文件，将 `Boot` 选项选择的文件修改成实际下载的文件。

- ① : 选择文件路径
- ② : 下载 Loader文件
- ③ : 操作反馈的信息

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-02.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

3. 读取存储容量

选择 `ReadCapability` 选项读取当前设备存储容量。

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-03.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

4. 清空 eMMC

先选中 `EMMC` ，点击 `Switch Storage` 进行存储切换，最后点击 `EraseALL` 选项清空 eMMC 内容。

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-04.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

5. 重启设备

点击 `ResetDevice` 选项重启设备。

<div style={{textAlign: 'left'}}>
  <img src="/img/e/e24c/emmc-rkdevtool-05.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

</TabItem>

<TabItem value="Linux/macOS">

使用 RKDevTool 工具对 eMMC 进行擦除。

使用工具前需要确保 PC 可以识别进入Maskrom模式的设备，然后打开系统终端或命令行进行下面操作。

1. 生成空镜像

在当前目录生成内容全为0的64MB文件。

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
dd if=/dev/zero of=./zero.img bs=1M count=64
```
</NewCodeBlock>

2. 检查设备

检查设备是否可以识别 Maskrom。

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool ld
```
</NewCodeBlock>

正常输出内容：识别到一个设备

```
DevNo=1	Vid=0x2207,Pid=0x350c,LocationID=101	Maskrom
```

1. 写入 Loader

进入[资源下载汇总](../../../download)页面下载对应的 Loader 文件，将下面的`xxx.bin`文件名称修改成实际下载的文件名称。

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool db xxx.bin
```
</NewCodeBlock>

4. 清空 eMMC

使用 RKDevTool 工具将 zero.img 写入设备的起始扇区，用于擦除或初始化 Rockchip 设备的 eMMC。

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool wl 0 zero.img
```
</NewCodeBlock>

5. 重启设备

使用 RKDevTool 工具重启设备。

<NewCodeBlock tip="Linux/macOS-host$" type="host">
```
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>
