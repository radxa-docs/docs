---
sidebar_position: 15
---

import Serial from "../../../common/general/\_serial.mdx"

# Radxa OS

Introduces system login, network connection, etc to let user to be familiar with the system quickly.

## User name and Password

The user name and password added by default to the Radxa ROCK S0 series are:

```text
User name：radxa/rock
Password： radxa/rock
```

## Serial Debug

<Serial platform="rk" />

## Setting Network

### Connect WiFi

```bash
nmcli device wifi                                           #Scan WiFi
sudo nmcli device wifi connect <ssid> password <passwd>     #Connect WiFi
```

### Ethernet

The Radxa ROCK S0 has 100M Ethernet on board, just connect the cable to enable internet access, use the `ip a ` command to view the ip.

## Remote Login

### SSH Login

After connecting to the network, you can use SSH to debug remotely, the official Debian image has enabled SSH by default, you just need to get the IP of the board to use SSH to connect.

- Debian/Ubuntu

```bash
ssh [username]@[hostname]
or
ssh [username]@[IP address]
Example:
ssh radxa@192.168.1.100
You can connect to the Debian system after entering your user password.
```

- Windows

There are a number of SSH tools available for Windows, here's [Mobaxterm](https://mobaxterm.mobatek.net/) to show you how to connect.

Click `Session` in the upper left corner to create a new SSH connection, enter the IP of the board in the `Remote host` field, tick `Specify usernema` and fill in the user who logs in, and then double-click on the session to start the connection and enter the login password to connect.

![mobaxterm ssh ](/img/zero/zero3/mobaxterm-ssh.webp)
