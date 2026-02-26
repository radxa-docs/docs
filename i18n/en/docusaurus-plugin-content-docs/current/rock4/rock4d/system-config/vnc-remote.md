---
sidebar_position: 5
---

# VNC Remote

Remote login refers to remotely controlling the motherboard through the network. This tutorial only covers VNC remote control methods within a local network.

Users without a display can use the [Serial Port Debugging](./uart_debug) method to run the following commands to configure VNC remote login.

:::tip
VNC remote control is suitable for systems with a graphical interface. If the system does not have a graphical desktop, we recommend using SSH remote control.
:::

## Using VNC (Windows / Linux)

### Download VNC Viewer

We need to install VNC Viewer software on the remote device (PC) to control the motherboard.

Go to the [RealVNC](https://www.realvnc.com/en/connect/download/viewer) website to download the VNC Viewer installation package for your system platform.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-download.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Install VNC Viewer

<Tabs queryString="install-vnc">

<TabItem value="Windows">

After downloading the Windows version of the `*.exe` installation package:

- Run the installer

Run the `VNC-Viewer-<version>.exe` installer as administrator.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>
- Software language

Select `English` language and click `OK` to proceed.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-02.webp" style={{width: '100%', maxWidth: '300px'}} />
</div>

- Start installation

Click `Next` to start the installation program.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Accept license

Check the `I accept the terms in the License Agreement` option and click `Next` to proceed.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-04.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Installation path

It's recommended to use the default installation path. Click `Next` to proceed.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-05.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Start installation

Click `Install` to begin the installation.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-06.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Complete installation

Click `Finish` to complete the installation.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-07.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

</TabItem>

<TabItem value="Linux">

After downloading the Linux version of the `*.deb` package, run the following command in the terminal to install VNC Viewer:

<NewCodeBlock tip="Linux-host$" type="host">
```bash
sudo dpkg -i VNC-Viewer-<version>.deb
```
</NewCodeBlock>

</TabItem>

</Tabs>

### Run VNC Viewer

After installation, open the VNC Viewer software. Users can choose to use VNC Viewer without logging in.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-use-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
VNC Viewer Interface
    <img src="/img/rock4/4d/vnc-windows-use-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## Using VNC (Radxa ROCK 4D)

### Install VNC Server

Run the following commands in the Radxa ROCK 4D terminal to install the VNC server:

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
sudo apt update
sudo apt install tigervnc-standalone-server tigervnc-common -y
```
</NewCodeBlock>

### Set VNC Remote Password

Run the following command in the ROCK 4D terminal to set the VNC remote password:
<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">

```
vncpasswd
```

</NewCodeBlock>

:::tip
The password and confirmation will not be displayed on the screen. When prompted to create a view-only password, choose `n` (no).
:::

After setting the password, the system will display similar information:

```
Password:
Verify:
Would you like to enter a view-only password (y/n)? n
A view-only password is not used
```

### Configure VNC Startup File

Edit the `~/.vnc/xstartup` file on ROCK 4D:

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
sudo vi ~/.vnc/xstartup
```
</NewCodeBlock>

Modify the contents of the `~/.vnc/xstartup` file to:

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

After editing the `~/.vnc/xstartup` file, make it executable:

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
sudo chmod +x ~/.vnc/xstartup
```
</NewCodeBlock>

### Start VNC Server

Run the following command in the ROCK 4D terminal to start the VNC server. Use the `-localhost no` parameter to allow remote access.

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
vncserver -localhost no
```
</NewCodeBlock>

After successful startup, the terminal will display information similar to this, indicating the VNC server's port number:

```
New Xtigervnc server 'rock-4d-spi:1 (radxa)' on port 5901 for display :1.
Use xtigervncviewer -SecurityTypes VncAuth -passwd /tmp/tigervnc.VQ4DfI/passwd :1 to connect to the VNC server.
```

### Check VNC Server Status

To check the status of the VNC server, run the following command in the ROCK 4D terminal:

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
vncserver -list
```
</NewCodeBlock>

The terminal will display output similar to:

```
TigerVNC server sessions:

X DISPLAY #	RFB PORT #	RFB UNIX PATH	PROCESS ID #	SERVER
1         	5901      	          	3283        	Xtigervnc
```

### Stop VNC Server

To stop the VNC server, run the following command in the ROCK 4D terminal. The `:1` in the command represents the VNC server's display number.

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
vncserver -kill :1
```
</NewCodeBlock>

After stopping the VNC server, the VNC Viewer software will automatically disconnect.

## VNC Remote Login

Open the VNC Viewer software on another device and connect to the ROCK 4D using its IP address and port number.

① Enter the ROCK 4D's IP address and port number

② Click `Connect to address ···` to connect to ROCK 4D

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-connect-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① Enter the VNC remote password

② Check the `Remember password` option to save the password for future logins

③ Click `OK` to connect

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-connect-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
Successful VNC Remote Login
    <img src="/img/rock4/4d/vnc-connect-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
