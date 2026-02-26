---
sidebar_position: 5
---

# Ethernet (with PoE Support) Interface

The Radxa CM4 IO Board features an onboard Gigabit Ethernet interface with PoE (Power over Ethernet) support. Note that PoE functionality requires the use of a PoE HAT.

## Hardware Connection

### Network Connection Only

Connect the board's Gigabit Ethernet port to your router's Gigabit Ethernet port using an Ethernet cable.

Under normal operation, the Gigabit Ethernet interface LED on the Radxa CM4 IO Board will blink, indicating a successful network connection.

### Power over Ethernet (PoE)

For single-cable power and data transmission, a PoE HAT is required.

After installing the PoE HAT on the Radxa CM4 IO Board, connect the board's Gigabit Ethernet port to a PoE switch's Gigabit Ethernet port using an Ethernet cable.

When powered solely via PoE (without an external power adapter), the Radxa CM4 IO Board's power indicator will light up, indicating proper power supply. The Gigabit Ethernet interface LED will blink, indicating a successful network connection.

## Network Information

You can view detailed network information using the `ip a` command.

<NewCodeBlock tip="radxa@device$" type="device">
```bash
ip a
```
</NewCodeBlock>

Example output (where `192.168.4.160` is the IP address of the Gigabit Ethernet interface):

```text
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever
2: end0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 46:d3:58:1c:a6:7b brd ff:ff:ff:ff:ff:ff
    inet 192.168.4.160/24 brd 192.168.4.255 scope global dynamic noprefixroute end0
       valid_lft 43187sec preferred_lft 43187sec
    inet6 fe80::8c36:4370:60d:64be/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

## Interface Pin Definitions

For detailed pin definitions, please refer to the hardware schematics available on the [Resource Download](../download.md) page.
