---
sidebar_position: 5
---

# ROCK 5 ITX

## 产品介绍

Radxa ROCK 5 ITX 是一款完全兼容 Mini-ITX 外形的单板计算机/主板，采用 Rockchip RK3588 SoC。
它拥有开源软件和硬件文档，是制造商、物联网爱好者、业余爱好者、游戏玩家和 PC 用户的理想平台。

### 实物照片

  <img src="/img/rock5itx/rock5itx-real.webp" width="500" />

### 接口说明

<table>
  <tr>
    <th>编号</th>
    <th>接口名</th>
    <th>编号</th>
    <th>接口名</th>
    <th>编号</th>
    <th>接口名</th>
    <th>编号</th>
    <th>接口名</th>
  </tr>
  <tr>
    <th>1</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#tp-接口">TP 接口</a></th>
    <th>9</th>
    <th>AUDIO</th>
    <th>17</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#poe">POE 接口</a></th>
    <th>25</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#pcie-m-key">PCIE M KEY</a></th>
  </tr>
  <tr>
    <th>2</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#lcd0">LCD 屏接口</a></th>
    <th>10</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#usb-30--hdmi-10">USB 3.0 + HDMI</a></th>
    <th>18</th>
    <th>ATX 电源接口</th>
    <th>26</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#pcie-e-key">PCIE E KEY</a></th>
  </tr>
  <tr>
    <th>3</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#摄像头接口">摄像头接口</a></th>
    <th>11</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#usb-30--hdmi-11">USB 3.0 + HDMI</a></th>
    <th>19</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#sata">SATA</a></th>
    <th>27</th>
    <th>RK3588 SOC</th>
  </tr>
  <tr>
    <th>4</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#miscro-sd">Miscro SD</a></th>
    <th>12</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#以太网--usb-20-12">以太网 + USB 2.0</a></th>
    <th>20</th>
    <th>5V/GND/GND/12V</th>
    <th>28</th>
    <th>LPDDR5</th>
  </tr>
  <tr>
    <th>5</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#debug-uart">DEBUG UART</a></th>
    <th>13</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#以太网--usb-20-13">以太网 + USB 2.0</a></th>
    <th>21</th>
    <th>EDP</th>
    <th>29</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#fan">FAN</a></th>
  </tr>
  <tr>
    <th>6</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#f_usb">F_USB</a></th>
    <th>14</th>
    <th>HDMI RX</th>
    <th>22</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#rtc">RTC 电源</a></th>
    <th></th>
    <th></th>
  </tr>
  <tr>
    <th>7</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#f_audio">F_AUDIO</a></th>
    <th>15</th>
    <th>全功能 Type C</th>
    <th>23</th>
    <th>MASK ROM 按键</th>
    <th></th>
    <th></th>
  </tr>
  <tr>
    <th>8</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#spdif-音频接口">SPDIF 音频接口</a></th>
    <th>16</th>
    <th>DC 电源接口</th>
    <th>24</th>
    <th><a href="/rock5/rock5itx/hardware-design/hardware-interface#recovery"></a></th>
    <th></th>
    <th></th>
  </tr>
</table>

### 芯片框图

<img src="/img/rock5b/rk3588-block-diagram.webp" alt="rk3588 system diagram" width="700" />

### 特性

<table>
  <tr>
    <th>型号</th>
    <th>ROCK 5ITX</th>
  </tr>
  <tr>
    <th>SoC</th>
    <th>Rockchip RK3588 SoC</th>
  </tr>
  <tr>
    <th>CPU</th>
    <th>基于 Arm® DynamIQ™ 配置的四路 Cortex®-A76 @ 2.2/2.4GHz 和四路 Cortex®-A55 @ 1.8GHz</th>
  </tr>
  <tr>
    <th>GPU</th>
    <th>Arm® Mali™ G610MC4 GPU supporting:<br/>OpenGL® ES1.1, ES2.0, and ES3.2<br/>OpenCL® 1.1, 1.2 and 2.2<br/>Vulkan® 1.1 and 1.2<br/>嵌入式高性能 2D 图像加速模块</th>
  </tr>
  <tr>
    <th>NPU</th>
    <th>支持 INT4 / INT8 / INT16 / FP16 / BF16 和 TF32 加速，计算能力高达 6TOPs</th>
  </tr>
  <tr>
    <th>内存</th>
    <th>64 位 LPDDR5 内存 5500MT/S<br/>可选：8/16/24/32GB </th>
  </tr>
  <tr>
    <th>存储</th>
    <th>板载 32GB eMMC</th>
  </tr>
  <tr>
    <th>硬件编解码</th>
    <th>可通过两个 HDMI、一个 DP（C 型）和一个 MIPI DSI 提供 4 路显示输出<br/>H.265/H.264/VP9/AV1/AVS2 视频解码器，最高 8K@60fps<br/>H.264/H.265 视频解码器，最高 8K@30fps</th>
  </tr>
  <tr>
    <th>以太网</th>
    <th>2 个 2.5 千兆以太网端口，其中一个支持 PoE（需要额外的 PoE 模块）</th>
  </tr>
  <tr>
    <th>USB</th>
    <th>USB Type-C：ROCK 5 ITX 配备了一个 USB 3.0 OTG Type-C 端口，支持 DP 接口，最大分辨率可达 4Kp60。不支持从 USB C 输入电源。<br/> 后 IO USB： 后 IO 提供 2 个 USB 2.0 HOST 端口（与 RJ5 共用连接器），这四个端口的总输出功率为 1A；后 IO 提供 2 个双 USB 3.0 HOST 端口（与 HDMI 共用连接器），每个双 USB 3.0 端口的总输出功率为 1.75A。<br/>前面板 USB： F_USB "连接器提供 2 个 USB 2.0 HOST 端口，这两个端口的总输出功率为 1A。
    </th>
  </tr>
  <tr>
    <th>显示</th>
    <th>1 个 eDP 端口，用于 eDP LCD 面板<br/>2x MIPI LCD 端口（四通道 MIPI DSI）</th>
  </tr>
  <tr>
    <th>摄像头</th>
    <th>2 个摄像头端口（2 个四通道 MIPI CSI 或 2 个双通道 MIPI CSI）</th>
  </tr>
  <tr>
    <th>SATA</th>
    <th>4x SATA 接口，带电源接头</th>
  </tr>
  <tr>
    <th>供电</th>
    <th>1x 12V DC 电源输入<br/>1x 24P ATX 电源连接器</th>
  </tr>
  <tr>
    <th>尺寸</th>
    <th>170mm x 170mm</th>
  </tr>
</table>

### 系统框图

<img src="/img/rock5itx/rock5itx-system-block-diagram.webp" alt="rk3588 system diagram" width="700" />

## 文档使用指引

:::tip
除了下面的 **其他系统** 目录外，其他内容都是围绕 Radxa OS (Radxa 基于 Debian 定制的系统) 展开。
:::

### [快速上手](./getting-started/README)

介绍系统烧录，系统登录，配件使用等内容让用户能快速的上手使用。

### [瑞莎系统](./radxa-os/README)

瑞莎系统 (Radxa OS) 是 Radxa 基于Debian OS 定制的一套操作系统，这里主要介绍 系统登录，网络连接等内容，
方便用户快速的熟悉并使用系统。

### [系统配置](./os-config/README)

介绍如何使用通过工具（例如rsetup）或者命令去使用设备或者功能。

### [应用部署](./apps-deployment/README)

介绍类似 Samba, Docker, PVE, OMV, LAMP, Cheese, 远程控制等常见应用的配置及使用。

### [应用开发](./app-development/README)

介绍上层应用开发，比如QT, WiringX, Mraa 等。

### [硬件开发](./hardware-design/README)

介绍硬件信息，例如硬件接口，支持的配件等。

### [底层开发](./low-level-dev/README)

介绍 uboot, kernel, debian os 编译打包等内容。

### [其他系统](./other-os/README)

介绍非 Radxa OS的其他系统，例如 Android。

### [配件列表](./accessories/README)

介绍支持的配件型号及使用说明。
