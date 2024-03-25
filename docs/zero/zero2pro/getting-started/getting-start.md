---
sidebar_position: 5
---

import Etcher from '../../../common/general/\_etcher.mdx'

# 新手入门

本指南是为 瑞莎 ZERO 2 PRO 初级使用者编写，可以帮助您了解 瑞莎 ZERO 2 PRO 基本的准备和设置。
当您拿到一块 瑞莎 ZERO 2 PRO 主板时，建议您首先查看印在电路板上面的型号和硬件版本。

## 必要项

- 瑞莎 ZERO 2 PRO

- microSD 卡，容量不小于 8GB（如果您的 ZERO 2 PRO 配备板载 eMMC，您可以直接将系统烧录其中）

- 电源：
  瑞莎 ZERO 2 PRO 采用 Type-C 接口供电，仅支持 5V 输入。

  :::tip
  瑞莎推荐使用 [瑞莎 Power PD30W](/accessories/pd_30w)。
  :::

- Type-C 集线器及 USB 键鼠
  ZERO 2 PRO 拥有两个 Type-C 接口，其中一个用于供电时，另一个可使用 Type-C 集线器来扩展键鼠或其他外设。

- 显示器和 micro HDMI 线
  ZERO 2 PRO 配备的是 micro HDMI 接口。建议使用具有 HDMI 功能的显示器，最高支持 4K60p 分辨率。

- microSD 读卡器
  将镜像刷写到 microSD 卡上。

## 可选项

- USB-A 转 USB-C 线：
  用于 `fastboot`/`adb` 命令和 maskrom 模式通信，线刷时需要使用到此配件。

- USB 转 TTL 串口线：
  用于[串口调试](../low-level-dev/serial)。

- 音频线
  可通过扬声器或标准 3.5 毫米插孔的耳机播放音频。

## 系统安装

首先，选择您要使用的[官方镜像](/zero/images)并下载。

然后，使用 Etcher 将镜像刷写到 microSD 卡中。

<Etcher model="zero2pro" />

最后，将 microSD 卡插入主板上的插口，并通过 Type-C 电源适配器供电启动。

### 线刷

如果需要将系统烧录进板载 eMMC 中，需要使用 USB-A 转 USB-C 线来进行线刷烧录。

#### 环境准备

<Tabs queryString="host_os">
<TabItem value="Windows">

1. 将瑞莎 ZERO 2 PRO 以 [Maskrom 模式](#maskrom-模式)连接电脑

2. 下载并安装 [Zagdig](https://zadig.akeo.ie/) USB 驱动

   确保展示的信息为 `GX-CHIP`，USB ID 为 `1B8E:C003`，选择 `libusb-win32`，然后点击 `Install Driver` 安装驱动程序。

   ![Zagdig libusb](/img/zero/zero2pro/Zagdig-libusb.webp)

   此外，您还可以在 PowerShell 中运行以下命令，使用 nexus-tools 安装 fastboot：

   :::tip
   fastboot 用于安装 Android 或手动清除 eMMC 启动加载器。如果不需要这些，可以跳过这一步。
   :::

   ```bash
   iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/corbindavenport/nexus-tools/master/install.ps1'))
   ```

   您还需要 Google 提供的 [Android 驱动程序](https://dl.google.com/android/repository/usb_driver_r13-windows.zip)。

   解压缩后右击 .inf 文件安装驱动程序。

   ![Android driver](/img/zero/zero2pro/Install-win-android-driver.webp)

   [RZ USB Boot Helper](https://dl.radxa.com/zero/tools/windows/RZ_USB_Boot_Helper_V1.0.0.zip) 是一款由 Radxa 制作的 Windows 工具，用于 maskrom 通信。

   该工具会在其界面上列出当前模式。现在我们使用的是 Maskrom 模式：

   ![Rz maskrom](/img/zero/zero2pro/Rz-usb-helper-maskrom.webp)

</TabItem>
<TabItem value="Linux/MacOS">

在这类平台上，我们可以使用 Amlogic boot tool 来加载二进制文件。首先确认已安装 [python](https://www.python.org/) 环境，然后在新终端中运行以下命令：

<Tabs queryString="nix">
<TabItem value="MacOS">

```bash
brew install python lsusb libusb
pip3 install pyamlboot
```

</TabItem>
<TabItem value="Linux">

```bash
sudo apt update
sudo apt install python3-pip
sudo pip3 install pyamlboot
```

</TabItem>
</Tabs>

类似于 Windows 平台，您也可以在终端中运行以下命令，使用 nexus-tools 安装 fastboot，如果不需要这些，也可以跳过这一步：

```bash
bash <(curl -s https://raw.githubusercontent.com/corbindavenport/nexus-tools/master/install.sh)
```

</TabItem>
</Tabs>

#### 烧录固件

<Tabs queryString="host_os">
<TabItem value="Windows">

工具检测到 Maskrom 模式后，你就可以点击 `Select` 按钮来选择 Loader 文件，然后点击 `Run` 按钮进行加载：

![Rz fastboot](/img/zero/zero2pro/Rz-usb-helper-fastboot.webp)

运行结果如上图所示。

在此之后，您的电脑将会将瑞莎 ZERO 2 PRO 识别为一个 USB 存储设备，您只需按照[操作系统安装指南](install-os)中的操作将系统镜像烧录其中，再正常启动即可。

</TabItem>
<TabItem value="Linux/MacOS">

在此平台下，您可以使用 boot-g12.py 工具。

运行以下命令来进行烧录：

```bash
boot-g12.py radxa-zero2-2pro-erase-emmc.bin
```

在 Linux 平台下，还需要增加 `sudo` 以获取权限：

```bash
sudo boot-g12.py radxa-zero2-2pro-erase-emmc.bin
```

在此之后，您的电脑将会将瑞莎 ZERO 2 PRO 识别为一个 USB 存储设备，您只需按照[操作系统安装指南](install-os)中的操作将系统镜像烧录其中，再正常启动即可。

</TabItem>
</Tabs>

### Loader 文件

- [radxa-zero2-2pro-erase-emmc.bin](https://dl.radxa.com/zero2pro/images/loader/radxa-zero-2pro-erase-emmc.bin)：自动擦除 eMMC，然后将 eMMC 作为 USB 存储设备显示。这是加载新 Linux 映像的推荐方法。

- [rz-2pro-fastboot-loader.bin](https://dl.radxa.com/zero2pro/images/loader/rz-2pro-fastboot-loader.bin)：启用 fastboot 模式。其不能用于安装我们的官方 Android 系统。

- [rz-2pro-udisk-loader.bin](https://dl.radxa.com/zero2pro/images/loader/rz-2pro-udisk-loader.bin): 将板载 eMMC 作为 USB 大容量存储设备。

- [u-boot.bin](https://dl.radxa.com/zero2pro/images/loader/u-boot.bin)：用于 USB 启动的主线 U-Boot 引导加载器。如果刷写到 eMMC/microSD，则无法工作。

- [u-boot.bin.sd.bin](https://dl.radxa.com/zero2pro/images/loader/u-boot.bin.sd.bin)：用于 eMMC/microSD 启动的主线 U-Boot 引导加载程序。

### Maskrom 模式

请按以下步骤进入 Maskrom 模式：

1. 按住 Maskrom 按键
2. 将 USB-A 转 USB-C 线缆的 USB-A 端口接入 PC, USB-C 接口插入 ZERO 2 PRO 的 OTG 端口
3. 松开 Maskrom 按键

![ZERO 2 PRO Maskrom](/img/zero/zero2pro/zero2pro-maskrom.webp)
