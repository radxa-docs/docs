---
sidebar_position: 5
---

# 安装系统到 eMMC

## 准备工作

- 1x USB 线 （一端 USB C，一端 USB A）
- 1x 5V 电源适配器，建议使用额定最大电流大于2A的电源适配器 (推荐使用 [Radxa Power PD30W](../../../accessories/pd_30w))

## 镜像下载

请到 [资源下载汇总](../getting-started/download) 下载对应的镜像文件

### 进入 Maskrom 模式

请按以下步骤进入 Maskrom 模式：

1. 按住 USB BOOT 按键
2. 将 USB-A 转 USB-C 线缆的 USB-A 端口接入 PC, USB-C 接口插入 ZERO 的 OTG 端口
3. 松开 USB BOOT 按键

![ZERO Maskrom](/img/zero/zero/Zero_ports.webp)

## 安装系统到 eMMC

### 环境准备

<Tabs queryString="host_os">
<TabItem value="Windows">

1. 将瑞莎 ZERO 以 [Maskrom 模式](#进入-maskrom-模式)连接电脑

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

   [RZ USB Boot Helper](https://dl.radxa.com/zero/tools/windows/RZ_USB_Boot_Helper_V1.0.0.zip) 是一款由 Radxa 制作的 Windows 工具，用于 Maskrom 通信。

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

类似于 Windows 平台，您也可以在终端中运行以下命令，使用 nexus-tools 安装 fastboot，如果不需要这些，也可以跳过这一步：

```bash
bash <(curl -s https://raw.githubusercontent.com/corbindavenport/nexus-tools/master/install.sh)
```

</TabItem>
<TabItem value="Linux">

```bash
sudo apt update
sudo apt install python3-pip
sudo pip3 install pyamlboot
```

类似于 Windows 平台，您也可以在终端中运行以下命令，使用 nexus-tools 安装 fastboot，如果不需要这些，也可以跳过这一步：

```bash
bash <(curl -s https://raw.githubusercontent.com/corbindavenport/nexus-tools/master/install.sh)
```

</TabItem>
</Tabs>
</TabItem>
</Tabs>

### 烧录固件

<Tabs queryString="host_os">
<TabItem value="Windows">

工具检测到 Maskrom 模式后，你就可以点击 `Select` 按钮来选择 [radxa-zero-erase-emmc.bin](https://dl.radxa.com/zero/images/loader/radxa-zero-erase-emmc.bin) 文件，然后点击 `Run` 按钮进行加载：

![Rz fastboot](/img/zero/zero2pro/Rz-usb-helper-fastboot.webp)

运行结果如上图所示。

在此之后，您的电脑将会将瑞莎 ZERO 识别为一个 USB 存储设备，您只需按照[操作系统安装指南](../getting-started/install-os)中的操作将系统镜像烧录其中，再正常启动即可。

</TabItem>
<TabItem value="Linux/MacOS">

在此平台下，您可以使用 boot-g12.py 工具。

运行以下命令来进行烧录：

```bash
boot-g12.py radxa-zero-erase-emmc.bin
```

在 Linux 平台下，还需要增加 `sudo` 以获取权限：

```bash
sudo boot-g12.py radxa-zero-erase-emmc.bin
```

在此之后，您的电脑将会将瑞莎 ZERO 识别为一个 USB 存储设备，您只需按照[操作系统安装指南](../getting-started/install-os)中的操作将系统镜像烧录其中，再正常启动即可。

</TabItem>
</Tabs>
