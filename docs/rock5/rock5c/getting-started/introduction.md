---
sidebar_position: 1
---

# 产品介绍

## 主要特性

Radxa ROCK 5C 是一款紧凑型单板计算机（SBC），拥有一系列领先的功能、特性和扩展选项。对于创客、物联网爱好者、业余爱好者、游戏玩家、PC用户以及所有追求卓越性能和可靠性的高规格平台的人来说，ROCK 5C 是理想的选择。ROCK 5C 提供两个版本：标准版（基于RK3588S2）和 Lite 版（基于RK3582）。这两个版本在大部分功能上相同，唯一的区别在于 SoC（片上系统）。在后续的文档中，除非特别说明，"ROCK 5C" 指的是 ROCK 5C 标准版和 5C Lite 版本。

ROCK 5C 可作为：

- 个人桌面计算机
- 个人私有服务器
- 安卓影音播放器
- 机器人控制器
- 区块链节点

其他更多使用场景，等你来发掘！

### 接口丰富

ROCK 5C 提供了丰富的接口，包括多个 USB 、HDMI 等接口，便于连接外部设备和扩展功能。详见[参数配置](#参数配置)。

### 配件生态丰富

ROCK 5C 支持多款摄像头和显示屏。

### 强大的多媒体处理能力

CPU 采用四核 A76 + 四核 A55 的八核架构，主频高达 2.4GHz，具有强大的计算能力和多任务处理能力。GPU部分则集成了 ARM G610MP4，支持 OpenGL ES1.1/2.0/3.2、OpenCL 2.2 和 Vulkan 1.2 等多种图形接口，可提供高效流畅的图形处理体验。

### 丰富的操作系统支持

支持多种操作系统，包括 Radxa 官方的发行的 Debian 系统和 Android 系统，另外还有一些第三方操作系统，适用于各类应用场景。

### 潜在的开发潜力

作为一款强大的开发平台 ROCK 5C 对于人工智能、边缘计算、嵌入式系统等领域具有较大的潜力。

### 开源支持

ROCK 5C 提供了完整的硬件设计原理图和软件源代码，这一特性使得大多 DIY 设计爱好者和开发者进行个性化修改和功能拓展，吸引了一众开源爱好者活跃在社区，有利于促进知识共享和技术创新。

## 主板预览

<Tabs queryString="Soc">
    <TabItem value="RK3588S2">
        <img src="/img/rock5c/rock-5c-rk3588s2-real.webp" alt="rock 5c rk3588s2" width="700" />
    </TabItem>
    <TabItem value="RK3582">
        <img src="/img/rock5c/rock-5c-rk3582-real.webp" alt="rock 5c rk3582" width="700" />
    </TabItem>
</Tabs>

## 参数配置

<table>
    <tr>
        <td align="center">型号</td>
        <td align="center">ROCK 5C 标准版</td>
        <td align="center">ROCK 5C Lite 版</td>
    </tr>
    <tr>
        <td align="center">处理器</td>
        <td align="center">瑞芯微 RK3588S2</td>
      <td align="center">瑞芯微 <strong>RK3582</strong></td>
    </tr>
    <tr>
        <td align="center">CPU</td>
      <td align="center">四核 Cortex-A76 主频最高达 2.4 GHz<br/>四核 Cortex-A55 主频最高达 1.8GHz</td>
      <td align="center"><strong>双核</strong> Cortex-A76 主频最高达 2.4 GHz<br/>四核 Cortex-A55 主频最高达 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td align="center"> Arm Mali‑G610MC4 </td>
      <td align="center"> <strong>无 GPU</strong> </td>
    </tr>
    <tr>
        <td align="center">内存</td>
        <td align="center">2/4/8/16/32GB 64位 LPDDR4x</td>
        <td align="center">1/2/4/8/16GB 64位 LPDDR4x</td>
    </tr>
    <tr>
        <td align="center">存储</td>
        <td align="center" colspan="2"> 1x eMMC 座子 <br/> 1x microSD 卡座 <br/> 无板载 SPI Flash，支持外接 SPI Flash 模块 </td>
    </tr>
    <tr>
        <td align="center">视频输出</td>
        <td align="center" colspan="2">1x HDMI 2.1 支持最高8K画面输出<br/>1x MIPI DSI 最高2K画面输出</td>
    </tr>
    <tr>
        <td align="center">多媒体</td>
        <td align="center">H.265 / VP9 8K@60fps 解码<br/>H.264 8K@30fps 解码<br/>AV1 4K@60fps 解码<br/>H.264 / H.265 8K@30fps 编码</td>
        <td align="center">H.264 / H.265 4K@60fps 编码</td>
    </tr>
    <tr>
        <td align="center">以太网</td>
        <td align="center" colspan="2">支持PoE 功能的千兆以太网口<br/>PoE 需要额外的 HAT</td>
    </tr>
    <tr>
        <td align="center">无线网</td>
        <td align="center" colspan="2">1x WiFi6 / BT5.4 带外部天线接口</td>
    </tr>
    <tr>
        <td align="center">USB</td>
        <td align="center" colspan="2">2x USB2.0 端口<br/>1x USB3.0 Host 端口, 1x USB3.0 OTG 端口</td>
    </tr>
    <tr>
        <td align="center">摄像头</td>
        <td align="center" colspan="2"> 1x 4 通道 MIPI CSI 接口(支持 2x 2 通道 MIPI CSI 摄像头)</td>
    </tr>
    <tr>
        <td align="center">其他</td>
        <td align="center" colspan="2">40 针脚扩展座</td>
    </tr>
        <tr>
        <td align="center">供电</td>
        <td align="center" colspan="2">支持 5V</td>
    </tr>
        <tr>
        <td align="center">尺寸</td>
        <td align="center" colspan="2">86 x 56 mm</td>
    </tr>
</table>
