---
sidebar_position: 1
---

# Docker

Radxa Debian 在内核已经开启 Docker 相关的配置，只需安装 Docker 应用即可开始使用。

1. 安装 Docker

```bash
sudo apt-get update
sudo apt-get install docker.io
```

2. 安装完成后执行以下两条命令

```bash
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo reboot
```

3. 重启后运行 docker test,查看 运行状态

```bash
sudo docker run hello-world
sudo systemctl status docker
```
