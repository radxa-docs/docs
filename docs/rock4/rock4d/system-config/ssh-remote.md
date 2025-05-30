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

## 1 安装 OpenSSH

SSH 远程控制需要安装 OpenSSH 服务器, 在 Radxa ROCK 4D 的终端命令行运行以下命令安装：

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo apt update
sudo apt install openssh-server -y
```
</NewCodeBlock>

## 2. 启动 SSH 服务

在 Radxa ROCK 4D 的终端命令行运行以下命令启动 SSH 服务：

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo systemctl start ssh
```
</NewCodeBlock>

## 3. 设置 SSH 服务自启动

在 Radxa ROCK 4D 的终端命令行运行以下命令设置 SSH 服务自启动：

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo systemctl enable ssh
```
</NewCodeBlock>

## 4. 查看 SSH 服务状态

在 Radxa ROCK 4D 的终端命令行运行以下命令查看 SSH 服务状态：

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo systemctl status ssh
```
</NewCodeBlock>

终端会输出类似信息: 提示您 SSH 服务是否自启动和当前运行状态。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
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

## 5. 远程登录

在另一台设备上打开终端，输入以下命令进行远程登录：可以使用 `ip a` 命令查看 Radxa ROCK 4D 的 IP 地址。

<NewCodeBlock tip="Linux-host$" type="host">
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
