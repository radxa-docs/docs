---
sidebar_position: 5
---

# Gigabit Ethernet (with PoE Support) Interface

The Radxa ROCK 4D features one onboard Gigabit Ethernet port with PoE (Power over Ethernet) capability. However, to utilize PoE power delivery, you'll need to purchase and install a PoE HAT expansion board separately.

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-ethernet.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## User Guide

### Ethernet

Connect the ROCK 4D's Gigabit Ethernet port to your router using an Ethernet cable. Under normal circumstances, the port's LED indicators will blink, indicating a successful network connection.

#### Checking Network Interface Status

Use the `ip a` command in the terminal to view network interface status and IP address information.

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
ip a
```
</NewCodeBlock>

The terminal will display output similar to the following, where 192.168.2.106 is the IP address assigned by your router:

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

### PoE (Power over Ethernet)

To use PoE functionality on the ROCK 4D, you'll need both a PoE HAT and a PoE-enabled Ethernet switch.

Once you have these components, connect the ROCK 4D's Gigabit Ethernet port to the PoE switch using an Ethernet cable.

Under normal operation, the motherboard's power indicator will light up, indicating proper power delivery, and the Ethernet port's LED will blink, showing an active network connection.

:::tip
A PoE Ethernet switch can perform both Ethernet data switching and provide power to PoE-capable devices.
:::

## Interface Specifications

:::tip
For detailed interface specifications, please refer to the [Hardware Design: Schematics](../download) in the download section.
:::

| Pin# | Name       | Pin# | Name        |
| :--: | :--------- | :--: | :---------- |
|  1   | PHY0_MDI0+ |  11  | TR0         |
|  2   | PHY0_MDI0- |  12  | TR1         |
|  3   | PHY0_MDI1+ |  13  | TR2         |
|  4   | GND        |  14  | TR3         |
|  5   | GND        |  15  | PHY0_G_LED+ |
|  6   | PHY0_MDI1- |  16  | PHY0_G_LED- |
|  7   | PHY0_MDI2+ |  17  | PHY0_Y_LED+ |
|  8   | PHY0_MDI2- |  18  | PHY0_Y_LED- |
|  9   | PHY0_MDI3+ |  19  | GND         |
|  10  | PHY0_MDI3- |  20  | GND         |
