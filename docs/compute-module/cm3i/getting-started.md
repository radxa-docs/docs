---
sidebar_position: 1
---

# 概览

Radxa CM3I 计算模块是基于 Rockchip RK3568(J) SoC 的系统模块 (SoM)。 CM3I 集成了中央处理器 (CPU)、电源管理单元 (PMU)、DRAM 内存、闪存和无线连接（WiFi 5 和 BT 5.0），外形小巧，其尺寸只有 70mm x 40mm , 接口丰富。

Radxa CM3I 使用 3x 100P 0.4mm 间距 B2B 连接器，提供强大的功能支持，可与自定义的底板结合，构建完整的产品功能，从而加快研发进程。

![Radxa CM3I](/img/cm3i/cm3i-overview.webp)

Radxa CM3I 提供各种 LPDDR4 RAM 和 eMMC 配置：

- RAM: 1 / 2 / 4 / 8 GB
- eMMC: 0 / 8 / 16 / 32 / 64 GB （0: 表示eMMC空贴）

:::tip
如果需要定制 CM3I 配置,可发邮件咨询 support@radxa.com。
:::

同时，Radxa 提供了与 CM3I 搭配的 [ CM3I 接口板](/compute-module/cm3i/accessories-guides/cm3i-io-board)，使用它可以快速开发出想要的产品，例如 HMI、机器人、可视对讲机、智能家居等。

![Radxa CM3I-IO](/img/cm3i/cm3i-io-overview.webp)

## 特点

### 硬件

- CPU：四核 Arm® Cortex®‑A55 (ARMv8) 64 位 @ 2.0GHz
- GPU：Arm Mali™‑G52‑2EE、OpenGL® ES1.1/2.0/3.0/3.1/3.2、Vulkan® 1.1、OpenCL™ 2.1
- NPU：1个TOPs@INT8，支持INT8、INT16、FP16、BFP16，支持TensorFlow、Caffe、Tflite、Pytorch、Onnx、Android™ NN等深度学习框架
- 内存：1GB, 2GB, 4GB or 8GB LPDDR4
- 存储：
  - eMMC5.1 8GB / 16GB / 32GB / 64GB, eMMC 最大可达 256GB
  - SPI Flash
- 显示：
  - 1x HDMI TX 最大支持 4096X2160@60Hz
  - 1x eDP 4 lanes, 2.7Gps/lane
  - 2x MIPI DSI 4 lanes, 1.6Gbps/lane
  - 1x LVDS 4 lanes(与MIPI DSI0复用)
- 多媒体：
  - 4K H.265/H.264/VP9 视频解码器
  - 1080p@60fps H.264/H.265 视频编码器
- 视频输入：
  - 1x 4‑lane MIPI CSI RX or 2x 2‑lane MIPI CSI RX
  - 1x 4‑lane MIPI_D/C PHY RX
- 音频接口：
  - I2S
  - SPDIF_TX
  - PDM, 支持麦克风阵列
- 高速接口：
  - 1x USB 3.0 HOST、1x USB 3.0 OTG、2x USB 2.0 HOST
  - 3x SATA (一个与 USB 3.0 HOST 共用，一个与 PCIe 共用，一个与 USB 3 OTG 共用)
  - 1x PCIe 3.0 2-lane
  - 1x PCIe 2.0 1-lane
- 低速接口:
  - 8x UART
  - 4x SPI
  - 2x CAN
  - 4x I2C
- 以太网：1000M 以太网 (RTL8211FS)
- 供电: 5V DC
- 安全性：
  - Arm TrustZone® 安全扩展
  - 安全视频路径、安全 JTAG 调试
  - 安全启动
  - OTP
  - 加密 (AES/TDES/SM4/SM3/SHA256/SHA512/RSA)
- 工作温度:
  - J0 model(RK3568): 0°C to 60°C
  - J1 model(RK3568J): ‑40°C to 85°C

### 软件

- Debian / Ubuntu
- Android 11/12

## 系统安装

[Debian系统安装](/compute-module/cm3i/install-debian-system)
