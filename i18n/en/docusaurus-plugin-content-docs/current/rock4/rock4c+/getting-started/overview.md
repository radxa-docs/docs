---
sidebar_position: 3
---

# ROCK 4C+ Overview

The ROCK 4C+ is an SBC based on the RK3399-T SoC.
Equipped with 1.5GHz dual core Cortex-A72 + 1Ghz quad core Cortex-A53 ARM processor, 64bit LPDDR4,
two micro-HDMI, MIPI DSI, MIPI CSI, 3.5mm headphone jack, USB Port, GbE LAN, 40-pin color expansion header, RTC.

## Close Look

![4C+ close view](/img/rock4/rock4c+-closelook.webp)

:::note
The board appearance may vary slightly depending on the hardware version.
:::

## Features

|   Model   | ROCK 4C Plus                                                                                                                                                                                                                 |
| :-------: | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Processor | 64bits hexa core processor<br/>Rockchip RK3399-T<br/>Dual Cortex-72, frequency 1.5GHz with qual Cortex-A53, frequency 1.0GHz<br/>Mali T860MP4 gpu, support OpenGL ES 1.1/2.0/3.0/3.1/3.2, Vulkan 1.0, Open CL 1.1 1.2, DX11. |
|  Memory   | LPDDR4<br/>64bit dual channel LPDDR4@3200Mb/s, 1GB/2GB/4GB optioal                                                                                                                                                           |
|  Storage  | eMMC<br/>microSD card: supports up to 256 GB microSD                                                                                                                                                                         |
|  Display  | One Micro HDMI 2K up to 1440P@60<br/>One Micro HDMI 4K 2.0 up to 4k@60<br/>MIPI DSI 4 lanes via FPC connector<br/>Only two of HDMI 2k, HDMI 4K and MIPI DSI can work at the same time.                                       |
|   Audio   | 3.5mm jack HD codec that supports up to 24-bit/96KHz audio                                                                                                                                                                   |
|  Camera   | MIPI CSI 2 lanes via FPC connector, support up to 800 MP camera (0.3mm pitch connector)                                                                                                                                      |
| Wireless  | Wi-Fi 5, BT 5.0, with external antenna                                                                                                                                                                                       |
|    USB    | USB 3.0 OTG X1, upper one, software configurable to be host or OTG,<br/>USB 3.0 HOST X1, dedicated USB 3.0 channel, lower one<br/>USB 2.0 HOST X2                                                                            |
| Ethernet  | GbE LAN with Power over Ethernet (PoE) support additional HAT is required for powering from PoE                                                                                                                              |
|    IO     | [40 pin GPIO](../../hardware/rock4-gpio)                                                                                                                                                                                     |
|   Other   | RTC                                                                                                                                                                                                                          |
|   Power   | USB type C 5V/3A.                                                                                                                                                                                                            |
|   Size    | 85mm x 54mm                                                                                                                                                                                                                  |
