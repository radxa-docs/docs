---
sidebar_position: 1
---

# ROCK 3A

## 产品介绍

- ROCK 3A 配备了四核 Cortex-A55 ARM 处理器和 LPDDR4 运行内存， 最高支持 4K@60 的 HDMI、MIPI DSI、MIPI CSI、带麦克风的 3.5 毫米耳机插孔、USB 端口、千兆以太网、PCIe 3.0、PCIe 2.0、40 pin GPIO 扩展座、RTC。 此外，ROCK 3A 还支持 PD 和 QC 协议供电。

### 实物照片

![ROCK 3A Overview](/img/rock3/3a/rock3a-interfaces.webp)

### 芯片框图

![rk3568 block diagram](/img/rock3/rk3568_block_diagram.webp)

### 特性

<table>
    <tr>
        <td align="center">型号</td>
        <td align="center">Radxa ROCK 3A</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">Rockchip rk3568</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">四核 Cortex-A55, 频率最高达 2GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Arm Mali™‑G52‑2EE, 支持 Arm Mali™‑G52‑2EE, OpenGL® ES1.1/2.0/3.2, Vulkan® 1.1, OpenCL™ 2.0</td>
    </tr>
    <tr>
        <td align="center">内存</td>
        <td colspan="2" align="center">1/2/4/8 GB LPDDR4</td>
    </tr>
    <tr>
        <td align="center">存储</td>
        <td align="center">板载 eMMC 模块：0/8/16/32/64 GB<br/>microSD 存储卡</td>
    </tr>
    <tr>
        <td align="center">显示</td>
        <td colspan="2" align="center">提供 Micro HDMI 接口：支持 4K@60fps 输出<br/>1x2 lane MIPI DSI</td>
    </tr>
    <tr>
        <td align="center">以太网</td>
        <td align="center">支持以太网供电（PoE）的千兆以太网<br/>PoE 需要额外的可选 HAT</td>
    </tr>
    <tr>
        <td align="center">无线通讯</td>
        <td align="center">M.2 E Key 支持外接 Radxa Wireless Module A8(Wi-Fi 6 & BT 5.2)</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td colspan="2" align="center">2x USB 2.0 HOST ports<br/>1x USB 3.0 HOST port<br/>1x USB 3.0 OTG/HOST port</td>
    </tr>
    <tr>
        <td align="center">摄像头</td>
        <td colspan="2" align="center">1x2 lane MIPI CSI</td>
    </tr>
    <tr>
        <td align="center">其他</td>
        <td colspan="2" align="center">40 针扩展座</td>
    </tr>
    <tr>
        <td align="center">供电</td>
        <td colspan="2" align="center">需要 5V/2A 电源适配器</td>
    </tr>
    <tr>
        <td align="center">尺寸</td>
        <td colspan="2" align="center">65mm x 30mm</td>
    </tr>
</table>

### 系统框图

![ROCK 3A SYSTEM BLOCK DIAGRAM](/img/rock3/3a/rock3a-system-block-diagram.webp)

## 文档使用指引

:::tip
除了下面的 **其他系统** 目录外，其他内容都是围绕 Radxa OS (Radxa 基于 Debian 定制的系统) 展开。
:::

### [快速上手](/rock3/rock3a/getting-started)

介绍系统烧录，系统登录，配件使用等内容让用户能快速的上手使用。

### [瑞莎系统](/rock3/rock3a/radxa-os)

瑞莎系统 (Radxa OS) 是 Radxa 基于Debian OS 定制的一套操作系统，这里主要介绍 系统登录，网络连接等内容，
方便用户快速的熟悉并使用系统。

### [系统配置](/rock3/rock3a/system-config)

介绍如何使用通过工具（例如rsetup）或者命令去使用设备或者功能。

### [应用部署](/rock3/rock3a/apps-deployment)

介绍类似 Samba, Docker, PVE, OMV, LAMP, Cheese, 远程控制等常见应用的配置及使用。

### [应用开发](/rock3/rock3a/app-development)

介绍上层应用开发，比如QT, WiringX, Mraa 等。

### [硬件开发](/rock3/rock3a/hardware-design)

介绍硬件信息，例如硬件接口，支持的配件等。

### [底层开发](/rock3/rock3a/low-level-dev)

介绍 uboot, kernel, debian os 编译打包等内容。

### [其他系统](/rock3/rock3a/other-os)

介绍非 Radxa OS的其他系统，例如 Android。

### [配件列表](/rock3/rock3a/accessories)

介绍支持的配件型号及使用说明。
