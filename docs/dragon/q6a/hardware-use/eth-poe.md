---
sidebar_position: 6
---

# 以太网接口(支持 PoE)

瑞莎 Dragon Q6A 板载的千兆以太网接口，支持 PoE 功能，PoE 功能需要搭配 PoE HAT 使用。

## 硬件连接

- 仅联网

使用网线连接主板的千兆以太网接口和路由器的千兆以太网接口。

正常情况下，瑞莎 Dragon Q6A 的千兆以太网接口指示灯会闪烁，表示网络连接正常。

- 供电上网（PoE）

单线实现供电和数据传输，需要搭配 PoE HAT 使用。

瑞莎 Dragon Q6A 安装 PoE HAT 后，使用网线连接瑞莎 Dragon Q6A 的千兆以太网接口和以太网 PoE 交换机的千兆以太网接口。

无电源适配器供电的情况下，瑞莎 Dragon Q6A 的电源指示灯亮起，表示电源正常；千兆以太网接口指示灯会闪烁，表示网络连接正常。

## 网络信息

我们可以使用 `ip a` 命令查看网络的详细信息。

<NewCodeBlock tip="radxa@device$" type="device">

```bash
ip a
```

</NewCodeBlock>

终端输出示例：其中 `192.168.4.165` 为千兆以太网接口 IP 地址。

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

## 接口引脚定义

可以参考 [资源汇总下载](../download) 页面的硬件原理图。
