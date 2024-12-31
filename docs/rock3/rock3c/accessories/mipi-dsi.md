---
sidebar_position: 2
---

# MIPI LCD

## DSI 接口定义

Radxa ROCK 3C 拥有一个 15 PIN 的 CSI 接口,接口定义如下:

<img src="../../../img/rock3/3c/rock3c-dsi-pin.webp" width = "800" alt="rock 3c csi 2lanes"/>

目前支持的 MIPI DSI 屏幕有:

- Radxa 8HD
- Radxa 10HD
- Raspberry Pi 7寸屏

## Radxa 10HD & Radxa 8HD

1. 连接屏幕

在 RCOK 3C 上使用 Radxa 10HD 和 Radxa 8HD 需要使用特定的 DSI 排线，PIN 脚连接如下：

|  排线  |      40PIN      |
| :----: | :-------------: |
|   5V   |    PIN2(5V)     |
|  GND   |    PIN6(GND)    |
|  PWM   | PIN7(PWM14_M0)  |
| TPRST  | PIN18(GPIO3_B2) |
| TPINT  | PIN16(GPIO3_B1) |
| LCDRST |   PIN1(3.3V)    |
|  GINT  |       NC        |

<img src="../../../img/rock3/3c/rock3c-8hd-connect.webp" width = "700" alt="rock 3c dsi connect"/>

2. 使用[`rsetup`](../os-config/rsetup)开启 `Radxa 10HD overlay`

<img src="../../../img/rock3/3c/rock3c-8hd-overlay.webp" width = "500" alt="rock 3c 10hd overlay"/>

如果使用 Radxa 8HD 则开启 `Enable Radxa Display 8HD`

3. 上电启动

上电前需要确认排线接正确连接，接入电源启动系统，即可开始使用 Radxa 10HD。

## 树莓派7寸屏

使用树莓派7寸屏只需要连接 `5v` 和 `GND`,连接示意图如下

<img src="../../../img/rock3/3c/rock3c-rpi-7hd-connect.webp" width = "700" alt="rock 3c dsi connect"/>

使用[`rsetup`](../os-config/rsetup)开启 `Enable Raspberry Pi 7-inch Touchscreen` overlay

## FAQ

- Radxa 8HD/Radxa 10HD 有背光无画面输出

如果使用 Radxa 8HD/Radxa 10HD 出现上电后只有背光没有画面输出的现象，请检查排线和屏幕的 mipi 连接座是否连接正确，此情况多数是由于排线没有接好导致。
