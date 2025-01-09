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

