---
sidebar_position: 40
---

# ZERO 2 PRO

## 产品介绍

- Radxa ZERO 2 PRO 是一款小尺寸单板计算机，专为嵌入其他外设共同使用而设计。
- 搭载了强大的 Amlogic A311D 处理器作为开发平台，为用户提供卓越的计算性能。多核心架构和高频率运行使其在处理多种复杂任务方面表现出色，涵盖了多媒体处理、图像处理、人工智能和数据分析等领域。
- 此外，该产品还集成了高效的图像和多媒体处理单元，从而支持高清视频的解码和编码，以及流畅的图像渲染。

## 实物照片

**Radxa ZERO 2 PRO**
![ZERO 2 PRO Overview](/img/zero/zero2pro/zero2pro-mark.webp)

为了最大程度释放 Radxa ZERO 2 PRO 的性能，专门配备了定制的散热模组。散热模组采用铝质材质，并设计有多鳍片结构，从而有效增大了散热表面积。此外，还采用了可编程控制的散热风扇，该风扇能够根据设备当前的负载和温度需求动态调整转速，以避免不必要的能源消耗，提高能效，从而降低电力消耗和热量产生。这使得Radxa ZERO 2 PRO 在高负载情况下能够保持稳定的性能表现，提供卓越的使用体验。

<div className='img' style={{ transform: 'scale(.6)' }}>

![ZERO 2 PRO Overview](/img/zero/zero2pro/zero2pro-heatsink.webp)

</div>

### 芯片框图

![A311D block diagram](/img/zero/zero2pro/A311D-block-digram.webp)

### 特性

<table>
    <tr>
        <td align="center">型号</td>
        <td align="center">Radxa ZERO 2 PRO</td>
    </tr>
    <tr>
        <td align="center">SoC</td>
        <td colspan="2" align="center">Amlogic A311D</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td colspan="2" align="center">四核 Cortex‑A73 @ 2.2GHz + 双核 Cortex‑A53 @ 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td colspan="2" align="center">Arm® G52 MP4 GPU, 支持 OpenGL® ES1.1/2.0/3.2, Vulkan® 1.1, OpenCL™ 2.0</td>
    </tr>
    <tr>
        <td align="center">内存</td>
        <td colspan="2" align="center">4GB LPDDR4</td>
    </tr>
    <tr>
        <td align="center">存储</td>
        <td align="center">可选板载 eMMC 模块：16/32/64 GB<br/>MicroSD 存储卡</td>
    </tr>
    <tr>
        <td align="center">显示</td>
        <td colspan="2" align="center">Micro HDMI x 1，4K60p<br/>4 通道 MIPI DSI 接口 x 1</td>
    </tr>
    <tr>
        <td align="center">无线通讯</td>
        <td align="center">Wi-Fi 5 (802.11 b/g/n/ac)<br/>BT 5.0 with BLE<br/>搭载外置天线</td>
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
        <td colspan="2" align="center">65mm x 37mm</td>
    </tr>
</table>

### 系统框图

- **Radxa ZERO 2 PRO**

![zero2pro-interface-overview](/img/zero/zero2pro/zero2pro-block-digram.webp)

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
