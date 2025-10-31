---
sidebar_position: 2
---

# VNC Login

## Prerequisites

For VNC remote access, both devices must be on the same local network, and the target device must have the VNC service enabled.

:::tip Usage Notes
VNC remote control is suitable for systems with a graphical interface. If the system doesn't have a graphical desktop, we recommend using SSH for remote control instead.
:::

## Using VNC (Remote Device)

### Download VNC Viewer

You need to install VNC Viewer software on the remote device to control the board.

Visit the [RealVNC](https://www.realvnc.com/en/connect/download/viewer) official website to download the VNC Viewer installer.

① : Select the operating system platform of your remote device

② : Download the VNC Viewer installer

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-download.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

### Install VNC Viewer

<Tabs queryString="install-vnc">

<TabItem value="Windows">

After downloading the Windows `*.exe` installer:

- Run the Installer

Run the `VNC-Viewer-xxx.exe` installer as administrator.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-windows-install-01.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>
- Select Language

Choose `English` as the language and click `OK` to proceed.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-windows-install-02.webp"
    style={{ width: "100%", maxWidth: "300px" }}
  />
</div>

- Start Installation

Click `Next` to begin the installation process.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-windows-install-03.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

- Accept License Agreement

Check the `I accept the terms in the License Agreement` option and click `Next` to continue.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-windows-install-04.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

- Choose Installation Folder

It's recommended to use the default installation path. Click `Next` to continue.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-windows-install-05.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

- Begin Installation

Click `Install` to start the installation.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-windows-install-06.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

- Complete Installation

Click `Finish` to complete the installation.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-windows-install-07.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

</TabItem>

<TabItem value="Linux">

After downloading the Linux `*.deb` package, run the following command in the terminal to install VNC Viewer:

<NewCodeBlock tip="Linux$" type="host">

```
sudo dpkg -i VNC-Viewer-xxx.deb
```

</NewCodeBlock>

</TabItem>

</Tabs>

### Run VNC Viewer

After installation, open the VNC Viewer software. You can choose to use VNC Viewer without logging into an account.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-windows-use-01.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

<div style={{ textAlign: "center" }}>
  VNC Viewer Interface
  <img
    src="/en/img/common/radxa-os/system-config/vnc-windows-use-02.webp"
    style={{ width: "100%", maxWidth: "600px" }}
  />
</div>

## Using VNC (Board)

### Install VNC Server

Run the following commands in the board's terminal to install the VNC server:

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo apt update
sudo apt install tigervnc-standalone-server tigervnc-common -y
```

</NewCodeBlock>

### Set VNC Remote Password

Run the following command in the board's terminal to set the VNC remote password:

<NewCodeBlock tip="radxa@airbox$" type="device">

```
vncpasswd
```

</NewCodeBlock>

:::tip
The password and confirmation won't be displayed on screen. When prompted to create a view-only password, select `n` (no).
:::

After setting the password, you'll see output similar to:

```
Password:
Verify:
Would you like to enter a view-only password (y/n)? n
A view-only password is not used
```

### Configure VNC Startup File

Edit the `~/.vnc/xstartup` file on the board:

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo vi ~/.vnc/xstartup
```

</NewCodeBlock>

Modify the `~/.vnc/xstartup` file with the following content:

```
#!/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=ubuntu:GNOME
export GNOME_SHELL_SESSION_MODE=ubuntu

exec gnome-session --session=ubuntu > ~/.vnc/gnome-startup.log 2>&1
```

After editing the `~/.vnc/xstartup` file, you need to make it executable:

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo chmod +x ~/.vnc/xstartup
```

</NewCodeBlock>

### Start VNC Server

Run the following command in the board's terminal to start the VNC server. The `-localhost no` parameter allows remote access.

<NewCodeBlock tip="radxa@airbox$" type="device">

```
vncserver -localhost no
```

</NewCodeBlock>

After successful startup, the terminal will display output similar to the following, showing the VNC server's port number:

```
/usr/bin/xauth:  file /home/radxa/.Xauthority does not exist

New Xtigervnc server 'airbox:1 (radxa)' on port 5901 for display :1.
Use xtigervncviewer -SecurityTypes VncAuth,TLSVnc -passwd /tmp/tigervnc.9lBgyh/passwd airbox:1 to connect to the VNC server.
```

### Check VNC Server Status

Run the following command in the board's terminal to check the VNC server status:

<NewCodeBlock tip="radxa@airbox$" type="device">

```
vncserver -list
```

</NewCodeBlock>

The terminal will display output similar to:

```
TigerVNC server sessions:

X DISPLAY #     RFB PORT #      RFB UNIX PATH   PROCESS ID #    SERVER
1               5901                            8900            Xtigervnc
```

### Stop VNC Server

To stop the VNC server, run the following command in the board's terminal. The `:1` in the command represents the VNC server's display number:

<NewCodeBlock tip="radxa@airbox$" type="device">

```
vncserver -kill :1
```

</NewCodeBlock>

After stopping the VNC server, the VNC Viewer software will automatically disconnect.

## VNC Remote Login

On another device, open the VNC Viewer software and connect to the board using its IP address and port number.

① Enter the board's IP address and port number

② Click `Connect to address ···` to connect to the board

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-connect-01.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

① Enter the VNC remote password you set

② Check the `Remember password` option to save the password for future logins

③ Click `OK` to connect

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/common/radxa-os/system-config/vnc-connect-02.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>

Upon successful login, you'll see the system's desktop environment.

<div style={{ textAlign: "center" }}>
  <img
    src="/en/img/fogwise/airbox-q900/airbox-q900-vnc-login.webp"
    style={{ width: "100%", maxWidth: "1200px" }}
  />
</div>
