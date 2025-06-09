---
sidebar_position: 3
---

# 串口调试

串口调试是嵌入式开发中通过串行通信接口 (UART) 与开发板交互的核心手段，通过串口工具可以查看系统输出的信息和进行调试。

## 硬件准备

- 开发板： Radxa ROCK 4D
- USB 串口数据线： 将开发板的 UART0 接口连接到 PC 机的 USB 端口
- 电源适配器： 给开发板供电（支持 PD 协议，5V 电源输入）

## 硬件连接

您需要将 USB 串口数据线连接到 Radxa ROCK 4D 的 UART0_TX、UART0_RX 和 GND 引脚。

:::danger
使用 USB 串口数据线和 Radxa ROCK 4D 进行串口调试时，请确保引脚连接正确，否则会导致主板硬件损坏。
:::

使用 USB 串口数据线的 USB 接口连接 PC ，另一端连接 Radxa ROCK 4D 的 GPIO 串口引脚。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-connect.webp" style={{width: '80%', maxWidth: '1200px'}} />
  引脚说明和连接示意图
</div>

| 序号 | 引脚功能                          | 连接方式                            |
| ---- | --------------------------------- | ----------------------------------- |
| ①    | Radxa ROCK 4D : GND（Pin6）       | 连接 USB 串口数据线的 GND 引脚      |
| ②    | Radxa ROCK 4D : UART0_TX（Pin8）  | 连接 USB 串口数据线的 RX 引脚       |
| ③    | Radxa ROCK 4D : UART0_RX（Pin10） | 连接 USB 串口数据线的 TX 引脚       |
| ④    | USB 串口数据线 : GND（黑色线）    | 连接 Radxa ROCK 4D 的 GND 引脚      |
| ⑤    | USB 串口数据线 : RX（白色线）     | 连接 Radxa ROCK 4D 的 UART0_TX 引脚 |
| ⑥    | USB 串口数据线 : TX（绿色线）     | 连接 Radxa ROCK 4D 的 UART0_RX 引脚 |
| ⑦    | USB 串口数据线 : VCC（红色线）    | 不连接                              |

## 串口登录

我们推荐使用 Tabby 软件进行串口登录和调试，支持 Windows、Linux、MacOS 等多个平台。

:::tip

- Radxa ROCK 4D 串口通讯参数

波特率：1500000

数据位：8

停止位：1

无校验位
:::

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
```
sudo chmod 777 /dev/ttyUSB0
```
</NewCodeBlock>

3. 检查串口设备是否被其他程序占用
   :::
