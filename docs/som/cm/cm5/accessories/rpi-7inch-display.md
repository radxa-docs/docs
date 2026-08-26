---
sidebar_position: 3
---

# 树莓派 7 英寸显示屏

瑞莎 CM5 载板的 LCD0 接口使用 15-pin 反向排线，兼容 5 英寸和 7 英寸显示屏。

## 连接树莓派 7 英寸显示屏

- 准备好树莓派 7 英寸显示屏，通过 15-pin 反向 FPC 排线连接到瑞莎 CM5 载板。

![显示屏安装-01](/img/cm5/cm5io-rpi-display-7inch-FPC.webp)  
![显示屏安装-02](/img/cm5/cm5io-rpi-display-7inch-connected.webp)

- 单击左下角的 Application Launcher（应用程序启动器），打开 Konsole 终端并运行 `rsetup` 命令：

```bash
radxa@radxa-cm5-io:~$ rsetup
```

- 通过[设备树配置](../radxa-os/sys-config/rsetup#overlays)来启用树莓派7寸屏的 Overlay。

:::caution [注意]

1. 请启用 `[] Enable Raspberry Pi 7-inch Touchscreen on DSI0` 项 Overlay。
2. 显示 `[*] Enable Raspberry Pi 7-inch Touchscreen on DSI0` 表示启用成功。退出配置界面并重启系统，使配置生效。

:::
