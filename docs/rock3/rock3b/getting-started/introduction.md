---
sidebar_position: 1
---

# 产品介绍

## 主要特性

Radxa ROCK 3B 是基于 Pico-ITX 外形尺寸（100 毫米 x 75 毫米）的单板计算机 (SBC)，不仅在性能上优于同类产品，还因其出色的机械兼容性而广受赞誉。ROCK 3B 系列不仅包括社区版，还包括专为工业应用定制的工业版。工业版 ROCK 3B 具有丰富的接口选项和对宽温度范围的专门支持，为工业领域的制造商和客户提供了一个可靠而强大的平台。在这里，创意的火花可以点燃，概念可以转化为创新，众多的想法可以实现，提供了令人振奋的可能性。

### 接口丰富

ROCK 3B 提供了丰富的接口，包括多个 USB 、HDMI 等接口，便于连接外部设备和扩展功能。详见[参数配置](#参数配置)。

### 配件生态丰富

ROCK 3B 支持多款摄像头和显示屏。

### 强大的多媒体处理能力

CPU 采用四核 A55 (ARM v8) 的架构，主频高达 2 GHz，具有强大的计算能力和多任务处理能力。GPU部分则集成了 Mali G52，支持 OpenGL ES 1.1/2.0/3.2、OpenCL 2.0 和 Vulkan 1.1 等多种图形接口，可提供高效流畅的图形处理体验。

### 丰富的操作系统支持

支持多种操作系统，包括 Radxa 官方的发行的 Debian 系统和 Android 系统，另外还有一些第三方操作系统，适用于各类应用场景。

### 潜在的开发潜力

作为一款强大的开发平台 ROCK 3B 对于人工智能、边缘计算、嵌入式系统等领域具有较大的潜力。

### 开源支持

ROCK 3B 提供了完整的硬件设计原理图和软件源代码，这一特性使得大多 DIY 设计爱好者和开发者进行个性化修改和功能拓展，吸引了一众开源爱好者活跃在社区，有利于促进知识共享和技术创新。

## 主板预览

<img src="/img/rock3/3b/rock3b-interfaces.webp" width="800" alt="rock3b real" />

## 参数配置

<table>
  <tr>
    <th>型号</th>
    <th>ROCK 3B</th>
  </tr>
  <tr>
    <th>CPU</th>
    <th>基于 Arm® DynamIQ™ 配置的四路 Cortex®-A55 @ 2 GHz</th>
  </tr>
  <tr>
    <th>GPU</th>
    <th>Mali G52 GPU supporting:<br/>OpenGL ES 1.1/2.0/3.2<br/> OpenCL 2.0 <br/> Vulkan 1.1</th>
  </tr>
  <tr>
    <th>内存</th>
    <th>64 位 LPDDR4 RAM 可选：<br/>2/4/8 GB</th>
  </tr>
  <tr>
    <th>存储</th>
    <th> 具有专为 eMMC 模块设计的高速 eMMC 插槽，可用作操作系统和数据存储解决方案。此 eMMC 插槽与广泛采用的工业引脚排列和外形尺寸标准完全兼容。</th>
  </tr>
  <tr>
    <th>硬件编解码</th>
    <th>H.265/VP9 (HEVC) 硬件解码（最高 4Kp60）<br/>H.264 硬件解码（最高 1080p60）</th>
  </tr>
  <tr>
    <th>显示</th>
    <th>通过 HDMI、2x MIPI DSI 或 eDP 实现三重显示</th>
  </tr>
  <tr>
    <th>以太网</th>
    <th>2 个千兆以太网端口（其中一个支持 PoE，带有附加 PoE HAT）</th>
  </tr>
  <tr>
    <th>USB</th>
    <th>2 个 USB2 HOST 端口<br/>1 个 USB3 HOST 端口<br/>1 个 USB3 OTG 口</th>
  </tr>
  <tr>
    <th>FAN</th>
    <th>有一个 2 针 1.25mm 接头，可让用户连接 5V 风扇（或其他外设）<br/>风扇可由 PWM 控制，无速度反馈。</th>
  </tr>
  <tr>
    <th>摄像头接口</th>
    <th>配备多功能 2 通道 MIPI CSI 摄像头端口，可与各种广泛使用的工业摄像头外设兼容。<br/>这不仅保证了灵活性和易于集成，还为用户提供了多种摄像头选项，以满足特定需求。</th>
  </tr>
  <tr>
    <th>M.2 连接器</th>
    <th>配备 M.2 M Key 2280 SSD 插槽和 PCIe 3.0 x2 通道接口<br/>拥有 M.2 E Key 插槽，提供多种接口，包括 SDIO、UART、PCIe 2.0、SATA 和 USB。此配置极大地促进了高速 WiFi 和蓝牙连接，包括对最新 WiFi 6 标准的支持。该插槽与 SDIO 类型的标准 M.2 无线模块完全兼容，确保轻松集成并增强无线功能。<br/>通过其 M.2 B Key 插槽提供 USB 接口。与 SIM 卡结合使用时（ROCK 3B 具有 SIM 插槽），可实现高速 4G 手机连接，并确保与标准 M.2 3042 B Key 模块兼容。</th>
  </tr>
  <tr>
    <th>音频接口</th>
    <th>通过 4 环 3.5 毫米耳机插孔提供出色的模拟音频功能，提供接近 CD 质量的输出。此模拟音频输出足够强大，可直接为 32 欧姆耳机供电，确保强劲而身临其境的音频体验。</th>
  </tr>
  <tr>
    <th>40-PIN Header</th>
    <th>1 x ADC<br/>2 x CAN<br/>27 x GPIO<br/>3 x I2C<br/>7 x PWM<br/>1 x SPI<br/>6 x UART<br/></th>
  </tr>
  <tr>
    <th>尺寸</th>
    <th>100 mm x 75 mm </th>
  </tr>
</table>
