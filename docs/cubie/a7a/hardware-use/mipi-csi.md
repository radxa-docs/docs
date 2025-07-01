---
sidebar_position: 7
---

# MIPI CSI 接口

瑞莎 Cubie A7A 板载 1 个 4 通道 MIPI CSI 或 2 个 2 通道 MIPI CSI，我们可以通过 MIPI CSI 接口连接摄像头。

:::tip
MIPI CSI 接口具体位置可以查看 [硬件接口](./hardware-info) 教程的接口说明部分！
:::

## 支持列表

目前正在适配摄像头模块，后续会更新支持的摄像头模块列表。

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

| Pin# | Name      | Pin# | Name        | Pin# | Name             |
| :--: | :-------- | :--: | :---------- | :--: | :--------------- |
|  1   | GND       |  12  | MCSIB-D1P   |  23  | MCSI-STBY-R      |
|  2   | MCSIB-D3N |  13  | GND         |  24  | TWI3-SCK         |
|  3   | MCSIB-D3P |  14  | MCSIB-D0N   |  25  | TWI3-SDA         |
|  4   | GND       |  15  | MCSIB-D0P   |  26  | MIPI_CSI0_PDN2_H |
|  5   | MCSIB-D2N |  16  | GND         |  27  | MCSI-STBY-R2     |
|  6   | MCSIB-D2P |  17  | MCSIB-CKN   |  28  | 3V3_CAM1         |
|  7   | GND       |  18  | MCSIB-CKP   |  29  | 3V3_CAM1         |
|  8   | NC        |  19  | GND         |  30  | 5V_CAM1          |
|  9   | NC        |  20  | GND         |  31  | 5V_CAM1          |
|  10  | GND       |  21  | MCSI-MCLK   |      |                  |
|  11  | MCSIB-D1N |  22  | MCSI-MCLK-2 |      |                  |
