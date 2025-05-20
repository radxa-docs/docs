---
sidebar_position: 1
---

# 快速上手

## 1. 产品实物图

:::tip
教程以 Radxa E24C 外壳版作为示意图演示！
:::

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '0px', fontSize: '18px', color: '#000000'}}>E24C 俯视图</div>
  <img src="/img/e/e24c/e24c-01-shell.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
  <div style={{textAlign: 'center', marginTop: '0px', marginBottom: '10px', fontSize: '18px', color: '#000000'}}>E24C 侧视图</div>
  <img src="/img/e/e24c/e24c-02-shell.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## 2. 使用前提

正常启动和使用 Radxa E24C 设备,您需要准备以下配件：电源适配器、系统启动介质、调试数据线( USB Type-A 转 Type-C 数据线)。

:::tip
对于不同开发能力的用户，我们建议额外增加以下配件使用 Radxa E24C ，这样会缩短熟悉产品和开发的时间。

- 初学者

准备配件：电源适配器、系统启动介质、显示器、HDMI数据线

- 开发者

准备配件：电源适配器、系统启动介质、调试数据线( USB Type-A 转 Type-C 数据线)

说明：其中显示器可以显示系统界面和进行图形化操作！
:::

### 2.1 主板供电

使用 DC5525 接口的 12V/2A 电源适配器进行供电。

:::tip

Radxa E24C 仅支持 12V 电源输入，建议电流 2A 及以上，以确保所有外设稳定运行。

参考电源：

- [瑞莎 DC12 36W电源适配器](https://radxa.com/products/accessories/power-dc12-36w)(推荐使用)
- [瑞莎 DC12 60W电源适配器](https://radxa.com/products/accessories/power-dc12-60w)
- 标准12V/2A DC电源适配器(DC5525接口)

:::

### 2.2 系统启动介质

Radxa E24C 支持多种配置选购，主要关注主板有无板载 eMMC。

**对于无 eMMC 的主板**：需要准备 MicroSD 卡和读卡器。

**对于有 eMMC 的主板**：出厂会提前安装好系统，直接使用即可！

### 2.3 调试数据线

Radxa E24C 上有一个 USB Type‑C 型接口，主要用于调试和访问系统。

## 3. 安装操作系统

<Tabs queryString="e24c-system">

<TabItem value="无板载eMMC系统">

对于无板载 eMMC 系统的用户，需要使用读卡器给 MicroSD 卡写入系统。

- 系统下载

进入[资源下载汇总](../download)页面下载对应的操作系统镜像压缩包，下载完成后解压系统镜像压缩包，得到的 `*.img` 后缀文件就是后面安装系统镜像需要的文件。

:::tip
下载的系统镜像是一个压缩文件，需要解压后才能通过镜像烧录软件写入到SD卡
:::

- 硬件连接

将 MicroSD 卡插入读卡器中，然后将读卡器插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-sd-insert.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- 镜像烧录工具

我们推荐使用瑞莎合作伙伴 Balena 开发的开源镜像烧录工具 Etcher，该软件使用简单，功能强大，支持 Windows/Linux/macOS 系统使用。

进入官网下载系统对应平台的软件：[balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

进入下载页面后，选择对应的系统平台进行 Etcher 软件下载。

<div style={{textAlign: 'center'}}>
<img src="/img/e/e24c/e24c-down-etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

:::tip
Windows 和 Linux 只需要打开对应程序就可以使用，无需安装！
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-down-etcher-00.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- 安装系统镜像

1. 选择主板对应的系统镜像：点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

2. 选择 MicroSD 卡对应的磁盘：点击 `Select target` 选项，选择自己接入 PC 的读卡器对应磁盘设备。

:::danger
请勿选错磁盘，否则 Etcher 将格式化被选中的磁盘，造成重要数据丢失！
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

① ： 选择需要安装系统镜像的磁盘设备

② ： 点击 `Select 1` 选项确认设备选择

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

3.开始写入系统镜像：点击 `Flash` 选项，等待软件自动进行系统镜像的写入和校验。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-04.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统写入完成
  <img src="/img/e/e24c/etcher-05.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统校验完成
  <img src="/img/e/e24c/etcher-07.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

4.成功写入系统镜像后，关闭 Etcher 软件！

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/etcher-06.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="有板载 eMMC 系统">

对于有板载 eMMC 系统的用户，出厂内置 OpenWrt 系统，无需烧录系统镜像。

</TabItem>

</Tabs>

## 4. 启动系统

<Tabs queryString="e24c-system">

<TabItem value="无板载 eMMC 系统">

在 MicroSD 卡上完成系统镜像的写入后，我们可以将读卡器上的 MicroSD 卡装入 Radxa E24C 的 MicroSD 卡槽中，然后使用 12V DC 电源适配器启动系统。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-insert-sd.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="有板载 eMMC 系统">

使用网线连接 Radxa E24C 的以太网 LAN 端口，然后使用 12V DC 电源适配器启动系统：以太网端口对应的 LED 指示灯闪烁，表示网络连接正常。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/e24c-rj45-cable.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

</Tabs>

## 5. 系统信息

我们提供 Debian Linux 和 OpenWrt 两大操作系统，用户根据自己的系统使用对应的用户名和密码进行系统登陆。

- Debian Linux

用户账号：radxa

用户密码：radxa

- OpenWrt

用户账号：root

用户密码：password

## 6. 登陆系统(串口)

:::tip
若用户有显示器和 HDMI 数据线，可以直接使用显示器看系统界面进行操作！
:::

### 6.1 硬件连接

在 Radxa E24C 通电的情况下，将 USB Type-A 转 Type-C 数据线的 Type-A 口接电脑，Type-C 口接 Radxa E24C 调试口。

:::note

- Radxa E24C 串口参数

波特率：1500000

数据位：8

停止位：1

无校验位

:::

### 6.2 串口登陆

<Tabs queryString="e24c-system-login">

<TabItem value="Windows">

Windows 平台推荐使用 PuTTY 软件串口登陆 Radxa E24C 系统。

- PuTTY使用

Radxa E24C 和 PC 通过 USB Type-A 转 Type-C 数据线连接后，可以进入系统的设备管理器查看 Radxa E24C 对应的串口号(示意图中 COM4 就是当前系统中对应的 Radxa E24C 设备)。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/serial-01.webp" style={{width: '80%', maxWidth: '600px'}} />
</div>

:::tip

若系统无法正确识别设备或者设备前面带有感叹号，需要自行安装[CH340驱动](https://www.wch.cn/downloads/CH341SER_EXE.html)，完成安装后重启系统。

:::

- 串口登陆选项

① --> Connection type：选择 `Serial`

② --> Serial line：填写 `COM4` (根据设备管理器显示的串口号信息)

③ --> Speed：填写 `1500000`

④ --> Open：串口连接 Radxa E24C 系统

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/serial-02.webp" style={{width: '80%', maxWidth: '600px'}} />
</div>

- 登陆系统

终端内按回车会出现登陆信息，然后使用对应系统的用户账号和密码进行登陆。

终端输入密码不会显示出来，输入完密码按回车登陆。

<div style={{textAlign: 'center'}}>
  <img src="/img/e/e24c/serial-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="Linux">

Linux 推荐使用 Screen 软件串口登陆 Radxa E24C 系统。

- 安装Screen

```
sudo apt update
sudo apt install screen
```

- 查找串口设备

打开终端使用 ls 命令查看串口设备:

若 PC 只有一个串口设备，系统默认是 ttyUSB0；

若 PC 有多个串口设备，可以插拔 USB 设备，使用下面命令观察变化的设备号。

```
ls /dev/ttyUSB*
```

- 串口登陆选项

使用 Screen 连接串口，只需要设置串口号和波特率。

```
sudo screen /dev/ttyUSB0 1500000
```

- 登陆系统

终端内按回车会出现登陆信息，然后使用对应系统的用户账号和密码进行登陆。

终端输入密码不会显示出来，输入完密码按回车登陆。

</TabItem>

<TabItem value="macOS">

macOS 平台推荐使用 Screen 软件串口登陆 Radxa E24C 系统。

:::tip

若系统无法正确识别设备，需要自行安装[CH340驱动](https://www.wch.cn/downloads/CH341SER_MAC_ZIP.html)，完成安装后重启系统。

:::

- 查找串口设备

打开终端使用 ls 命令查看串口设备:

找到类似 /dev/tty.wchusbserial14xx0 的设备名称，若 PC 有多个串口设备，可以插拔 USB 设备，使用下面命令观察变化的设备号。

```
ls /dev/tty.*
```

- 串口登陆选项

使用 Screen 连接串口，只需要设置串口号和波特率。

```
screen /dev/tty.wchusbserial14xx0 1500000
```

- 登陆系统

终端内按回车会出现登陆信息，然后使用对应系统的用户账号和密码进行登陆。

终端输入密码不会显示出来，输入完密码按回车登陆。

</TabItem>

</Tabs>
