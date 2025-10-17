---
sidebar_position: 5
---

# 2.5G 以太网接口

瑞莎 Fogwise® AIRbox Q900 板载 2 个 2.5G 以太网接口（其中 1 个为 WAN 口，1 个为 LAN 口），支持 10M/100M/1000M/2500M 多种速率自适应；主要用于连接 PC 设备或局域网设备到 AIRbox Q900。

WAN 和 LAN 区分：靠近 USB Type-C 接口的为 WAN 口，远离 USB Type-C 接口的为 LAN 口。

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-ethernet.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

使用网线连接以太网接口和 PC 设备或局域网设备。

### 查看网络信息

使用 `ip a` 命令查看网络接口信息。

<NewCodeBlock tip="radxa@airbox$" type="device">

```
ip a
```

</NewCodeBlock>

若连接成功，终端会输出类似信息：其中 `end1` 为 LAN 口，`end0` 为 WAN 口，`192.168.11.102` 是路由器分配的 IP 地址。

```
···
2: end1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 6e:1b:2b:cf:7e:b7 brd ff:ff:ff:ff:ff:ff
    inet 192.168.150.1/24 brd 192.168.150.255 scope global noprefixroute end1
       valid_lft forever preferred_lft forever
    inet6 fe80::6c1b:2bff:fecf:7eb7/64 scope link
       valid_lft forever preferred_lft forever
3: end0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
    link/ether 36:62:88:56:74:aa brd ff:ff:ff:ff:ff:ff
    inet 192.168.11.102/24 brd 192.168.11.255 scope global dynamic noprefixroute end0
       valid_lft 86142sec preferred_lft 86142sec
    inet6 fe80::3462:88ff:fe56:74aa/64 scope link
       valid_lft forever preferred_lft forever
···
```

## 测试网络带宽性能

使用 `iperf` 工具来测试网络带宽（吞吐量）性能，建议多次测试取平均值。

### 测试前提

- 硬件设备

您需要两台设备，其中一台设备作为服务端，另一台设备作为客户端。

服务端（Server）：PC、服务器等设备。

客户端（Client）：待测试的主板设备。

- 同一局域网

服务端和客户端需要处于同一局域网，彼此可以 ping 通。

### 安装 iperf

服务端和客户端都需要安装 `iperf`。

<NewCodeBlock tip="radxa@airbox$ & Linux@host$" type="device">

```
sudo apt update
sudo apt install iperf
```

</NewCodeBlock>

### 测试步骤

#### 服务端 (PC)

打开命令行终端，输入以下命令启动服务端：

<NewCodeBlock tip="Linux@host$" type="host">

```
iperf -s
```

</NewCodeBlock>

成功启动后，终端会输出类似如下信息：

```
------------------------------------------------------------
Server listening on TCP port 5001
TCP window size:  128 KByte (default)
------------------------------------------------------------
```

#### 客户端（主板）

1. 上传测试

打开命令行终端，输入以下命令测试客户端上传网络带宽：将 `<server_ip>` 替换为实际的服务端 IP 地址（可以通过 `ip a` 命令查看）。

<NewCodeBlock tip="radxa@airbox$ & Linux@host$" type="device">

```
iperf -c <server_ip> -t <time>
# 示例
iperf -c 192.168.11.101 -t 60
```

</NewCodeBlock>

参数说明：

- `<server_ip>`：服务端 IP 地址。
- `<time>`：测试时间，单位为秒。

2. 下载测试

打开命令行终端，输入以下命令测试客户端下载网络带宽：将 `<server_ip>` 替换为实际的服务端 IP 地址（可以通过 `ip a` 命令查看）。

<NewCodeBlock tip="radxa@airbox$ & Linux@host$" type="device">

```
iperf -c <server_ip> -t <time> -R
# 示例
iperf -c 192.168.11.101 -t 60 -R
```

</NewCodeBlock>

参数说明：

- `<server_ip>`：服务端 IP 地址。
- `<time>`：测试时间，单位为秒。
- `-R`：反向测试，即客户端作为服务端，服务端作为客户端。

## 接口规格

:::note 技术参考

完整的技术规格和引脚定义可参考 [下载专区](../download.md#硬件设计) 的硬件设计文档!

:::
