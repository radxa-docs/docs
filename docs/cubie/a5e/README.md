---
sidebar_position: 1
---

# Cubie A5E

## 产品概述

瑞莎 Cubie A5E 是一款设计精巧、结构紧凑的单板计算机（SBC），可选配全志 A527 SoC 或工业级 T527 SoC，在提供出色性能的同时也具备高度的应用灵活性。

该主板搭载 8 核 Arm® Cortex®-A55 CPU（A527 SoC 最高频率 2.0 GHz，T527 SoC 最高频率 1.8 GHz），其中 T527 SoC 配备了 3TPOS@INT8 NPU，能够高效执行机器学习推理任务，适用于边缘计算及AI应用场景。

Cubie A5E 在紧凑形态中实现了性能与能效的平衡，适合嵌入式系统、智能物联网设备及轻量级工业应用，为用户提供了兼顾算力与功耗的优质选择。

## 产品外观

| 序号 |       视图       | 序号 |       视图       | 序号 |       视图       |
| :--: | :--------------: | :--: | :--------------: | :--: | :--------------: |
|  ①   | Cubie A5E 正视图 |  ②   | Cubie A5E 背视图 |  ③   | Cubie A5E 侧视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a5e/cubie_a5e_view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 包装清单

| 数量 | 部件            |
| :--: | :-------------- |
|  1   | 瑞莎 Cubie A5E  |
|  1   | WiFi / 蓝牙天线 |

## 产品规格

<Tabs queryString="product model">

<TabItem value="Cubie A5E（A527 SoC）">

| 类别     | 规格                                                                                                                                                                                                                        |
| -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 处理器   | 系统级芯片 (SoC)： 全志 A527 <br/> 中央处理器 (CPU)： 8 核 Cortex-A55 <br/> 图形处理器 (GPU)： Arm Mali-G57; 支持 OpenGL® ES 1.1 / 2.0 / 3.1 / 3.2、Vulkan® 1.1、OpenCL™ 1.1 / 1.2 / 2.0 <br/> 神经网络加速器 (NPU)： 无 |
| 内存     | LPDDR4 / LPDDR4x，可选：1GB / 2GB / 4GB                                                                                                                                                                                     |
| 存储     | 启动存储： 板载 SPI Flash <br/> 系统存储： 支持 MicroSD 卡 / 板载 eMMC（可选 0GB / 8GB / 16GB / 32GB） / 支持 M.2 M Key NVMe SSD                                                                                            |
| 网络     | 有线连接： 2 个千兆以太网口（支持 PoE，需外接 PoE HAT） <br/> 无线连接： Wi-Fi 6、蓝牙 5.4，预留天线座                                                                                                                      |
| 视频输出 | HDMI： 1 个 HDMI 接口，最高支持 4K@60fps <br/> MIPI DSI： 1 个 4 通道 MIPI DSI                                                                                                                                              |
| 摄像头   | 1 个 4 通道 MIPI CSI 或 2 个 2 通道 MIPI CSI                                                                                                                                                                                |
| USB      | 1个 USB 3.0 Type-A HOST <br/> 1个 USB 2.0 Type-C OTG 和 5V 供电                                                                                                                                                             |
| 拓展     | 40 Pin GPIO 排针： 支持 UART、SPI、I2C 等 <br/> M.2 M Key 2230 插槽： 支持 M.2 M Key 2230 NVMe SSD                                                                                                                          |
| 供电方式 | 支持 USB Type-C 5V 供电 <br/> 支持 PoE 供电(需外接 PoE HAT) <br/> 支持 GPIO 引脚5V 供电（引脚 2 与 4）                                                                                                                      |
| 操作系统 | 支持 Debian Linux、Android 13 系统                                                                                                                                                                                          |

</TabItem>

<TabItem value="Cubie A5E（T527 SoC）">

| 类别     | 规格                                                                                                                                                                                                                                |
| -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 处理器   | 系统级芯片 (SoC)： 全志 T527 <br/> 中央处理器 (CPU)： 8 核 Cortex-A55 <br/> 图形处理器 (GPU)： Arm Mali-G57; 支持 OpenGL® ES 1.1 / 2.0 / 3.1 / 3.2、Vulkan® 1.1、OpenCL™ 1.1 / 1.2 / 2.0 <br/> 神经网络加速器 (NPU)： 2TOPS@INT8 |
| 内存     | LPDDR4 / LPDDR4x，可选：1GB / 2GB / 4GB                                                                                                                                                                                             |
| 存储     | 启动存储： 板载 SPI Flash <br/> 系统存储： 支持 MicroSD 卡 / 板载 eMMC（可选 0GB / 8GB / 16GB / 32GB） / 支持 M.2 M Key NVMe SSD                                                                                                    |
| 网络     | 有线连接： 2 个千兆以太网口（支持 PoE，需外接 PoE HAT） <br/> 无线连接： Wi-Fi 6、蓝牙 5.4，预留天线座                                                                                                                              |
| 视频输出 | HDMI： 1 个 HDMI 接口，最高支持 4K@60fps <br/> MIPI DSI： 1 个 4 通道 MIPI DSI                                                                                                                                                      |
| 摄像头   | 1 个 4 通道 MIPI CSI 或 2 个 2 通道 MIPI CSI                                                                                                                                                                                        |
| USB      | 1个 USB 3.0 Type-A HOST <br/> 1个 USB 2.0 Type-C OTG 和 5V 供电                                                                                                                                                                     |
| 拓展     | 40 Pin GPIO 排针： 支持 UART、SPI、I2C 等 <br/> M.2 M Key 2230 插槽： 支持 M.2 M Key NVMe SSD                                                                                                                                       |
| 供电方式 | 支持 USB Type-C 5V 供电 <br/> 支持 PoE 供电(需外接 PoE HAT) <br/> 支持 GPIO 引脚5V 供电（引脚 2 与 4）                                                                                                                              |
| 操作系统 | 支持 Debian Linux、Android 13 系统                                                                                                                                                                                                  |

</TabItem>

</Tabs>

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/cubie/a5e/cubie_a5e_interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                | 序号 | 说明                   | 序号 | 说明                       |
| ---- | ------------------- | ---- | ---------------------- | ---- | -------------------------- |
| ①    | Wi-Fi / 蓝牙模块    | ⑧    | PoE 排针               | ⑭    | LPDDR4 / LPDDR4x 内存      |
| ②    | 天线座              | ⑨    | 千兆以太网（支持 PoE） | ⑮    | 全志 A527 / T527           |
| ③    | USB 3.0 Type-A HOST | ⑩    | MIPI DSI               | ⑯    | 板载 eMMC（预留）          |
| ④    | HDMI                | ⑪    | MicroSD 卡槽           | ⑰    | 40 Pin GPIO 排针           |
| ⑤    | SPI Flash           | ⑫    | MIPI CSI               | ⑱    | USB Type-C (5V 供电 & OTG) |
| ⑥    | UBOOT 按键          | ⑬    | M.2 M Key 2230 插槽    | ⑲    | 千兆以太网（不支持 PoE）   |
| ⑦    | 状态指示灯          |      |                        |      |                            |

:::tip 板载 eMMC
若您购买的 Cubie A5E 型号为无板载 eMMC 套餐，则主板板载 eMMC 位置预留，无任何元器件。
:::

## 应用场景

### Linux 初学者

作为一款基于 Linux 的单板计算机，可以用于 Linux 入门学习、进阶底层和应用层开发。

### 机器人开发

作为机器人开发的主控，提供优秀的性能和丰富的硬件接口，方便用户开发机器人应用。

### 嵌入式开发

引出丰富的 GPIO 接口，支持UART、SPI、I2C等通讯方式，方便用户驱动各种硬件。

### AI 视觉开发

其中 T527 SoC 提供 2 TOPS NPU，支持 AI 视觉开发，加速 AI 推理和训练。

## 系统平台

Cubie A5E 基于全志 A527 / T527 SoC，支持多种操作系统：

- Debian Linux
- Buildroot
- Tina Linux
- Android 13
