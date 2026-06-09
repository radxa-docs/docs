---
sidebar_position: 0
---

# 快速上手

本章节的目的是为了让大家快速使用瑞莎 ROCK Pi E，大家可以按照该教程进行操作。

## 产品实物

<Tabs queryString="version">

<TabItem value=" ROCK Pi E V1.20 ">

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pie/rock-pi-e-v120.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value=" ROCK Pi E V1.21 ">

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pie/rock-pi-e-v121.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value=" ROCK Pi E V1.30 ">

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pie/rock-pi-e-v130.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## 使用前提

您需要提前准备以下硬件设备，以便完成快速上手教程的所有操作。

- 主板：瑞莎 ROCK Pi E
- 系统启动介质： microSD 卡
- microSD 卡读卡器：用于读写 microSD 卡
- USB 串口数据线：用于串口调试和登录
- 供电方式: 5V Type-C 电源适配器

:::tip
ROCK Pi E 主板仅支持 5V 电源输入，建议电流 2A 以上，确保所有外设稳定运行。

参考电源：

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)

- 标准 Type-C 电源适配器( 5V 电源输入，支持 PD 协议，建议电流 2A 以上)
  :::

## 安装系统

主要介绍安装系统到 microSD 卡。

:::warning 重要提醒

**安装系统会完全格式化 microSD 卡，所有数据将被永久删除！**

请在操作前确认：

- microSD 卡中无重要数据或已完成资料备份
- 选择正确的存储设备，避免格式化其他磁盘

:::

## 硬件连接

将 microSD 卡插入 microSD 卡读卡器，再将 microSD 卡读卡器插入电脑。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/sd-reader.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### 下载系统镜像

请访问 [资源汇总下载](../download) 页面，下载 **系统镜像**。

:::tip 软件使用

该镜像文件为 `.img.xz` 格式的压缩包，下载后需要先解压，得到 `.img` 格式的镜像文件才能使用。

:::

### 安装系统镜像

使用 Balena Etcher 软件可以将系统镜像安装到 microSD 卡中。

:::tip Balena Etcher

对于 Balena Etcher 的安装和使用，可以参考 [Etcher 使用](/common/radxa-os/install-system/balena-etcher) 教程。

:::

#### 选择系统镜像

点击 `Flash from file` 选项，选择自己提前下载并解压好的系统镜像文件。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-image.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### 选择存储设备

点击 `Select target` 选项，选择 microSD 卡设备。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-sd-01.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-select-sd-02.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

#### 开始烧录

点击 `Flash!` 选项，开始烧录系统镜像到 microSD 卡中。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/install-system/etcher-flash.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  等待系统安装完成
  <img
    src="/img/common/radxa-os/install-system/etcher-flashing.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  等待系统校验完成
  <img
    src="/img/common/radxa-os/install-system/etcher-valid.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  成功安装系统镜像后，关闭 Etcher 软件！
  <img
    src="/img/common/radxa-os/install-system/etcher-completed.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

## 使用系统

完成系统镜像的安装后，将 microSD 卡插入 ROCK Pi E 的 microSD 卡槽，然后使用 5V Type-C 电源适配器启动系统。

### 串口登录系统

我们推荐使用 Tabby 软件进行串口登录和调试，支持 Windows、Linux、MacOS 等多个平台。

:::tip

- ROCK Pi E 串口参数

波特率：1500000

数据位：8

停止位：1

无校验位

:::

### 硬件连接

:::danger
使用 USB 串口数据线和 ROCK Pi E 进行串口调试时，请确保引脚连接正确，否则会导致主板硬件损坏。

不建议连接 USB 串口数据线的 VCC 接口（红色线），避免接错导致主板损坏。
:::

使用 USB 串口数据线的 USB 接口连接 PC ，另一端连接 ROCK Pi E 的 GPIO串口 引脚。

| 引脚功能                      | 连接方式                                 |
| ----------------------------- | ---------------------------------------- |
| ROCK Pi E : GND（Pin6）       | 连接 USB 串口数据线的 GND 引脚（黑色线） |
| ROCK Pi E : UART2_TX（Pin8）  | 连接 USB 串口数据线的 RXD 引脚（白色线） |
| ROCK Pi E : UART2_RX（Pin10） | 连接 USB 串口数据线的 TXD 引脚（绿色线） |

说明：不同厂商的 USB 转串口线，线序可能不同，请根据实际引脚功能进行连接。

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pie/rock-pi-e-serial.webp" style={{width: '80%', maxWidth: '1200px'}} />
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
  <img src="/img/rockpi/pis/tabby-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

设置串口连接：

① --> `Settings` : 点击设置选项

② --> `Profiles & connections` : 点击配置连接选项

③ --> `New profile` : 点击添加新的配置选项

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/tabby-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

选择一个基础配置作为模板 : 选择任意 `Serial` 模板，我们可以在后续配置界面修改设备名称、串口设备号、波特率等参数。

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/tabby-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

选择 `Serial` 模板后，修改以下参数:

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/tabby-04.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① --> `Name` : 设置连接名称,建议填写产品名称

② --> `Device` : 设置串口设备号，若只连接一个串口设备，一般为 `/dev/ttyUSB0`

③ --> `Baud rate` : 设置波特率,填写 `1500000`

④ --> `Save` : 保存配置

点击运行按钮连接串口设备:

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/tabby-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

连接成功后，按回车会出现登陆信息，然后使用对应系统的用户账号和密码进行登陆（终端输入密码不会显示出来，输入完密码按回车登陆）。

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/tabby-06.webp" style={{width: '100%', maxWidth: '1200px'}} />
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
