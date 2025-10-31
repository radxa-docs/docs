---
sidebar_position: 9
---

# Mini PCIe 插槽

瑞莎 Fogwise® AIRbox Q900 板载 1 个 Mini PCIe 插槽，支持安装无线网卡和 4G/5G 模块。

## 硬件连接

主板关机后，将 Mini PCIe 接口的无线网卡或 4G/5G 模块插入 Mini PCIe 插槽，然后使用 M.2 螺丝固定即可使用。

<Tabs queryString="Module">

<TabItem value="无线网卡">

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-wifi.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="4G/5G 模块">

实现移动网络需要安装 4G/5G 模块和 Nano SIM 卡。

说明：教程以移远 LTE EC20 为例。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-5g.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

</Tabs>

## 使用指南

<Tabs queryString="Module">

<TabItem value="无线网卡">

可以使用 `lspci` 命令查看无线网卡是否正常识别。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
lspci | grep -i net
```

</NewCodeBlock>

若系统识别正常，终端会输出类似信息：

```
0000:01:00.0 Network controller: Realtek Semiconductor Co., Ltd. RTL8852BE PCIe 802.11ax Wireless Network Controller
```

使用 `nmcli` 命令行工具来连接 WiFi 网络。

:::tip
nmcli（NetworkManager Command Line Interface）是 NetworkManager 的命令行管理工具，用于在 Linux 系统下配置和管理网络连接。
:::

- 开启 WiFi 功能

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo nmcli radio wifi on
```

</NewCodeBlock>

- 搜索 WiFi 网络

若开启 WiFi 功能并没有搜索到 WiFi 网络，可以尝试重启系统。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo nmcli device wifi list
```

</NewCodeBlock>

- 连接 WiFi 网络

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo nmcli device wifi connect <SSID> password <PASSWORD>
# 示例
sudo nmcli device wifi connect wifi-demo password 12345678
```

</NewCodeBlock>

连接成功后，终端会输出类似如下信息：

```
Device 'wlp1s0' successfully activated with 'fb6ae336-87b2-4d36-af8b-ae9ac6b335d4'.
```

- 查看网络连接的详细信息

<NewCodeBlock tip="radxa@airbox$" type="device">

```
ip a
```

</NewCodeBlock>

终端会输出类似如下信息：其中 `192.168.31.231` 就是路由器分配的 IP 地址。

```
···
4: wlp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether fc:23:cd:90:8e:04 brd ff:ff:ff:ff:ff:ff
    inet 192.168.31.231/24 brd 192.168.31.255 scope global dynamic noprefixroute wlp1s0
       valid_lft 3575sec preferred_lft 3575sec
    inet6 fdaa:0:0:30::f12/128 scope global dynamic noprefixroute
       valid_lft 3587sec preferred_lft 3587sec
    inet6 240e:3b7:324c:5782::f12/128 scope global dynamic noprefixroute
       valid_lft 3587sec preferred_lft 3587sec
    inet6 240e:3b7:324c:5782:f7ff:b72a:6f0c:e487/64 scope global temporary dynamic
       valid_lft 252323sec preferred_lft 86195sec
    inet6 240e:3b7:324c:5782:51aa:999e:13aa:20d9/64 scope global dynamic mngtmpaddr noprefixroute
       valid_lft 252323sec preferred_lft 165923sec
    inet6 fdaa::xxxxxxxxxxxxxxxxxxx scope global temporary dynamic
       valid_lft 604787sec preferred_lft 86195sec
    inet6 fdaa::xxxxxxxxxxxxxxxxxxx scope global mngtmpaddr noprefixroute
       valid_lft forever preferred_lft 604787sec
    inet6 240e:3b7:3247:94b2:a9c0:4f94:b63:8735/64 scope global deprecated dynamic mngtmpaddr noprefixroute
       valid_lft 292sec preferred_lft 0sec
    inet6 fe80::cca9:da77:4d73:58bb/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
···
```

:::tip
拓展命令：

- `sudo nmcli radio wifi off`：关闭 WiFi 功能。
- `sudo nmcli connection delete <SSID>` ：删除指定的 WiFi 网络。
  :::

- 设置 WiFi 热点

我们会使用 `nmcli` 命令行工具来设置 WiFi 热点。

- 查看 WiFi 网卡

使用 `ip a` 命令查看无线网卡设备名称。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
ip a
```

</NewCodeBlock>

终端会输出类似如下信息：其中 `wlp1s0` 就是无线网卡设备名称。

```
···
4: wlp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether fc:23:cd:90:8e:04 brd ff:ff:ff:ff:ff:ff
    inet 192.168.31.231/24 brd 192.168.31.255 scope global dynamic noprefixroute wlp1s0
       valid_lft 3575sec preferred_lft 3575sec
    inet6 fdaa:0:0:30::f12/128 scope global dynamic noprefixroute
       valid_lft 3587sec preferred_lft 3587sec
    inet6 240e:3b7:324c:5782::f12/128 scope global dynamic noprefixroute
       valid_lft 3587sec preferred_lft 3587sec
    inet6 240e:3b7:324c:5782:f7ff:b72a:6f0c:e487/64 scope global temporary dynamic
       valid_lft 252323sec preferred_lft 86195sec
    inet6 240e:3b7:324c:5782:51aa:999e:13aa:20d9/64 scope global dynamic mngtmpaddr noprefixroute
       valid_lft 252323sec preferred_lft 165923sec
    inet6 fdaa::30:7cba:a8be:78f9:be4e/64 scope global temporary dynamic
       valid_lft 604787sec preferred_lft 86195sec
    inet6 fdaa::xxxxxxxxxxxxxxxxxxx scope global mngtmpaddr noprefixroute
       valid_lft forever preferred_lft 604787sec
    inet6 240e:3b7:3247:94b2:a9c0:4f94:b63:8735/64 scope global deprecated dynamic mngtmpaddr noprefixroute
       valid_lft 292sec preferred_lft 0sec
    inet6 fe80::cca9:da77:4d73:58bb/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
···
```

- 设置 WiFi 热点

打开系统终端命令行，输入以下命令设置 WiFi 热点：

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo nmcli device wifi hotspot ifname <ifname> con-name <name> ssid <SSID> password <password>
# 示例
sudo nmcli device wifi hotspot ifname wlp1s0 con-name My-Hotspot ssid My-Hotspot password 12345678
```

</NewCodeBlock>

参数说明：用名为 `wlp1s0` 的无线网卡创建一个名为 `My-Hotspot`、密码为 `12345678` 的 WiFi 热点，并将该连接保存为 `My-Hotspot`，方便后续管理。

- `ifname`：指定用于创建热点的无线网卡接口名，可以使用 `ip a` 命令查看无线网卡接口名。
- `con-name`：指定热点连接名称，后续可以通过这个名字管理（开启、关闭、删除该热点）。
- `ssid`：指定热点的名称，也就是其他设备搜索到的无线网络名称。
- `password`：指定热点的密码。

设置成功后，终端会输出类似如下信息：

```
Device 'wlp1s0' successfully activated with 'f680a445-8f38-44a0-9f50-cb1a8daafb30'.
Hint: "nmcli dev wifi show-password" shows the Wi-Fi name and password.
```

- 关闭 WiFi 热点

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo nmcli connection down My-Hotspot
```

</NewCodeBlock>

- 开启 WiFi 热点

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo nmcli connection up My-Hotspot
```

</NewCodeBlock>

- 删除 WiFi 热点

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo nmcli connection delete My-Hotspot
```

</NewCodeBlock>

</TabItem>

<TabItem value="4G/5G 模块">

- 验证 4G/5G 模块

可以使用 `lsusb` 命令查看 4G/5G 模块是否正常识别。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
lsusb | grep -i Quectel
```

</NewCodeBlock>

若系统识别正常，终端会输出类似信息：

```
Bus 005 Device 002: ID 2c7c:0125 Quectel Wireless Solutions Co., Ltd. EC25 LTE modem
```

- 检查 cdc-wdm 设备

使用 `ls` 命令检查系统是否正常枚举出 `cdc-wdm` 设备。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
ls /dev/cdc-wdm*
```

</NewCodeBlock>

若识别正常，终端会输出类似信息：

```
/dev/cdc-wdm0
```

- 安装软件

安装拨号上网相关软件包。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo apt install libqmi-utils modemmanager -y
```

</NewCodeBlock>

- 检查数据端口格式

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo qmicli -d /dev/cdc-wdm0 -e
```

</NewCodeBlock>

正常应该配置为 `raw-ip`，否则需要使用 `sudo qmicli -d /dev/cdc-wdm0 -E raw-ip` 命令设置，并重启板子。

- 检查数据网络接口

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo qmicli -d /dev/cdc-wdm0 -w
```

</NewCodeBlock>

正常应该配置为 `wwan0`，否则需要使用 `sudo qmicli -d /dev/cdc-wdm0 -w wwan0` 命令设置，并重启板子。

- 创建网络接口配置

使用 `nmcli` 命令创建网络接口配置。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo nmcli connection add type gsm ifname cdc-wdm0
```

</NewCodeBlock>

若创建成功，终端会输出类似信息：

```
Connection 'gsm-cdc-wdm0' (6a044568-6947-436e-9b46-51a1f2a9b65d) successfully added.
```

:::tip 根据运营商要求编辑网络接口配置（可选）

此操作为可选项，如果网络连接异常，可以参考以下操作编辑 apn、username、password 等运营商相关配置。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo nmcli connection edit gsm-cdc-wdm0
```

</NewCodeBlock>

终端会自动进入交互式界面，可以输入 `help` 或 `?` 查看帮助信息。

```
===| nmcli interactive connection editor |===

Editing existing 'gsm' connection: 'gsm-cdc-wdm0'

Type 'help' or '?' for available commands.
Type 'print' to show all the connection properties.
Type 'describe [<setting>.<prop>]' for detailed property description.

You may edit the following settings: connection, gsm, serial, ppp, match, ipv4, ipv6, hostname, link, tc, proxy
nmcli> set gsm.apn ctlte
nmcli> save
Connection 'gsm-cdc-wdm0' (e26d1d79-ba6b-44f3-9135-1ef7a80d982a) successfully updated.
nmcli> quit
```

:::

- 验证网络

使用 `ip a` 命令查看 `wwan0` 接口是否正常配置 IP。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
ip a
```

</NewCodeBlock>

若连接成功，终端会输出类似信息：

```
···
4: wwan0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UNKNOWN group default qlen 1000
    link/none
    inet 10.10.24.33/30 brd 10.10.24.35 scope global noprefixroute wwan0
       valid_lft forever preferred_lft forever
···
```

若接口无 IP 信息，可以使用 `sudo nmcli connection up gsm-cdc-wdm0` 命令重启网络接口。

使用 `ping` 命令测试网络连接。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
sudo ping baidu.com -I wwan0 -c 5
```

</NewCodeBlock>

若网络正常，终端会输出类似信息：

```
PING baidu.com (220.181.7.203) from 10.10.24.33 wwan0: 56(84) bytes of data.
64 bytes from 220.181.7.203: icmp_seq=1 ttl=52 time=60.6 ms
64 bytes from 220.181.7.203: icmp_seq=2 ttl=52 time=59.5 ms
64 bytes from 220.181.7.203: icmp_seq=3 ttl=52 time=68.7 ms
64 bytes from 220.181.7.203: icmp_seq=4 ttl=52 time=66.9 ms
64 bytes from 220.181.7.203: icmp_seq=5 ttl=52 time=64.2 ms

--- baidu.com ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4006ms
rtt min/avg/max/mdev = 59.494/63.983/68.727/3.540 ms
```

</TabItem>

</Tabs>
