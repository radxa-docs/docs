---
sidebar_position: 4
---

# Gigabit Ethernet Interface

The Radxa Cubie A5E features 2 onboard Gigabit Ethernet interfaces, with one of them supporting Power over Ethernet (PoE) functionality.

To use the PoE feature, you'll need to connect it with a PoE HAT and a PoE Ethernet switch, enabling both power delivery and data transmission through a single cable.

:::tip
For the exact location of the Ethernet interfaces, please refer to the interface description section in the [Hardware Interface](./hardware-info) tutorial!
:::

## Ethernet

Connect the Cubie A5E's Ethernet interface to your router using an Ethernet cable. Under normal circumstances, the Ethernet port LED on the Cubie A5E will blink, indicating a successful Ethernet connection.

### Checking Network Interface Status

You can view network interface status and IP address information by entering the `ip a` command in the terminal.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
ip a
```
</NewCodeBlock>

The terminal will display output similar to the following, where 192.168.2.106 is the IP address assigned by your router.

```text
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

To use the PoE functionality, the Cubie A5E requires both a PoE HAT and a PoE-enabled Ethernet switch.

Once these requirements are met, you can connect the Cubie A5E's Gigabit Ethernet port to the PoE switch using an Ethernet cable.

Under normal operation, the board's power indicator will light up, indicating successful power delivery, and the Ethernet port's LED will blink, indicating an active network connection.

## Interface Specifications

:::info Technical Reference
For complete technical specifications and pin definitions, please refer to the [Hardware Design: Schematics](../download) document in the download section.
:::
