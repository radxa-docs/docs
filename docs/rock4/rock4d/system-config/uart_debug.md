---
sidebar_position: 3
---

# 串口调试

串口调试是嵌入式开发中通过串行通信接口 (UART) 与开发板交互的核心手段，通过串口工具可以查看系统输出的信息和进行调试。

## 1. 硬件准备

- 开发板： Radxa ROCK 4D
- USB 串口数据线： 将开发板的 UART0 接口连接到 PC 机的 USB 端口
- 电源适配器： 给开发板供电（支持 PD 协议，5V 电源输入）

## 2. 硬件连接

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

## 3. 串口登录

:::tip

- Radxa ROCK 4D 串口通讯参数

波特率：1500000

数据位：8

停止位：1

无校验位
:::

<Tabs queryString="e24c-system-login">

<TabItem value="Windows">

Windows 平台推荐使用 PuTTY 软件串口登陆 Radxa ROCK 4D 系统。

- PuTTY使用

Radxa ROCK 4D 和 PC 通过 USB 串口数据线连接后，可以进入系统的设备管理器查看 Radxa ROCK 4D 对应的串口号(示意图中 COM4 就是当前系统中对应的 Radxa ROCK 4D 设备)。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-01.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

:::tip

若系统无法正确识别设备或者设备前面带有感叹号，需要自行安装[CH340驱动](https://www.wch.cn/downloads/CH341SER_EXE.html)，完成安装后重启系统。

:::

- 串口登陆选项

① --> Connection type：选择 `Serial`

② --> Serial line：填写 `COM4` (根据设备管理器显示的串口号信息)

③ --> Speed：填写 `1500000`

④ --> Open：串口连接 Radxa ROCK 4D 系统

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-02.webp" style={{width: '80%', maxWidth: '1200px'}} />
</div>

- 登陆系统

终端内按回车会出现登陆信息，然后使用对应系统的用户账号和密码进行登陆。

终端输入密码不会显示出来，输入完密码按回车登陆。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/serial-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Linux">

Linux 推荐使用 Screen 软件串口登陆 Radxa ROCK 4D 系统。

- 安装Screen

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo apt update
sudo apt install screen
```
</NewCodeBlock>

- 查找串口设备

打开终端使用 ls 命令查看串口设备:

若 PC 只有一个串口设备，系统默认是 ttyUSB0；

若 PC 有多个串口设备，可以插拔 USB 设备，使用下面命令观察变化的设备号。

<NewCodeBlock tip="Linux-host$" type="host">
```
ls /dev/ttyUSB*
```
</NewCodeBlock>

- 串口登陆选项

使用 Screen 连接串口，只需要设置串口号和波特率。

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo screen /dev/ttyUSB0 1500000
```
</NewCodeBlock>

- 登陆系统

终端内按回车会出现登陆信息，然后使用对应系统的用户账号和密码进行登陆。

终端输入密码不会显示出来，输入完密码按回车登陆。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/uart-debug-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="macOS">

MacOS 平台推荐使用 Screen 软件串口登陆 Radxa ROCK 4D 系统。

:::tip

若系统无法正确识别设备，需要自行安装[CH340驱动](https://www.wch.cn/downloads/CH341SER_MAC_ZIP.html)，完成安装后重启系统。

:::

- 查找串口设备

打开终端使用 ls 命令查看串口设备:

找到类似 /dev/tty.wchusbserial14xx0 的设备名称，若 PC 有多个串口设备，可以插拔 USB 设备，使用下面命令观察变化的设备号。

<NewCodeBlock tip="macOS-host$" type="host">
```
ls /dev/tty.*
```
</NewCodeBlock>

- 串口登陆选项

使用 Screen 连接串口，只需要设置串口号和波特率。

<NewCodeBlock tip="macOS-host$" type="host">
```
screen /dev/tty.wchusbserial14xx0 1500000
```
</NewCodeBlock>

- 登陆系统

终端内按回车会出现登陆信息，然后使用对应系统的用户账号和密码进行登陆。

终端输入密码不会显示出来，输入完密码按回车登陆。

</TabItem>

</Tabs>
