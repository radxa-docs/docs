---
sidebar_position: 3
---

# ROCK 4A/4B 简介

ROCK 4A/4B 是基于 RK3399 SoC 的 SBC，搭载双核 1.8GHz Cortex-A72 和四核 1.4GHz Cortex-A53 处理器，支持 4K 显示，提供卓越的性能和丰富的扩展接口。ROCK 4A/AB 为专业人士、工业 OEM、物联网爱好者、业余爱好者、PC DIY 爱好者和制造商提供了一个可靠且功能强大的平台，用于将他们的想法构建和修改为现实。

![4A close view](/img/rock4/4a/rock4a.webp)

:::note
主板外观可能因为硬件版本不同而有细微的差别。
:::

## 主要参数

ROCK 4B 相比于 ROCK 4A 额外搭载了板载无线模块，同时支持 PoE 供电（需额外选配 PoE HAT）。

|   产品    |                                                  ROCK 4A/4B                                                   |
| :-------: | :-----------------------------------------------------------------------------------------------------------: |
|    CPU    |             Rockchip RK3399，64 位六核处理器<br/>双核 1.8GHz Cortex-72<br/>四核 1.4GHz Cortex-A53             |
|    GPU    |        Mali T860MP4 GPU，支持 OpenGL ES 1.1/2.0/3.0/3.1/3.2，Vulkan 1.0，OpenCL 1.1 1.2，DirectX 11等         |
|   内存    |                                           LPDDR4 内存，可选 2GB/4GB                                           |
|   存储    |                                    eMMC<br/>microSD<br/>M.2 NVMe 固态硬盘                                     |
|   显示    | 一个最高支持 4K@60 的标准 HDMI 接口<br/>一个通过 FPC 连接的双通道 MIPI DSI<br/>支持 HDMI 和 MIPI DSI 同时工作 |
|   音频    |                              3.5 毫米插孔，高清编解码器最高支持 24 位/96KHz 音频                              |
|   相机    |                 通过 FPC 连接的双通道 MIPI CSI，支持高达 800 万像素摄像头（0.3mm 间距连接器）                 |
| 无线连接  |             ROCK 4A不搭载无线模块<br/>ROCK 4B搭载无线模块（Wi-Fi 5，蓝牙 5.0），带外置天线连接器              |
|    USB    |  USB 3.0 OTG X1，位于上方的 USB 3.0 插口，可通过软件配置为 Host 或 Peripheral<br/>USB 3.0 X1<br/>USB 2.0 X2   |
|  以太网   |                       千兆以太网<br/>ROCK 4B 可通过额外选购的 HAT 支持以太网供电（PoE）                       |
|   其他    |                                                      RTC                                                      |
| GPIO 扩展 |                                   [40 pin GPIO](/rock4/hardware/rock4-gpio)                                   |
|   电源    |                                             支持 USB Type-C 5V/3A                                             |
|   尺寸    |                                                  85mm x 54mm                                                  |
