---
sidebar_position: 1
---

# Docker 安装

Radxa Debian 系统在内核已经开启 Docker 相关的配置，只需安装 Docker 应用即可开始使用。

:::tip
目前国内用户无法访问 Docker Hub，需要自行配置 Docker 镜像源或使用代理访问
:::

## Docker 特点

- 易管理

轻量级容器化技术，使用 Docker 命令管理容器和镜像，依赖隔离，简化部署流程。

- 跨平台

支持 Windows、macOS 和 Linux 系统，可在多种平台上运行和部署容器。

- 可移植性

通过 Dockerfile 和镜像实现环境一致性，便于在不同机器或云平台上快速迁移和部署。

- 高效资源利用

基于容器化技术，共享主机内核，资源占用低，启动速度快，适合微服务架构。

## 安装 Docker

终端输入以下命令安装 Docker：

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo apt update
sudo apt install docker.io
```
</NewCodeBlock>

## 配置 iptables

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
```
</NewCodeBlock>

重启系统后，Docker 配置生效。

## 验证安装

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
docker --version
```
</NewCodeBlock>

终端输出类似如下的信息表示安装成功：

```
Docker version 20.10.24+dfsg1, build 297e128
```

## 添加访问权限

终端输入以下命令添加系统当前用户对 Docker 守护程序的访问权限：不需要使用 sudo 命令就可以使用 Docker 命令。

<NewCodeBlock tip="radxa@cubie-a7a$" type="device">
```
sudo usermod -aG docker $USER
```
</NewCodeBlock>

重启系统后，Docker 配置生效。
