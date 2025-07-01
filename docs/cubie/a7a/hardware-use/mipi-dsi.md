---
sidebar_position: 8
---

# MIPI DSI 接口

瑞莎 Cubie A7A 板载 1 个 4 通道 MIPI DSI 接口，我们可以通过 MIPI DSI 接口连接显示器。

:::tip
MIPI DSI 接口具体位置可以查看 [硬件接口](./hardware-info) 教程的接口说明部分！
:::

## 支持列表

目前正在适配显示器，后续会更新支持的显示器列表。

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

| Pin# | Name           | Pin# | Name          | Pin# |   Name    |
| :--: | :------------- | :--: | :------------ | :--: | :-------: |
|  1   | LCD_3V3        |  15  | GND           |  29  |    GND    |
|  2   | VCC18-LCD      |  16  | MIPI-DSI0-DN2 |  30  |  LCD_3V3  |
|  3   | TP-SENSOR      |  17  | MIPI-DSI0-DP2 |  31  |  LCD_3V3  |
|  4   | LCD-RST        |  18  | GND           |  32  |    GND    |
|  5   | NC             |  19  | MIPI-DSI0-DN3 |  33  |    GND    |
|  6   | GND            |  20  | MIPI-DSI0-DP3 |  34  | VCC_LEDK1 |
|  7   | MIPI-DSI0-DN2  |  21  | GND           |  35  | VCC_LEDK1 |
|  8   | MIPI-DSI0-DP2  |  22  | GND           |  36  |    NC     |
|  9   | GND            |  23  | TP_RST        |  37  |    NC     |
|  10  | MIPI-DSI0-DN1  |  24  | LCD_3V3       |  38  | VCC_LEDA1 |
|  11  | MIPI-DSI0-DP1  |  25  | TP_INT        |  39  | VCC_LEDA1 |
|  12  | GND            |  26  | TWI2-SDA      |  40  |    GND    |
|  13  | MIPI-DSI0-CLKN |  27  | TWI2-SCK      |  41  |    GND    |
|  14  | MIPI-DSI0-CLKP |  28  | GND           |      |           |
