---
sidebar_position: 7
---

# 常见问题

## 系统问题

### 系统无法启动

我们提供标准系统镜像和 Phoenix 系统镜像。

- 标准系统镜像：包含分区表，可以直接安装系统到系统启动介质上。

若使用标准系统镜像，参考 [快速上手 → 安装系统](./getting-started/install-system/) 教程进行系统安装。

- Phoenix 系统镜像：不包含分区表，需要借助 Phoenix 工具烧录系统镜像。

若使用 Phoenix 系统镜像，参考 [底层开发 → FEL 模式安装系统](./low-level-dev/fel-install-system/) 教程进行系统安装。

先确认安装的系统镜像是否正确，若系统镜像正确，可以通过串口调试获取系统启动日志，根据日志信息进行排查。

## 远程问题

### SSH 无法远程

出厂系统镜像默认开启 SSH 服务，一般情况下，您只需要确保 Cubie A7A 和 PC 端处于同一局域网，即可通过 SSH 远程。

排查方法：

1. 检查 Cubie A7A 是否连接到网络以及 IP 地址是否正确：使用 `ip a` 命令可以查看网络连接的详细信息。
2. 检查 Cubie A7A 和 PC 端是否处于同一局域网：使用 `ping` 彼此 IP 地址测试是否可以 ping 通。
3. 检查 SSH 服务是否启动：使用 `sudo systemctl status ssh` 命令查看 SSH 服务状态。

### VNC 无法远程

VNC 远程需要您手动配置 VNC 服务器；若按照教程操作，每次重启或者关机后，VNC 服务器都会自动关闭。

排查方法：

1. 按照教程完成 VNC 远程的配置。
2. 确保 SSH 远程一切正常。
3. 检查是否启动 VNC 服务器：使用 `vncserver -list` 命令查看 VNC 服务器是否启动。
4. 使用 `ip:5901` 进行 VNC 远程，其中 `ip` 是 Cubie A7A 的 IP 地址。
