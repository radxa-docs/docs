---
sidebar_position: 3
---

# USB Type-C 接口

## 功能概述

瑞莎 Cubie A7A 的 USB Type-C 接口提供以下功能：

- **供电接口**：支持 5V 电压输入
- **数据传输**：支持 USB OTG (USB0 接口)
- **系统烧录**：支持 USB 刷机功能

:::info 接口位置
USB Type-C 接口具体位置可以查看 [硬件接口](./hardware-info) 文档的接口说明部分
:::

## 电源需求

- **刷机模式**：可直接通过 PC 的 USB Type-C 接口供电并进行刷机操作
- **正常使用**：建议使用输出电流 3A 以上的 USB 适配器，确保所有外设稳定运行

:::tip 推荐电源配件

- [瑞莎 PD 30W 电源适配器](https://radxa.com/products/accessories/power-pd-30w)（官方推荐）
  :::

## 使用指南

1. 将电源适配器连接至 Cubie A7A 的 USB Type-C 接口
2. 观察板载指示灯状态：
   - **供电成功**：电源指示灯呈绿色亮起
   - **供电异常**：指示灯不亮或异常闪烁

## 接口规格

:::info 技术参考
完整的技术规格和引脚定义可参考下载专区的 [硬件设计：原理图](../download) 文档
:::

### 引脚定义表

| 引脚号 | 名称 | 引脚号 | 名称       | 引脚号 | 名称    | 引脚号 | 名称    |
| :----: | :--- | :----: | :--------- | :----: | :------ | :----: | :------ |
|   1    | GND  | A1B12  | GND        |   A5   | GND     |   A7   | USB0-DM |
|   2    | GND  | B1A12  | GND        |   B5   | GND     |   B7   | USB0-DM |
|   3    | GND  |  A4B9  | VCC5V0_SYS |   A6   | USB0-DP |   A8   | NC      |
|   4    | GND  |  B4A9  | VCC5V0_SYS |   B6   | USB0-DP |   B8   | NC      |
