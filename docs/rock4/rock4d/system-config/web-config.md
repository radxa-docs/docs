---
sidebar_position: 3
---

# 网络配置

## 1. 有线网络

<Tabs queryString="web-mode">

<TabItem value="有屏模式">

使用网线连接 Radxa ROCK 4D 千兆网口和路由器，连接成功后；路由器会自动分配 IP 地址给 Radxa ROCK 4D。

① ： 点击网络图标

② ： 选择 `Details` 选项可以看到网络连接的详细信息，如 IP 地址、子网掩码、网关地址等。

其中 `192.168.2.106` 就是路由器分配的 IP 地址。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/web-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="无屏模式">

使用网线连接 Radxa ROCK 4D 千兆网口和路由器，连接成功后；路由器会自动分配 IP 地址给 Radxa ROCK 4D。

终端命令行输入以下命令可以查看网络连接的详细信息：

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
ip a
```
</NewCodeBlock>

终端会输出类似如下信息：其中 `192.168.2.106` 就是路由器分配的 IP 地址。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
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
       valid_lft 2652sec preferred_lft 2652sec
    inet6 fdaa::dd7/128 scope global dynamic noprefixroute
       valid_lft 2494sec preferred_lft 2494sec
    inet6 240e:3b7:3246:54f0::dd7/128 scope global dynamic noprefixroute
       valid_lft 2494sec preferred_lft 2494sec
    inet6 240e:3b7:3246:54f0:4732:d5f3:184e:7827/64 scope global dynamic noprefixroute
       valid_lft 236440sec preferred_lft 150040sec
    inet6 fdaa::9d81:8d0f:7ee4:5760/64 scope global noprefixroute
       valid_lft forever preferred_lft forever
    inet6 fe80::379f:ead8:706f:5d6/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```
</NewCodeBlock>

</TabItem>

</Tabs>

## 2. 无线网络

通过 Radxa ROCK 4D 的板载 WiFi 连接无线路由器，连接成功后，路由器会自动分配 IP 地址给 Radxa ROCK 4D。

:::tip
Radxa ROCK 4D 预留两个板载天线接口，您需要将天线安装到接口位置，不然WiFi信号会很差
:::

<Tabs queryString="web-mode">

<TabItem value="有屏模式">

① ： 点击网络图标

② ： 点击需要连接的 WiFi 名称后面的 `Connect` 按钮，然后输入 WiFi 密码并根据后续的提示进行连接。

其中 `192.168.31.53` 就是路由器分配的 IP 地址。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/wifi-connect-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

连接成功后，选择 `Details` 选项可以看到网络连接的详细信息，如 IP 地址、子网掩码、网关地址等。

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/wifi-connect-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="无屏模式">

1. 开启 WiFi 功能

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo nmcli radio wifi on
```
</NewCodeBlock>

2. 搜索附近 WiFi 网络

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo nmcli device wifi list
```
</NewCodeBlock>

3. 连接 WiFi 网络

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
sudo nmcli device wifi connect <SSID> password <PASSWORD>
# 示例
sudo nmcli device wifi connect wifi_demo password 12345678
```
</NewCodeBlock>

4. 查看网络连接的详细信息

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
```
ip a
```
</NewCodeBlock>

终端会输出类似如下信息：其中 `192.168.31.53` 就是路由器分配的 IP 地址。

<NewCodeBlock tip="radxa@radxa-4d$" type="host">
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
</NewCodeBlock>

:::tip
Nmcli 是 Network Manager Command Line Interface 的简称，是 Linux 下管理网络的命令行工具。

拓展命令：

- `nmcli radio wifi off`：关闭 WiFi 功能。
- `nmcli connection delete <SSID>` ：删除指定的 WiFi 网络。
  :::

</TabItem>

</Tabs>
