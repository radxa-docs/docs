---
sidebar_position: 10
---

# 移远 LTE EC25

以下以 ROCK 5B+ 为例，介绍移远 LTE EC25-AU 模块的配置方法。

:::tip
只支持 M.2 B Key 接口，不支持 M.2 M Key 接口。
:::

## 安装相关软件

请在终端中执行以下命令以安装拨号上网相关软件：

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
sudo apt update
sudo apt install libqmi-utils modemmanager
```
</NewCodeBlock>

## 连接外设

首先，将移远 LTE EC25-AU 模块安装到 ROCK 5B+ 的 M.2 B Key 接口上，然后将 SIM 卡插入 ROCK 5B+ 的 SIM 卡槽。

你可以通过以下命令检查设备是否已连接：

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
lsusb | grep -i Quectel
```
</NewCodeBlock>

若连接正常，终端会输出类似信息：
```
Bus 002 Device 002: ID 2c7c:0125 Quectel Wireless Solutions Co., Ltd. EC25 LTE modem
```

请检查系统是否正确枚举出对应的 cdc-wdm 设备：

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
ls /dev/cdc-wdm*
```
</NewCodeBlock>

若识别正常，终端会输出类似信息：
```
/dev/cdc-wdm0
```

检查数据端口格式：

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
sudo qmicli -d /dev/cdc-wdm0 -e
```
</NewCodeBlock>

正常应该配置为 `raw-ip`，否则需要使用 `sudo qmicli -d /dev/cdc-wdm0 -E raw-ip` 命令设置，并重启板子。

检查数据网络接口：

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
sudo qmicli -d /dev/cdc-wdm0 -w
```
</NewCodeBlock>

正常应该配置为 `wwan0`，否则需要使用 `sudo qmicli -d /dev/cdc-wdm0 -w wwan0` 命令设置，并重启板子。

## 创建网络接口配置接口

首先，使用 `nmcli` 创建接口配置：

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
sudo nmcli connection add type gsm ifname cdc-wdm0
```
</NewCodeBlock>

若创建成功，终端会输出类似信息：
```
Connection 'gsm-cdc-wdm0' (e26d1d79-ba6b-44f3-9135-1ef7a80d982a) successfully added.
```

然后根据运营商要求编辑接口配置（可选）：

:::info
此操作为可选项，如果连接不正常，可仿照以下操作编辑 apn、username、password 等运营商相关配置。
输入 `print` 可输出所有配置信息。
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

## 检查网络

检查 wwan 接口是否已配置 IP，如果此接口无 IP，可使用 `sudo nmcli connection up gsm-cdc-wdm0` 命令重新连接：

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
ip a
```
</NewCodeBlock>

若连接成功，查询 IP 会输出类似信息：
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

使用 `ping` 命令指定 `wwan` 接口检查网络是否正常：

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

## 疑难解答

1. 我的系统没有列出 cdc-wdm 串口设备。

请检查对应的驱动是否包含在你当前运行的系统中。你可以执行以下命令检查：

<NewCodeBlock tip="radxa@rock-5b-plus$" type="device">
```
sudo lsmod | grep qmi_wwan
```
</NewCodeBlock>

终端输出类似信息表示驱动已加载：
```
qmi_wwan               36864  0
cdc_wdm                28672  2 qmi_wwan
usbnet                 36864  1 qmi_wwan
```