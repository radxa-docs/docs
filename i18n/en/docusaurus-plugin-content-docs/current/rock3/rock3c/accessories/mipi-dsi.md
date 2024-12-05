---
sidebar_position: 2
---

# MIPI LCD

## DSI Interface definition

Radxa ROCK 3C has a 15 PIN CSI interface. The interface definition is as follows:

<img src="../../../img/rock3/3c/rock3c-dsi-pin.webp" width = "800" alt="rock 3c csi 2lanes"/>

Currently supported MIPI DSI screens are:

- Radxa 8HD
- Radxa 10HD
- Raspberry Pi 7 inch screen

## Radxa 10HD & Radxa 8HD

1. Connection Screen

Using Radxa 10HD and Radxa 8HD on RCOK 3C requires the use of specific DSI cables. The PIN pins are connected as follows:

| Cable  |      40PIN      |
| :----: | :-------------: |
|   5V   |    PIN2(5V)     |
|  GND   |    PIN6(GND)    |
|  PWM   | PIN7(PWM14_M0)  |
| TPRST  | PIN18(GPIO3_B2) |
| TPINT  | PIN16(GPIO3_B1) |
| LCDRST |   PIN1(3.3V)    |
|  GINT  |       NC        |

<img src="../../../img/rock3/3c/rock3c-8hd-connect.webp" width = "700" alt="rock 3c dsi connect"/>

2. Use [`rsetup`](../os-config/rsetup) to enable `Radxa 10HD overlay`

<img src="../../../img/rock3/3c/rock3c-8hd-overlay.webp" width = "500" alt="rock 3c 10hd overlay"/>

If using Radxa 8HD need `Enable Radxa Display 8HD`

3. Power on and start

Before powering on, you need to confirm that the cables are connected correctly, connect the power supply to start the system, and you can start using Radxa 10HD.

## Raspberry Pi 7 inch screen

To use the Raspberry Pi 7-inch screen, you only need to connect `5v` and `GND`. The connection diagram is as follows

<img src="../../../img/rock3/3c/rock3c-rpi-7hd-connect.webp" width = "700" alt="rock 3c dsi connect"/>

Use[`rsetup`](../os-config/rsetup)to `Enable Raspberry Pi 7-inch Touchscreen` overlay

## FAQ

- Radxa 8HD/Radxa 10HD With backlight but no picture output

If you use Radxa 8HD/Radxa 10HD and there is only backlight but no picture output after powering on, please check whether the cable and the mipi connector of the screen are connected correctly. This situation is mostly caused by the cable not being connected properly.
