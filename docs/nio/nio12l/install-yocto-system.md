---
sidebar_position: 2
---

# Yocto系统安装

Yocto 系统的烧录需要使用 MTK 提供的 Genio Tools 烧录工具，Genio Tools 包含以下工具：

- `genio-config` 检查 Linux 或 Windows 主机是否已正确设置
- `genio-flash` 提供Flash写入功能
- `genio-board` 允许您以编程方式重置开发板

## Genio Tools 环境配置

## Linux 环境配置

### 1. 安装必要软件

```
sudo apt update
sudo apt install git
sudo apt-get install python3
sudo apt-get install python3-pip
```

您可以通过运行以下命令来检查 Python 和 pip 版本：

```
$ python3 --version
Python 3.9.2
$ pip3 --version
pip 21.2.4 from /usr/bin/pip3 (python 3.9)
```

如果您的 pip3 版本低于 20.3。请通过运行以下命令进行升级：

```
pip3 install --upgrade pip
```

### 2. Fstboot 安装

```
sudo apt update
sudo apt-get install android-tools-adb android-tools-fastboot
```

如果您使用的是 Ubuntu 以外的 Linux 发行版，请参阅 [Android SDK Platform-Tools](https://developer.android.com/studio/releases/platform-tools) 安装 fastboot。

### 3. 配置 USB 设备规则

为了让您的主机能够通过 USB 与开发板通信而无需 root 权限，您需要创建一个 udev 规则来授予用户访问您设备的权限：

```
$ echo -n 'SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="201c", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="0003", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="gpio", MODE="0660", TAG+="uaccess"
' | sudo tee /etc/udev/rules.d/72-aiot.rules

$ sudo udevadm control --reload-rules

$ sudo udevadm trigger
```

另外，如果您打算使用 adb 连接到开发板，请添加新的 udev 规则并将您的用户帐户添加到 Plugdev 组：

```
$ echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="201c", MODE="0660", $ GROUP="plugdev"' | sudo tee -a /etc/udev/rules.d/96-rity.rules
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
$ sudo usermod -a -G plugdev $USER
```

udev 是 Linux 内核的设备管理器。它可用于授予用户或组访问设备的权限。在本例中，我们添加了一条 udev 规则，将 Plugdev 组分配给新创建的 SoC USB 设备。为了访问 SoC，您的用户帐户必须是plugdev 组的成员。

### 4. Genio Tools 安装

```
$ pip3 install -U genio-tools
```

:::tip
安装genio-tools后请注销并重新登录。这可确保 PATH 环境变量得到正确更新。
:::

重新登录后，请使用 genio-config 检查您的安装

```
$ genio-config
fastboot: OK
udev rules: OK
```

更多信息请参考 [MTK 官方文档](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/env-setup/flash-env-linux.html)

## Windows 环境配置

### 1. 安装 Git

访问 https://gitforwindows.org/ 下载并安装适用于 Windows 的 git

安装完成后，打开git bash程序，执行以下配置命令：

```
> git config --global http.sslBackend schannel
> git config --global credential.helper manager-core
```

这会将 git 配置为使用 Windows 默认凭据和安全连接通道。

### 2. 安装 Fastboot 和 ADB 驱动

Google USB 驱动程序包含 Windows 上的 `adb` 和 `fastboot` 设备驱动程序。Genio Tools 需要正确安装 fastboot 设备驱动程序。如果使用 rity-demo-image 进行了烧写，adb 就可以用来连接到开发板。

需要安装这两个驱动程序：

- 下载 Google USB 驱动 https://developer.android.com/studio/run/win-usb
- 解压缩下载的 zip 文件。文件名应该类似于 `usb_driver_r13-windows.zip`
- 在解压后的目录中找到该文件 `android_winusb.inf`
- 右键单击文件 `android_winusb.inf` 并从上下文菜单中选择安装

详情请参阅 https://developer.android.com/studio/run/oem-usb#InstallingDriver

在实际连接开发板并进入下载模式之前，可能无法正确检测到 fastboot 设备驱动程序。 您可能需要手动将“未知设备”分配为 Android 引导加载程序设备。 请参考[故障排除](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/flash/flash-troubleshoot-windows.html#missing-yocto-driver)
来执行此操作。

### 3. 安装 Fastboot Tool

- 下载 Windows 版 [SDK Platform-Tools](https://developer.android.com/studio/releases/platform-tools)并解压包

- 将解压后的目录添加到PATH环境变量中

通过以下命令检查是否正确安装：

```
> fastboot --version
fastboot version 34.0.4-10411341
```

版本应大于 34.0.4。

### 4. 安装 Python3

- 下载并安装 Python 3.9 https://www.python.org/downloads/release/python-3912/.

:::tip
在 Windows 平台上安装 genio-tools 时报告了 Python 3.10 的已知问题。如果您使用Windows，我们建议您安装Python 3.9。
:::

确保pip3的版本大于20.3,并通过pip3安裝必要的包：

```
> pip3 --version
pip 21.2.4 from c:\python39\lib\site-packages\pip (python 3.9)
>pip3 install python-certifi-win32 --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host gitlab.com
```

安装完成后，将以下环境变量添加到您的Windows系统中：

```
> setx REQUESTS_CA_BUNDLE %LOCALAPPDATA%\.certifi\cacert.pem
> set REQUESTS_CA_BUNDLE=%LOCALAPPDATA%\.certifi\cacert.pem
```

### 5 安装 Genio Tools

以管理员身份运行以下命令来安装 Genio Tools：

```
> pip3 install -U genio-tools
```

:::tip
缺少依赖项
如果遇到安装错误，例如缺少 `setuptools_scm`，可以先使用以下命令安装软件包：

```
> pip3 install wheel setuptools_scm gpiod libusb1 packaging pyserial pyftdi pyusb pyyaml pyparsing enum34 oyaml windows-curses --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host gitlab.com
```

然后运行 `​​pip3 install -U genio-tools`。
:::

使用以下命令检查是否正确安装:

```
> genio-flash --version
1.3.4
> genio-config
fastboot: OK
```

更多信息请参考 [MTK 官方文档](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/env-setup/flash-env-windows.html#install-genio-tools)

## 镜像烧录步骤

:::tip
安装系统到UFS之前，UFS需要 [格式化](nio/nio12l/format-ufs)
:::

### 1. 下载镜像并解压

- 下载地址:https://github.com/radxa-build/radxa-nio-12l/releases

### 2. 执行 genio-flash

- 开启 overlay 可以添加 --load-dtbo 参数, 例如: genio-flash --load-dtbo palmshell-nio12-radxa-display-8hd.dtbo
  ![install-yocto](/img/nio/nio12l/install-yocto-system.webp)

### 3. 烧录镜像

按住 download key ,使用 TYPE C 数据线连接 TYPE-C OTG 口和你的 PC,开始烧录后可以松开 download key

:::tip
必须先执行步骤2,再执行步骤3
:::

## 参考文档

[MT8395 (Genio 1200) 开发手册](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/hw/mt8395-soc.html)
