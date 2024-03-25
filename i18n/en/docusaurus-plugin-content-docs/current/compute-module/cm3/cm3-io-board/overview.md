---
sidebar_position: 10
---

# Overview

The Radxa ROCK 3 Compute Module (CM3) is a System on Module (SoM) based on a the Rockchip RK3566 System on Chip (SoC). The CM3 integrates the Central Process Unit (CPU), Power Management Unit (PMU), DRAM memory, flash storage and wireless connectivity
(WiFi 5 and BT 5.0) in a small form factor of just 55mm x 40mm.
The ROCK CM3 core board uses 3x 100P 0.4mm pitch B2B connector to provide powerful functional support, and can be combined with the customer's backplane to build complete product functions, thereby speeding up the research and development process.

![ROCK CM3](/img/cm3/radxa-cm3-top-bottom.webp)

The ROCK CM3 is available in various LPDDR4 RAM and eMMC size configurations:

- RAM: 1 / 2 / 4 / 8 GB
- eMMC: NA / 8 / 16 / 32 GB

At the same time, we provide [ROCK CM3 IO Board](/accessories/cm3-io-board) compatible with ROCK CM3, you can use it to develop the products you want. For example, HMI, robot, video intercom, smart home, etc.

![ROCK CM3](/img/cm3/cm3-install-io-board.webp)

## Features

### Hardware

The CM3 is based on a Rockchip RK3566 SoC with 64‑bit Quad Core low power cores up to 2.0GHz.
CPU: Quad‑core Arm® Cortex®‑A55 (ARMv8) 64‑bit @ 2.0GHz

- GPU: Arm Mali™‑G52‑2EE, OpenGL® ES1.1/2.0/3.0/3.1/3.2, Vulkan® 1.1, OpenCL™ 2.1
- NPU: 1 TOPs@INT8, support INT8, INT16, FP16, BFP16, support deep learning frameworks such as TensorFlow, Caffe, Tflite, Pytorch, Onnx, Android™ NN, etc
- Memory: 32bit LPDDR4X up to 8GB
- Storage: eMMC 5.1 up to 512GB
- Display: Single display engine, HDMI2.0, eDP 1.3, Dual MIPI‑DSI, combo with single LVDS, 24bit RGB/BT1120 and EBC interface
- Multi‑Media: 4K H.265/H.264/VP9 video decoder and 1080p@60fps H.264/H.265 video encoder
- Video input: 8M Pixel ISP and 1 x 4 lanes or 2 x 2 lanes MIPI CSI‑2 and DVP interface
- Audio interface: I2S0/I2S1 with 8 channels, IS2/I2S3 with 2 channels, SPDIF0, PDM0 with 8 channels, TDM with 8 channels and Voice Activity Detection (VAD)
- High Speed Interface: One USB 3.0 host, two SATA 3.0, one PCIe 2.1, two SerDes (seri‑
  aliser / deserialiser)lanes, dual USB 2.0 host and one USB 2.0 OTG
- Ethernet: 1000M ethernet phy(RTL8211F)
- Security: Arm TrustZone® security extension, Secure Video Path, Secure JTAG to debug, Secure boot, OTP and Crypto (AES/TDES/SM4/SM3/SHA256/SHA512/RSA)

### Interfaces

- 802.11 b/g/n/ac Wireless LAN (Wi‑Fi 5)
- BT 5.0 with BLE
- 8 x I2C
- 4 x SPI
- 8 x UART
- 9 x PWM
- 50 x GPIO
- 2 x ADC
- 1 x Gigabit Ethernet PHY
- 1 x PDM with microphone array support
- 1 x I2S
- 2 x SATA
- 1 x PCIe 2.0, 1 lane host (5Gbps)
- 1 x USB 2.0
- 1 x USB 2.0 OTG
- 1 x USB 3.0 (5Gbps)
- 1 x SDIO 3.0
- 1 x HDMI up to 4K x 2k@60Hz
- 1 x eDP four lanes (2.7 Gbps per lane)
- 2 x MIPI DSI @ 1.6Gbps per lane
- 2 x 2 lane or 1 x 4 lane MIPI CSI camera port
- 1 x LVDS combo four lanes, mux with MIPI DSIO
- 3 x 100 pins 0.4mm pitch B2B connector

### Software

- Debian Linux support
- Android 11/12 support
