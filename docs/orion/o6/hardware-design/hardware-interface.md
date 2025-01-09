---
sidebar_position: 4
---

# 硬件接口说明

## 芯片框图

<img src="/img/o6/cd8180-block-diagram.webp" alt="cd8180 system diagram" width="700" />

## 系统框图

<img src="/img/o6/o6-system-block-diagram.webp" alt="o6 system diagram" width="700" />

## 实物照片

<img src="/img/o6/o6-real.webp" alt="o6 hardware diagram" width="700" />

以下是各个硬件接口的详细接口线序以及说明。

| No. |         Name         | No. |          Name          | No. |         Name        | No. |     Name    |
|:---:|:--------------------:|:---:|:----------------------:|:---:|:-------------------:|:---:|:-----------:|
|  1  |     PCIe X16 Slot    |  9  |           DP           |  17 |    40-PIN Header    |  25 |  Debug UART |
|  2  |       M.2 M-Key      |  10 |          HDMI          |  18 |      CIX CD8180     |  26 |     eDP     |
|  3  |       M.2 E-Key      |  11 |         USB3.2         |  19 |    RAM LPDDR5(X)    |  27 | RTC Battery |
|  4  |      Speaker L/R     |  12 |         USB2.0         |  20 | ATX Power Interface |  28 | MIPI Camera |
|  5  | Power LED + User LED |  13 | Full-functioned Type-C |  21 |        F_USB        |     |             |
|  6  |     Reset Button     |  14 |      Power Button      |  22 |       F_AUDIO       |     |             |
|  7  |  Headphone with MIC  |  15 |       FAN Header       |  23 |     Touch Panel     |     |             |
|  8  |         5GbE         |  16 |    SPI Flash Socket    |  24 |       F_PANEL       |     |             |


## 供电电源

Orion o6 的供电方式有两种，一种是通过机箱电源（ATX 电源）座，另一种是通过 Type-C 口。
当 Orion O6 同时接了 ATX 电源和 Type-C 电源时，供电电源是 ATX 电源。

### 机箱电源（ATX 电源）接口

ATX 电源提供的电压是 12V。

### Type-C 口

Orion O6 有两个 Type-C 口，都是全功能 Type-C 口。支持通过该口为板子供电；支持通过该口对外提供电；也支持 Type-C 显示。

Type-C 作为供电口时，使用的适配器，需要支持 PD 协议，功率至少 65W，输出电压 20V。

Type-C 口对外供电的电压是 5V。

## 网络

Orion O6 搭载了2个 5G 以太网口。使用的 Phy 是 Realtek RTL8126。

## 40-PIN GPIO Header

| 第三功能 |    第二功能    | 第一功能 | 引脚序号 |   | 引脚序号 | 第一功能 |     第二功能     | 第三功能 |
|:--------:|:--------------:|:--------:|:--------:|---|:--------:|:--------:|:----------------:|:--------:|
|          |                |   3.3V   |     1    |   |     2    |    5V    |                  |          |
|          |                | I2C4_SDA |     3    |   |     4    |    5V    |                  |          |
|          |                | I2C4_CLK |     5    |   |     6    |    GND   |                  |          |
|          |                |  GPIO071 |     7    |   |     8    |  GPIO105 |     UART3_TXD    |          |
|          |                |    GND   |     9    |   |    10    |  GPIO106 |     UART3_RXD    |          |
|   PWM0   |    UART0_TXD   |  GPIO095 |    11    |   |    12    |  GPIO091 |    I2S4_SCK_LB   |          |
|   PWM1   |    UART0_RXD   |  GPIO096 |    13    |   |    14    |    GND   |                  |          |
|          |    UART1_TXD   |  GPIO099 |    15    |   |    16    |  GPIO100 |     UART1_RXD    |          |
|          |                |   3.3V   |    17    |   |    18    |  GPIO044 |                  |          |
|          |    SPI2_MOSI   |  GPIO141 |    19    |   |    20    |    GND   |                  |          |
|          |    SPI2_MISO   |  GPIO138 |    21    |   |    22    |  GPIO045 |                  |          |
|          |    SPI2_CLK    |  GPIO142 |    23    |   |    24    |  GPIO139 |     SPI2_CS0     |          |
|          |                |    GND   |    25    |   |    26    |  GPIO140 |     SPI2_CS1     |          |
| I3C0_SDA |    I2C2_SDA    |  GPIO056 |    27    |   |    28    |  GPIO055 |     I2C2_CLK     | I3C0_SCL |
|          |  I2S2_DATA_IN1 |  GPIO076 |    29    |   |    30    |    GND   |                  |          |
|          | I2S2_DATA_OUT1 |  GPIO078 |    31    |   |    32    |  GPIO046 |                  |          |
|          | I2S2_DATA_OUT2 |  GPIO079 |    33    |   |    34    |    GND   |                  |          |
|          |   I2S4_WS_LB   |  GPIO092 |    35    |   |    36    |  GPIO090 |   I2S4_MCLK_LB   |          |
|          | I2S2_DATA_OUT3 |  GPIO080 |    37    |   |    38    |  GPIO093 |  I2S4_DATA_IN_LB |          |
|          |                |    GND   |    39    |   |    40    |  GPIO094 | I2S4_DATA_OUT_LB |          |