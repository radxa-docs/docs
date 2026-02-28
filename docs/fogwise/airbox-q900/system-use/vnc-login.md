---
sidebar_position: 2
---

# VNC 登录

## 使用前提

VNC 远程需要双方设备处于同一局域网下，且目标设备需要开启 VNC 服务。

:::tip 使用说明
VNC 远程控制适合带有图形界面的系统，若系统没有图形化桌面，推荐使用 SSH 远程控制。
:::

## 使用 VNC(远程设备)

### 下载 VNC Viewer

我们需要在远程设备上安装 VNC Viewer 软件控制主板。

访问 [RealVNC](https://www.realvnc.com/en/connect/download/viewer) 官网下载 VNC Viewer 安装包。

① : 选择远程设备的系统平台

② : 下载 VNC Viewer 安装包

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-download.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### 安装 VNC Viewer

<Tabs queryString="install-vnc">

<TabItem value="Windows">

下载 windows 版本的 `*.exe` 安装包后。

- 运行安装包

以管理员身份运行 `VNC-Viewer-<version>.exe` 安装程序。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-windows-install-01.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>
- 软件语言

选择 `English` 语言，点击 `OK` 进入下一步。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-windows-install-02.webp"
    style={{ width: "100%", maxWidth: "300px" }}
  />
</div>

- 进入安装

点击 `Next` 进入安装程序。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-windows-install-03.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

- 同意协议

勾选 `I accept the terms in the License Agreement` 选项，点击 `Next` 进入下一步。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-windows-install-04.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

- 安装路径

建议选择软件默认安装路径，点击 `Next` 进入下一步。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-windows-install-05.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

- 正式安装

点击 `Install` 开始正式安装。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-windows-install-06.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

- 完成安装

点击 `Finish` 完成安装。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-windows-install-07.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

</TabItem>

<TabItem value="Linux">

下载 Linux 版本的 `*.deb` 安装包后，在终端命令行运行以下命令安装 VNC Viewer：

<NewCodeBlock tip="Linux$" type="host">

```bash
sudo dpkg -i VNC-Viewer-<version>.deb
```

</NewCodeBlock>

</TabItem>

</Tabs>

### 运行 VNC Viewer

安装完成后，打开 VNC Viewer 软件: 您可以选择不登录账号使用 VNC Viewer 软件。

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-windows-use-01.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  VNC Viewer 界面
  <img
    src="/img/common/radxa-os/system-config/vnc-windows-use-02.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

## 使用 VNC（主板）

### 安装 VNC 服务器

在主板的终端命令行运行以下命令安装 VNC 服务器：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo apt update
sudo apt install tigervnc-standalone-server tigervnc-common -y
```

</NewCodeBlock>

### 设置 VNC 远程密码

在主板的终端命令行运行以下命令设置 VNC 远程密码：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
vncpasswd
```

</NewCodeBlock>

:::tip
输入密码和确认密码不会显示在屏幕上，系统提示是否创建一个只读密码，选择 `n`（否）。
:::

完成密码设置后，系统会提示类似信息：

```bash
Password:
Verify:
Would you like to enter a view-only password (y/n)? n
A view-only password is not used
```

### 配置 VNC 启动文件

在主板编辑 `~/.vnc/xstartup` 文件：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo vi ~/.vnc/xstartup
```

</NewCodeBlock>

修改 `~/.vnc/xstartup` 文件内容为：

```bash
#!/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=ubuntu:GNOME
export GNOME_SHELL_SESSION_MODE=ubuntu

exec gnome-session --session=ubuntu > ~/.vnc/gnome-startup.log 2>&1
```

编辑 `~/.vnc/xstartup` 文件后，需要赋予该文件可执行权限：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
sudo chmod +x ~/.vnc/xstartup
```

</NewCodeBlock>

### 启动 VNC 服务器

在主板的终端命令行运行以下命令启动 VNC 服务器：使用 `-localhost no` 参数可以允许远程访问。

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
vncserver -localhost no
```

</NewCodeBlock>

启动成功后，终端会输出类似信息，提示 VNC 服务器的端口号。

```bash
/usr/bin/xauth:  file /home/radxa/.Xauthority does not exist

New Xtigervnc server 'airbox:1 (radxa)' on port 5901 for display :1.
Use xtigervncviewer -SecurityTypes VncAuth,TLSVnc -passwd /tmp/tigervnc.9lBgyh/passwd airbox:1 to connect to the VNC server.
```

### 查看 VNC 服务器状态

在主板的终端命令行运行以下命令查看 VNC 服务器状态：

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
vncserver -list
```

</NewCodeBlock>

终端会输出类似信息：

```bash
TigerVNC server sessions:

X DISPLAY #     RFB PORT #      RFB UNIX PATH   PROCESS ID #    SERVER
1               5901                            8900            Xtigervnc
```

### 关闭 VNC 服务器

在主板的终端命令行运行以下命令可以关闭 VNC 服务器：其中命令中的 `:1` 代表 VNC 服务器的显示编号。

<NewCodeBlock tip="radxa@airbox$" type="device">

```bash
vncserver -kill :1
```

</NewCodeBlock>

关闭 VNC 服务器后，VNC Viewer 软件会自动断开连接。

## VNC 远程登录

在另一台设备上打开 VNC Viewer 软件，根据主板的 IP 地址和端口号进行 VNC 连接。

① ： 填写主板的 IP 地址和端口号

② ： 点击 `Connect to address ···` 连接主板

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-connect-01.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

① ： 输入 VNC 远程设置的密码

② ： 勾选 `Remember password` 选项可以保存密码，方便下次登录

③ ： 点击 `OK` 进行连接

<div style={{ textAlign: "center" }}>
  <img
    src="/img/common/radxa-os/system-config/vnc-connect-02.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

登录成功会出现系统的桌面环境。

<div style={{ textAlign: "center" }}>
  <img
    src="\img\fogwise\airbox-q900\airbox-q900-vnc-login.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>
