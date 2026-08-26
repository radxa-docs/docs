---
sidebar_position: 3
---

# 瑞莎 8 英寸高清显示屏

准备好瑞莎 8 英寸、10 英寸或 10 英寸全高清显示屏，通过 FPC 排线连接到瑞莎 CM5 载板的 LCD1 接口。

## 连接瑞莎 8 英寸显示屏

![显示屏安装-01](/img/rock5b/rock5b-display-8hd-FPC.webp)  
![显示屏安装-02](/img/cm5/cm5io-display-8hd-connected.webp)

- 单击左下角的 Application Launcher（应用程序启动器），打开 Konsole 终端并运行 `rsetup` 命令：

```bash
radxa@radxa-cm5-io:~$ rsetup
```

- 通过[设备树配置](../radxa-os/sys-config/rsetup#overlays)来启用瑞莎 8 寸触摸屏的 Overlay。

:::caution [注意]

1. 请启用 `[] Enable Radxa Display 8HD on DSI1` 项 Overlay。
2. 显示 `[*] Enable Radxa Display 8HD on DSI1` 表示启用成功。退出配置界面并重启系统，使配置生效。

:::
