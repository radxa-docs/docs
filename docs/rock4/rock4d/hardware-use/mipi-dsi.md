---
sidebar_position: 8
---

# MIPI DSI 接口

瑞莎 ROCK 4D 板载 1 个 MIPI DSI 接口，我们可以通过 MIPI DSI 接口连接显示器，支持最高 2K 的分辨率。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-mipi-dsi-4l.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

## 支持列表

使用 ROCK 4D 实际测试正常的显示器列表。

|                                   型号                                   |  分辨率   |
| :----------------------------------------------------------------------: | :-------: |
| [Radxa Display 8 HD](https://radxa.com/products/accessories/display-8hd) | 800\*1280 |

## 使用指南

使用 MIPI DSI 接口连接显示器，ROCK 4D 需要搭配专门的 FPC 排线（FPC 排线规格：39-pin 0.3mm(SBC) 转 40 pin 0.5mm(Display)）。

- 排线说明

①： 连接 ROCK 4D 的 MIPI DSI 接口，金手指（金属接触点）朝向主板方向

②： 连接显示器的接口，金手指（金属接触点）朝向显示器方向

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rock4d-dsi.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

### 使能显示器

在终端命令行输入 `rsetup` 命令，使用 Rsetup 工具设置显示器选项。

<NewCodeBlock tip="radxa@radxa-4d$" type="device">
```
rsetup
```
</NewCodeBlock>

1. 通过方向键选择 `Overlays` 选项，然后按回车键确认选择。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-overlays-dsi-1.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

2. 通过方向键选择 `Manage overlays` 选项，然后按回车键确认选择。

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-overlays-dsi-2.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

3. 通过方向键选择 `Enable Radxa Display 8 HD` 选项，然后按空格键勾选 `Enable Radxa Display 8 HD` 选项，最后按回车确认选择。

:::tip
选项框中出现 `*` 表示该选项已启用
:::

<div style={{textAlign: 'center'}}>
  <img src="/img/rock4/4d/rsetup-overlays-dsi-3.webp" style={{width: '100%', maxWidth: '1200px'}} />
</div>

4. 重启系统，配置生效，显示器会正常显示。

## 接口规格

:::tip
详细接口规格参考下载专区的 [硬件设计 : 原理图](../download)
:::

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
