---
sidebar_position: 4
---

# 硬件接口说明

## 40-PIN 引脚定义表

| GPIO number | Function2  | Function1 | Pin# |     | Pin# | Function1 | Function2 | GPIO number |
| :---------: | :--------: | :-------: | :--: | :-: | :--: | :-------: | :-------: | :---------: |
|             |            |   +3.3V   |  1   |     |  2   |   +5.0V   |           |             |
|     359     |    SDA2    |  GPIO12   |  3   |     |  4   |   +5.0V   |           |             |
|     360     |    SCL2    |  GPIO13   |  5   |     |  6   |    GND    |           |             |
|     483     | SPIM1_CSB  |  GPIO136  |  7   |     |  8   |  GPIO98   |   UTXD0   |     445     |
|             |            |    GND    |  9   |     |  10  |  GPIO99   |   URXD0   |     446     |
|     484     | SPIM1_CLK  |  GPIO137  |  11  |     |  12  |  GPIO104  | DISP_PWM1 |     451     |
|     485     |  SPIM1_MO  |  GPIO138  |  13  |     |  14  |    GND    |           |             |
|     486     |  SPIM1_MI  |  GPIO139  |  15  |     |  16  |  GPIO61   | DMIC1_SLK |     408     |
|             |            |   +3.3V   |  17  |     |  18  |  GPIO62   | DMIC1_DAT |     409     |
|     489     |  SPIM2_MO  |  GPIO142  |  19  |     |  20  |    GND    |           |             |
|     490     |  SPIM2_MI  |  GPIO143  |  21  |     |  22  |  GPIO17   |   SCL4    |     364     |
|     488     | SPIM2_CLK  |  GPIO141  |  23  |     |  24  |  GPIO140  | SPIM2_CSB |     487     |
|             |            |    GND    |  25  |     |  26  |  AUXIN3   |           |             |
|     362     |    SCL3    |  GPIO15   |  27  |     |  28  |  GPIO14   |   SDA3    |     361     |
|     404     | I2SO2_MCLK |  GPIO57   |  29  |     |  30  |    GND    |           |             |
|     405     | I2SO2_BCK  |  GPIO58   |  31  |     |  32  |  GPIO16   |   SDA4    |     363     |
|     406     |  I2SO2_WS  |  GPIO59   |  33  |     |  34  |    GND    |           |             |
|     407     |  I2SO2_D0  |  GPIO60   |  35  |     |  36  |  GPIO47   | I2SIN_BCK |     394     |
|     393     | I2SIN_MCK  |  GPIO46   |  37  |     |  38  |  GPIO48   | I2SIN_WS  |     395     |
|             |            |    GND    |  39  |     |  40  |  GPIO49   | I2SIN_D0  |     396     |
