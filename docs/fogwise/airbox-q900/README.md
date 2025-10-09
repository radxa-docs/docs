---
sidebar_position: 20
---

# Fogwise® AIRbox Q900

## 产品介绍

Fogwise® AIRbox Q900 是一款嵌入式人工智能微型服务器，支持高达 200TOPS@INT8 稀疏算力，支持多种精度（INT8、FP16、FP32），支持私有 GPT、文本到图像等多种主流人工智能模型部署，并配备散热铝合金外壳，可在恶劣环境中部署。

## 产品规格

| 产品型号   | Fogwise® AIRbox Q900                                                                                                                                                                                                                                                                                                                |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| CPU        | 八大核 Kryo 第六代（基于 Cortex-A78C）架构 @2.36 GHz                                                                                                                                                                                                                                                                                 |
| GPU        | Adreno 663 图形处理器<br/> • 支持安全通用 GPU 计算，1.2 TFLOPS FP32 算力<br/>• 支持 Vulkan 1.2, OpenGL ES 3.2, OpenCL 2.0 FP<br/>• 支持 Adreno NN Direct                                                                                                                                                                             |
| MCU        | 独立四核 Cortex-R52 @ 1.85GHz                                                                                                                                                                                                                                                                                                        |
| NPU        | 集成 Hexagon 张量处理器 (HTP)：包含四路向量扩展(HVX)和双路矩阵协处理器(HMX)<br/>AI 算力：200 TOPS@INT8（稀疏算力）                                                                                                                                                                                                                   |
| 视频编解码 | Adreno VPU 765<br/> **解码：**<br/>• 支持 AV1 / HEVC / H.264 / H.265 / VP9 / MPEG2 格式<br/>• 1x 8Kp60 / 2x 8Kp30 / 4x 4Kp60 / 8x 4Kp30 / 16x 1080p60 / 32x 1080p30<br/>**编码：**<br/>• 支持 H.264 / H.265 / HEIF / HEIC 格式<br/>• 2x 4Kp60 / 4x 4Kp30 / 8x 1080p60 / 16x 1080p30<br/>可同时运行 2 路 4Kp60 解码 + 2 路 4Kp60 编码 |
| 内存       | 36GB 96bit LPDDR5@6400MT/s（支持 ECC）                                                                                                                                                                                                                                                                                               |
| 存储       | 1x 板载 32MB SPI 闪存<br/>1x UFS / eMMC 模块接口<br/>1x 板载 128GB UFS3.1（Gear4 2-Lane）<br/>1x M.2 M Key 插槽（PCle Gen4 4-Lane）                                                                                                                                                                                                  |
| 显示输出   | 1x 标准 HDMI 2.0（最高支持 4K@60fps）                                                                                                                                                                                                                                                                                                |
| 有线网络   | 2 x RJ45 2.5G 以太网口（支持 TSN 实时以太网）                                                                                                                                                                                                                                                                                        |
| 无线网络   | 1x Mini PCIe 插槽<br/>• 支持 Wi-Fi 6 / BT 5.4<br/>• 支持 4G / 5G Mini PCIe 模组，用于支持 4G / 5G 移动网络<br/>1x Nano SIM 卡槽<br/>最多支持外接 3 根天线                                                                                                                                                                            |
| USB 接口   | 1x USB 3.1 Gen2 HOST Type-A 口<br/>1x USB 3.1 Gen2 OTG Type-A 口<br/>1x Type-C 控制台                                                                                                                                                                                                                                                |
| 供电方式   | DC 12V/5.4A (5.5x2.5mm) 供电接口                                                                                                                                                                                                                                                                                                     |
| 其他接口   | 1x PWM 风扇接口<br/>1x RTC 电池接口<br/>1x 紧急下载 EDL 按键<br/>1x 关机按键                                                                                                                                                                                                                                                         |
| 操作系统   | 支持 Ubuntu、Yocto 等操作系统                                                                                                                                                                                                                                                                                                        |
| 机械尺寸   | 104 x 84 x 45 mm                                                                                                                                                                                                                                                                                                                     |
| 工作温度   | 0℃ ~ 60 ℃                                                                                                                                                                                                                                                                                                                            |
| 散热方式   | 散热铝合金外壳，内置 PWM 调速风扇                                                                                                                                                                                                                                                                                                    |

## 接口概览

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-ports.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                                                               | 序号 | 说明              | 序号 | 说明              |
| :--: | :----------------------------------------------------------------- | :--: | :---------------- | :--: | :---------------- |
|  1   | 12V DC 电源输入                                                    |  4   | USB Type-C 控制台 |  7   | 3x 外置天线接口   |
|  2   | 上：USB 3.1 Gen2 HOST Type-A 口<br/>下：USB 3.1 Gen2 OTG Type-A 口 |  5   | Nano SIM 卡槽     |  8   | 紧急下载 EDL 按键 |
|  3   | 2x 2.5G RJ45 以太网口                                              |  6   | 标准 HDMI 2.0     |  9   | 关机按键          |

## 芯片框图

<div style={{textAlign: 'center'}}>
**IQ-9075 芯片框图**
</div>

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/iq-9075-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 系统框图

<div style={{textAlign: 'center'}}>
**Fogwise® AIRbox Q900 硬件系统框图**
</div>

<div style={{textAlign: 'center'}}>
   <img src="/img/fogwise/airbox-q900/airbox-q900-block-diagram.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>
