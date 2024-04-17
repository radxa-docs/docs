---
sidebar_position: 1
---

# Preparation

## power supply

BM168M Powered by Type-C connector, needs 20V / 65W power input.

## Access to equipment

The default user name and password for the system are as follows:

User one:

```
username: linaro
password: linaro
```

User two:

```
username: admin
password: admin
```

### Serial Login

Use the USB Type-A to Type-C cable to connect the Debug port of the whole machine and the PC side, the baud rate is set to 115200, the connection diagram:

![](/img/bm168m/connection-diagram-1.webp)

#### Serial port usage under WIndows

Serial port driver is required under WIndows:[Installation of Serial Driver](/sophon/bm168m/getting-started/serial-driver-install.md)

After you have installed it, illustrated with the Putty tool:

1. Launch the application Putty on a Windows PC and set it up as follows:

- Select Session in the left column, set the serial line to COM1, the baud rate to 115200, and the connection type to Serial.
- Write the name you want to set in the Saved Sessions column and press Save.

![](/img/bm168m/putty-setting-1.webp)

2. Select Serial at the bottom in the left column and configure it according to the following parameters:

![](/img/bm168m/putty-setting-2.webp)

3. After the settings are completed, click Open to open the serial port.

#### Serial port usage under Linux

Illustrated with the Picocom tool:

1. Install Picocom:

```
sudo apt-get update

sudo apt-get install picocom
```

2. Turn on Picocom:

```
sudo picocom -b 115200 /dev/ttyUSBX
```

X is a different device, usually 0.

### SSH Login

#### Via WAN port

Connection schematic:

![](/img/bm168m/connection-diagram-2.webp)

First, use Angryip to find the IP.

Use this method to look up the ip address when you cannot operate the motherboard directly to obtain the ip address without a screen or remotely.

- First the host PC needs to download [Angryip](https://angryip.org/download/), Then make sure that the host PC and the board are on the same LAN.

- Open Angryip, select the IP range, which is in the range of 192.168.2.0 - 192.168.2.255 (select the network segment where the host computer is located with the motherboard), and click Start as shown in the figure.

- ![](/img/bm168m/angryip-settion.webp)

- Press Ctrl + F to look for the `bm1684` keyword to find the IP address of the board.

After obtaining the board IP:

##### Debian/Ubuntu

```
ssh [username]@[hostname]
or
ssh [username]@[IP address]
example:
ssh linaro@192.168.1.100
```

##### Windows

Windows has a number of SSH tools, Here is [Mobaxterm](https://mobaxterm.mobatek.net/) to show you how to connect.

Click `Session` in the upper left corner to create a new SSH connection, enter the board's IP in the `Remote host` field, check `Specify usernema` and fill in the logged-in user, double-click the session to start the connection and enter the login password to connect.

![](/img/bm168m/angryip.webp)

#### Via LAN port

Connection schematic:

![](/img/bm168m/connection-diagram-3.webp)

This way does not need to get the IP first, LAN port fixed IP for 192.168.150.1, after knowing the IP for 192.168.150.1 and WAN port using the same method can SSH login system, but we need to change the computer's IP to 150 network segment, for example, set our computer's IP to 192.168.150.5.
