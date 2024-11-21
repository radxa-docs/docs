---
sidebar_position: 1
description: "简单介绍 SiRider S1"
---

# 产品介绍

SiRider S1 是 Radxa 与芯擎科技及安谋科技联合推出工业单板计算机，融合芯擎科技的工业级 “龍鹰一号” 7nm AIoT应用处理器SE1000-I，安谋科技自研“周易”NPU，以及Radxa的工业级产品设计经验，为市场提供高性能、高可靠的工业级产品，应对未来多元化的应用场景需求。

## 主板预览

<img src="/img/sirider/s1/sirider-s1-overview.webp" alt="sirider s1 Overview" width="700" />

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
        <th> CAN </th>
        <th>26</th>
        <th> PMIC I2C</th>
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
        <th>USB 2.0 </th>
        <th>20</th>
        <th> RS485/RS232 </th>
        <th>28</th>
        <th>B KEY</th>
        <th>36</th>
        <th>MCU烧录口</th>
      </tr>
      <tr>
        <th>5</th>
        <th>CPU SE1000</th>
        <th>13</th>
        <th>POWER</th>
        <th>21</th>
        <th> DIO OUT </th>
        <th>29</th>
        <th>I2S</th>
        <th>37</th>
        <th>M.2 M KEY </th>
      </tr>
      <tr>
        <th>6</th>
        <th>DSI</th>
        <th>14</th>
        <th>DEBUG</th>
        <th>22</th>
        <th>DIO IN</th>
        <th>30</th>
        <th>I2C</th>
        <th>38</th>
        <th>SIM Card</th>
      </tr>
      <tr>
        <th>7</th>
        <th>UFS</th>
        <th>15</th>
        <th>3.5 mm headphone holder</th>
        <th>23</th>
        <th> DIO IN </th>
        <th>31</th>
        <th>UART</th>
        <th>39</th>
        <th>SDCard</th>
      </tr>
      <tr>
        <th>8</th>
        <th>Ethernet</th>
        <th>16</th>
        <th>FastBoot 按键</th>
        <th>24</th>
        <th> FAN </th>
        <th>32</th>
        <th>I2C</th>
      </tr>
    </table>

### 芯片架构

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
    <th> 分两个Custer，Cluster0: 4个A76，最大频率2.4G,2个A55，最大频率1.8G；Cluster1： 2个 A55，最大1.8G</th>
  </tr>
  <tr>
    <th>GPU</th>
    <th>包含3D GPU0，3D GPU1 和 2D/2.5D 图形核心，支持OpenGL ES1.1/2.0/3.2, Vulkan 1.0和 OpenCL2.0</th>
  </tr>
  <tr>
    <th>NPU</th>
    <th>两个NPU核，NPU0: 3.34TOPS， NPU1: 3.5 TOPS</th>
  </tr>
  <tr>
    <th>内存</th>
    <th>支持 LPDDR4/LPDDR4X/LPDDR5, 最大容量16G</th>
  </tr>
  <tr>
    <th>存储</th>
    <th>支持UFS 3.0，目前测试过的UFS最大为128G</th>
  </tr>
  <tr>
    <th>硬件编解码</th>
    <th>丰富的多媒体接口,支持 4k 120fps解码，4K 60fps编码</th>
  </tr>
  <tr>
    <th>显示</th>
    <th>HDMI x1</th>
  </tr>
  <tr>
    <th>以太网</th>
    <th>2 个 1000M 以太网端口</th>
  </tr>
  <tr>
    <th>USB</th>
    <th>USB2.0 x4, USB3.0 x4</th>
  </tr>
  <tr>
    <th>FAN</th>
    <th>提供 4 个散热器安装孔，安装孔距 60 毫米</th>
  </tr>
  <tr>
    <th>屏接口</th>
    <th> MIPI DSI</th>
  </tr>
  <tr>
    <th>摄像头</th>
    <th>2 lan MIPI CSI  x2 </th>
  </tr>

  <tr>
    <th>供电</th>
    <th>一个支持 8 ~ 12V 输入的Type-C 供电口 <br/>一个 8 ~ 12V 2P DC IN </th>
  </tr>
  <tr>
    <th>尺寸</th>
    <th>100mm x 150mm</th>
  </tr>
</table>
