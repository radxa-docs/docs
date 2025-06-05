---
sidebar_position: 5
---

# VNC Remote

Remote login refers to remote control of the board through the network, and this tutorial only introduces the method of remote control using VNC in a local area network (LAN).

Users without a display can configure VNC remote login by following the [Serial Debugging](./uart_debug) method to run the commands below.

:::tip
VNC remote control is suitable for systems with a graphical interface. If the system does not have a graphical desktop, it is recommended to use SSH remote control.
:::

## Using VNC (Windows / Linux)

### Download VNC Viewer

We need to install VNC Viewer software on the remote device, which is the PC, to control the board.

Enter the [RealVNC](https://www.realvnc.com/en/connect/download/viewer) official website to download the VNC Viewer installation package corresponding to the system platform.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-download.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### Install VNC Viewer

<Tabs queryString="install-vnc">

<TabItem value="Windows">

Download the `*.exe` installation package after downloading the Windows version.

- Run the installation package

Run `VNC-Viewer-xxx.exe` installation program as administrator.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Software language

Select `English` language, click `OK` to enter the next step.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-02.webp" style={{width: '100%', maxWidth: '300px'}} />
</div>

- Enter the installation page

Click `Next` to enter the security agreement page.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-03.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Agree to the agreement

Select `I accept the terms in the License Agreement` option, click `Next` to enter the next step.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-04.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Installation path

Select the default installation path of the software, click `Next` to enter the next step.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-install-05.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

- Formal installation

Click `Install` to start the formal installation.

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

Download the Linux version of the `*.deb` installation package and run the following command in the terminal to install VNC Viewer:

<NewCodeBlock tip="Linux-host$" type="host">
```
sudo dpkg -i VNC-Viewer-xxx.deb
```
</NewCodeBlock>

</TabItem>

</Tabs>

### Run VNC Viewer

After installation, open the VNC Viewer software: users can choose to use VNC Viewer software without logging in to an account.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-windows-use-01.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

<div style={{textAlign: 'center'}}>
VNC Viewer interface
    <img src="/img/rock4/4d/vnc-windows-use-02.webp" style={{width: '100%', maxWidth: '600px'}} />
</div>

## Install VNC Server (Radxa ROCK 4D)

### Install VNC Server

Run the following command in the terminal of Radxa ROCK 4D to install VNC Server:

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
sudo apt update
sudo apt install tigervnc-standalone-server tigervnc-common -y
```
</NewCodeBlock>

### Set VNC Remote Password

Run the following command in the terminal of Radxa ROCK 4D to set the VNC remote password:
<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">

```
vncpasswd
```

</NewCodeBlock>

:::tip
Input password and confirm password will not be displayed on the screen, the system will prompt whether to create a read-only password, select `n` (no).
:::

After setting the password, the system will prompt similar information:

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
Password:
Verify:
Would you like to enter a view-only password (y/n)? n
A view-only password is not used
```
</NewCodeBlock>

### Configure VNC startup file

Edit the `~/.vnc/xstartup` file on Radxa ROCK 4D:

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
sudo vi ~/.vnc/xstartup
```
</NewCodeBlock>

Modify the `~/.vnc/xstartup` file content as follows:

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

After editing the `~/.vnc/xstartup` file, you need to grant the file executable permissions:

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
sudo chmod +x ~/.vnc/xstartup
```
</NewCodeBlock>

### Start VNC Server

Run the following command in the terminal of Radxa ROCK 4D to start the VNC server: use the `-localhost no` parameter to allow remote access.

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
vncserver -localhost no
```
</NewCodeBlock>

After starting successfully, it will prompt similar information to show the VNC server port number, for example:

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
New Xtigervnc server 'rock-4d-spi:1 (radxa)' on port 5901 for display :1.
Use xtigervncviewer -SecurityTypes VncAuth -passwd /tmp/tigervnc.VQ4DfI/passwd :1 to connect to the VNC server.
```
</NewCodeBlock>

### View VNC Server Status

Run the following command in the terminal of Radxa ROCK 4D to view the VNC server status:

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
vncserver -list
```
</NewCodeBlock>

The terminal will output similar information:
<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">

```
TigerVNC server sessions:

X DISPLAY #	RFB PORT #	RFB UNIX PATH	PROCESS ID #	SERVER
1         	5901      	             	3283        	Xtigervnc
```

</NewCodeBlock>

### Close VNC Server

Run the following command in the terminal of Radxa ROCK 4D to close the VNC server. The `:1` in the command represents the display number of the VNC server.

<NewCodeBlock tip="radxa@radxa-rock-4d$" type="device">
```
vncserver -kill :1
```
</NewCodeBlock>

After closing the VNC server, the VNC Viewer software will automatically disconnect.

## VNC Remote Login

Open the VNC Viewer software on another device and connect to Radxa ROCK 4D using its IP address and port number.

① : Fill in the IP address and port number of Radxa ROCK 4D

② : Click `Connect to address ···` to connect to Radxa ROCK 4D

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-connect-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① : Enter the VNC remote password set on Radxa ROCK 4D

② : Check the `Remember password` option to save the password for easy login next time

③ : Click `OK` to connect

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/vnc-connect-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

<div style={{textAlign: 'center'}}>
VNC remote login successful
    <img src="/img/rock4/4d/vnc-connect-03.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
