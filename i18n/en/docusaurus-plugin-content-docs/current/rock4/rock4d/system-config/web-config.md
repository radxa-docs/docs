---
sidebar_position: 3
---

# Network Configuration

Configure wired and wireless networks through both graphical interface and command line.

## Wired Network

<Tabs queryString="web-mode">

<TabItem value="Graphical Interface">

Connect the Radxa ROCK 4D's Gigabit Ethernet port to your router using an Ethernet cable. After a successful connection, the router will automatically assign an IP address to the ROCK 4D.

① Click on the network icon

② Select the `Details` option to view detailed network connection information, such as IP address, subnet mask, gateway address, etc.

The IP address `192.168.2.106` is assigned by the router.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/web-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Command Line">

Connect the Radxa ROCK 4D's Gigabit Ethernet port to your router using an Ethernet cable. After a successful connection, the router will automatically assign an IP address to the ROCK 4D.

Enter the following command in the terminal to view detailed network connection information:

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
ip a
```
</NewCodeBlock>

The terminal will output information similar to the following. The IP address `192.168.2.106` is assigned by the router.

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

</TabItem>

</Tabs>

## Wireless Network

Connect to a wireless router using the ROCK 4D's onboard WiFi. After a successful connection, the router will automatically assign an IP address to the ROCK 4D.

:::tip
The ROCK 4D has two onboard antenna connectors. You need to install the antennas in these positions; otherwise, the WiFi signal will be very poor.
:::

<Tabs queryString="web-mode">

<TabItem value="Graphical Interface">

① Click on the network icon

② Click the `Connect` button next to the WiFi network name you want to connect to

③ Enter the WiFi password and follow the prompts to complete the connection

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/wifi-connect-01.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

After a successful connection, select the `Details` option to view detailed network connection information, such as IP address, subnet mask, gateway address, etc.

The IP address `192.168.31.53` is assigned by the router.

<div style={{textAlign: 'center'}}>
    <img src="/img/rock4/4d/wifi-connect-02.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

</TabItem>

<TabItem value="Command Line">

1. Enable WiFi

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo nmcli radio wifi on
```
</NewCodeBlock>

2. Search for nearby WiFi networks

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo nmcli device wifi list
```
</NewCodeBlock>

3. Connect to a WiFi network

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo nmcli device wifi connect <SSID> password <PASSWORD>
# Example
sudo nmcli device wifi connect wifi_demo password 12345678
```
</NewCodeBlock>

4. View network connection details

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
ip a
```
</NewCodeBlock>

The terminal will output information similar to the following. The IP address `192.168.31.53` is assigned by the router.

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
Nmcli is the abbreviation for Network Manager Command Line Interface, a command-line tool for managing networks in Linux.

Additional commands:

- `nmcli radio wifi off`: Disable WiFi
- `nmcli connection delete <SSID>`: Delete a specified WiFi network
  :::

</TabItem>

</Tabs>
