---
sidebar_position: 5
---

# Debian 用户指南

## 默认用户名和密码

```
username : radxa
password : radxa
```

## 访问设备

### 选项一：使用 HDMI 显示器，USB 键盘和鼠标

可以在 HDMI 显示器看到桌面系统。

### 选项二：SSH

SSH 服务默认是使能的。
可以在路由器管理界面查看设备的 IP；或者是通过电脑主机的 [angryip](https://angryip.org/) 来找到设备的 IP。

```
$ ping ip-of-device
$ ssh radxa@ip-of-device
```


## 显示

Orion O6 有5个显示接口，分别是

- HDMI
- DP
- USBC 0
- USBC 1
- eDP

物理接口与系统 DRM Card 的对应关系如下：

| 系统 DRM Card              | 物理接口 |
|----------------------------|----------|
| /sys/class/drm/card0-DP-1  | USBC 0   |
| /sys/class/drm/card1-DP-2  | HDMI     |
| /sys/class/drm/card4-DP-3  | USBC 1   |
| /sys/class/drm/card4-DP-4  | DP       |
| /sys/class/drm/card2-eDP-1 | eDP      |
