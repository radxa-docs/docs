---
sidebar_position: 0
---

# 快速上手

本章节的目的是为了让大家快速使用 Radxa ROCK Pi S，大家可以按照该教程进行操作。

## 产品实物

<Tabs queryString="version">

<TabItem value=" ROCK Pi S V1.3 ">

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/rock-pi-s-v13.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value=" ROCK Pi S V1.5 ">

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/rock-pi-s-v15.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## 使用前提

您需要提前准备以下硬件设备，以便完成快速上手教程的所有操作。

- 开发板： 瑞莎 ROCK Pi S
- 系统启动介质： MicroSD 卡
- MicroSD 卡读卡器：用于读写 MicroSD 卡
- USB 串口数据线：用于串口调试和登录
- 供电方式: 5V Type-C 电源适配器或使用 Type-C 转 Type-A 数据线连接 PC 供电

:::tip

- USB 串口数据线

您可以通过串口获取系统输出信息，确认系统是否启动成功以及登录系统使用ROCK Pi S。

- 供电方式

Pi S 主板仅支持 5V 电源输入，建议电流 1A 以上，确保所有外设稳定运行。

- MicroSD 卡读卡器

ROCK Pi S V1.5 支持 eMMC 安装和启动系统，若安装系统到 eMMC，则不需要准备 MicroSD 卡读卡器。

:::

## 安装系统

你可以根据自己的 ROCK Pi S 版本选择对应的安装系统教程。

<Tabs queryString="version">

<TabItem value=" ROCK Pi S V1.3 ">

ROCK Pi S V1.3 支持 MicroSD 卡安装和启动系统。

- 参考 [安装系统到 MicroSD 卡](./install-os/install-os-to-sd.md) 教程。

</TabItem>

<TabItem value=" ROCK Pi S V1.5 ">

ROCK Pi S V1.5 支持 MicroSD 卡和板载 eMMC 安装和启动系统，你可以选择一种方式安装系统，其中安装系统到 MicroSD 卡比较简单。

- 参考 [安装系统到 MicroSD 卡](./install-os/install-os-to-sd.md) 教程
- 参考 [安装系统到 eMMC (适用 V1.5 )](./install-os/install-os-to-emmc.md) 教程

</TabItem>

</Tabs>

## 使用系统

完成系统镜像的安装后，可以使用 5V Type-C 电源适配器或 Type-C 转 Type-A 数据线连接 PC 启动系统。

### 串口登录系统

我们推荐使用 Tabby 软件进行串口登录和调试，支持 Windows、Linux、MacOS 等多个平台。

:::tip

- ROCK Pi S 串口参数

波特率：1500000

数据位：8

停止位：1

无校验位

:::

### 硬件连接

:::danger
使用 USB 串口数据线和 ROCK Pi S 进行串口调试时，请确保引脚连接正确，否则会导致主板硬件损坏。

不建议连接 USB 串口数据线的 VCC 接口（红色线），避免接错导致主板损坏。
:::

使用 USB 串口数据线的 USB 接口连接 PC ，另一端连接 ROCK Pi S 的 GPIO串口 引脚。

| 引脚功能                      | 连接方式                                 |
| ----------------------------- | ---------------------------------------- |
| ROCK Pi S : GND（Pin6）       | 连接 USB 串口数据线的 GND 引脚（黑色线） |
| ROCK Pi S : UART0_TX（Pin8）  | 连接 USB 串口数据线的 RX 引脚（白色线）  |
| ROCK Pi S : UART0_RX（Pin10） | 连接 USB 串口数据线的 TX 引脚（绿色线）  |

<div style={{textAlign: 'center'}}>
  <img src="/img/rockpi/pis/rock-pi-s-serial.webp" style={{width: '80%', maxWidth: '1200px'}} />
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
