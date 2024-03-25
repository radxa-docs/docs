---
sidebar_position: 5
---

# ROCK 5B

## 产品介绍

ROCK 5B 是一款基于 RK3588 芯片组的优雅单板计算机 (SBC)。其 100 x 75 mm 的紧凑尺寸几乎涵盖了 RK3588 的所有功能，提供卓越的灵活性和可扩展性。ROCK 5B 为极客、单板机爱好者、物联网爱好者和高校师生等用户提供了将想法变为现实的坚实基础。它在边缘计算、人工智能、云计算、智能监控和其他领域有着广泛的应用。

ROCK 5B 可作为：

- 个人桌面计算机
- 个人私有服务器
- 安卓影音播放器
- 机器人控制器
- 区块链节点

其他更多使用场景，等你来发掘！

### 实物照片

<img src="/img/rock5b/rock-5b-overview.webp" alt="rock 5b overview" width="700" />

### 芯片框图

<img src="/img/rock5b/rk3588-block-diagram.webp" alt="rk3588 system diagram" width="700" />

### 特性

<table>
    <tr>
        <td align="center">型号</td>
        <td align="center">ROCK 5B</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">Rockchip rk3588</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">四大核 Cortex‑A76 频率最高达 2.4GHz<br/>四小核 Cortex‑A55 主频最大为 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Mali G610MP4 GPU，支持 OpenGLES 1.1、2.0 和 3.2，OpenCL 最高 2.2 和 Vulkan 1.2</td>
    </tr>
    <tr>
        <td align="center">内存</td>
        <td colspan="2" align="center">4/8/16 64 位 LPDDR4x</td>
    </tr>
    <tr>
        <td align="center">存储</td>
        <td align="center">板载 eMMC 模块：0/8/16/32/64 GB<br/>microSD 存储卡</td>
    </tr>
    <tr>
        <td align="center">显示</td>
        <td colspan="2" align="center">通过两个 HDMI、一个DP（type C）、一个 MIPI DSI 最多接四台显示设备<br/>分辨率高达 3x 4K@60FPS + 1x 1080P@60FPS 或者 1x 8K@60FPS + 1x 4K@60FPS + 1x 1080P@60FPS</td>
    </tr>
    <tr>
        <td align="center">硬件编解码</td>
        <td colspan="2" align="center">H.265/VP9 (HEVC)/AVS2 硬件解码（高达 8Kp60<br/>H.264 硬件解码（最高 8Kp30<br/>H.265/H.264 硬件编码(最高 8Kp30)</td>
    </tr>
    <tr>
        <td align="center">以太网</td>
        <td align="center">支持以太网供电（PoE）的千兆以太网<br/>PoE 需要额外的可选 HAT</td>
    </tr>
    <tr>
        <td align="center">无线通讯</td>
        <td align="center">Wi-Fi 6 (802.11 b/g/n) BT 5.0 with BLE</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td colspan="2" align="center">2x USB 2 端口<br/>1x USB 3 HOST 端口, 1x USB3 OTG 端口</td>
    </tr>
    <tr>
        <td align="center">摄像头</td>
        <td colspan="2" align="center">1x4 通道 MIPI CSI</td>
    </tr>
    <tr>
        <td align="center">其他</td>
        <td colspan="2" align="center">40 针扩展座</td>
    </tr>
    <tr>
        <td align="center">供电</td>
        <td colspan="2" align="center">支持 9V/2A、12V/2A、15V/2A 和 20V/2A 的 USB Type-C PD 2.0</td>
    </tr>
    <tr>
        <td align="center">尺寸</td>
        <td colspan="2" align="center">100 x 75 mm</td>
    </tr>
</table>

### 系统框图

<img src="/img/rock5b/rock-5b-block-digram.webp" alt="rock 5b system diagram" width="700" />

## 文档使用指引

:::tip
除了下面的 **其他系统** 目录外，其他内容都是围绕 Radxa OS (Radxa 基于 Debian 定制的系统) 展开。
:::

### [快速上手](/rock5/rock5b/getting-started)

介绍系统烧录，系统登录，配件使用等内容让用户能快速的上手使用。

### [瑞莎系统](/rock5/rock5b/radxa-os)

瑞莎系统 (Radxa OS) 是 Radxa 基于Debian OS 定制的一套操作系统，这里主要介绍 系统登录，网络连接等内容，
方便用户快速的熟悉并使用系统。

### [系统配置](/rock5/rock5b/os-config)

介绍如何使用通过工具（例如rsetup）或者命令去使用设备或者功能。

### [应用部署](/rock5/rock5b/apps-deployment)

介绍类似 Samba, Docker, PVE, OMV, LAMP, Cheese, 远程控制等常见应用的配置及使用。

### [应用开发](/rock5/rock5b/app-development)

介绍上层应用开发，比如QT, WiringX, Mraa 等。

### [硬件开发](/rock5/rock5b/hardware-design)

介绍硬件信息，例如硬件接口，支持的配件等。

### [底层开发](/rock5/rock5b/low-level-dev)

介绍 uboot, kernel, debian os 编译打包等内容。

### [其他系统](/rock5/rock5b/other-os)

介绍非 Radxa OS的其他系统，例如 Android。

### [配件列表](/rock5/rock5b/accessories)

介绍支持的配件型号及使用说明。
