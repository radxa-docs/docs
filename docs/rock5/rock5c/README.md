---
sidebar_position: 5
---

# ROCK 5C

### 实物照片

<Tabs queryString="target">

  <TabItem value="rock-5c" label="ROCK 5C">
  <img src="/img/rock5c/rock-5c-overview.webp" alt="rock 5c overview" width="700" />
  </TabItem>

  <TabItem value="rock-5c-lite" label="ROCK 5C Lite">
  <img src="/img/rock5c/rock-5c-lite-overview.webp" alt="rock 5c lite overview" width="700" />
  </TabItem>

</Tabs>

### 芯片框图

<Tabs queryString="target">

  <TabItem value="rk3588s2" label="RK3588S2">
  <img src="/img/rock5c/rk3588s2_blockdiagram.webp" alt="rock 5c overview" width="700" />
  </TabItem>

  <TabItem value="rk3582" label="RK3582">
  <img src="/img/rock5c/rk3582_blockdiagram.webp" alt="rock 5c lite overview" width="700" />
  </TabItem>

</Tabs>

### 特性

<table>
    <tr>
        <td align="center">型号</td>
        <td align="center">ROCK 5C</td>
        <td align="center">ROCK 5C Lite</td>
    </tr>
    <tr>
        <td align="center">处理器</td>
        <td align="center">Rockchip RK3588S2</td>
        <td align="center">Rockchip RK3582</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td align="center">Quad-core Cortex-A76 主频最高达 2.4 GHz<br/>Quad-core Cortex-A55 主频最高达 1.8GHz</td>
        <td align="center">Dual-core Cortex-A76 主频最高达 2.4 GHz<br/>Quad-core Cortex-A55 主频最高达 1.8GHz</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td align="center"> Arm Mali‑G610MC4 </td>
        <td align="center"> N/A </td>
    </tr>
    <tr>
        <td align="center">内存</td>
        <td align="center">2/4/8/16/32GB 64位 LPDDR4x</td>
        <td align="center">1/2/4/8/16GB 64位 LPDDR4x</td>
    </tr>
    <tr>
        <td align="center">存储</td>
        <td align="center" colspan="2"> 1x eMMC 座子 <br/> 1x microSD 卡座 <br/> 无 SPI Flash </td>
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
        <td align="center" colspan="2"> 1x 4通道 MIPI CSI 接口</td>
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

## 文档使用指引

:::tip
除了下面的 **其他系统** 目录外，其他内容都是围绕 Radxa OS (Radxa 基于 Debian 定制的系统) 展开。
:::

### [快速上手](/rock5/rock5c/getting-started)

介绍系统烧录，系统登录，配件使用等内容让用户能快速的上手使用。

### [瑞莎系统](/rock5/rock5c/radxa-os)

瑞莎系统 (Radxa OS) 是 Radxa 基于Debian OS 定制的一套操作系统，这里主要介绍 系统登录，网络连接等内容，
方便用户快速的熟悉并使用系统。

### [系统配置](/rock5/rock5c/os-config)

介绍如何使用通过工具（例如rsetup）或者命令去使用设备或者功能。

### [应用部署](/rock5/rock5c/apps-deployment)

介绍类似 Samba, Docker, PVE, OMV, LAMP, Cheese, 远程控制等常见应用的配置及使用。

### [应用开发](/rock5/rock5c/app-development)

介绍上层应用开发，比如QT, WiringX, Mraa 等。

### [硬件开发](/rock5/rock5c/hardware-design)

介绍硬件信息，例如硬件接口，支持的配件等。

### [底层开发](/rock5/rock5c/low-level-dev)

介绍 uboot, kernel, debian os 编译打包等内容。

### [其他系统](/rock5/rock5c/other-os)

介绍非 Radxa OS的其他系统，例如 Android。

### [配件列表](/rock5/rock5c/accessories)

介绍支持的配件型号及使用说明。
