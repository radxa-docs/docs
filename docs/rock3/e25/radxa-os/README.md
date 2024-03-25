---
sidebar_position: 15
---

import VNC from "../../../common/general/\_vnc.mdx"
import SSH from "../../../common/general/\_ssh.mdx"

# 瑞莎系统

主要介绍 Radxa Debian 系统的基本使用方法，帮助你快速了解常用的系统的配置。

## 用户名和密码

Radxa E25 系列默认添加的用户名和密码为：

```
用户名：radxa
密码：  radxa
```

## 串口登录

Radxa E25 板载 CH340 芯片，板子的 USB TYPC C 接口可以用于串口调试， 默认的波特率为 `115200`

:::tip
使用USB TYPE C 调试串口的时候可能会由于供电不断重启，建议使用带供电的 USB TYPE C HUB 进行调试
:::

## 设置网络

### 以太网连接

Radxa E25E 板载两个 2.5G 以太网，只需要将网线连接即可开启上网，使用`ip a `指令可以查看 ip。

## 远程登录

### SSH 登录

<SSH />

### VNC 远程桌面

<VNC />
