---
sidebar_position: 15
---

import Serial from "../../../common/general/\_serial.mdx"

# 瑞莎系统

主要介绍 Radxa Debian 系统的基本使用方法，帮助你快速了解常用的系统的配置。

## 用户名和密码

Radxa ROCK S0 系列默认添加的用户名和密码为：

```text
用户名：radxa/rock
密码：  radxa/rock
```

## 串口登录

<Serial platform="rk" />

## 设置网络

### 连接WiFi

```bash
nmcli device wifi                                           #扫描WiFi
sudo nmcli device wifi connect <ssid> password <passwd>     #连接WiFi
```

### 以太网连接

Radxa ROCK S0 板载100M以太网，只需要将网线连接即可开启上网，使用`ip a `指令可以查看 ip。

## 远程登录

### SSH 登录

在连接上网络后可以通过 SSH 远程调试，官方Debian 镜像已默认开启 SSH ,只需要获取到板子的 IP 即可使用 SSH 连接。

- Debian/Ubuntu

```bash
ssh [username]@[hostname]
or
ssh [username]@[IP address]
例如：
ssh radxa@192.168.1.100
输入用户密码后即可连接到Debian系统。
```

- Windows

Windows 有许多 SSH 工具，这里以 [Mobaxterm](https://mobaxterm.mobatek.net/) 为你展示连接方法

点击左上角的 `Session` 新建 SSH 连接，在 `Remote host` 处输入板子的 IP，勾选 `Specify usernema` 并填入登录的用户, 双击会话开始连接后输入登录密码即可连接。

![mobaxterm ssh ](/img/zero/zero3/mobaxterm-ssh.webp)
