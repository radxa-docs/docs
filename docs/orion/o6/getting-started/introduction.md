---
sidebar_position: 1
---

# 产品介绍

瑞莎星睿 O6 (Radxa Orion O6) 是一款面向 AI 计算和多媒体应用的专业级 Mini-ITX 主板。它搭载 **Cix P1 SoC**(型号 CD8180)，支持 **最高 64GB LPDDR5 内存**，在紧凑的尺寸下提供服务器级性能。Orion O6 具备丰富的 I/O 接口，包括 **四路显示输出、双 5GbE 网络** 和 **PCIe Gen4 扩展**，非常适合 **AI 开发工作站、边缘计算节点** 以及 **高性能个人计算** 应用。

## 主要特性

- **高性能 Cix P1 SoC**：采用 TSMC 6nm 工艺制造
- **Arm v9 指令集 & EDK II UEFI**，提供广泛的软件兼容性
- **Mini-ITX 规格**：兼容标准 PC 机箱
- **原生支持 Debian/Ubuntu Linux**，便于部署
- **可扩展性强**：支持 PCIe x16（Gen4 x8）、M.2 NVMe、M.2 Wi-Fi/蓝牙

## 详细规格

<table>
  <thead>
    <tr>
      <th>规格</th>
      <th>详细信息</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>主板类型</strong></td>
      <td>基于 ARM 的 Mini-ITX 主板</td>
    </tr>
    <tr>
      <td><strong>尺寸</strong></td>
      <td>170 x 170 x 25mm</td>
    </tr>
    <tr>
      <td><strong>处理器（CPU）</strong></td>
      <td>
        Cix P1 - CD8180 <br />
        • 四核大核 Cortex®-A720、四核中核 Cortex®-A720、四核小核 Cortex®-A520 <br />
        • 12MB L3 共享缓存
      </td>
    </tr>
    <tr>
      <td><strong>图形处理器（GPU）</strong></td>
      <td>
        Arm® Immortals™ G720 MC10 GPU，支持：<br />
        • 硬件光线追踪 <br />
        • OpenGL® ES3.2 <br />
        • OpenCL® 3.0 <br />
        • Vulkan® 1.3
      </td>
    </tr>
    <tr>
      <td><strong>神经处理单元（NPU）</strong></td>
      <td>支持 INT4 / INT8 / INT16 / FP16 / BF16 和 TF32 加速，算力高达 28.8TOPs</td>
    </tr>
    <tr>
      <td><strong>视频解码</strong></td>
      <td>支持 AV1 / H.265 / H.264 / VP9 / VP8 / H.263 / MPEG-4 / MPEG-2，最高 8K@60fps</td>
    </tr>
    <tr>
      <td><strong>视频编码</strong></td>
      <td>支持 H.265 / H.264 / VP9 / VP8，最高 8K@30fps</td>
    </tr>
    <tr>
      <td><strong>内存</strong></td>
      <td>
        <p><strong>类型：</strong> 128-bit LPDDR5，板载焊接</p>
        <p><strong>容量选项：</strong> 8GB、12GB、16GB、24GB、32GB、64GB</p>
        <p><strong>速度：</strong> 5500MT/s</p>
      </td>
    </tr>
    <tr>
      <td><strong>存储接口</strong></td>
      <td>1x M.2 M Key 插槽，支持 PCIe Gen4 4 通道 NVMe SSD</td>
    </tr>
    <tr>
      <td><strong>无线连接</strong></td>
      <td>1x M.2 E Key 插槽，支持 PCIe Gen4 2 通道和 USB，可用于 WiFi/蓝牙模块</td>
    </tr>
    <tr>
      <td><strong>PCIe 插槽</strong></td>
      <td>1x PCIe x16 全尺寸插槽，支持 PCIe Gen4 8 通道</td>
    </tr>
    <tr>
      <td><strong>视频输出</strong></td>
      <td>
        • 1x HDMI，最高 4Kp60 <br />
        • 1x DisplayPort（DP），最高 4Kp120，支持 2 路 MST <br />
        • 1x USB-C（支持 DP），最高 4Kp60 <br />
        • 1x eDP，最高 4Kp60
      </td>
    </tr>
    <tr>
      <td><strong>以太网接口</strong></td>
      <td>2x 1G / 2.5G / 5G 以太网端口</td>
    </tr>
    <tr>
      <td><strong>USB 接口</strong></td>
      <td>
        • 2x USB 2.0 Type-A（后置）<br />
        • 2x USB 3.2 10Gbps Type-A（后置）<br />
        • 2x USB 2.0（前置内部接口）<br />
        • 2x USB Type-C（后置），支持 USB 3.2 10Gbps，其中一个支持 DP 视频输出
      </td>
    </tr>
    <tr>
      <td><strong>电源输入</strong></td>
      <td>
        • ATX 24P 电源接口 <br />
        • USB-C PD 电源输入（20V/3.25A 或更高）<br />
        • 20V USB-C 适配器直出
      </td>
    </tr>
    <tr>
      <td><strong>推荐电源</strong></td>
      <td>至少 65W</td>
    </tr>
    <tr>
      <td><strong>工作温度</strong></td>
      <td>0°C 至 40°C</td>
    </tr>
    <tr>
      <td><strong>散热</strong></td>
      <td>
        • 4x 散热器安装孔（75mm x 75mm）<br />
        • 1x 4P 风扇接口，支持 PWM 调速与 TACH 反馈
      </td>
    </tr>
    <tr>
      <td><strong>RTC 实时时钟</strong></td>
      <td>RTC 电池座（支持 CR1220 电池）</td>
    </tr>
    <tr>
      <td><strong>支持的操作系统</strong></td>
      <td>Debian / Ubuntu Linux</td>
    </tr>
  </tbody>
</table>

## 接口说明

# 主板布局

详细的 O6 <span id="o6-layout">主板布局</span>，带有编号标签如下：

![Orion O6 主板布局及组件标签](/img/o6/rs600_layout.webp)

| 编号 | 描述                                                               | 编号 | 描述                                                                    | 编号 | 描述                                                                       |
| ---- | ------------------------------------------------------------------ | ---- | ----------------------------------------------------------------------- | ---- | -------------------------------------------------------------------------- |
| ①    | [PCIe X16 插槽](../hardware-design/hardware-interface.md#circle-1) | ⑩    | [双 USB 3.2](../hardware-design/hardware-interface.md#circle-10)        | ⑲    | [ATX 电源连接器](../hardware-design/hardware-interface.md#circle-19)       |
| ②    | [M.2 M 键](../hardware-design/hardware-interface.md#circle-2)      | ⑪    | [双 USB 2.0](../hardware-design/hardware-interface.md#circle-11)        | ⑳    | [F_USB 连接器](../hardware-design/hardware-interface.md#circle-20)         |
| ③    | [M.2 E 键](../hardware-design/hardware-interface.md#circle-3)      | ⑫    | [USB-C 端口](../hardware-design/hardware-interface.md#circle-12)        | ㉑   | [F_Audio 连接器](../hardware-design/hardware-interface.md#circle-21)       |
| ④    | [板载状态 LED](../hardware-design/hardware-interface.md#circle-4)  | ⑬    | [电源按钮](../hardware-design/hardware-interface.md#circle-13)          | ㉒   | [TP 连接器](../hardware-design/hardware-interface.md#circle-22)            |
| ⑤    | [复位按钮](../hardware-design/hardware-interface.md#circle-5)      | ⑭    | [风扇连接器](../hardware-design/hardware-interface.md#circle-14)        | ㉓   | [F_Panel 前面板连接器](../hardware-design/hardware-interface.md#circle-23) |
| ⑥    | [耳机插孔](../hardware-design/hardware-interface.md#circle-6)      | ⑮    | [BIOS 闪存座](../hardware-design/hardware-interface.md#circle-15)       | ㉔   | [调试连接器](../hardware-design/hardware-interface.md#circle-24)           |
| ⑦    | [RJ45 以太网](../hardware-design/hardware-interface.md#circle-7)   | ⑯    | [40 针 GPIO 连接器](../hardware-design/hardware-interface.md#circle-16) | ㉕   | [eDP 连接器](../hardware-design/hardware-interface.md#circle-25)           |
| ⑧    | [DP 端口](../hardware-design/hardware-interface.md#circle-8)       | ⑰    | [CPU Cix CD8180](../hardware-design/hardware-interface.md#circle-17)    | ㉖   | [RTC 电池座](../hardware-design/hardware-interface.md#circle-26)           |
| ⑨    | [HDMI 端口](../hardware-design/hardware-interface.md#circle-9)     | ⑱    | [LPDDR5 内存](../hardware-design/hardware-interface.md#circle-18)       |      |                                                                            |
