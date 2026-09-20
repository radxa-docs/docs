---
sidebar_position: 1
---

# 瑞莎 4K HDMI IN 转 MIPI CSI-2 转接板

## 产品简介

**瑞莎 4K HDMI IN 转 MIPI CSI-2 转接板** 基于瑞芯微 RK628H 视频桥接芯片，可将 HDMI 视频信号转换为 MIPI CSI-2 信号，并从 HDMI 信号中提取 I2S 数字音频。

转接板提供 2-lane 和 4-lane 两种 MIPI CSI-2 接口，可帮助开发板快速接入 HDMI 摄像机、计算机及其他高清视频源，适用于视频采集、图像处理和嵌入式视觉应用。

<div style={{textAlign: 'center'}}>
    <img src="/img/accessories/display/hdmi-in-to-mipi-csi2/hdmi-in-to-mipi-csi2-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 主要特性

- **4K HDMI 输入**

最高支持 4K@30fps HDMI 视频输入，满足高清视频采集需求。

- **MIPI CSI-2 输出**

提供 2-lane 和 4-lane MIPI CSI-2 接口，其中 4-lane 接口最高支持 4K@30fps 视频输出。

- **RK628H 视频桥接**

基于瑞芯微 RK628H，实现 HDMI 至 MIPI CSI-2 视频信号转换。

- **HDMI 音频提取**

支持从 HDMI 输入信号中提取音频，并通过独立 I2S 接口输出数字音频信号。

- **EDID 管理**

支持通过 EDID 向 HDMI 信号源声明兼容的视频格式，提升不同 HDMI 信号源的接入兼容性。

- **兼容瑞莎 Z 版型**

可直接安装在瑞莎 Z 版型迷你主板上；用于其他版型时，可沿预留分板位置裁切扩展部分，灵活适配不同安装空间。

- **面向视觉开发**

适用于 HDMI 视频采集、图像处理、视频分析及嵌入式视觉应用。

## 产品规格

| 项目     | 规格                                                                                                       |
| -------- | ---------------------------------------------------------------------------------------------------------- |
| 处理器   | 瑞芯微 RK628H                                                                                               |
| 视频输入 | HDMI 输入，最高支持 4K@30fps                                                                                |
| 视频输出 | 1x 2-lane MIPI CSI（15-Pin，1.0 mm 间距）；1x 4-lane MIPI CSI（31-Pin，0.3 mm 间距），最高输出 4K@30fps      |
| 音频输出 | I2S 数字音频输出，引脚：DOUT、LRCK、SCLK、MCLK                                                              |
| 辅助信号 | HDMI 检测、系统中断，信号：DET、INT                                                                         |
| 机械尺寸 | 30 x 65 mm                                                                                                  |
| 兼容产品 | ROCK 3C / ROCK 4D / ROCK 5A / ROCK 5B / ROCK 5B+ / ROCK 5C / ROCK 5T                                        |

## 机械尺寸

<div style={{textAlign: 'center'}}>
    <img src="/img/accessories/display/hdmi-in-to-mipi-csi2/hdmi-in-to-mipi-csi2-dimension.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 接口线序

转接板提供 31-Pin MIPI CSI（4-lane）、15-Pin MIPI CSI（2-lane）和 7-Pin 排针（I2S）三个接口。

### 31-Pin MIPI CSI（4-lane）

| 引脚 | 信号            | 电平 | 说明                 |
| ---- | --------------- | ---- | -------------------- |
| 1    | GND             | -    | 接地                 |
| 2    | MIPI_D3N        | -    | 数据通道 3 负端      |
| 3    | MIPI_D3P        | -    | 数据通道 3 正端      |
| 4    | GND             | -    | 接地                 |
| 5    | MIPI_D2N        | -    | 数据通道 2 负端      |
| 6    | MIPI_D2P        | -    | 数据通道 2 正端      |
| 7    | GND             | -    | 接地                 |
| 8    | NC              | -    | 未连接               |
| 9    | NC              | -    | 未连接               |
| 10   | GND             | -    | 接地                 |
| 11   | MIPI_D1N        | -    | 数据通道 1 负端      |
| 12   | MIPI_D1P        | -    | 数据通道 1 正端      |
| 13   | GND             | -    | 接地                 |
| 14   | MIPI_D0N        | -    | 数据通道 0 负端      |
| 15   | MIPI_D0P        | -    | 数据通道 0 正端      |
| 16   | GND             | -    | 接地                 |
| 17   | MIPI_CLKN       | -    | MIPI CSI 时钟负端    |
| 18   | MIPI_CLKP       | -    | MIPI CSI 时钟正端    |
| 19   | GND             | -    | 接地                 |
| 20   | NC              | -    | 未连接               |
| 21   | GND             | -    | 接地                 |
| 22   | NC              | -    | 未连接               |
| 23   | RK628_INT       | 1.8V | RK628 中断输出       |
| 24   | I2C_SCL         | 1.8V | I2C 时钟             |
| 25   | I2C_SDA         | 1.8V | I2C 数据             |
| 26   | RK628_Plugin_DET | 1.8V | 转接板在位检测       |
| 27   | RK628_Reset     | 1.8V | RK628 复位           |
| 28   | 3.3V            | 3.3V | 电源                 |
| 29   | 3.3V            | 3.3V | 电源                 |
| 30   | 5V              | 5V   | 未使用               |
| 31   | 5V              | 5V   | 未使用               |

### 15-Pin MIPI CSI（2-lane）

| 引脚 | 信号       | 电平 | 说明              |
| ---- | ---------- | ---- | ----------------- |
| 1    | 3.3V       | 3.3V | 电源              |
| 2    | I2C_SDA    | 3.3V | I2C 数据          |
| 3    | I2C_SCL    | 3.3V | I2C 时钟          |
| 4    | NC         | -    | 未连接            |
| 5    | RK628_Reset | 3.3V | RK628 复位       |
| 6    | GND        | -    | 接地              |
| 7    | MIPI_CLKP  | -    | MIPI CSI 时钟正端 |
| 8    | MIPI_CLKN  | -    | MIPI CSI 时钟负端 |
| 9    | GND        | -    | 接地              |
| 10   | MIPI_D1P   | -    | 数据通道 1 正端   |
| 11   | MIPI_D1N   | -    | 数据通道 1 负端   |
| 12   | GND        | -    | 接地              |
| 13   | MIPI_D0P   | -    | 数据通道 0 正端   |
| 14   | MIPI_D0N   | -    | 数据通道 0 负端   |
| 15   | GND        | -    | 接地              |

### 7-Pin 排针

| 引脚 | 信号             | 电平 | 说明                    |
| ---- | ---------------- | ---- | ----------------------- |
| 1    | I2S_D0           | -    | I2S 数据输出（DOUT）    |
| 2    | I2S_LRCK         | -    | I2S 帧时钟（LRCK）      |
| 3    | I2S_SCLK         | -    | I2S 位时钟（SCLK）      |
| 4    | I2S_MCLK         | -    | I2S 主时钟（MCLK）      |
| 5    | RK628_Plugin_DET | 3.3V | 转接板在位检测          |
| 6    | RK628_INT        | 3.3V | RK628 中断输出          |
| 7    | GND              | -    | 接地                    |

:::note 说明

- 31-Pin 接口只走 MIPI CSI 视频信号，HDMI 音频需要通过 7-Pin 排针的 I2S 接口单独连接主板。
- `RK628_Plugin_DET` 和 `RK628_INT` 在 31-Pin 接口上是 1.8V 电平，在 7-Pin 排针上是 3.3V 电平，接线时请注意电平匹配。
- 标记为 `NC` 的引脚未连接，请保持悬空，不要与其他信号短接。

:::

## 配件清单

- 1x 瑞莎 4K HDMI IN 转 MIPI CSI-2 转接板
- 1x AC006（31P 0.3 mm 转 31P 0.3 mm，异面 FPC 排线）
- 1x AC014（15P 1.0 mm 转 15P 1.0 mm，异面 FPC 排线）
