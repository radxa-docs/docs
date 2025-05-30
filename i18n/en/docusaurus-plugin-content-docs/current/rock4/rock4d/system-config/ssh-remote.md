---
sidebar_position: 4
---

# SSH Remote Access

Remote access allows you to control the board over a network. This tutorial only covers the method of SSH remote control within a local area network (LAN).

Users without a display can configure SSH remote access by following the [UART Debug](./uart_debug) method to run the commands below.

:::tip
Ensure both devices are on the same local area network:

1. Verify that both devices have IP addresses on the same subnet.
2. Test connectivity by running `ping` between the devices using their IP addresses.
   :::

## Install OpenSSH

SSH remote control requires the OpenSSH server. Run the following commands in the terminal of your Radxa ROCK 4D to install it:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo apt update
sudo apt install openssh-server -y
```
</NewCodeBlock>

## Start SSH Service

Run the following command in the terminal of your Radxa ROCK 4D to start the SSH service:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo systemctl start ssh
```
</NewCodeBlock>

## Enable SSH Service at Boot

Run the following command in the terminal of your Radxa ROCK 4D to enable the SSH service to start automatically on boot:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo systemctl enable ssh
```
</NewCodeBlock>

## Check SSH Service Status

Run the following command in the terminal of your Radxa ROCK 4D to check the status of the SSH service:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo systemctl status ssh
```
</NewCodeBlock>

The terminal will display information indicating whether the SSH service is enabled to start on boot and its current running status.

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

## Remote Login

On another device, open a terminal and enter the following command to log in remotely. You can use the `ip a` command to check the IP address of your Radxa ROCK 4D.

<NewCodeBlock tip="Host-PC$" type="host">
```
ssh <user-name>@<ip-address>
```
</NewCodeBlock>

Where `<user-name>` and `<ip-address>` are the username and IP address of your Radxa ROCK 4D, respectively.

① : Query the IP address of the Radxa ROCK 4D (in this case, I'm querying the IP address through a serial connection to the Radxa ROCK 4D).

② : The actual IP address of the Radxa ROCK 4D.

③ : Remotely log in to the Radxa ROCK 4D via SSH.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/ssh-login.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
