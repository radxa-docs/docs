---
sidebar_position: 1
---

# Docker 安装

Radxa Debian 系统在内核已经开启 Docker 相关的配置，只需安装 Docker 应用即可开始使用。

:::tip
目前国内用户无法访问 Docker Hub，需要自行配置 Docker 镜像源或使用代理访问
:::

## 安装 Docker

终端输入以下命令安装 Docker：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo apt update
sudo apt install docker.io
```
</NewCodeBlock>

## 配置 iptables

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
```
</NewCodeBlock>

重启系统后，Docker 配置生效。

## 验证安装

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
docker --version
```
</NewCodeBlock>

终端输出类似如下的信息表示安装成功：

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
Docker version 20.10.24+dfsg1, build 297e128
```
</NewCodeBlock>

## 添加访问权限

终端输入以下命令添加系统当前用户对 Docker 守护程序的访问权限：不需要使用 sudo 命令就可以使用 Docker 命令。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
sudo usermod -aG docker $USER
```
</NewCodeBlock>

重启系统后，Docker 配置生效。
