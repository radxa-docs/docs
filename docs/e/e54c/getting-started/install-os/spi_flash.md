---
sidebar_position: 4
---

# 擦除/烧录 SPI 启动固件

主要介绍如何使用 RKDevTool 工具擦除和烧录 SPI 启动固件。

:::tip
瑞莎 E54C 出厂默认烧录 SPI 启动固件到 SPI Flash。

对于系统启动异常的用户，可以尝试擦除 SPI Flash，然后重新烧录 SPI 启动固件。
:::

## SPI 启动固件说明

SPI启动固件（BootROM + 引导程序）的核心任务是分阶段初始化硬件（CPU → 内存 → 存储），最终通过存储设备加载操作系统内核。

## 提前准备

我们需要使用 RKDevTool 工具进行 SPI Flash 擦除和烧录操作。

:::tip
RKDevTool 是 Rockchip 为 Windows/Linux/macOS 平台下进行 USB 烧录所开发的软件。
:::

### RKDevTool 安装

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

### 进入 Maskrom 模式

Radxa E54C 有一个专用的 Maskrom 按键，在系统启动过程中检测到该键被按下，系统会自动进入 Maskrom 模式！

#### 所需设备

- 一根 USB Type-A 转 USB Type-C 数据线
- 一个插针或者一根牙签
- 12V/2A DC电源适配器（ DC5525 ）

#### 进入模式

1. 使用 USB Type-C 接口连接 Radxa E54C，USB Type-A 连接 PC

2. 使用插针或者牙签按住 Maskrom 按键

3. 插上 12V/2A DC 电源适配器

4. 松开 Maskrom 按键

正常情况下进入 Maskrom 模式电源指示灯会常亮，若现象不符合，可以重新按照步骤进行操作！

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-maskrom.webp" style={{width: '100%', maxWidth: '700'}} />
</div>

## 擦除 SPI 启动固件

:::danger
擦除 SPI 启动固件操作会擦除 SPI Flash 中的 SPI 启动固件，擦除后 SPI Flash 中的数据将被清空，系统将无法启动。
:::

我们需要让 E54C 处于 Maskrom 模式，然后使用 RKDevTool 工具进行 SPI Flash 擦除操作。

<Tabs queryString="platform">

<TabItem value="Windows">

① : 确保 E54C 处于 Maskrom 模式。

② : 选择 E54C 对应的 Loader 文件，可以去 [资源汇总下载](../../download) 下载 Loader 文件。

③ : 点击 `Download` 选项，运行 Loader 文件。

④ : 选择 `SPINOR` 选项。

⑤ : 选择 `Switch Storage` 选项切换存储。

⑥ : 选择 `Erase ALL` 选项擦除 SPI Flash。

⑦ : 可以通过该界面观察操作进度。

重启系统，擦除 SPI Flash 的操作生效。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rk-earse-spi-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux / MacOS">

1. 确保 E54C 处于 Maskrom 模式。

2. 验证 Maskrom 模式

使用 rkdeveloptool ld 命令查看识别到的设备信息：

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
rkdeveloptool ld
```
</NewCodeBlock>

输出类似内容：说明识别到一个 Maskrom 设备

```
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

3. 运行 Loader 文件

你需要将 `demo.bin` 换成 E54C 对应的 Loader 文件，可以去 [资源汇总下载](../../download) 下载 Loader 文件。

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool db  demo.bin
```
</NewCodeBlock>

4. 擦除 SPI Flash

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool ef
```
</NewCodeBlock>

5. 重启系统，擦除 SPI Flash 的操作生效

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>

## 烧录 SPI 启动固件

使用 RKDevTool 工具烧录 SPI 启动固件。

<Tabs queryString="platform">

<TabItem value="Windows">

① 确认 E54C 处于 Maskrom 模式。

② 选择 E54C 对应的 Loader 文件，可以去 [资源汇总下载](../../download) 下载 Loader 文件。

③ 选择对应存储设备，我们这里选择 `SPINOR` 选项。

④ 选择你需要烧录进去 SPI Flash 的 `spi.img` 文件，可以去 [资源汇总下载](../../download) 下载 SPI 启动固件。

⑤ 勾选 `Write by Address` 选项。

⑥ 点击 `RUN` 选项执行所有操作。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rk-down-spi-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux / MacOS">

1. 确保 E54C 处于 Maskrom 模式。

2. 验证 Maskrom 模式

使用 rkdeveloptool ld 命令查看识别到的设备信息：

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
rkdeveloptool ld
```
</NewCodeBlock>

输出类似内容：说明识别到一个 Maskrom 设备

```
DevNo=1	Vid=0x2207,Pid=0x350e,LocationID=109 Maskrom
```

3. 运行 Loader 文件

你需要将 `demo.bin` 换成 E54C 对应的 Loader 文件，可以去 [资源汇总下载](../../download) 下载 Loader 文件。

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool db  demo.bin
```
</NewCodeBlock>

4. 烧录 SPI 启动固件

你需要将 `spi.img` 换成 E54C 对应的 SPI 启动固件，可以去 [资源汇总下载](../../download) 下载 SPI 启动固件。

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool wl 0 spi.img
```
</NewCodeBlock>

5. 重启系统，烧录 SPI Flash 的操作生效

<NewCodeBlock tip="Linux/MacOS-Host$" type="host">
```
sudo rkdeveloptool rd
```
</NewCodeBlock>

</TabItem>

</Tabs>
