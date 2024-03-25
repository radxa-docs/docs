---
sidebar_position: 5
---

# ZERO 3

## 产品介绍

- Radxa ZERO 3W/3E 是一款基于 Rockchip RK3566 开发的一款超小尺寸高性能单板计算机，外形紧凑，接口丰富。
- Radxa ZERO 3W/3E 专为包括制造商、物联网开发人员、业余爱好者和 PC DIY 爱好者在内的多元化用户群量身定制，是一个超小尺寸的多功能的平台，可以用于各种不同的应用，包括物联网设备、机器学习边缘计算、家庭自动化、教育和娱乐等。
- ZERO 3W 和 ZERO 3E 尺寸型号基本一致，只是在存储，网络接口方面有区别，详情请参考本文的特性部分，这里统一介绍。

### 实物照片

<Tabs queryString="model">
<TabItem value="zero-3w" label="ZERO 3W">

- **Radxa ZERO 3W**
  ![ZERO 3W Overview](/img/zero/zero3/radxa_zero_3w.webp)

</TabItem>

<TabItem value="zero-3e" label="ZERO 3E">

- **Radxa ZERO 3E**
  ![ZERO 3E Overview](/img/zero/zero3/radxa_zero_3e.webp)

</TabItem>

</Tabs>

### 芯片框图

![RK3566 block diagram](/img/rock3/rk3566_block_diagram.webp)

### 特性

<table>
    <tr>
        <td align="center">型号</td>
        <td align="center">Radxa ZERO 3W</td>
        <td align="center">Radxa ZERO 3E</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">Rockchip RK3566</td>
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
        <td colspan="2" align="center">1/2/4/8 GB LPDDR4</td>
    </tr>
    <tr>
        <td align="center">存储</td>
        <td align="center">板载 eMMC 模块：0/8/16/32/64 GB<br/>microSD 存储卡</td>
        <td align="center">microSD 存储卡</td>
    </tr>
    <tr>
        <td align="center">显示</td>
        <td colspan="2" align="center">提供 Micro HDMI 接口：支持 1080p60 输出</td>
    </tr>
    <tr>
        <td align="center">以太网</td>
        <td align="center">/</td>
        <td align="center">支持以太网供电（PoE）的千兆以太网<br/>PoE 需要额外的可选 HAT</td>
    </tr>
    <tr>
        <td align="center">无线通讯</td>
        <td align="center">Wi-Fi 6 (802.11 b/g/n) BT 5.0 with BLE</td>
        <td align="center">/</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td colspan="2" align="center">USB 2.0 Type-C OTG x1<br/>USB 3.0 Type-C HOST x1</td>
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
        <td colspan="2" align="center">需要 5V/2A 电源适配器</td>
    </tr>
    <tr>
        <td align="center">尺寸</td>
        <td colspan="2" align="center">65mm x 30mm</td>
    </tr>
</table>

### 系统框图

<Tabs queryString="model">

<TabItem value="zero-3w" label="ZERO 3W">

- **Radxa ZERO 3W**

![zero-3w-interface-overview](/img/zero/zero3/zero-3w-interface-overview.webp)

</TabItem>
<TabItem value="zero-3e" label="ZERO 3E">

- **Radxa ZERO 3E**

![zero-3e-interface-overview](/img/zero/zero3/zero-3e-interface-overview.webp)

</TabItem>
</Tabs>

## 文档使用指引

:::tip
除了下面的 **其他系统** 目录外，其他内容都是围绕 Radxa OS (Radxa 基于 Debian 定制的系统) 展开。
:::

### [快速上手](/zero/zero3/getting-started)

介绍系统烧录，系统登录，配件使用等内容让用户能快速的上手使用。

### [瑞莎系统](/zero/zero3/radxa-os)

瑞莎系统 (Radxa OS) 是 Radxa 基于Debian OS 定制的一套操作系统，这里主要介绍 系统登录，网络连接等内容，
方便用户快速的熟悉并使用系统。

### [系统配置](/zero/zero3/os-config)

介绍如何使用通过工具（例如rsetup）或者命令去使用设备或者功能。

### [应用部署](/zero/zero3/apps-deployment)

介绍类似 Samba, Docker, PVE, OMV, LAMP, Cheese, 远程控制等常见应用的配置及使用。

### [应用开发](/zero/zero3/app-development)

介绍上层应用开发，比如QT, WiringX, Mraa 等。

### [硬件开发](/zero/zero3/hardware-design)

介绍硬件信息，例如硬件接口，支持的配件等。

### [底层开发](/zero/zero3/low-level-dev)

介绍 uboot, kernel, debian os 编译打包等内容。

### [其他系统](/zero/zero3/other-os)

介绍非 Radxa OS的其他系统，例如 Android。

### [配件列表](/zero/zero3/accessories)

介绍支持的配件型号及使用说明。
