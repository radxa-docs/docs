---
sidebar_position: 50
---

# Radxa X5

## 产品概述

瑞莎 X5 是一款基于英特尔® 处理器 N150 (Twin Lake) 的高性能单板计算机，面向边缘计算与嵌入式应用场景，在紧凑尺寸内提供 x86 平台的通用计算与图形能力。

X5 提供 LPDDR5 内存（最大可选 16GB），并支持板载 eMMC（可选）及 M.2 M Key 2230 扩展存储，便于按项目需求灵活配置容量与性能。

显示与连接方面，板载 2× Micro HDMI 显示输出，提供 2.5GbE 有线网络，并集成 Wi‑Fi 6 / 蓝牙 5.2，适用于智能终端、工业网关与多媒体边缘设备等应用。

供电支持 USB Type-C（兼容 PD / QC 协议）或 12V DC 输入，同时板载 40-Pin GPIO 等扩展接口，便于外设连接与系统集成。

## 产品外观

| 位置 |   视图    | 位置 |   视图    | 位置 |   视图    |
| :--: | :-------: | :--: | :-------: | :--: | :-------: |
|  左  | X5 正视图 |  中  | X5 背视图 |  右  | X5 侧视图 |

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-view.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 产品规格

| 类别       | 规格参数                                                                                                                                |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| 中央处理器 | 英特尔® 处理器 N150 (Twin Lake)<br />- 内核数: 4<br />- 线程数: 4<br />- 最大睿频频率: 3.6 GHz<br />- 缓存: 6 MB Intel® Smart Cache   |
| 图形处理器 | Intel® Graphics<br />- 最大动态频率：1GHz<br />- 最大分辨率：4K@60Hz<br />- 支持 DirectX 12.1 / OpenGL 4.6 / OpenCL 3.0                |
| 微控制器   | RP2350                                                                                                                                  |
| 内存       | LPDDR5<br />- 最大可选 16 GB                                                                                                            |
| 存储       | 板载 eMMC（可选）<br />1× M.2 M Key 2230 插槽                                                                                           |
| 显示       | 2x Micro HDMI                                                                                                                           |
| 网络       | 1x 2.5GbE RJ45 端口（支持 PoE，需搭配 PoE 扩展板）<br />板载 WiFi 6 / 蓝牙 5.2                                                          |
| USB        | 1x USB 2.0 Type-A 端口 <br />3x USB 3.2 Gen 2 Type-A 端口                                                                               |
| 音频       | 3.5mm 耳机接口                                                                                                                          |
| 按键       | 1x 电源按键<br />1x BOOTSEL 按键                                                                                                        |
| 其他       | 1x PoE 接口<br />1x 风扇接口<br />1x RTC 电池接口<br />1x 40-Pin GPIO 排针<br />- 支持 UART, I2C, PWM, GPIO 等功能<br />1x 电源按键接口 |
| 供电       | USB Type-C（支持 PD / QC 协议）或 12V DC 电源输入接口                                                                                   |
| 操作系统   | 支持 Windows 10 / Windows 11<br />支持主流 Linux 发行版（如 Ubuntu、Debian、Fedora 等）                                                 |
| 尺寸       | 85 mm x 56 mm                                                                                                                           |

## 接口说明

<div style={{textAlign: 'center'}}>
   <img src="/img/x/x5/x5-interface.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

| 序号 | 说明                   | 序号 | 说明                                              | 序号 | 说明                        |
| ---- | ---------------------- | ---- | ------------------------------------------------- | ---- | --------------------------- |
| 1    | 40-Pin GPIO 排针       | 2    | M.2 M Key 2230 卡槽                               | 3    | BOOTSEL 按键                |
| 4    | WiFi 6 & 蓝牙 5.2 模组 | 5    | 电源按键                                          | 6    | USB Type-C 供电接口         |
| 7    | 12V DC 电源输入接口    | 8    | 2x Micro HDMI 接口                                | 9    | 电源按键接口                |
| 10   | 风扇接口               | 11   | RTC 电池接口                                      | 12   | RP2350                      |
| 13   | PoE 接口               | 14   | 2.5GbE RJ45 网口                                  | 15   | 2x USB 3.2 Gen2 Type-A 端口 |
| 16   | 板载 eMMC              | 17   | Up: USB 2.0 Type-A<br />Down: USB 3.2 Gen2 Type-A | 18   | 耳机插孔                    |
| 19   | LPDDR5 内存            | 20   | 英特尔® 处理器 N150 (Twin Lake)                  | 21   | SPI Flash                   |

:::tip 板载 eMMC

板载 eMMC 为可选配置，用户可选择板载 eMMC 容量。

:::

## 应用场景

瑞莎 X5 适合用于需要 x86 通用算力与多媒体能力的边缘计算与嵌入式应用，如工业网关、轻量视觉分析、智能终端与本地服务部署等。

### 边缘 AI 应用

可利用英特尔® 处理器与 Intel® Graphics 的图形/媒体能力，在本地完成图像/视频预处理、轻量推理与可视化展示，并通过 2.5GbE 或 Wi‑Fi 6 将数据接入局域网或边缘集群。

### 嵌入式开发

板载 40-Pin GPIO 排针等扩展接口，结合 USB 3.2、2× Micro HDMI 与 M.2 扩展能力，可用于连接常见外设并搭建原型系统。

### 机器人开发

作为机器人/自动化设备的上位机或边缘控制节点，瑞莎 X5 可用于运行控制与交互程序，并通过有线/无线网络、USB 与 GPIO 连接传感器、执行器及扩展模块。

### 开发者套件

可作为嵌入式爱好者与项目开发的计算平台，便于在 Windows 或 Linux 环境下快速完成应用移植、外设联调与系统集成。

## 系统平台

瑞莎 X5 基于英特尔® 处理器 N150，支持多种操作系统，可按项目生态与部署形态选择：

- Windows 10 / Windows 11
- 主流 Linux 发行版（如 Ubuntu、Debian、Fedora 等）
