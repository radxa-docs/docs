---
sidebar_position: 3
---

# 在 Windows 主机上烧录 Yocto 系统

Yocto 系统的烧录需要使用联发科提供的 Genio Tools 烧录工具，Genio Tools 包含以下工具：

- `genio-config` 检查 Linux 或 Windows 主机是否已正确设置
- `genio-flash` 提供镜像写入功能
- `genio-board` 允许以编程方式重置联发科评估板

测试过的主机有：

- Windows10
- Windows11

## Genio Tools 环境配置

### 1. 安装 Git

访问 https://gitforwindows.org/ 下载并安装适用于 Windows 的 git

安装完成后，打开git bash程序，执行以下配置命令：

```
> git config --global http.sslBackend schannel
> git config --global credential.helper manager-core
```

这会将 git 配置为使用 Windows 默认凭据和安全连接通道。

### 2. 安装 Fastboot 和 ADB 驱动

Google USB 驱动程序包含 Windows 上的 `adb` 和 `fastboot` 设备驱动程序。Genio Tools 需要正确安装 fastboot 设备驱动程序。

需要安装这两个驱动程序：

- 下载 Google USB 驱动 https://developer.android.com/studio/run/win-usb
- 解压缩下载的 zip 文件。文件名应该类似于 `usb_driver_r13-windows.zip`
- 在解压后的目录中找到该文件 `android_winusb.inf`
- 右键单击文件 `android_winusb.inf` 并从上下文菜单中选择安装

详情请参阅 https://developer.android.com/studio/run/oem-usb#InstallingDriver

在实际连接开发板并进入下载模式之前，可能无法正确检测到 fastboot 设备驱动程序。 您可能需要手动将“未知设备”分配为 Android 引导加载程序设备。 请参考[故障排除](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/flash/flash-troubleshoot-windows.html#missing-yocto-driver)来执行此操作。

### 3. 安装 Fastboot Tool

- 下载 Windows 版 [SDK Platform-Tools](https://developer.android.com/studio/releases/platform-tools)并解压包

- 将解压后的目录添加到 PATH 环境变量中

通过以下命令检查是否正确安装：

```
> fastboot --version
fastboot version 34.0.4-10411341
```

版本应大于 34.0.4。

### 4. 安装 Python3

- 下载并安装 Python 3.9 https://www.python.org/downloads/release/python-3912/.

:::tip
在 Windows 平台上安装 genio-tools 时报告了 Python 3.10 的已知问题。如果您使用 Windows，我们建议您安装 Python 3.9。
:::

确保 pip3 的版本大于 20.3，并通过pip3安裝必要的包：

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

### 5. 安装 Genio Tools

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

## 烧录 Yocto 镜像

### 获取 Yocto 镜像

请到 [**资源下载**](../download/README) 镜像下载部分下载 Yocto 镜像并解压。

### 格式化 UFS

烧录系统到 UFS 之前，需要先[格式化 UFS](/nio/nio12l/installation/format-ufs)。

### 开始烧录 Yocto 系统

#### 执行 genio-flash

在主机上，进入存放 Yocto 系统文件的目录。在窗口空白处，单机鼠标右键，选择“在终端中打开”，进入 PowerShell 环境。
输入命令 “genio-flash”。

#### NIO 12L 进入烧录模式

NIO 12L 进入烧录模式的步骤：- 按住 **Download Button** - 使用 USB Type-C 数据线，一端接 NIO 12L 的 **Type-C OTG 口**，另一端接 PC 的 USB-A 口 - 释放 **Download Button**

![NIO 12L Download](/img/nio/nio12l/n12l_download.webp)
成功进入烧录模式后，将会执行烧录步骤。

:::tip
必须先执行步骤“执行命令 genio-flash”，再执行步骤“板子进入烧录模式”。
:::

## 参考文档

[MT8395 (Genio 1200) 开发手册](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/hw/mt8395-soc.html)
