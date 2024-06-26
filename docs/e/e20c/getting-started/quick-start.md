---
sidebar_position: 2
---

import { Section, Image } from "@site/src/utils/docs";

# 快速上手

## 实物图

目前 E20C 有多种配置，有带外壳的，有裸板的，有带板载 EMMC 的，有 EMMC 空贴的，请在操作前注意分辨自己的产品型号; 

<img src="/img/e/e20c/radxa-e20c-machine.webp" width="500" alt="radxa-e20c pack" />

要启动 Radxa E20C，您需要以下设备：

- 一个 5V/2A 的电源头（E20C 只支持 5V 输入，可以使用支持 5V 的 PD 电源头）更多过供电详情，请参考[电源方案](./power-supply)。
- 两根 USB TYPE-A 转 TYPE-C 数据线，供电及查看日志输出和访问系统。
- 两根以太网网线

## 安装操作系统

<Tabs queryString="mode">

<TabItem value="withemmc" label="带板载EMMC" default>

出厂自带 [istoreos](../istoreos/istoreos.md) 系统，上电自启动，不需要烧录。

</TabItem>

<TabItem value="withoutemmc" label="不带板载EMMC">

准备MicroSD卡, 参考[安装系统](./install-os/) 安装操作系统。

</TabItem>
</Tabs>

## 接线和上电

连接 WAN 和 LAN， 然后上电，系统会自动起来

<img src="/img/e/e20c/e20c-connect.webp" width="500" alt="e20c connect" />

## 登录

### 浏览器登录

如果此时 LAN 口接到 PC 上，在 PC 上可以通过浏览器通过 iStoreOS 默认的 ip 192.168.100.1 登录到 iStoreOS系统后台, iStoreOS 后台默认用户名为 root， 密码为 password. 

<img src="/img/e/e20c/e20c-istoreos-login.webp" width="700" alt="e20c-istoreos" />

<img src="/img/e/e20c/e20c-istoreos-login-enter.webp" width="700" alt="e20c-istoreos" />

### 串口登录

1.将 USB TYPE-A 转 TYPE-C 数据线的 TYPE-A 口接电脑，TYPE-C 口接 Radxa E20C 调试口，波特率设置为1500000

<img src="/img/e/e20c/radxa-e20c-serial-login1.webp" width="500" alt="radxa-e20c pack" />

2.将电源适配器插入 Radxa E20C 的电源接口。设备上电启动，系统状态灯将亮起。

<img src="/img/e/e20c/radxa-e20c-serial-login2.webp" width="500" alt="radxa-e20c pack" />

3.系统起来之后，系统状态灯会闪烁

<img src="/img/e/e20c/radxa-e20c-power1.webp" width="500" alt="radxa-e20c pack" />

4.如果是 windows 系统，确保电脑已安装 CH340 驱动

将 USB TYPE-A 转 TYPE-C 数据线的 TYPE-A 口接电脑，TYPE-C 口接 Radxa E20C 调试口，在电脑的设备管理器查看是否已经有 CH340 驱动

<img src="/img/e/e20c/radxa-e20c-ch340-install.webp" width="500" alt="radxa-e20c pack" />

能看到上图中的 USB-SERIAL CH340 表示已有驱动，如果没有，请安装 [CH340驱动](https://www.wch.cn/download/CH341SER_EXE.html)

5.使用串口工具

<Tabs queryString="os">
<TabItem value="windows" label="Windows" default>

### Windows

Putty 是一个可以在 Windows 上使用，支持多种波特率的串口工具。下面介绍如何使用 Putty 连接串口。

1. 下载 [Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) 并安装。

2. 将 USB 转 TTL 串口线的 USB 一端插到 PC，查看**设备管理器**，以找到 COM 编号。这里假设是 COM3。

3. 打开 Putty，并按如下方式进行设置：

- 在左边栏目中选择 Session，将串行线路设置为 COM3，波特率设置 1500000，连接类型为 Serial。
- 在 Saved Sessions 列中写入 radxa-e20c ，然后按 Save。

![Putty](/img/common/putty/putty-rk-1.webp)

4. 在左边栏目选择最底下的 Serial 并按照以下参数配置：

![Putty](/img/common/putty/putty-rk-2.webp)

5. 设置完成后，点击 Open 打开串口，确保 TTL 端正确接入之后，接通主板的电源即可。

</TabItem>

<TabItem value="linux" label="Linux">

### Linux

Minicom 是一个可以在 Linux 上使用，支持多种波特率的串口工具。下面介绍如何使用 Minicom 连接串口。

1. 将串口 USB 端插入主机 PC 后，请先找到串口设备：

在终端输入 `dmesg | tail` 会得到类似下面的打印：

```bash
[10.654076] usb 1-6.4.3: new full-speed USB device number 103 using xhci_hcd
[10.755730] usb 1-6.4.3: New USB device found, idVendor=0403, idProduct=6001
[10.755732] usb 1-6.4.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[10.755733] usb 1-6.4.3: Product: USB <-> Serial
[10.755734] usb 1-6.4.3: Manufacturer: FTDI
[10.756728] ftdi_sio 1-6.4.3:1.0: FTDI USB Serial Device converter detected
[10.756750] usb 1-6.4.3: Detected FT232BM
[10.757195] usb 1-6.4.3: FTDI USB Serial Device converter now attached to ttyUSB0
```

依照最后一行所示，**/dev/ttyUSB0** 即是新插入的串口设备。

:::tip
可能存在没有权限读写串口的情况。

**临时处理：通过 chmod 命令修改权限**

```bash
sudo chmod 777 /dev/ttyUSB0
```

**永久处理：通过将当前用户加入 dialout 组**

```bash
sudo usermod -aG dialout $USER
```

:::

2. 安装 minicom：

```bash
sudo apt-get update
sudo apt-get install minicom
```

3. 设置 minicom

首先将当前非 root 或者不使用 sudo 的用户加入 plugdev 组

```bash
sudo usermod -aG plugdev $USER
```

编辑 ~/.bashrc，添加以下参数，重新打开新的终端后即可生效。

```bash
alias minicom='minicom -w -t xterm -l -R UTF-8'
```

创建并且编辑文件 ~/.minirc.1500000-usb0，添加下列内容：

```
pu port             /dev/ttyUSB0
pu baudrate         1500000
pu bits             8
pu parity           N
pu stopbits         1
pu rtscts           No
```

4. 执行以下命令以连接设备，指定参数 1500000-usb0 来使用上面的配置。

```bash
minicom 1500000-usb0
```

</TabItem>

<TabItem value="mac" label="Mac" >

### Mac

Picocom 是一个可以在 Mac 上使用，支持多种波特率的串口工具。下面介绍如何使用 Picocom 连接串口。

1. 安装 picocom

```bash
% brew install --build-from-source radxa/picocom/picocom
```

2. 开启 picocom

```bash
% picocom -b 1500000 -d 8 /dev/tty.usbserial-2130
```

</TabItem>
</Tabs>

### SSH 登录

1.将网线接到 WAN 或者 LAN 口，下面以接入 WAN 口举例说明如何用 SSH 方式访问设备

<img src="/img/e/e20c/radxa-e20c-serial-net-login1.webp" width="500" alt="radxa-e20c pack" />

2.将电源适配器插入 Radxa E20C 的电源接口。设备上电启动，系统状态灯将亮起。

<img src="/img/e/e20c/radxa-e20c-serial-net-login2.webp" width="500" alt="radxa-e20c pack" />

3.系统起来之后，系统状态灯会闪烁，WAN 口的灯也将会亮起

<img src="/img/e/e20c/radxa-e20c-power2.webp" width="500" alt="radxa-e20c pack" />

4.查找 IP

iStoreOS 系统默认ip地址是 192.168.100.1

但是如果用户自己修改了可以使用 Angryip 这个工具去查询

- 首先主机需要下载 [Angryip](https://angryip.org/download/)，然后确保主机和主板在同一个局域网内。

- 打开 Angryip，选择 IP 范围为 192.168.2.0 - 192.168.2.255（选择主机和主板所在的网段），点击开始，如图所示。

- ![Angryip](/img/configuration/ssh-Angryip.webp)

- Ctrl + F 查找 `2a` 关键字，找到主板的 IP 地址。

  5.SSH 连接到 Radxa E20C

```bash
ssh [username]@[IP address] # or ssh [username]@[hostname]
```
默认用户名: root
默认密码: password
