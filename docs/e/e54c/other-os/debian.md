---
sidebar_position: 1
---

# Radxa OS 使用

## 系统安装

请参考 [系统安装](../getting-started/install-os/)

## 使用说明

请参考 [上手指南](../getting-started/)

## 系统登录

默认账号：radxa 密码：radxa

## E54C 特有功能

在 Debian 系统上，E54C 的四个千兆以太网端口可以通过网络配置工具进行灵活设置：

- 网络桥接：可以将多个网口桥接为一个逻辑接口，提高网络吞吐量
- 网络绑定：支持多种绑定模式，如负载均衡、主备模式等
- 虚拟网络：可以配置为多个虚拟网络接口，用于网络隔离或容器网络

## 网络配置示例

以下是配置网络桥接的示例命令：

<NewCodeBlock tip="root@radxa-e54c#" type="device">

```bash
# 安装bridge-utils
sudo apt-get install bridge-utils

# 创建网桥
sudo brctl addbr br0

# 添加网络接口到网桥
sudo brctl addif br0 eth0
sudo brctl addif br0 eth1

# 启用网桥
sudo ip link set dev br0 up
```

</NewCodeBlock>
