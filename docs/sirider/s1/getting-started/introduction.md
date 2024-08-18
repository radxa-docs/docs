---
sidebar_position: 1
description: "简单介绍 SiRider S1"
---

# 产品介绍

SiRider S1 是 Radxa 与芯擎科技及安谋科技联合推出工业单板计算机，融合芯擎科技的工业级 “龍鹰一号” 7nm AIoT应用处理器SE1000-I，安谋科技自研“周易”NPU，以及Radxa的工业级产品设计经验，为市场提供高性能、高可靠的工业级产品，应对未来多元化的应用场景需求。

## 主板预览

<img src="/img/sirider/s1/sirider-s1-overview.webp" alt="sirider s1 Overview" width="700" />

接口说明

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
        <th>编号</th>
        <th>接口名</th>
      </tr>
      <tr>
        <th>1</th>
        <th>Power Button</th>
        <th>9</th>
        <th>Ethernet</th>
        <th>17</th>
        <th>电源输入</th>
        <th>25</th>
        <th>40-pin GPIO Header</th>
        <th>33</th>
        <th>I2S</th>
      </tr>
      <tr>
        <th>2</th>
        <th>DDR</th>
        <th>10</th>
        <th>USB 3.0</th>
        <th>18</th>
        <th>POE Header</th>
        <th>26</th>
        <th> / </th>
        <th>34</th>
        <th>UART</th>
      </tr>
      <tr>
        <th>3</th>
        <th>CSI</th>
        <th>11</th>
        <th>HDMI</th>
        <th>19</th>
        <th>RTC</th>
        <th>27</th>
        <th>M.2 E Key</th>
        <th>35</th>
        <th>LED</th>
      </tr>
      <tr>
        <th>4</th>
        <th>CSI</th>
        <th>12</th>
        <th> / </th>
        <th>20</th>
        <th> / </th>
        <th>28</th>
        <th>B KEY</th>
        <th>36</th>
        <th>MCU烧录接口</th>
      </tr>
      <tr>
        <th>5</th>
        <th>CPU SE1000</th>
        <th>13</th>
        <th>POWER</th>
        <th>21</th>
        <th> / </th>
        <th>29</th>
        <th>I2S</th>
        <th>37</th>
        <th>M.KEY </th>
      </tr>
      <tr>
        <th>6</th>
        <th>DSI</th>
        <th>14</th>
        <th>DEBUG</th>
        <th>22</th>
        <th> / </th>
        <th>30</th>
        <th>I2C</th>
        <th>38</th>
        <th>SIM Card</th>
      </tr>
      <tr>
        <th>7</th>
        <th>eMMC</th>
        <th>15</th>
        <th>3.5 mm headphone holder</th>
        <th>23</th>
        <th> / </th>
        <th>31</th>
        <th>UART</th>
        <th>39</th>
        <th>SDCard</th>
      </tr>
      <tr>
        <th>8</th>
        <th>Ethernet</th>
        <th>16</th>
        <th>MaskRom 按键</th>
        <th>24</th>
        <th> / </th>
        <th>32</th>
        <th>I2C</th>
      </tr>
    </table>

## 主要特性

### 接口丰富

<img src="/img/sirider/s1/se1000-architecture.webp" alt="sirider s1 architecture" width="700" />

## 参数配置

<table>
  <tr>
    <th>型号</th>
    <th>SiRider S1</th>
  </tr>
  <tr>
    <th>SoC</th>
    <th>siengine SE1000</th>
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
    <th>板载 8GB eMMC</th>
  </tr>
  <tr>
    <th>硬件编解码</th>
    <th>H.265/H.264/VP9/AV1/AVS2 视频解码器，最高 8K@60fps<br/>H.264/H.265 视频解码器，最高 8K@30fps</th>
  </tr>
  <tr>
    <th>显示</th>
    <th>可通过两个 HDMI、一个 DP（ 通过 USB-C 口）和一个 MIPI DSI 或者 eDP 屏 提供 4 路显示输出</th>
  </tr>
  <tr>
    <th>以太网</th>
    <th>2 个 2.5 G 以太网端口，任意一个支持 PoE 以太网供电（需要额外的 PoE 模块）</th>
  </tr>
  <tr>
    <th>USB</th>
    <th>USB Type-C：一个 USB 3.0 OTG Type-C 端口，支持 DP 显示，最大分辨率可达 4Kp60。不支持从 USB C 输入电源。<br/> 后 IO USB： 后 IO 提供 2 个 USB 2.0 HOST 端口（与 RJ5 共用连接器），这四个端口的总输出功率为 1A；后 IO 提供 2 个双 USB 3.0 HOST 端口（与 HDMI 共用连接器），每个双 USB 3.0 端口的总输出功率为 1.75A。<br/>前面板 USB： F_USB 连接器提供 2 个 USB 2.0 HOST 端口，这两个端口的总输出功率为 1A。</th>
  </tr>
  <tr>
    <th>FAN</th>
    <th>提供 4 个散热器安装孔，安装孔距 75 毫米，可与英特尔 LGA 151x 型散热器兼容。为带风扇的散热器提供了 ATX 标准风扇座。不支持风扇转速码表。</th>
  </tr>
  <tr>
    <th>屏接口</th>
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
