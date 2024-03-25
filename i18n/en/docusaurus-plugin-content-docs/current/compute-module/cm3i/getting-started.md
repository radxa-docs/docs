---
sidebar_label: "Getting Started"
sidebar_position: 1
---

# Overview

The Radxa CM3I compute module is a system-on-module (SoM) based on the Rockchip RK3568(J) SoC. CM3I integrates a central processing unit (CPU), power management unit (PMU), DRAM memory, flash memory and wireless connectivity (WiFi 5 and BT 5.0). It is compact in size, only 70mm x 40mm, and has rich interfaces.

Radxa CM3I uses 3x 100P 0.4mm pitch B2B connectors to provide strong functional support and can be combined with a custom backplane to build complete product functions, thereby speeding up the development process.

![Radxa CM3I](/img/cm3i/cm3i-overview.webp)

Radxa CM3I is available in various LPDDR4 RAM and eMMC configurations:

- RAM: 1 / 2 / 4 / 8 GB
- eMMC: 0 / 8 / 16 / 32 / 64 GB (0: No onboard eMMC)

:::tip
CM3I supports customized configuration, please contact Radxa (support@radxa.com) if needed.
:::

At the same time, Radxa provides [Radxa CM3I interface board](/compute-module/cm3i/accessories-guides/cm3i-io-board) compatible with Radxa CM3I. It can help to quickly develop the products,
such as HMI, robots, video intercoms, smart home and so on.

![Radxa CM3I-IO](/img/cm3i/cm3i-io-overview.webp)

## Features

### Hardware

- CPU:Quad core Cortex‑A55 (ARM v8) 64‑bit SoC @ 2.0GHz
- GPU:Arm Mali™‑G52‑2EE、OpenGL® ES1.1/2.0/3.0/3.1/3.2、Vulkan® 1.1、OpenCL™ 2.1
- NPU:1个TOPs@INT8,Support INT8 INT16 FP16 BFP16,SupportTensorFlow Caffe Tflite Pytorch Onnx Android™ NN and other deep learning frameworks
- Memory: 1GB, 2GB, 4GB or 8GB LPDDR4
- Storage:
  - eMMC5.1 NA / 8GB / 16GB / 32GB / 64GB, Maximum 256GB
  - SPI Flash
- Display:
  - 1x HDMI TX up to 4096X2160@60Hz
  - 1x eDP 4 lanes, 2.7Gps/lane
  - 2x MIPI DSI 4 lanes, 1.6Gbps/lane
  - 1x LVDS 4 lanes(muxed with MIPI DSI0)
- Media:
  - 4K H.265/H.264/VP9 decoder
  - 1080p@60fps H.264/H.265 encoder
- Video Input:
  - 1x 4‑lane MIPI CSI RX or 2x 2‑lane MIPI CSI RX
  - 1x 4‑lane MIPI_D/C PHY RX
- Audio:
  - I2S
  - SPDIF_TX
  - PDM, support mic array
- High Speed Interface:
  - 1x USB 3.0 HOST、1x USB 3.0 OTG、2x USB 2.0 HOST
  - 3x SATA (1 shared with USB 3.0 HOST, 1 shared with PCIe, and one USB 3 OTG)
  - 1x PCIe 3.0 2 lanes
  - 1x PCIe 2.0 1 lane
- Low Speed Interface:
  - 8x UART
  - 4x SPI
  - 2x CAN
  - 4x I2C
- Ethernet: 1000M (RTL8211FS)
- Powered : 5V DC
- Security:
  - Arm TrustZone® security extensions
  - secure video path
  - secure JTAG debugging
  - secure boot
  - OTP
  - encryption (AES/TDES/SM4/SM3/SHA256/SHA512/RSA)
- Operating Temperature:
  - J0 model(RK3568): 0°C to 60°C
  - J1 model(RK3568J): ‑40°C to 85°C

### Software

- Debian / Ubuntu
- Android 11/12

### Install System

[Install Debian System](/compute-module/cm3i/install-debian-system)
