---
sidebar_position: 2
---

# 无线网络

主要介绍如何连接 WiFi 网络或设置 WiFi 热点。

- **连接 WiFi 网络**

主板连接到 WiFi 网络后，通常会通过路由器的 DHCP 服务自动获得 IP 地址。

- **设置 WiFi 热点**

当主板设置为 WiFi 热点（AP 模式）时，系统一般会自动启动 DHCP 服务，为连接的设备分配 IP 地址。如需定制网络参数，可根据需要手动配置 DHCP 服务。

## 连接 WiFi 网络

我们会使用 `nmcli` 命令行工具来连接 WiFi 网络。

:::tip
nmcli（NetworkManager Command Line Interface）是 NetworkManager 的命令行管理工具，用于在 Linux 系统下配置和管理网络连接。
:::

### 开启 WiFi 功能

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo nmcli radio wifi on
```
</NewCodeBlock>

### 搜索 WiFi 网络

若开启 WiFi 功能并没有搜索到 WiFi 网络，可以尝试重启系统。

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo nmcli device wifi list
```
</NewCodeBlock>

### 连接 WiFi 网络

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo nmcli device wifi connect <SSID> password <PASSWORD>
# 示例
sudo nmcli device wifi connect wifi-demo password 12345678
```
</NewCodeBlock>

连接成功后，终端会输出类似如下信息：

```
Device 'wlan0' successfully activated with 'xxxxxx'.
```

### 查看网络连接的详细信息

<NewCodeBlock tip="radxa@device$" type="device">
```
ip a
```
</NewCodeBlock>

终端会输出类似如下信息：其中 `192.168.31.53` 就是路由器分配的 IP 地址。

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: sit0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN group default qlen 1000
    link/sit 0.0.0.0 brd 0.0.0.0
3: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:e8:ec:f4:6f:8b brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.186/24 brd 192.168.2.255 scope global dynamic noprefixroute eth0
       valid_lft 3432sec preferred_lft 3432sec
    inet6 240e:3b7:3246:1e0::b09/128 scope global dynamic noprefixroute
       valid_lft 3383sec preferred_lft 3383sec
    inet6 fdaa::b09/128 scope global dynamic noprefixroute
       valid_lft 3383sec preferred_lft 3383sec
    inet6 fdaa::7ebe:84a2:306f:4271/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 240e:3b7:3246:1e0:e07d:77fb:4aa5:ace/64 scope global dynamic noprefixroute
       valid_lft 201116sec preferred_lft 114716sec
    inet6 fe80::f69d:bf6f:3d68:cef1/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
4: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 2c:c6:82:85:8d:fe brd ff:ff:ff:ff:ff:ff
    inet 192.168.31.104/24 brd 192.168.31.255 scope global dynamic noprefixroute wlan0
       valid_lft 1978sec preferred_lft 1978sec
    inet6 240e:3b7:3246:1e2::b09/128 scope global dynamic noprefixroute
       valid_lft 1978sec preferred_lft 1978sec
    inet6 fdaa:0:0:30::b09/128 scope global dynamic noprefixroute
       valid_lft 1978sec preferred_lft 1978sec
    inet6 fdaa::30:ca7:7952:73cf:aa06/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 240e:3b7:3246:1e2:7498:9c5:1d2a:f90e/64 scope global dynamic noprefixroute
       valid_lft 201117sec preferred_lft 114717sec
    inet6 fe80::3dfc:b4f1:ffe4:6c50/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

:::tip
拓展命令：

- `sudo nmcli radio wifi off`：关闭 WiFi 功能。
- `sudo nmcli connection delete <SSID>` ：删除指定的 WiFi 网络。
  :::

## 设置 WiFi 热点

我们会使用 `nmcli` 命令行工具来设置 WiFi 热点。

### 查看 WiFi 网卡

使用 `ip a` 命令查看无线网卡设备名称。

<NewCodeBlock tip="radxa@device$" type="device">
```
ip a
```
</NewCodeBlock>

终端会输出类似如下信息：其中 `wlan0` 就是无线网卡设备名称。

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: sit0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN group default qlen 1000
    link/sit 0.0.0.0 brd 0.0.0.0
3: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:e8:ec:f4:6f:8b brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.186/24 brd 192.168.2.255 scope global dynamic noprefixroute eth0
       valid_lft 3432sec preferred_lft 3432sec
    inet6 240e:3b7:3246:1e0::b09/128 scope global dynamic noprefixroute
       valid_lft 3383sec preferred_lft 3383sec
    inet6 fdaa::b09/128 scope global dynamic noprefixroute
       valid_lft 3383sec preferred_lft 3383sec
    inet6 fdaa::7ebe:84a2:306f:4271/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 240e:3b7:3246:1e0:e07d:77fb:4aa5:ace/64 scope global dynamic noprefixroute
       valid_lft 201116sec preferred_lft 114716sec
    inet6 fe80::f69d:bf6f:3d68:cef1/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
4: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 2c:c6:82:85:8d:fe brd ff:ff:ff:ff:ff:ff
    inet 192.168.31.104/24 brd 192.168.31.255 scope global dynamic noprefixroute wlan0
       valid_lft 1978sec preferred_lft 1978sec
    inet6 240e:3b7:3246:1e2::b09/128 scope global dynamic noprefixroute
       valid_lft 1978sec preferred_lft 1978sec
    inet6 fdaa:0:0:30::b09/128 scope global dynamic noprefixroute
       valid_lft 1978sec preferred_lft 1978sec
    inet6 fdaa::30:ca7:7952:73cf:aa06/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 240e:3b7:3246:1e2:7498:9c5:1d2a:f90e/64 scope global dynamic noprefixroute
       valid_lft 201117sec preferred_lft 114717sec
    inet6 fe80::3dfc:b4f1:ffe4:6c50/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

### 设置 WiFi 热点

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo nmcli device wifi hotspot ifname <ifname> con-name <name> ssid <SSID> password <password>
# 示例
sudo nmcli device wifi hotspot ifname wlan0 con-name My-Hotspot ssid My-Hotspot password 12345678
```
</NewCodeBlock>

参数说明：用名为 wlan0 的无线网卡创建一个名为 My-Hotspot、密码为 12345678 的WiFi热点，并将该连接保存为 My-Hotspot，方便后续管理。

- `ifname`：指定用于创建热点的无线网卡接口名，可以使用 `ip a` 命令查看无线网卡接口名。
- `con-name`：指定热点连接名称，后续可以通过这个名字管理（开启、关闭、删除该热点）。
- `ssid`：指定热点的名称，也就是其他设备搜索到的无线网络名称。
- `password`：指定热点的密码。

设置成功后，终端会输出类似如下信息：

```
Device 'wlan0' successfully activated with 'xxxxxx'.
Hint: "nmcli dev wifi show-password" shows the Wi-Fi name and password.
```

### 关闭 WiFi 热点

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo nmcli connection down My-Hotspot
```
</NewCodeBlock>

### 开启 WiFi 热点

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo nmcli connection up My-Hotspot
```
</NewCodeBlock>

### 删除 WiFi 热点

<NewCodeBlock tip="radxa@device$" type="device">
```
sudo nmcli connection delete My-Hotspot
```
</NewCodeBlock>

## 测试网络带宽性能

使用 `iperf` 工具来测试网络带宽（吞吐量）性能，建议多次测试取平均值。

### 测试前提

- 硬件设备

您需要两台设备，其中一台设备作为服务端，另一台设备作为客户端。

服务端（Server）：PC、服务器等设备。

客户端（Client）：待测试的设备，如 Cubie A7A。

- 同一局域网

服务端和客户端需要处于同一局域网，彼此可以 ping 通。

### 安装 iperf

服务端和客户端都需要安装 `iperf`。

<NewCodeBlock tip="radxa@device & Linux@host$" type="device">
```
sudo apt update
sudo apt install iperf
```
</NewCodeBlock>

### 测试步骤

#### 服务端 (PC)

打开命令行终端，输入以下命令启动服务端：

<NewCodeBlock tip="Linux@host$" type="device">
```
iperf -s
```
</NewCodeBlock>

成功启动后，终端会输出类似如下信息：

```
-----------------------------------------------------------
Server listening on 5201 (test #1)
-----------------------------------------------------------
```

#### 客户端（主板）

1. 上传测试

打开命令行终端，输入以下命令测试客户端上传网络带宽：将 `<server_ip>` 替换为实际的服务端 IP 地址（可以通过 `ip a` 命令查看）。

<NewCodeBlock tip="radxa@device$" type="device">
```
iperf -c <server_ip> -t <time>
# 示例
iperf -c 192.168.2.186 -t 60
```
</NewCodeBlock>

参数说明：

- `<server_ip>`：服务端 IP 地址。
- `<time>`：测试时间，单位为秒。

2. 下载测试

打开命令行终端，输入以下命令测试客户端下载网络带宽：将 `<server_ip>` 替换为实际的服务端 IP 地址（可以通过 `ip a` 命令查看）。

<NewCodeBlock tip="radxa@device$" type="device">
```
iperf -c <server_ip> -t <time> -R
# 示例
iperf -c 192.168.2.186 -t 60 -R
```
</NewCodeBlock>

参数说明：

- `<server_ip>`：服务端 IP 地址。
- `<time>`：测试时间，单位为秒。
- `-R`：反向测试，即客户端作为服务端，服务端作为客户端。
