---
sidebar_position: 1
description: "Introduces SiRider S1"
---

# Introduction

SiRider S1 is an industrial single-board computer jointly launched by Radxa, Siengine Technology and Arm China. It integrates Siengine Technology's industrial-grade "StarEagle No.1" 7nm AIoT application processor SE1000-I, Arm China's self-developed "Zhouyi" NPU, and Radxa's industrial product design experience to provide the market with high-performance and reliable industrial-grade products that can meet the diverse application requirements in the future.

## Motherboard OverView

<img src="/img/sirider/s1/sirider-s1-overview.webp" alt="sirider s1 Overview" width="700" />

<table>
      <tr>
        <th>Number</th>
        <th>Interface name</th>
        <th>Number</th>
        <th>Interface name</th>
        <th>Number</th>
        <th>Interface name</th>
        <th>Number</th>
        <th>Interface name</th>
        <th>Number</th>
        <th>Interface name</th>
      </tr>
      <tr>
        <th>1</th>
        <th>Power Button</th>
        <th>9</th>
        <th>Ethernet</th>
        <th>17</th>
        <th>Power Input</th>
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
        <th>MCU Programming Interface</th>
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
        <th>FastBoot Button</th>
        <th>24</th>
        <th> FAN </th>
        <th>32</th>
        <th>I2C</th>
      </tr>
    </table>

### Chip Architecture

<img src="/img/sirider/s1/se1000-architecture.webp" alt="sirider s1 architecture" width="700" />

## Specifications

<table>
  <tr>
    <th>Model</th>
    <th>SiRider S1</th>
  </tr>
  <tr>
    <th>SoC</th>
    <th>siengine SE1000</th>
  </tr>
  <tr>
    <th>CPU</th>
    <th> Contains two clusters <br/> Cluster0: <br/>A76 x4, Maximum Frequency: 2.4G, <br/> A55 x2, Maximum Frequency: 1.8G; <br/>Cluster1: <br/> A55 x2，Maximum Frequency: 1.8G; </th>
  </tr>
  <tr>
    <th>GPU</th>
    <th>Contains 3D GPU0, 3D GPU1, and a 2D/2.5D graphics core, supporting OpenGL ES1.1/2.0/3.2, Vulkan 1.0, and OpenCL 2.0.</th>
  </tr>
  <tr>
    <th>NPU</th>
    <th>Contains tow NPU Core，NPU0: 3.34TOPS, NPU1: 3.5 TOPS</th>
  </tr>
  <tr>
    <th>Memory</th>
    <th>Support LPDDR4/LPDDR4X/LPDDR5, maximum capacity is 16G</th>
  </tr>
  <tr>
    <th>Storage</th>
    <th>Support EMMC and UFS, the maximum capacity of UFS tested is 128G</th>
  </tr>
  <tr>
    <th>Hardware Codec</th>
    <th>Supports 4K 120fps decoding and 4K 60fps encoding</th>
  </tr>
  <tr>
    <th>Display</th>
    <th>HDMI x1</th>
  </tr>
  <tr>
    <th>Ethernet</th>
    <th>1000M x2</th>
  </tr>
  <tr>
    <th>USB</th>
    <th>USB2.0 x4, USB3.0 x4</th>
  </tr>
  <tr>
    <th>FAN</th>
    <th>Provides 4 heat sink mounting holes with a hole spacing of 60mm.</th>
  </tr>
  <tr>
    <th>Display</th>
    <th> MIPI DSI</th>
  </tr>
  <tr>
    <th>Camera</th>
    <th>2 lan MIPI CSI  x2 </th>
  </tr>
  <tr>
    <th>Power</th>
    <th>A Type-C power port supporting 8 ~ 12V input & <br/>An 8~12V 2P DC IN port </th>
  </tr>
  <tr>
    <th>Size</th>
    <th>100mm x 150mm</th>
  </tr>
</table>
