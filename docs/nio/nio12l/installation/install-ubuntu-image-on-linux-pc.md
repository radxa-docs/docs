---
sidebar_position: 2
description: ""
---

# 在 Linux 主机上烧录 Ubuntu 系统

Ubuntu 系统的烧录需要使用联发科提供的 Genio Tools 烧录工具，Genio Tools 包含以下工具：

- `genio-config` 检查 Linux 或 Windows 主机是否已正确设置
- `genio-flash` 提供镜像写入功能
- `genio-board` 允许以编程方式重置联发科评估板

测试过的 Ubuntu 主机：

- Ubuntu20
- Ubuntu22

## Genio Tools 环境配置

### 1. 安装必要软件

```
$ sudo apt update
$ sudo apt install -y git python3 python3-pip
```

运行以下命令来检查 Python 和 pip 版本：

```
$ python3 --version
Python 3.9.2
$ pip3 --version
pip 21.2.4 from /usr/bin/pip3 (python 3.9)
```

如果 pip3 版本低于 20.3。请通过运行以下命令进行升级：

```
$ pip3 install --upgrade pip
```

### 2. Fastboot 安装

```
$ sudo apt update
$ sudo apt install -y android-tools-adb android-tools-fastboot
```

如果主机运行的是 Ubuntu 以外的 Linux 发行版，请参阅 [Android SDK Platform-Tools](https://developer.android.com/studio/releases/platform-tools) 安装 fastboot。

### 3. 配置 USB 设备规则

为了让主机能够通过 USB 与设备通信而无需 root 权限，我们需要创建一个 udev 规则来授予用户访问设备的权限：

```
$ echo -n 'SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="201c", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="0003", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="0403", MODE="0660", TAG+="uaccess"
SUBSYSTEM=="gpio", MODE="0660", TAG+="uaccess"
' | sudo tee /etc/udev/rules.d/72-aiot.rules

$ sudo udevadm control --reload-rules

$ sudo udevadm trigger
```

另外，如果使用 adb 连接到开发板，请添加新的 udev 规则并将您的用户帐户添加到 plugdev 组：

```
$ echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="201c", MODE="0660", $ GROUP="plugdev"' | sudo tee -a /etc/udev/rules.d/96-rity.rules
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
$ sudo usermod -a -G plugdev $USER
```

udev 是 Linux 内核的设备管理器。它可用于授予用户或组访问设备的权限。在本例中，我们添加了一条 udev 规则，将 plugdev 组分配给新创建的 SoC USB 设备。为了访问 SoC，主机的用户帐户必须是 plugdev 组的成员。

### 4. Genio Tools 安装

```
$ pip3 install -U genio-tools
```

:::tip
安装 genio-tools 后请注销并重新登录。这可确保 PATH 环境变量得到正确更新。
:::

重新登录后，请使用 genio-config 检查您的安装。

```
$ genio-config
fastboot: OK
udev rules: OK
```

更多信息请参考[联发科官方文档](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/sw/yocto/get-started/env-setup/flash-env-linux.html)

## 烧录 Ubuntu 镜像

### 获取 Ubuntu 镜像

请到 [**资源下载**](../download) 镜像下载部分下载 Ubuntu 镜像，然后解压。

### 格式化 UFS

烧录系统到 UFS 之前，需要先[格式化 UFS](./format-ufs)。

### 开始烧录 Ubuntu 系统

#### 执行 genio-flash

对于 DDR 4GB NIO 12L，烧录指令是

```
radxa@ubuntu:~$ cd ~/baoshan-classic-desktop-2204-x01-20231005-133-g1200-radxa-nio-12l-ufs-b7/
radxa@ubuntu:~/baoshan-classic-desktop-2204-x01-20231005-133-g1200-radxa-nio-12l-ufs-b7$ cp fip-ddr4g.bin fip.bin && cp u-boot-initial-env-ddr4g u-boot-initial-env
radxa@ubuntu:~/baoshan-classic-desktop-2204-x01-20231005-133-g1200-radxa-nio-12l-ufs-b7$ genio-flash
Genio Tools: v1.3.6
Ubuntu Image:
	edition:  Ubuntu classic/core images
	version:  22.04
	codename: jammy

WARNING:aiot:No 'ftdi-cbus' device found
WARNING:aiot:Unable to find and reset the board. Possible causes are:
1. This is not a Genio 350/700 EVK, nor a Pumpkin board.
2. The board port UART0 is not connected.
3. The UART0 port is being opened by another tool, such as TeraTerm on Windows.
You can now manually reset the board into DOWNLOAD mode.

INFO:aiot:Continue flashing...
```

对于 DDR 8GB NIO 12L，烧录指令是

```
radxa@ubuntu:~$ cd ~/baoshan-classic-desktop-2204-x01-20231005-133-g1200-radxa-nio-12l-ufs-b7/
radxa@ubuntu:~/baoshan-classic-desktop-2204-x01-20231005-133-g1200-radxa-nio-12l-ufs-b7$ cp fip-ddr8g.bin fip.bin && cp u-boot-initial-env-ddr8g u-boot-initial-env
radxa@ubuntu:~/baoshan-classic-desktop-2204-x01-20231005-133-g1200-radxa-nio-12l-ufs-b7$ genio-flash
Genio Tools: v1.3.6
Ubuntu Image:
	edition:  Ubuntu classic/core images
	version:  22.04
	codename: jammy

WARNING:aiot:No 'ftdi-cbus' device found
WARNING:aiot:Unable to find and reset the board. Possible causes are:
1. This is not a Genio 350/700 EVK, nor a Pumpkin board.
2. The board port UART0 is not connected.
3. The UART0 port is being opened by another tool, such as TeraTerm on Windows.
You can now manually reset the board into DOWNLOAD mode.

INFO:aiot:Continue flashing...
```

对于 DDR 16GB NIO 12L，烧录指令是

```
radxa@ubuntu:~$ cd ~/baoshan-classic-desktop-2204-x01-20231005-133-g1200-radxa-nio-12l-ufs-b7/
radxa@ubuntu:~/baoshan-classic-desktop-2204-x01-20231005-133-g1200-radxa-nio-12l-ufs-b7$ cp fip-ddr16g.bin fip.bin && cp u-boot-initial-env-ddr16g u-boot-initial-env
radxa@ubuntu:~/baoshan-classic-desktop-2204-x01-20231005-133-g1200-radxa-nio-12l-ufs-b7$ genio-flash
Genio Tools: v1.3.6
Ubuntu Image:
	edition:  Ubuntu classic/core images
	version:  22.04
	codename: jammy

WARNING:aiot:No 'ftdi-cbus' device found
WARNING:aiot:Unable to find and reset the board. Possible causes are:
1. This is not a Genio 350/700 EVK, nor a Pumpkin board.
2. The board port UART0 is not connected.
3. The UART0 port is being opened by another tool, such as TeraTerm on Windows.
You can now manually reset the board into DOWNLOAD mode.

INFO:aiot:Continue flashing...
```

#### NIO 12L 进入烧录模式

NIO 12L 进入烧录模式的步骤：

- 按住 **Download Button**
- 使用 USB Type-C 数据线，一端接 NIO 12L 的 **Type-C OTG 口**，另一端接 PC 的 USB-A 口
- 释放 **Download Button**

![NIO 12L Download](/img/nio/nio12l/n12l_download.webp)
成功进入烧录模式后，会自动开始下载。

:::tip
必须先执行步骤“执行 genio-flash”，再执行步骤“进入烧录模式”。
:::

## 参考文档

[MT8395 (Genio 1200) 开发手册](https://mediatek.gitlab.io/aiot/doc/aiot-dev-guide/master/hw/mt8395-soc.html)
