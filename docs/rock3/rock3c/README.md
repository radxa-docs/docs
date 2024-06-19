---
sidebar_position: 3
---

# ROCK 3C

## 产品介绍

ROCK 3C 是一款基于 RK3566 SoC 开发的SBC。 搭载了四核 Cortex-A55 ARM 处理器，板载 32 位 LPDDR4 内存，板载 Radxa D8 WiFi 模组(V1.3 板载 AP6256)，支持 1080P@60 HDMI， MIPI DSI，MIPI CSI，支持麦克风的 3.5 毫米音频插孔，USB 端口，千兆以太网，PCIe 2.0，40 针 GPIO 扩展。

### 实物照片

<Tabs queryString="Overview">
<TabItem value="V1.4">

![ROCK 3C V1.4 Overview](/img/rock3/3c/rock3c-overview-v1.4.webp)

</TabItem>
<TabItem value="V1.3">

![ROCK 3C V1.4 Overview](/img/rock3/3c/rock3c-overview-v1.3.webp)

</TabItem>
</Tabs>

### 芯片框图

![rk3566 block diagram](/img/rock3/rk3566_block_diagram.webp)

### 特性

<table>
    <tr>
        <td align="center">型号</td>
        <td align="center">Radxa ROCK 3C</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">Rockchip rk3566</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">四核 Cortex-A55, 频率最高达 1.6GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Arm Mali™‑G52‑2EE, 支持 Arm Mali™‑G52‑2EE, OpenGL® ES1.1/2.0/3.2, Vulkan® 1.1, OpenCL™ 2.0</td>
    </tr>
    <tr>
        <td align="center">内存</td>
        <td colspan="2" align="center">1/2/4 GB LPDDR4</td>
    </tr>
    <tr>
        <td align="center">存储</td>
        <td align="center">eMMC 模块<br/>microSD 存储卡</td>
    </tr>
    <tr>
        <td align="center">显示</td>
        <td colspan="2" align="center">1080P@60 HDMI<br/>2-lane MIPI DSI</td>
    </tr>
    <tr>
        <td align="center">以太网</td>
        <td align="center">支持以太网供电（PoE）的千兆以太网<br/>PoE 需要额外的可选 HAT</td>
    </tr>
    <tr>
        <td align="center">无线通讯</td>
        <td align="center">Wi-Fi 6 & BT 5.4(V1.4)<br/>Wi-Fi 5 & BT 5.0(V1.3)</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td colspan="2" align="center">USB 2.0 OTG x1<br/>USB 2.0 HOST x2<br/>USB 3.0 HOST x1</td>
    </tr>
    <tr>
        <td align="center">摄像头</td>
        <td colspan="2" align="center">2-lane MIPI CSI x1</td>
    </tr>
    <tr>
        <td align="center">其他</td>
        <td colspan="2" align="center">40 PIN GPIO 扩展座</td>
    </tr>
    <tr>
        <td align="center">供电</td>
        <td colspan="2" align="center"> 5V/2A 电源适配器</td>
    </tr>
    <tr>
        <td align="center">尺寸</td>
        <td colspan="2" align="center">85mm x 56mm</td>
    </tr>
</table>

### 系统框图

![ROCK 3C system block diagram](/img/rock3/3c/rock3c-system-diagram.webp)

## 文档使用指引

### [快速上手](/rock3/rock3c/getting-started)

介绍系统烧录，系统登录，配件使用等内容让用户能快速的上手使用。

### [瑞莎系统](/rock3/rock3c/radxa-os)

瑞莎系统 (Radxa OS) 是 Radxa 基于Debian OS 定制的一套操作系统，这里主要介绍 系统登录，网络连接等内容，
方便用户快速的熟悉并使用系统。

### [系统配置](/rock3/rock3c/os-config)

介绍如何使用通过工具（例如rsetup）或者命令去使用设备或者功能。

### [应用部署](/rock3/rock3c/apps-deployment)

介绍类似 Samba, Docker 等常见应用的配置及使用。

### [配件列表](/rock3/rock3c/accessories)

介绍支持的配件型号及使用说明。

### [硬件开发](/rock3/rock3c/hardware-design)

介绍硬件信息，例如硬件接口，支持的配件等。

### [底层开发](/rock3/rock3c/low-level-dev)

介绍 uboot, kernel, debian os 编译打包等内容。
