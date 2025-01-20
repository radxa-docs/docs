---
sidebar_position: 1
---

# Introduction

The Radxa Orion O6 is a professional‑grade Mini ITX motherboard designed for AI computing and multimedia applications. Powered by the **Cix P1 SoC** and featuring **up to 64GB LPDDR5 RAM**, it delivers server‑class performance in a compact form factor. With comprehensive I/O options including **quad display outputs, dual 5GbE networking**, and **PCIe Gen4 expansion**, the Orion O6
is ideal for **AI development workstations, edge computing nodes**, and **high‑performance personal computing**.

## Key Features

- **High‑performance Cix P1 SoC**: Manufactured using TSMC 6nm
- **Arm v9 Instruction Set & EDK II UEFI** for software compatibility
- **Mini‑ITX Form Factor**: Fits standard PC enclosures
- **Native Debian/Ubuntu Linux support** for easy deployment
- **Expandable**: PCIe x16 (Gen4 x8), M.2 NVMe, M.2 Wi‑Fi/BT

## Specification

<table>
  <thead>
    <tr>
      <th>Specification</th>
      <th>Details</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Motherboard Type</strong></td>
      <td>ARM‑based Mini‑ITX motherboard</td>
    </tr>
    <tr>
      <td><strong>Dimensions</strong></td>
      <td>170 x 170 x 25mm</td>
    </tr>
    <tr>
      <td><strong>CPU</strong></td>
      <td>
        Cix P1 - CD8180 <br />
        • Quad Big Cortex®‑A720, Quad Medium Cortex®‑A720, Quad Little Cortex®‑A520 <br />
        • 12MB L3 shared across all cores
      </td>
    </tr>
    <tr>
      <td><strong>GPU</strong></td>
      <td>
        Arm® Immortals™ G720 MC10 GPU, supporting: <br />
        • Hardware‑based Ray‑Tracing <br />
        • OpenGL® ES3.2 <br />
        • OpenCL® 3.0 <br />
        • Vulkan® 1.3
      </td>
    </tr>
    <tr>
      <td><strong>NPU</strong></td>
      <td>supporting INT4 / INT8 / INT16 / FP16 / BF16 and TF32 acceleration and computing power is up to 28.8TOPs</td>
    </tr>
    <tr>
      <td><strong>Video Decoding</strong></td>
      <td>AV1 / H.265 / H.264 / VP9 / VP8 / H.263 / MPEG‑4 / MPEG‑2 up to 8K@60fps</td>
    </tr>
    <tr>
      <td><strong>Video Encoding</strong></td>
      <td>H.265 / H.264 / VP9 / VP8 up to 8K@30fps</td>
    </tr>
    <tr>
      <td><strong>RAM</strong></td>
      <td>
        <p><strong>Type:</strong> 128-bit LPDDR5, soldered on board</p>
        <p><strong>Capacity Options:</strong> 8GB、12GB、16GB、24GB、32GB、64GB</p>
        <p><strong>Speed:</strong> 5500MT/s</p>
      </td>
    </tr>
    <tr>
      <td><strong>Storage Interfaces</strong></td>
      <td>1x M.2 M Key: PCIe Gen4 4 ‑ lane for NVMe SSD</td>
    </tr>
    <tr>
      <td><strong>Wireless</strong></td>
      <td>1x M.2 E Key: PCIe Gen4 2 ‑ lane and USB for WiFi/BT modules</td>
    </tr>
    <tr>
      <td><strong>PCIe Slot</strong></td>
      <td>1x PCIe x16 full slot with PCIe Gen4 8‑lane</td>
    </tr>
    <tr>
      <td><strong>Video Outputs</strong></td>
      <td>
        • 1x HDMI up to 4Kp60 <br />
        • 1x DisplayPort (DP) up to 4Kp120 with 2 streams MST <br />
        • 1x USB‑C (DP capable) up to 4Kp60 <br />
        • 1x eDP up to 4Kp60
      </td>
    </tr>
    <tr>
      <td><strong>Ethernet Ports</strong></td>
      <td>2x 1G / 2.5G / 5G Ethernet Ports</td>
    </tr>
    <tr>
      <td><strong>USB Ports</strong></td>
      <td>
        • 2x USB 2.0 Type A (Back Panel)<br />
        • 2x USB 3.2 10Gbps Type A (Back Panel)<br />
        • 2x USB 2.0 (Front Panel internal connector)<br />
        • 2x USB Type‑C (Back Panel) with USB 3.2 10Gbps and one supports DP display
      </td>
    </tr>
    <tr>
      <td><strong>Audio</strong></td>
      <td>
        • 1x Headphone Jack with Microphone Input (Back Panel) <br />
        • 1x Front Panel Audio Connector for front panel 3.5mm audio jack
      </td>
    </tr>
    <tr>
      <td><strong>Power Input</strong></td>
      <td>
        • ATX 24P Power Connector <br />
        • USB C PD power supply (20V/3.25A or higher)<br />
        • Dummy USB C power input (20V)
      </td>
    </tr>
    <tr>
      <td><strong>Recommended Power</strong></td>
      <td>At least 65W</td>
    </tr>
    <tr>
      <td><strong>Operating Temperature</strong></td>
      <td>0°C to 40°C</td>
    </tr>
    <tr>
      <td><strong>Cooling</strong></td>
      <td>
        • 4x Heatsink Mounting Holes (75mm x 75mm)<br />
        • 1x 4P Fan with PWM Control and TACH
      </td>
    </tr>
    <tr>
      <td><strong>RTC Real-Time Clock</strong></td>
      <td>RTC Battery Holder (Supports CR1220 Battery)</td>
    </tr>
    <tr>
      <td><strong>Supported Operating System</strong></td>
      <td>Debian / Ubuntu Linux</td>
    </tr>
  </tbody>
</table>

## Interface Description

# Board Layout

The detailed <span id="o6-layout">layout of the O6 motherboard</span>, with numbered labels, is as follows:

![Orion O6 Motherboard layout and component labels](/img/o6/rs600_layout.webp)

| No. | Description                                                              | No. | Description                                                                | No. | Description                                                               |
| --- | ------------------------------------------------------------------------ | --- | -------------------------------------------------------------------------- | --- | ------------------------------------------------------------------------- |
| ①   | [PCIe X16 slot](../hardware-design/hardware-interface.md#circle-1)       | ⑩   | [Double USB 3.2](../hardware-design/hardware-interface.md#circle-10)       | ⑲   | [ATX Power Connector](../hardware-design/hardware-interface.md#circle-19) |
| ②   | [M.2 M Key](../hardware-design/hardware-interface.md#circle-2)           | ⑪   | [Double USB 2.0](../hardware-design/hardware-interface.md#circle-11)       | ⑳   | [F_USB Connector](../hardware-design/hardware-interface.md#circle-20)     |
| ③   | [M.2 E Key](../hardware-design/hardware-interface.md#circle-3)           | ⑫   | [USB-C Ports](../hardware-design/hardware-interface.md#circle-12)          | ㉑  | [F_Audio Connector](../hardware-design/hardware-interface.md#circle-21)   |
| ④   | [On board Status LED](../hardware-design/hardware-interface.md#circle-4) | ⑬   | [Power Button](../hardware-design/hardware-interface.md#circle-13)         | ㉒  | [TP Connector](../hardware-design/hardware-interface.md#circle-22)        |
| ⑤   | [Reset Button](../hardware-design/hardware-interface.md#circle-5)        | ⑭   | [FAN Connector](../hardware-design/hardware-interface.md#circle-14)        | ㉓  | [F_Panel Connector](../hardware-design/hardware-interface.md#circle-23)   |
| ⑥   | [Headphone Jack](../hardware-design/hardware-interface.md#circle-6)      | ⑮   | [BIOS Flash Holder](../hardware-design/hardware-interface.md#circle-15)    | ㉔  | [Debug Connector](../hardware-design/hardware-interface.md#circle-24)     |
| ⑦   | [RJ45 Ethernets](../hardware-design/hardware-interface.md#circle-7)      | ⑯   | [40Pin GPIO Connector](../hardware-design/hardware-interface.md#circle-16) | ㉕  | [eDP Connector](../hardware-design/hardware-interface.md#circle-25)       |
| ⑧   | [DP Port](../hardware-design/hardware-interface.md#circle-8)             | ⑰   | [CPU Cix CD8180](../hardware-design/hardware-interface.md#circle-17)       | ㉖  | [RTC Battery Holder](../hardware-design/hardware-interface.md#circle-26)  |
| ⑨   | [HDMI Port](../hardware-design/hardware-interface.md#circle-9)           | ⑱   | [LPDDR5 RAM](../hardware-design/hardware-interface.md#circle-18)           |     |                                                                           |
