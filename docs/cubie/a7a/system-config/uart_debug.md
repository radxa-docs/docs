---
sidebar_position: 1
---

# 串口调试

串口调试是嵌入式开发中通过串行通信接口 (UART) 与开发板交互的核心手段，通过串口工具可以查看系统输出的信息和进行调试。

## 硬件准备

- 开发板：瑞莎 Cubie A7A
- 系统启动介质：支持 MicroSD 卡、eMMC 模块、UFS 模块启动系统（选中其中一种系统启动介质即可）
- 电源适配器：5V Type-C 电源适配器
- USB 串口数据线：用于串口调试和登录系统

## 硬件连接

:::danger
使用 USB 串口数据线和 Cubie A7A 进行串口调试时，请确保引脚连接正确，接错引脚可能会导致主板硬件损坏。

不建议连接 USB 串口数据线的 VCC 接口（红色线），避免接错导致主板损坏。
:::

将 USB 串口数据线连接到 Cubie A7A 的 UART0 接口，另一端连接到 PC 的 USB 端口。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/a7a-uart.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| Cubie A7A 引脚功能             | 连接方式                                                                |
| ------------------------------ | ----------------------------------------------------------------------- |
| Cubie A7A : GND（Pin6）        | Cubie A7A 的 GND 引脚连接 USB 串口数据线的 GND 引脚（黑色杜邦线）       |
| Cubie A7A : UART0_TXD（Pin8）  | Cubie A7A 的 UART0_TXD 引脚连接 USB 串口数据线的 RXD 引脚（白色杜邦线） |
| Cubie A7A : UART0_RXD（Pin10） | Cubie A7A 的 UART0_RXD 引脚连接 USB 串口数据线的 TXD 引脚（绿色杜邦线） |

## 串口登录

:::info
串口通讯参数

- 波特率：115200
- 数据位：8
- 停止位：1
- 校验位：无
- 流控：无
  :::

### Tabby 使用

我们推荐使用 Tabby 软件进行串口登录，Tabby 是一款功能强大、界面友好的串口调试软件，支持串口、SSH 等多种协议，适配 Windows、macOS、Linux 等主流操作系统。

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
  <img src="/img/cubie/a7a/tabby-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- 设置串口连接

① --> `Settings` : 点击设置选项

② --> `Profiles & connections` : 点击配置连接选项

③ --> `New profile` : 点击添加新的配置选项

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/tabby-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

- 选择一个基础配置作为模板

选择任意 `Serial` 模板，我们可以在后续配置界面修改设备名称、串口设备号、波特率等参数。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/tabby-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

选择 `Serial` 模板后，修改以下参数:

① --> `Name` : 设置连接名称,建议填写产品名称

② --> `Device` : 设置串口设备号，若只连接一个串口设备，一般为 `/dev/ttyUSB0`

③ --> `Baud rate` : 设置波特率,填写 `115200`

④ --> `Save` : 保存配置

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/tabby-07.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

点击运行按钮连接串口设备:

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/tabby-05.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

连接成功后，按回车会出现登陆信息，然后使用对应系统的用户账号和密码进行登陆（终端输入密码不会显示出来，输入完密码按回车登陆）。

<div style={{textAlign: 'center'}}>
  <img src="/img/cubie/a7a/tabby-08.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

:::tip

若打开串口出现 `Error: Permission denied, cannot open /dev/ttyUSB0` 错误提示！

您需要按照以下步骤排查问题：

1. 检查串口设备是否正确连接

2. 检查串口设备权限

以 Linux 系统为例，若串口设备权限不足，您需要在终端命令行运行以下命令，让所有用户都有权限访问串口设备。

<NewCodeBlock tip="Host-Linux$" type="host">
```
sudo chmod 777 /dev/ttyUSB0
```
</NewCodeBlock>

3. 检查串口设备是否被其他程序占用
   :::
