---
sidebar_position: 4
---

# SSH 远程

远程登录是指通过网络远程控制主板，教程只介绍局域网下进行 SSH 的远程控制的方法。

无显示器的用户可以通过 [串口调试](./uart_debug) 的方法运行下面命令配置 SSH 远程登录。

:::tip
确保远程双方设备处于同一局域网：

1. 确认两台设备的 IP 地址是否在同一网段。
2. 两台设备相互 `ping` 彼此 IP 地址是否正常。
   :::

## 安装 OpenSSH

SSH 远程控制需要安装 OpenSSH 服务器, 在 Radxa ROCK 4D 的终端命令行运行以下命令安装：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo apt update
sudo apt install openssh-server -y
```
</NewCodeBlock>

## 启动 SSH 服务

在 Radxa ROCK 4D 的终端命令行运行以下命令启动 SSH 服务：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo systemctl start ssh
```
</NewCodeBlock>

## 设置 SSH 服务自启动

在 Radxa ROCK 4D 的终端命令行运行以下命令设置 SSH 服务自启动：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo systemctl enable ssh
```
</NewCodeBlock>

## 查看 SSH 服务状态

在 Radxa ROCK 4D 的终端命令行运行以下命令查看 SSH 服务状态：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo systemctl status ssh
```
</NewCodeBlock>

终端会输出类似信息: 提示您 SSH 服务是否自启动和当前运行状态。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
● ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/lib/systemd/system/ssh.service; enabled; preset: enabled)
     Active: active (running) since Tue 2025-05-27 10:18:30 UTC; 4min 39s ago
       Docs: man:sshd(8)
             man:sshd_config(5)
   Main PID: 1841 (sshd)
      Tasks: 1 (limit: 4659)
     Memory: 5.3M
        CPU: 608ms
     CGroup: /system.slice/ssh.service
```
</NewCodeBlock>

## SSH 远程登录

<Tabs queryString="ssh-mode">

<TabItem value="命令行模式">

在另一台设备上打开终端，输入以下命令进行远程登录：可以使用 `ip a` 命令查看 Radxa ROCK 4D 的 IP 地址。

<NewCodeBlock tip="Host-PC$" type="host">
```
ssh <user-name>@<ip-address>
```
</NewCodeBlock>

其中，`<user-name>` 和 `<ip-address>` 分别是 Radxa ROCK 4D 的用户名和 IP 地址。

① ： 查询 Radxa ROCK 4D 的 IP 地址（此时我是通过串口连接到 Radxa ROCK 4D 查询的 IP 地址）。

② ： Radxa ROCK 4D 的实际 IP 地址。

③ ： 通过 SSH 远程登录 Radxa ROCK 4D。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/ssh-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="图形界面模式">

Tabby 是一款功能强大的跨平台串口调试工具，支持串口、SSH 等多种协议; 我们推荐使用 Tabby 软件进行 SSH 远程登录。

- Tabby 安装

通过 [Tabby 官网](https://tabby.sh/) 下载并安装 Tabby 软件。

:::tip

- Windows

根据自己的系统架构选择 `.exe` 文件进行安装。

- Linux

根据自己的系统架构选择 `.deb` 文件进行安装。

- MacOS

根据自己的系统架构选择 `.dmg` 文件进行安装。

:::

- Tabby 使用（SSH）

双击 Tabby 软件图标打开 Tabby 软件。

<div style={{textAlign: 'center'}}>
Tabby 软件主界面
  <img src="/img/rock4/4d/tabby-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

设置 SSH 连接：

① --> `Settings` : 点击设置选项

② --> `Profiles & connections` : 点击配置连接选项

③ --> `New profile` : 点击添加新的配置选项

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

选择一个基础配置作为模板 :

选择 `SSH connection` ，我们可以在后续配置界面修改设备名称、IP 地址、端口等参数。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-08.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

选择 `SSH connection` 模板后，修改以下参数:

`Name` : 设置连接名称,建议填写产品名称

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-09.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① --> `Host` : 设置 IP 地址，根据 Radxa ROCK 4D 的 实际 IP 地址填写

② --> `User` : 设置用户名，默认出厂用户名为 `radxa`

③ --> `Save` : 保存配置

端口号默认为 `22`，不用修改。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-10.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

点击运行按钮远程连接 SSH 设备:

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-11.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

连接后，Tabby 软件会弹出输入密码的界面：

① --> password : 输入 Radxa ROCK 4D 的密码,默认出厂密码为 `radxa`

② --> OK : 确认连接

推荐勾选 `Remember` 选项，这样下次连接时就不需要输入密码了。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-12.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

连接成功后，会出现远程的界面。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-13.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>
</Tabs>
