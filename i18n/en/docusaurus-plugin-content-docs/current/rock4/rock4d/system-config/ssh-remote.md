---
sidebar_position: 4
---

# SSH Remote Access

Remote access allows you to control the board over a network. This tutorial focuses on SSH remote control within a local area network (LAN).

For users without a display, you can configure SSH remote access by following the [Serial Debugging](./uart_debug) guide and running the commands below.

:::tip
Ensure both devices are on the same local network:

1. Verify both devices have IP addresses in the same subnet.
2. Test connectivity by pinging each device's IP address.
   :::

## Install OpenSSH

To enable SSH remote control, install the OpenSSH server by running the following commands in the Radxa ROCK 4D terminal:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo apt update
sudo apt install openssh-server -y
```
</NewCodeBlock>

## Start SSH Service

Run the following command to start the SSH service on your ROCK 4D:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo systemctl start ssh
```
</NewCodeBlock>

## Enable SSH Service on Boot

To ensure the SSH service starts automatically on boot, run:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo systemctl enable ssh
```
</NewCodeBlock>

## Check SSH Service Status

To verify the SSH service status, use the following command:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```bash
sudo systemctl status ssh
```
</NewCodeBlock>

The output will show whether the SSH service is active and enabled to start on boot:

```text
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

## SSH Remote Login

<Tabs queryString="ssh-mode">

<TabItem value="Command Line Mode">

On another device, open a terminal and use the following command to connect. You can find the ROCK 4D's IP address using the `ip a` command.

<NewCodeBlock tip="Host-PC$" type="host">
```bash
ssh <user-name>@<ip-address>

# Example

ssh radxa@192.168.2.106

````
</NewCodeBlock>

Where `<user-name>` is your ROCK 4D username and `<ip-address>` is the board's IP address.

① : Query the ROCK 4D's IP address (in this case, obtained via serial connection).

② : The actual IP address of the ROCK 4D.

③ : Remote login to ROCK 4D via SSH.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/ssh-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
</TabItem>

<TabItem value="Graphical Interface Mode">

Tabby is a powerful cross-platform terminal emulator that supports various protocols including serial and SSH. We recommend using Tabby for SSH remote access.

- Installing Tabby

Download and install Tabby from the [official Tabby website](https://tabby.sh/).

:::tip

- Windows

Choose the appropriate `.exe` file based on your system architecture.

- Linux

Select the `.deb` file that matches your system architecture.

- MacOS

Download the `.dmg` file for your system architecture.

:::

- Using Tabby for SSH

Double-click the Tabby icon to launch the application.

<div style={{textAlign: 'center'}}>
Tabby Main Interface
  <img src="/img/rock4/4d/tabby-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Configure SSH connection:

① --> `Settings`: Click to access settings

② --> `Profiles & connections`: Click to configure connection settings

③ --> `New profile`: Click to add a new configuration

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Select a base configuration template:

Choose `SSH connection` to modify device name, IP address, port, and other parameters in the subsequent interface.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-08.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After selecting the `SSH connection` template, modify the following parameters:

`Name`: Set a connection name (recommended to use the product name)

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-09.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

① --> `Host`: Enter the IP address of your ROCK 4D

② --> `User`: Set the username (default is `radxa`)

③ --> `Save`: Save the configuration

The default port `22` typically doesn't need to be changed.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-10.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Click the run button to establish the SSH connection:

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-11.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After connecting, Tabby will prompt for a password:

① --> password: Enter the ROCK 4D password (default is `radxa`)

② --> OK: Confirm the connection

It's recommended to check the `Remember` option to avoid entering the password on subsequent connections.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-12.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

Once successfully connected, the remote interface will appear.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/tabby-13.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>
</Tabs>
```text
````
