---
sidebar_position: 4
---

# 网络配置

通过命令行方式来配置有线 / 无线网络。

## 有线网络

使用网线连接瑞莎 Cubie A7A 千兆网口和路由器，连接成功后；路由器会自动分配 IP 地址给 Cubie A7A。

终端命令行输入以下命令可以查看网络连接的详细信息：

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
ip a
```
</NewCodeBlock>

终端会输出类似如下信息：其中 `192.168.2.186` 就是路由器分配的 IP 地址。

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
       valid_lft 3212sec preferred_lft 3212sec
    inet6 240e:3b7:3240:6e00::b09/128 scope global dynamic noprefixroute
       valid_lft 3210sec preferred_lft 3210sec
    inet6 fdaa::b09/128 scope global dynamic noprefixroute
       valid_lft 3210sec preferred_lft 3210sec
    inet6 fdaa::7ebe:84a2:306f:4271/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 240e:3b7:3240:6e00:9f8b:e83d:3c56:18e5/64 scope global dynamic noprefixroute
       valid_lft 219073sec preferred_lft 132673sec
    inet6 fe80::f69d:bf6f:3d68:cef1/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
4: wlx2cc682858dfe: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
    link/ether 76:13:0d:bc:43:06 brd ff:ff:ff:ff:ff:ff permaddr 2c:c6:82:85:8d:fe
```

## 无线网络

通过 Cubie A7A 的板载 WiFi 连接无线路由器，连接成功后，路由器会自动分配 IP 地址给 Cubie A7A。

:::tip

:::

1. 开启 WiFi 功能

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo nmcli radio wifi on
```
</NewCodeBlock>

2. 搜索附近 WiFi 网络

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo nmcli device wifi list
```
</NewCodeBlock>

3. 连接 WiFi 网络

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo nmcli device wifi connect <SSID> password <PASSWORD>
# 示例
sudo nmcli device wifi connect wifi_demo password 12345678
```
</NewCodeBlock>

4. 查看网络连接的详细信息

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
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
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever
2: end0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 5a:cb:6b:3c:ed:ae brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.106/24 brd 192.168.2.255 scope global dynamic noprefixroute end0
       valid_lft 3125sec preferred_lft 3125sec
    inet6 fdaa::dd7/128 scope global dynamic noprefixroute
       valid_lft 3119sec preferred_lft 3119sec
    inet6 240e:3b7:3246:54f0::dd7/128 scope global dynamic noprefixroute
       valid_lft 3119sec preferred_lft 3119sec
    inet6 240e:3b7:3246:54f0:4732:d5f3:184e:7827/64 scope global dynamic noprefixroute
       valid_lft 235266sec preferred_lft 148866sec
    inet6 fdaa::9d81:8d0f:7ee4:5760/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 fe80::379f:ead8:706f:5d6/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
3: wlx94706c5ee946: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 94:70:6c:5e:e9:46 brd ff:ff:ff:ff:ff:ff
    inet 192.168.31.53/24 brd 192.168.31.255 scope global dynamic noprefixroute wlx94706c5ee946
       valid_lft 3556sec preferred_lft 3556sec
    inet6 fdaa:0:0:30::dd7/128 scope global dynamic noprefixroute
       valid_lft 3555sec preferred_lft 3555sec
    inet6 240e:3b7:3246:54f2::dd7/128 scope global dynamic noprefixroute
       valid_lft 3555sec preferred_lft 3555sec
    inet6 240e:3b7:3246:54f2:518e:da68:272f:928/64 scope global dynamic noprefixroute
       valid_lft 235266sec preferred_lft 148866sec
    inet6 fdaa::30:f642:3a8c:dd7b:4ada/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 fe80::ff38:edfe:b892:b694/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

:::tip
Nmcli 是 Network Manager Command Line Interface 的简称，是 Linux 下管理网络的命令行工具。

拓展命令：

- `nmcli radio wifi off`：关闭 WiFi 功能。
- `nmcli connection delete <SSID>` ：删除指定的 WiFi 网络。
  :::
