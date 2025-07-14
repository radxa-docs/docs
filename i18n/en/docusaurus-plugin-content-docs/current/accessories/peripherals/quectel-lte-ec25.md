---
sidebar_position: 10
---

# Quectel LTE EC25

This guide uses the ROCK 5B+ as an example to demonstrate how to configure the Quectel LTE EC25-AU module.

:::tip
Only M.2 B Key interface is supported; M.2 M Key interface is not supported.
:::

## Install Required Software

Execute the following commands in the terminal to install the necessary dial-up networking software:

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
sudo apt update
sudo apt install libqmi-utils modemmanager
```
</NewCodeBlock>

## Connect Peripherals

First, install the Quectel LTE EC25-AU module into the M.2 B Key slot on the ROCK 5B+, then insert the SIM card into the SIM card slot of the ROCK 5B+.

You can check if the device is properly connected with the following command:

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
lsusb | grep -i Quectel
```
</NewCodeBlock>

If connected properly, the terminal will display output similar to:

```
Bus 002 Device 002: ID 2c7c:0125 Quectel Wireless Solutions Co., Ltd. EC25 LTE modem
```

Check if the system has correctly enumerated the corresponding cdc-wdm device:

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
ls /dev/cdc-wdm*
```
</NewCodeBlock>

If recognized correctly, the terminal will display output similar to:

```
/dev/cdc-wdm0
```

Check the data port format:

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
sudo qmicli -d /dev/cdc-wdm0 -e
```
</NewCodeBlock>

It should be configured as `raw-ip`. If not, use the command `sudo qmicli -d /dev/cdc-wdm0 -E raw-ip` to set it, then reboot the board.

Check the data network interface:

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
sudo qmicli -d /dev/cdc-wdm0 -w
```
</NewCodeBlock>

It should be configured as `wwan0`. If not, use the command `sudo qmicli -d /dev/cdc-wdm0 -w wwan0` to set it, then reboot the board.

## Create Network Interface Configuration

First, use `nmcli` to create the interface configuration:

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
sudo nmcli connection add type gsm ifname cdc-wdm0
```
</NewCodeBlock>

If successful, the terminal will display output similar to:

```
Connection 'gsm-cdc-wdm0' (e26d1d79-ba6b-44f3-9135-1ef7a80d982a) successfully added.
```

Edit the interface configuration according to your carrier's requirements (optional):

:::info
This step is optional. If the connection is not working properly, you can edit carrier-related configurations such as APN, username, and password following the example below.
Type `print` to display all configuration information.
:::

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
sudo nmcli connection edit gsm-cdc-wdm0

===| nmcli interactive connection editor |===

Editing existing 'gsm' connection: 'gsm-cdc-wdm0'

Type 'help' or '?' for available commands.
Type 'print' to show all the connection properties.
Type 'describe [<setting>.<prop>]' for detailed property description.

You may edit the following settings: connection, gsm, serial, ppp, match, ipv4, ipv6, hostname, tc, proxy
nmcli> set gsm.apn ctlte
nmcli> save
Connection 'gsm-cdc-wdm0' (e26d1d79-ba6b-44f3-9135-1ef7a80d982a) successfully updated.
nmcli> quit

```
</NewCodeBlock>

## Check Network

Check if the wwan interface has been assigned an IP address. If not, use the command `sudo nmcli connection up gsm-cdc-wdm0` to reconnect:

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```

ip a

```
</NewCodeBlock>

If connected successfully, the IP query will display output similar to:
```

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
inet 127.0.0.1/8 scope host lo
valid_lft forever preferred_lft forever
inet6 ::1/128 scope host noprefixroute
valid_lft forever preferred_lft forever
2: enP4p65s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
link/ether 92:f3:c7:c0:ad:c9 brd ff:ff:ff:ff:ff:ff permaddr 02:2b:ab:02:ab:a8
3: wlP2p33s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
link/ether 20:0b:74:70:fc:62 brd ff:ff:ff:ff:ff:ff
inet 192.168.31.215/24 brd 192.168.31.255 scope global dynamic noprefixroute wlP2p33s0
valid_lft 3529sec preferred_lft 3529sec
inet6 fe80::2d68:bb6a:934b:a41b/64 scope link noprefixroute
valid_lft forever preferred_lft forever
7: wwan0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UNKNOWN group default qlen 1000
link/none
inet 10.10.239.91/29 brd 10.10.239.95 scope global noprefixroute wwan0
valid_lft forever preferred_lft forever

```

Use the `ping` command with the `wwan` interface to check if the network is working properly:

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```

sudo ping baidu.com -I wwan0 -c 5
PING baidu.com (39.156.66.10) from 10.10.239.91 wwan0: 56(84) bytes of data.
64 bytes from 39.156.66.10 (39.156.66.10): icmp_seq=1 ttl=48 time=172 ms
64 bytes from 39.156.66.10 (39.156.66.10): icmp_seq=2 ttl=48 time=63.7 ms
64 bytes from 39.156.66.10 (39.156.66.10): icmp_seq=3 ttl=48 time=61.2 ms
64 bytes from 39.156.66.10 (39.156.66.10): icmp_seq=4 ttl=48 time=88.9 ms
64 bytes from 39.156.66.10 (39.156.66.10): icmp_seq=5 ttl=48 time=80.5 ms

--- baidu.com ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4004ms
rtt min/avg/max/mdev = 61.224/93.320/172.271/40.800 ms

```
</NewCodeBlock>

## Troubleshooting

1. My system doesn't list the cdc-wdm serial device.

Please check if the corresponding driver is included in your current system. You can check by executing the following command:

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```

sudo lsmod | grep qmi_wwan

```
</NewCodeBlock>

If the driver is loaded, the terminal will display output similar to:
```

qmi_wwan 36864 0
cdc_wdm 28672 2 qmi_wwan
usbnet 36864 1 qmi_wwan

```

```
