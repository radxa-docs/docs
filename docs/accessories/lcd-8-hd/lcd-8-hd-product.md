---
sidebar_position: 5
---

# Radxa Display 8 HD

![Radxa Display 8 HD](/img/accessories/display-8-hd.webp)

## 概述

Radxa Display 8 HD 是一款带触摸屏的彩色有源矩阵 LCD 模块，专为 Radxa 单板计算机设计。
这款 8.0 英寸显示屏可让您创建交互式项目，例如平板电脑、工业 HMI、信息仪表板等。 Radxa Display 8 HD 具有用于电源、显示和触摸的单根电缆以及启用的软件屏幕键盘，无需连接键盘或鼠标即可为您提供完整的人机界面。
此外，显示器上的内置传感器可用于自动纵向或横向旋转。 它具有以下特点：

- 8.0 英寸液晶显示器
- 800 x 1280、16.7M 色分辨率
- 全视角 LCD
- 5 点电容式触摸屏
- 支持 PWM 亮度控制
- 支持颜色增强
- 内置重力传感器，用于纵向/横向旋转

## LCD

### 特征

- 有效范围：107.64(H) x 172.224(V) mm
- 像素间距：0.04485(W) x 3 x 0.13455(H)
- 像素排列：RGB 竖条纹
- 显示颜色：16.7M
- 显示模式：常黑
- 可视角度：全角度
- 亮度（cd/㎡）：300 型 cd/㎡
- 对比度：1000（典型值）
- 表面处理：防眩光
- 接口：MIPI
- 背光：白色 LED
- 输入电压：1.8V
- 工作温度：‑20 至 60℃
- 储存温度：‑30 至 60℃

## 触控

Radxa Display 8 HD 触控面板由 GT911 驱动，这是专为 7 英寸至 8 英寸面板设计的新一代 5 点电容式触控解决方案，
由多达 26 个发射器电极和 14 个接收器电极组成，可提供更高的触控精度。
GT911 支持最多 5 点并发触控，实时追踪准确位置和运动轨迹以及触控区域。此外，它还可以根据需要向主机报告这些信息。

### 特征

- 内置电容式感应电路和高性能 MPU
  - 报告率：100Hz
  - 实时输出触摸坐标
  - 适用于各种尺寸电容触摸屏的统一软件
- 电容式触摸传感器
- 通道：26（Tx 通道）\* 14（Rx 通道）
  - 支持的 Cover Lens 厚度：0.55mm ≦ Glass ≦ 2mm,0.5mm ≦ PMMA ≦ 1.2mm
  - 自适应跳频
  - 支持 OGS 全贴合
- 环境适应性
  - 初始化期间的自校准
  - 自动漂移补偿
- 响应时间
  - 绿色模式：<48ms
  - 睡眠模式：<200ms
  - 初始化：<200ms

## Pinout

| PIN | Name     | Description                    | PIN | Name     | Description                          |
| --- | -------- | ------------------------------ | --- | -------- | ------------------------------------ |
| 1   | NC       | No connection                  | 21  | MIPI_3P  | +MIPI differential data input        |
| 2   | VDD      | 3.3V                           | 22  | GND      | Ground                               |
| 3   | VCCIO    | IO VCC (1.8V-3.3V)             | 23  | GND      | Ground                               |
| 4   | NC       | INT 1                          | 24  | TP_RESET | External interrupt to the host Reset |
| 5   | Reset    | RESET                          | 25  | TP_VCC   | Power                                |
| 6   | NC       | INT 2                          | 26  | TP_INT   | External Low is active               |
| 7   | GND      | Ground                         | 27  | TP_SDA   | I2C data input and output            |
| 8   | MIPI_0N  | -MIPI differential data input  | 28  | TP_SCL   | I2C clock input                      |
| 9   | MIPI_0P  | +MIPI differential data input  | 29  | GND      | Ground                               |
| 10  | GND      | Ground                         | 30  | GND      | Ground                               |
| 11  | MIPI_1N  | -MIPI differential data input  | 31  | VDD      | VDD 3.3V                             |
| 12  | MIPI_1P  | +MIPI differential data input  | 32  | VDD      | VDD 3.3V                             |
| 13  | GND      | Ground                         | 33  | GND      | Ground                               |
| 14  | MIPI_CKN | -MIPI differential clock input | 34  | GND      | Ground                               |
| 15  | MIPI_CKP | +MIPI differential clock input | 35  | LED-     | LED Cathode                          |
| 16  | GND      | Ground                         | 36  | LED-     | LED Cathode                          |
| 17  | MIPI_2N  | -MIPI differential data input  | 37  | NC       | No connection                        |
| 18  | MIPI_2P  | +MIPI differential data input  | 38  | NC       | No connection                        |
| 19  | GND      | Ground                         | 39  | LED+     | LED Anode                            |
| 20  | MIPI_3N  | -MIPI differential data input  | 40  | LED+     | LED Anode                            |

## 物理规格

![Radxa Display 8 HD](/img/accessories/rock5a-display-8hd-spec.webp)
