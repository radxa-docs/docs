---
sidebar_position: 6
---

# Ethernet Interface (Supports PoE)

The Dragon Q6A's onboard gigabit Ethernet interface supports PoE functionality, which requires the use of a PoE HAT.

## Hardware Connection

- Network Connection Only

Connect the Gigabit Ethernet interface on the motherboard to the Gigabit Ethernet interface on the router using an Ethernet cable.

Under normal circumstances, the Gigabit Ethernet interface indicator light on the Radxa Dragon Q6A will flash, indicating a normal network connection.

- Power Over Ethernet (PoE)

Power and data transmission are achieved over a single cable, requiring the use of a PoE HAT.

After installing the PoE HAT on the Radxa Dragon Q6A, connect the Gigabit Ethernet port of the Radxa Dragon Q6A to the Gigabit Ethernet port of the Ethernet PoE switch using an Ethernet cable.

Without a power adapter, the power indicator light on the Radxa Dragon Q6A will be lit, indicating normal power supply; the Gigabit Ethernet port indicator light will flash, indicating a normal network connection.

## Network Information

We can use the `ip a` command to view detailed network information.

<NewCodeBlock tip="radxa@device$" type="device">

```bash
ip a
```

</NewCodeBlock>

Terminal output example: where `192.168.4.165` is the Gigabit Ethernet interface IP address.

```text
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever
2: sit0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN group default qlen 1000
    link/sit 0.0.0.0 brd 0.0.0.0
3: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:e0:4c:68:00:03 brd ff:ff:ff:ff:ff:ff
    inet 192.168.4.165/24 brd 192.168.4.255 scope global dynamic noprefixroute enp1s0
       valid_lft 43182sec preferred_lft 43182sec
    inet6 fe80::9222:1ab7:a6a6:898/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
4: wlx68249956ac87: <NO-CARRIER,BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state DORMANT group default qlen 1000
    link/ether 68:24:99:56:ac:87 brd ff:ff:ff:ff:ff:ff
```

## Interface Pin Definitions

Please refer to the hardware schematic diagram on the [Resource Summary Download](../download) page.
