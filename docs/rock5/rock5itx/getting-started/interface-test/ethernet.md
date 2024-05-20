---
sidebar_position: 12
---

# Ethernet

## 简介

以太网（英语：Ethernet）是一种计算机局域网技术。IEEE组织的IEEE 802.3标准制定了以太网的技术标准，它规定了包括物理层的连线、电子信号和介质访问控制的内容。以太网是目前应用最普遍的局域网技术，取代了其他局域网标准如令牌环、FDDI和ARCNET。

### 接口测试方法

#### 唯一 MAC 地址

ROCK 5 ITX 的 MAC 地址是唯一且固定的，在每次断电重启或者软件重启，MAC 都保持不变，且重新刷机后也是保持不变的。

#### 网口测速


- 安装 iperf3 工具

```bash
sudo apt-get install iperf3
```

- 在服务器端运行命令：

```bash
iperf -s
```

- 测速

1. 测试上传速度

```bash
iperf3 -c server-ip -t 60
```

2. 测试下载速度

```bash
iperf3 -c server-ip -t 60 -R
```
