---
sidebar_position: 3
---

# RPI 7 inch Display
Radxa CM5 IO LCD0 接口，使用反向15pin排线，兼容的5寸和7寸屏。  
## 以连接树莓派7寸屏为例：
- 准备好 RPI 7 inch Display，通过 15pin 反向FPC 线接上 Radxa CM5 IO。

![显示屏安装-01](/img/cm5/cm5io-rpi-display-7inch-FPC.webp)  
![显示屏安装-02](/img/cm5/cm5io-rpi-display-7inch-connected.webp)

- 通过左下角 Application Launcher 打开 Kconsole 终端, 运行 `rsetup` 命令：

```bash
radxa@radxa-cm5-io:~$ rsetup
```

- 通过[设备树配置](../os-config/rsetup#overlays)来启用树莓派7寸屏的 Overlay。

:::caution [注意]

1. 请启用 `[] Enable Raspberry Pi 7-inch Touchscreen on DSI0` 项 Overlay。
2. 在启用成功显示 `[*] Enable Raspberry Pi 7-inch Touchscreen on DSI0` 后退出reboot重启才能使配置生效。

:::
