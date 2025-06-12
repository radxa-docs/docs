---
sidebar_position: 8
---

# MIPI DSI 接口

Radxa ROCK 4D 板载 1 个 MIPI DSI 接口，我们可以通过 MIPI DSI 接口连接显示器，支持最高 2K 的分辨率。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-mipi-dsi-4l.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 使用指南

## 接口规格

| Pin# | Name                  | Pin# | Name                 | Pin# |   Name    |
| :--: | :-------------------- | :--: | :------------------- | :--: | :-------: |
|  1   | LCD_3V3               |  15  | GND                  |  29  |    GND    |
|  2   | LCD_3V3/VCC_1V8_S0    |  16  | MIPI_DPHY_DSI_TX_D2N |  30  |  LCD_3V3  |
|  3   | NC                    |  17  | MIPI_DPHY_DSI_TX_D2P |  31  |  LCD_3V3  |
|  4   | LCD_RESET_1           |  18  | GND                  |  32  |    GND    |
|  5   | NC                    |  19  | MIPI_DPHY_DSI_TX_D3N |  33  |    GND    |
|  6   | GND                   |  20  | MIPI_DPHY_DSI_TX_D3P |  34  | VCC_LEDK2 |
|  7   | MIPI_DPHY_DSI_TX_D0N  |  21  | GND                  |  35  | VCC_LEDK2 |
|  8   | MIPI_DPHY_DSI_TX_D0P  |  22  | GND                  |  36  |    NC     |
|  9   | GND                   |  23  | TP_RST_LCD           |  37  |    NC     |
|  10  | MIPI_DPHY_DSI_TX_D1N  |  24  | VCC_TP               |  38  | VCC_LEDA2 |
|  11  | MIPI_DPHY_DSI_TX_D1P  |  25  | TP_INT_LCD           |  39  | VCC_LEDA2 |
|  12  | GND                   |  26  | TP_SDA_LCD           |  40  |    GND    |
|  13  | MIPI_DPHY_DSI_TX_CLKN |  27  | TP_SCL_LCD           |  41  |    GND    |
|  14  | MIPI_DPHY_DSI_TX_CLKP |  28  | GND                  |      |           |
