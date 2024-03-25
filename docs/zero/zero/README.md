---
sidebar_position: 40
---

# ZERO

## 产品介绍

- Radxa Zero 是一款基于 Amlogic S905Y2 的小尺寸高性能单板计算机，它可以运行安卓和 Linux 系统
- Radxa Zero 拥有一颗 4 核 64 位处理器，最高 4GB(32bit) LPDDR4 内存，支持 4k@60 HDMI 输出，支持 WiFi 和蓝牙，板载 USB3.0、40-pin GPIO 接口。
- 板载USB2.0 OTG接口，支持供电和数据传输。

## 实物照片

**Radxa ZERO**
![Radxa ZERO](/img/zero/zero/Zero_ports.webp)

### 芯片框图

![S905Y2 block diagram](/img/zero/zero/S905Y2-block-digram.webp)

### 特性

<table>
    <tr>
        <td align="center">型号</td>
        <td align="center">Radxa ZERO</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">Amlogic S905Y2</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">四核 Cortex-A53, 频率最高达 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Arm Mali™‑G31 MP2 GPU, 支持 OpenGL ES 3.2, Vulkan 1.0 和 OpenCL 2.0</td>
    </tr>
    <tr>
        <td align="center">内存</td>
        <td colspan="2" align="center">512 MB，1/2/4 GB LPDDR4</td>
    </tr>
    <tr>
        <td align="center">存储</td>
        <td align="center">板载 eMMC 模块：0/8/16/32/64/128 GB<br/>microSD 存储卡</td>
    </tr>
    <tr>
        <td align="center">显示</td>
        <td colspan="2" align="center">Micro HDMI x 1，4K60p</td>
    </tr>
    <tr>
        <td align="center">无线通讯</td>
        <td align="center">ap6212/ap6256/aw-cm256sm WIFI/BT 模块</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td colspan="2" align="center">USB 2.0 Type-C OTG x1<br/>USB 3.0 Type-C HOST x1</td>
    </tr>
    <tr>
        <td align="center">其他</td>
        <td colspan="2" align="center">40 针扩展座</td>
    </tr>
    <tr>
        <td align="center">供电</td>
        <td colspan="2" align="center">支持 5V 电源适配器，建议使用额定最大电流大于2A的电源适配器</td>
    </tr>
    <tr>
        <td align="center">尺寸</td>
        <td colspan="2" align="center">65mm x 30mm</td>
    </tr>
</table>

### 系统框图

- **Radxa ZERO**

![zero-interface-overview](/img/zero/zero/zero-block-digram.webp)

## 文档使用指引

:::tip
除了下面的 **其他系统** 目录外，其他内容都是围绕 Radxa OS (Radxa 基于 Debian 定制的系统) 展开。
:::

### [快速上手](/zero/zero/getting-started)

介绍系统烧录，系统登录，配件使用等内容让用户能快速的上手使用。

### [瑞莎系统](/zero/zero/radxa-os)

瑞莎系统 (Radxa OS) 是 Radxa 基于Debian OS 定制的一套操作系统，这里主要介绍 系统登录，网络连接等内容，
方便用户快速的熟悉并使用系统。

### [系统配置](/zero/zero/os-config)

介绍如何使用通过工具（例如 rsetup）或者命令去使用设备或者功能。

### [应用部署](/zero/zero/apps-deployment)

介绍类似 Samba, Docker, PVE, OMV, LAMP, Cheese, 远程控制等常见应用的配置及使用。

### [应用开发](/zero/zero/app-development)

介绍上层应用开发，比如 QT, WiringX, Mraa 等。

### [硬件开发](/zero/zero/hardware-design)

介绍硬件信息，例如硬件接口，支持的配件等。

### [底层开发](/zero/zero/low-level-dev)

介绍 uboot, kernel, debian os 编译打包等内容。

### [其他系统](/zero/zero/other-os)

介绍非 Radxa OS 的其他系统，例如 Android。

### [配件列表](/zero/zero/accessories)

介绍支持的配件型号及使用说明。
