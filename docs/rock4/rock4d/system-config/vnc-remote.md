---
sidebar_position: 5
---

# VNC 远程

远程登录是指通过网络远程控制主板，教程只介绍局域网下进行 VNC 的远程控制的方法。

无显示器的用户可以通过 [串口调试](./uart_debug) 的方法运行下面命令配置 VNC 远程登录。

:::tip
VNC 远程控制适合带有图形界面的系统，若系统没有图形化桌面，推荐使用 SSH 远程控制。
:::

## 使用 VNC（Windows / Linux）

### 下载 VNC Viewer

我们需要在远程设备，也就是 PC 上安装 VNC Viewer 软件控制主板。

进入 [RealVNC](https://www.realvnc.com/en/connect/download/viewer) 官网下载系统平台对应的 VNC Viewer 安装包。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-download.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 安装 VNC Viewer

<Tabs queryString="install-vnc">

<TabItem value="Windows">

下载 windows 版本的 `*.exe` 安装包后。

- 运行安装包

以管理员身份运行 `VNC-Viewer-xxx.exe` 安装程序。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
- 软件语言

选择 `English` 语言，点击 `OK` 进入下一步。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-02.webp" style={{width: '100%', maxWidth: '300px'}} />
</div>

- 进入安装

点击 `Next` 进入安装程序。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- 同意协议

勾选 `I accept the terms in the License Agreement` 选项，点击 `Next` 进入下一步。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-04.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- 安装路径

建议选择软件默认安装路径，点击 `Next` 进入下一步。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-05.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- 正式安装

点击 `Install` 开始正式安装。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-06.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- 完成安装

点击 `Finish` 完成安装。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-07.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="Linux">

下载 Linux 版本的 `*.deb` 安装包后，在终端命令行运行以下命令安装 VNC Viewer：

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo dpkg -i VNC-Viewer-xxx.deb
```
</NewCodeBlock>

</TabItem>

</Tabs>

### 运行 VNC Viewer

安装完成后，打开 VNC Viewer 软件: 用户可以选择不登录账号使用 VNC Viewer 软件。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-use-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
VNC Viewer 界面
    <img src="/img/rock4/4d/vnc-windows-use-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## 使用 VNC（Radxa ROCK 4D）

### 安装 VNC 服务器

在 Radxa ROCK 4D 的终端命令行运行以下命令安装 VNC 服务器：

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
sudo apt update
sudo apt install tigervnc-standalone-server tigervnc-common -y
```
</NewCodeBlock>

### 设置 VNC 远程密码

在 Radxa ROCK 4D 的终端命令行运行以下命令设置 VNC 远程密码：
<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">

```
vncpasswd
```

</NewCodeBlock>

:::tip
输入密码和确认密码不会显示在屏幕上，系统提示是否创建一个只读密码，选择 `n`（否）。
:::

完成密码设置后，系统会提示类似信息：

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
Password:
Verify:
Would you like to enter a view-only password (y/n)? n
A view-only password is not used
```
</NewCodeBlock>

### 配置 VNC 启动文件

在 Radxa ROCK 4D 编辑 `~/.vnc/xstartup` 文件：

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
sudo vi ~/.vnc/xstartup
```
</NewCodeBlock>

修改 `~/.vnc/xstartup` 文件内容为：

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export XDG_SESSION_TYPE=x11
export DESKTOP_SESSION=plasma
exec startplasma-x11
```
</NewCodeBlock>

编辑 `~/.vnc/xstartup` 文件后，需要赋予该文件可执行权限：

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
sudo chmod +x ~/.vnc/xstartup
```
</NewCodeBlock>

### 启动 VNC 服务器

在 Radxa ROCK 4D 的终端命令行运行以下命令启动 VNC 服务器：使用 `-localhost no` 参数可以允许远程访问。

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
vncserver -localhost no
```
</NewCodeBlock>

启动成功后，会提示 VNC 服务器的端口号，例如：

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
New Xtigervnc server 'rock-4d-spi:1 (radxa)' on port 5901 for display :1.
Use xtigervncviewer -SecurityTypes VncAuth -passwd /tmp/tigervnc.VQ4DfI/passwd :1 to connect to the VNC server.
```
</NewCodeBlock>

### 查看 VNC 服务器状态

在 Radxa ROCK 4D 的终端命令行运行以下命令查看 VNC 服务器状态：

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
vncserver -list
```
</NewCodeBlock>

终端会输出类似信息：
<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">

```
TigerVNC server sessions:

X DISPLAY #	RFB PORT #	RFB UNIX PATH	PROCESS ID #	SERVER
1         	5901      	             	3283        	Xtigervnc
```

</NewCodeBlock>

### 关闭 VNC 服务器

在 Radxa ROCK 4D 的终端命令行运行以下命令可以关闭 VNC 服务器：其中命令中的 `:1` 代表 VNC 服务器的显示编号。

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
vncserver -kill :1
```
</NewCodeBlock>

关闭 VNC 服务器后，VNC Viewer 软件会自动断开连接。

## VNC 远程登录

在另一台设备上打开 VNC Viewer 软件，根据 Radxa ROCK 4D 的 IP 地址和端口号进行 VNC 连接。

① ： 填写 Radxa ROCK 4D 的 IP 地址和端口号

② ： 点击 `Connect to address ···` 连接 Radxa ROCK 4D

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-connect-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① ： 输入 VNC 远程设置的密码

② ： 勾选 `Remember password` 选项可以保存密码，方便下次登录

③ ： 点击 `OK` 进行连接

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-connect-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
VNC远程登录成功
    <img src="/img/rock4/4d/vnc-connect-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
