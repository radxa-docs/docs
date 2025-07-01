---
sidebar_position: 4
---

# 千兆以太网（支持 PoE）

瑞莎 Cubie A7A 板载千兆以太网接口，支持 PoE 功能。

PoE 功能需要搭配 PoE HAT 和以太网 PoE 交换机，实现单线供电和数据传输。

:::tip
以太网接口具体位置可以查看 [硬件接口](./hardware-info) 教程的接口说明部分！
:::

## 以太网

使用网线连接 Cubie A7A 的以太网接口和路由器，正常情况下，Cubie A7A 的网口指示灯会闪烁，表示以太网连接正常。

### 查看网络接口状态

终端输入 `ip a` 命令可以查看网络接口状态和 IP 地址等信息。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
ip a
```
</NewCodeBlock>

终端会输出类似如下信息：其中 192.168.2.106 就是路由器分配的 IP 地址。

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

### PoE（Power over Ethernet）

Cubie A7A 需要搭配 PoE HAT 和使用以太网 PoE 交换机才能使用 PoE 功能。

满足以上条件后，可以使用网线连接 Cubie A7A 的千兆以太网口和以太网 PoE 交换机。

正常情况下，主板指示灯会亮起，说明供电正常；网口的指示灯会闪烁，表示网络连接正常。

:::tip
以太网 PoE 交换机可以进行以太网数据交换和给支持 PoE 的设备供电。
:::

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

| Pin# | Name       | Pin# | Name        |
| :--: | :--------- | :--: | :---------- |
|  1   | PHY1_MDI0+ |  11  | TR0         |
|  2   | PHY1_MDI0- |  12  | TR1         |
|  3   | PHY1_MDI1+ |  13  | TR2         |
|  4   | GND        |  14  | TR3         |
|  5   | GND        |  15  | PHY0_G_LED+ |
|  6   | PHY1_MDI1- |  16  | PHY0_G_LED- |
|  7   | PHY1_MDI2+ |  17  | PHY0_Y_LED+ |
|  8   | PHY1_MDI2- |  18  | PHY0_Y_LED- |
|  9   | PHY1_MDI3+ |  19  | GND         |
|  10  | PHY1_MDI3- |  20  | GND         |
