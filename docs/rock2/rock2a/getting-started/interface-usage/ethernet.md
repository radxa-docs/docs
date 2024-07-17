---
sidebar_position: 3
---

# 以太网接口

ROCK 2A 提供一个千兆以太网端口。

## 网口测速

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
