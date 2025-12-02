---
sidebar_position: 1
---

# 瑞莎 CM3J

# 产品介绍

Radxa CM3J 是基于 Rockchip RK3568J 片上系统 (SoC) 的一款功能丰富的工业级计算模块。CM3J 集成了中央处理器 (CPU)、电源管理单元 (PMU)、DRAM 存储器、eMMC 存储器和无线连接（WiFi 5 和 BT 5.0），外形小巧，仅为 55 毫米 x 40 毫米。CM3J 为许多不同的工业应用提供了高性价比的解决方案。

## 主要特性

### 强大的多媒体处理能力

CPU 采用了先进的 ARM Cortex-A55 架构，集成了强大的图像处理单元（GPU），支持高清视频解码和编码，能够处理多种视频格式和分辨率。此外，RK3568J还配备了高性能的 DSP 和 NPU（神经网络处理单元），用于音频处理和人工智能应用，使其在多媒体处理方面表现出色。

### 潜在的开发潜力

作为一款强大的开发平台 Radxa CM3J 对于人工智能、边缘计算、嵌入式系统等领域具有较大的潜力。

### 兼容性

Radxa CM3J 在兼容 [Raspberry Pi CM4 IO Board](https://www.raspberrypi.com/products/compute-module-4-io-board/) 的同时也兼容 [WaveShare CM4-POE-UPS-BASE](https://www.waveshare.net/shop/CM4-POE-UPS-BASE.htm)，[WaveShare CM4-IO-BASE-B](https://www.waveshare.net/shop/CM4-IO-BASE-B.htm)，[WaveShare CM4-NANO-B](https://www.waveshare.net/shop/CM4-NANO-B.htm)

## 主板预览

<img src="/img/cm3j/cm3j-package.webp" alt="Radxa CM3J 核心板" style={{ width: "60%" }} />

## 芯片框图

<img src="/img/rock3/3b/rk3568-block-diagram.webp" alt="rk3568 chip block diagram" style={{ width: "80%" }} />

## 系统框图

<img src="/img/cm3j/radxa-cm3j-System-block-diagram.webp" alt="cm3j board block diagram" style={{ width: "80%" }} />

## 参数配置

<table>
    <tr>
        <td align="center">型号</td>
        <td align="center">CM3J 核心板</td>
    </tr>
    <tr>
        <td align="center">CPU</td>
        <td align="center">Rockchip RK3568J, Quad core Cortex-A55 (ARM v8) 64-bit SoC @ **2.0GHz**</td>
    </tr>
    <tr>
        <td align="center">GPU</td>
        <td align="center">ARM G52-2EE GPU<br/>OpenGL® ES1.1/2.0/3.0/3.1/3.2<br/>OpenCL® 2.1<br/>Vulkan® 1.1</td>
    </tr>
    <tr>
        <td align="center">NPU</td>
        <td align="center">NPU 支持 INT8/INT16/FP16/BFP16，计算能力高达 1TOPs@INT8</td>
    </tr>
    <tr>
        <td align="center">内存</td>
        <td align="center">2GB 或 4GB LPDDR4X（视机型而定）</td>
    </tr>
    <tr>
        <td align="center">存储</td>
        <td align="center">可选 4GB/8GB/16GB/32GB，板载 eMMC 与 eMMC 5.1 兼容<br/>1x SPI Flash<br/>1x SDMMC0</td>
    </tr>
    <tr>
        <td align="center">显示</td>
        <td align="center">1x HDMI TX up to 4096X2160@60Hz<br/>1x 2‑lane MIPI DSI for MIPI LCD 和 1x 4‑lane MIPI DSI for MIPI LCD<br/>1x LVDS four lanes(与 MIPI DSI0 复用)</td>
    </tr>
    <tr>
        <td align="center">硬件编解码</td>
        <td align="center">VP9/H.265/H.264 decode 4K@60fps<br/>H.264/H.265 encoder 1080pK@60fps</td>
    </tr>
    <tr>
        <td align="center">摄像头接口</td>
        <td align="center">1x 4-lane MIPI CSI RX 和 2x 2-lane MIPI CSI RX</td>
    </tr>
    <tr>
        <td align="center">音频接口</td>
        <td align="center">I2S<br/>PDM，支持麦克风阵列<br/>SPDIF_TX</td>
    </tr>
    <tr>
        <td align="center">输入功率</td>
        <td align="center">5V DC</td>
    </tr>
    <tr>
        <td align="center">运行温度</td>
        <td align="center">RK3568J: -40° to 85° 摄氏度</td>
    </tr>
    <tr>
        <td align="center">安全性</td>
        <td align="center">OTP<br/>安全启动<br/>Arm TrustZone® 安全扩展<br/>安全视频路径、安全 JTAG 调试<br/>加密 (AES/TDES/SM4/SM3/SHA256/SHA512/RSA)</td>
    </tr>
    <tr>
        <td align="center">以太网</td>
        <td align="center">1000M 以太网物理层（RTL8211FSI-VS）</td>
    </tr>
        <tr>
        <td align="center">无线网络</td>
        <td align="center">IEEE 802.11 b/g/n/ac 无线局域网（Wi-Fi 5），带外置天线连接器<br/>带 BLE 的 BT 5.0</td>
    </tr>
    <tr>
        <td align="center">尺寸</td>
        <td align="center">50 mm × 40 mm </td>
    </tr>
</table>
