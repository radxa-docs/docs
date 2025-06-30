---
sidebar_position: 3
---

# USB Type-C 接口

瑞莎 Cubie A7A 支持 USB Type-C 和 GPIO 供电，我们推荐使用 USB Type-C 接口进行供电，仅支持 5V 电源输入，建议电流 3A 以上，确保所有外设稳定运行。

我们推荐使用支持 PD 协议的标准 5V Type-C 电源适配器进行供电。

:::tip

推荐配件：

- [瑞莎 PD 30W电源适配器(推荐使用)](https://radxa.com/products/accessories/power-pd-30w)

:::

## 使用指南

可以通过 Cubie A7A 的板载指示灯判断是否供电成功，如果供电成功，电源指示灯绿色亮起。

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

| Pin# | Name | Pin#  | Name       | Pin# | Name    | Pin# | Name    |
| :--: | :--- | :---: | :--------- | :--: | :------ | :--: | :------ |
|  1   | GND  | A1B12 | GND        |  A5  | GND     |  A7  | USB0-DM |
|  2   | GND  | B1A12 | GND        |  B5  | GND     |  B7  | USB0-DM |
|  3   | GND  | A4B9  | VCC5V0_SYS |  A6  | USB0-DP |  A8  | NC      |
|  4   | GND  | B4A9  | VCC5V0_SYS |  B6  | USB0-DP |  B8  | NC      |
