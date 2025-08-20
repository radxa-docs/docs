---
sidebar_position: 1
---

# 硬件接口说明

## 接口总览

<img src="/img/aicore-sg2300x/mark_aicore_sg2300x.webp" alt="radxa-aicore-sg2300x interfaces" />

## 网卡

核心板有两个网卡，eth0默认为DHCP，eth1默认设置为静态IP：192.168.150.1

## 144pin BTB 接口

SG2300X 的144pin BTB 接口上提供了3组UART，其中 UART0 已用作 bootloader和Linux 的 console 端口；

1 组 I2C master，对应设备节点为/dev/i2c-2；

1 个 PWM 输出引脚，对应 PWM0；

1 个风扇测速输入引脚。
