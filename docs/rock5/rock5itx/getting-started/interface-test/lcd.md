---
sidebar_position: 2
---

# LCD

## 简介

## 支持列表

ROCK 5 ITX 带有一个 4-lane 的 DSI 接口。以下是目前支持的屏幕列表：

<table>
  <tr>
    <th>Screen Name</th>
    <th>分辨率</th>
  </tr>
  <tr>
    <td>Radxa Display 8 HD</td>
    <td>1280x800 像素</td>
  </tr>
  <tr>
    <td>Radxa Display 10FHD</td>
    <td>1200x1920 像素 </td>
  </tr>
  <tr>
    <td>Radxa Display 10HD</td>
    <td>1200x1920 像素 </td>
  </tr>
</table>

## 配件介绍

### 瑞莎 8 寸高清触摸屏

![Radxa Display 8 HD](/img/accessories/display-8-hd.webp)

#### 概述

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

#### 特征

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

#### 触控

Radxa Display 8 HD 触控面板由 GT911 驱动，这是专为 7 英寸至 8 英寸面板设计的新一代 5 点电容式触控解决方案，
由多达 26 个发射器电极和 14 个接收器电极组成，可提供更高的触控精度。
GT911 支持最多 5 点并发触控，实时追踪准确位置和运动轨迹以及触控区域。此外，它还可以根据需要向主机报告这些信息。

#### 特征

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
  - 绿色模式：\<48ms
  - 睡眠模式：\<200ms
  - 初始化：\<200ms

#### 信号定义

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

#### 物理规格

![Radxa Display 8 HD](/img/accessories/rock5a-display-8hd-spec.webp)

#### 测试方法

- 连接

通过 FPC 线接上 ROCK 5 ITX，如图所示：

<img src="/img/accessories/8hd-connect-fpc.webp" alt="Radxa Display 8 HD"/>

- 开启 Overlay

- 通过左下角 Application Launcher 打开 Kconsole 终端, 运行 `rsetup` 命令：

```bash
radxa@rock-5itx:~$ rsetup
```

- 通过[设备树配置](../os-config/rsetup#overlays)来启用瑞莎 4K 摄像头的 Overlay。

:::tip

1. 请启用 `[] Enable Radxa Display 8HD on LCD0` 项 Overlay。
2. 在启用成功显示 `[*] Enable Radxa Display 8HD on LCD0` 后退出重启才能使配置生效。

:::

- 测试

重启后，瑞莎 8 寸全高清触摸屏能够显示系统画面，且支持触摸。

### 瑞莎 10 寸全高清触摸屏

![Radxa Display 10 FHD](/img/accessories/display-10-fhd.webp)

#### 概述

Radxa Display 10 FHD 支持 10 点触摸，并拥有 10.1 英寸（10:16）显示区域，分辨率为 1200 × 1920 像素。

其特点如下：

- 尺寸：10.1英寸
- 符合 RoHS 设计标准
- 外形尺寸：155毫米（高）x 246.16毫米（宽）x 5.95毫米（深）
- 显示区域：135.36毫米（宽）x 216.58毫米（高）
- 像素数量：1200（水平）x 1920（垂直）像素
- 像素间距：0.0564毫米（水平）x 0.1692毫米（垂直）
- 像素排列：RGB垂直条纹
- 颜色滤光阵列：RGB垂直条纹
- 背光：白色LED
- 接口：MIPI
- 内置重力感应器

#### 信号定义

| PIN | Name     | Description                                | PIN | Name     | Description                            |
| --- | -------- | ------------------------------------------ | --- | -------- | -------------------------------------- |
| 1   | NC       | No connection                              | 21  | MIPI_3P  | +MIPI differential data input          |
| 2   | VDD      | Power Voltage for digital circuit 3.3V     | 22  | GND      | Ground                                 |
| 3   | VCCIO    | Power Voltage for digital circuit 1.8V[^1] | 23  | GND      | Ground                                 |
| 4   | INT1     | INT 1                                      | 24  | TP_RESET | External interrupt to the Host Reset   |
| 5   | Reset    | Global Reset Pin 1.8V[^1]                  | 25  | TP_VCC   | Power Voltage for digital circuit 3.3V |
| 6   | INT2     | INT 2                                      | 26  | TP_INT   | External Low is active                 |
| 7   | GND      | Ground                                     | 27  | TP_SDA   | I2C data input and output              |
| 8   | MIPI_0N  | -MIPI differential data input              | 28  | TP_SCL   | I2C clock input                        |
| 9   | MIPI_0P  | +MIPI differential data input              | 29  | GND      | Ground                                 |
| 10  | GND      | Ground                                     | 30  | GND      | Ground                                 |
| 11  | MIPI_1N  | -MIPI differential data input              | 31  | VDD      | Power Voltage for digital circuit 3.3V |
| 12  | MIPI_1P  | +MIPI differential data input              | 32  | VDD      | Power Voltage for digital circuit 3.3V |
| 13  | GND      | Ground                                     | 33  | GND      | Ground                                 |
| 14  | MIPI_CKN | -MIPI differential clock input             | 34  | GND      | Ground                                 |
| 15  | MIPI_CKP | +MIPI differential clock input             | 35  | LED-     | Power for LED backlight (Cathode)      |
| 16  | GND      | Ground                                     | 36  | LED-     | Power for LED backlight (Cathode)      |
| 17  | MIPI_2N  | -MIPI differential data input              | 37  | NC       | No connection                          |
| 18  | MIPI_2P  | +MIPI differential data input              | 38  | NC       | No connection                          |
| 19  | GND      | Ground                                     | 39  | LED+     | Power for LED backlight (Anode)        |
| 20  | MIPI_3N  | -MIPI differential data input              | 40  | LED+     | Power for LED backlight (Anode)        |

- The 3 PIN and 5 PIN should be the same as 1.8v or 3.3v

#### 机械规格

![Radxa Display 10 FHD](/img/accessories/display_10_fhd_01.webp)

#### 测试方法

- 连接

通过 FPC 线接上 ROCK 5 ITX，如图所示：

<img src="/img/rock5itx/rock5itx-lcd0.webp" alt="rock5itx lcd0" width="700" />

- 开启 Overlay

- 通过左下角 Application Launcher 打开 Kconsole 终端, 运行 `rsetup` 命令：

```bash
radxa@rock-5itx:~$ rsetup
```

- 通过[设备树配置](../../os-config/rsetup#overlays)来启用瑞莎 8 寸触摸屏的 Overlay。

:::tip

1. 请启用 `[] Enable Radxa Display 10FHD on LCD0` 项 Overlay。
2. 在启用成功显示 `[*] Enable Radxa Display 10FHD on LCD0` 后退出重启才能使配置生效。

:::

- 测试

重启后，瑞莎 10 寸全高清触摸屏能够显示系统画面，且支持触摸。
