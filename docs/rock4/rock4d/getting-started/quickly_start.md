---
sidebar_position: 1
---

# 快速上手

本章节的目的是为了让大家快速使用瑞莎 ROCK 4D。大家可以按照该教程进行操作。

## 产品实物

<div style={{textAlign: 'center'}}>
   ROCK 4D 正面
   <img src="/img/rock4/4d/rock4d-top.webp" style={{width: '100%', maxWidth: '1200px'}} />
   ROCK 4D 背面
    <img src="/img/rock4/4d/rock4d-bottom.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用前提

### 硬件设备

您需要提前准备以下硬件设备，以便完成快速上手教程的所有操作。

- 开发板：瑞莎 ROCK 4D
- 系统启动介质：MicroSD 卡
- USB串口数据线（可选）：用于串口调试和登录
- 显示器（可选）：HDMI 显示器和 HDMI 数据线
- 电源适配器：Type-C 电源适配器( 支持 PD 协议，5V 电源输入，建议电流 3A 以上)

**说明**：用户需要在 USB串口数据线和显示器二选一，我们优先推荐使用显示器搭配Rock 4D进行使用和开发。

:::tip
对于不同开发能力的用户，我们建议额外增加以下配件使用 ROCK 4D，这样会缩短熟悉产品和开发的时间。

- **初学者**

准备配件：电源适配器、系统启动介质、显示器、HDMI数据线

- **开发者**

准备配件：电源适配器、系统启动介质、调试数据线( USB串口数据线)

**说明**：其中显示器可以显示系统界面和进行图形化操作！
:::

### 主板供电

ROCK 4D 主板支持 Type-C 和 GPIO 供电，我们推荐使用 Type-C 电源适配器供电，请确保电源适配器能够提供 5V 电源输入，并且能够兼容 PD 协议。

:::tip
ROCK 4D 主板仅支持 5V 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

参考电源：

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)

- 标准 Type-C 电源适配器( 5V 电源输入，支持 PD 协议，建议电流 3A 以上)
  :::

### 系统启动介质

ROCK 4D 支持 MicroSD 卡、NVME、UFS启动，但是快速上手教程只介绍 MicroSD卡启动。

### 串口调试

ROCK 4D 主板支持通过 USB 串口数据线进行串口调试，您需要将 USB 串口数据线连接到 ROCK 4D 的 UART0_TX、UART0_RX 和 GND 引脚。

## 写入系统镜像

您需要在 PC 上下载待写入的系统镜像文件，并将其烧写到 MicroSD 卡中。

### 下载系统镜像

在 PC 上访问[资源下载汇总](../download)页面，下载 ROCK 4D 对应的系统镜像压缩包，下载完成后解压系统镜像压缩包，得到的 `*.img` 文件就是待烧写到 MicroSD 卡中的系统镜像文件。

:::tip
下载的系统镜像是一个压缩文件，需要解压后才能通过镜像烧录软件写入到SD卡, 未解压就直接烧录到SD卡，可能会出现写入系统失败或者启动系统失败的情况。
:::

### 写入系统镜像

将 MicroSD 卡插入读卡器中，然后将读卡器插入 PC 的 USB 端口上。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/sd-insert.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- **镜像烧录软件：Balena Etcher**

我们推荐使用瑞莎合作伙伴 Balena 开发的开源镜像烧录工具 Etcher，该软件使用简单，功能强大，支持 Windows/Linux/MacOS 系统使用。

进入官网下载系统对应平台的软件：[balenaEtcher](https://etcher.balena.io)

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

进入下载页面后，选择对应的系统平台进行 Etcher 软件下载。

<div style={{textAlign: 'center'}}>
<img src="/img/rock4/4d/down-etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip
Windows 和 Linux 只需要打开对应程序就可以使用，无需安装！
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/down-etcher-00.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- 安装系统镜像

1. 选择主板对应的系统镜像：点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. 选择 MicroSD 卡对应的磁盘：点击 `Select target` 选项，选择自己接入 PC 的读卡器对应磁盘设备。

:::danger
请勿选错磁盘，否则 Etcher 将格式化被选中的磁盘，造成重要数据丢失！
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ： 选择需要安装系统镜像的磁盘设备

② ： 点击 `Select 1` 选项确认设备选择

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3.开始写入系统镜像：点击 `Flash` 选项，等待软件自动进行系统镜像的写入和校验。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/etcher-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统写入完成
  <img src="/img/rock4/4d/etcher-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
等待系统校验完成
  <img src="/img/rock4/4d/etcher-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

4.成功写入系统镜像后，关闭 Etcher 软件！

## 系统信息

您使用我们提供的系统镜像，首次需要使用我们设置的用户名和密码登录系统。

- Debian Linux

用户账号：radxa

用户密码：radxa

## 启动系统

在 MicroSD 卡上完成系统镜像的写入后，我们可以将读卡器上的 MicroSD 卡装入 ROCK 4D 的 MicroSD 卡槽中，然后使用 5V Type-C 电源适配器启动系统。

启动系统后，蓝色和绿色 LED 灯会同时亮起，大概过几秒左右，绿灯常亮、蓝色指示灯会闪烁，一般表示系统启动成功。

使用系统建议：

1. 若您有显示器，启动 ROCK 4D 后可以使用 HDMI 数据线连接显示器和主板，直接通过显示器查看系统界面。

2. 若您没有显示器，可以使用串口调试工具查看系统输出信息，确认系统是否启动成功以及登录系统使用 ROCK 4D。

## 串口登录系统

我们推荐使用 Tabby 软件进行串口登录和调试，支持 Windows、Linux、MacOS 等多个平台。

:::tip

- ROCK 4D 串口参数

波特率：1500000

数据位：8

停止位：1

无校验位

:::

### 硬件连接

:::danger
使用 USB 串口数据线和 ROCK 4D 进行串口调试时，请确保引脚连接正确，否则会导致主板硬件损坏。
:::

使用 USB 串口数据线的 USB 接口连接 PC ，另一端连接 ROCK 4D 的 GPIO串口 引脚。

| 序号 | 引脚功能                       | 连接方式                       |
| ---- | ------------------------------ | ------------------------------ |
| ①    | ROCK 4D : GND（Pin6）          | 连接 USB 串口数据线的 GND 引脚 |
| ②    | ROCK 4D : UART0_TX（Pin8）     | 连接 USB 串口数据线的 RX 引脚  |
| ③    | ROCK 4D : UART0_RX（Pin10）    | 连接 USB 串口数据线的 TX 引脚  |
| ④    | USB 串口数据线 : GND（黑色线） | 连接 ROCK 4D 的 GND 引脚       |
| ⑤    | USB 串口数据线 : RX（白色线）  | 连接 ROCK 4D 的 UART0_TX 引脚  |
| ⑥    | USB 串口数据线 : TX（绿色线）  | 连接 ROCK 4D 的 UART0_RX 引脚  |
| ⑦    | USB 串口数据线 : VCC（红色线） | 不连接                         |

<div style={{textAlign: 'center'}}>
  引脚说明和连接示意图
  <img src="/img/rock4/4d/serial-connect.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

### Tabby 使用

Tabby 是一款功能强大的跨平台串口调试工具，支持串口、SSH 等多种协议。

#### Tabby 安装

通过 [Tabby 官网](https://tabby.sh/) 下载并安装 Tabby 软件。

:::tip

- Windows

根据自己的系统架构选择 `.exe` 文件进行安装。

- Linux

根据自己的系统架构选择 `.deb` 文件进行安装。

- MacOS

根据自己的系统架构选择 `.dmg` 文件进行安装。

:::

#### Tabby 使用（串口）

双击 Tabby 软件图标打开 Tabby 软件。

<div style={{textAlign: 'center'}}>
Tabby 软件主界面
  <img src="/img/rock4/4d/tabby-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

设置串口连接：

① --> `Settings` : 点击设置选项

② --> `Profiles & connections` : 点击配置连接选项

③ --> `New profile` : 点击添加新的配置选项

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

选择一个基础配置作为模板 :

选择任意 `Serial` 模板，我们可以在后续配置界面修改设备名称、串口设备号、波特率等参数。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

选择 `Serial` 模板后，修改以下参数:

`Name` : 设置连接名称,建议填写产品名称

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① --> `Device` : 设置串口设备号，若只连接一个串口设备，一般为 `/dev/ttyUSB0`

② --> `Baud rate` : 设置波特率,填写 `1500000`

③ --> `Save` : 保存配置

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

点击运行按钮连接串口设备:

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

连接成功后，按回车会出现登陆信息，然后使用对应系统的用户账号和密码进行登陆（终端输入密码不会显示出来，输入完密码按回车登陆）。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip

若打开串口出现 `Error: Permission denied, cannot open /dev/ttyUSB0` 错误提示！

您需要按照以下步骤排查问题：

1. 检查串口设备是否正确连接

2. 检查串口设备权限

以 Linux 系统为例，若串口设备权限不足，您需要在终端命令行运行以下命令，让所有用户都有权限访问串口设备。

<NewCodeBlock tip="Host-Linux$" type="host">
```bash
sudo chmod 777 /dev/ttyUSB0
```
</NewCodeBlock>

3. 检查串口设备是否被其他程序占用
   :::

## 系统使用

### 有屏模式

若您是 ROCK 4D 搭配显示器使用，使用系统就变的比较简单，你可以根据显示器上的系统界面进行操作。

### 无屏模式

若您是 ROCK 4D 搭配 USB 串口数据线使用，您可以通过串口调试工具进行系统操作。

:::tip
对于无屏模式的用户，我们提供以下建议助力您快速熟悉系统使用。

1. 配置网络

您可以直接给 ROCK 4D 插入网线，确保系统能够连接网络。

2. 串口调试

您可以通过 [串口调试](../system-config/uart_debug) 查看系统的输出信息，比如 IP 地址、系统启动信息等。

3. 配置 SSH 远程

配置 [SSH 远程](../system-config/ssh-remote) 登录可以去掉 USB 串口数据线，直接使用 SSH 远程登录系统。

4. 配置 VNC 远程

若系统本身带有图形化界面，配置 [VNC 远程](../system-config/vnc-remote) 登录可以让您直接看到系统画面，无需使用显示器。
:::
