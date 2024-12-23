---
sidebar_position: 4
---

# 硬件接口说明

## 芯片框图

<img src="/img/o6/cd8180-block-diagram.webp" alt="cd8180 system diagram" width="700" />

## 系统框图

<img src="/img/o6/o6-system-block-diagram.webp" alt="o6 system diagram" width="700" />

## 实物照片

<img src="/img/o6/o6-real.webp" width="600" />

以下是各个硬件接口的详细接口线序以及说明。

## 供电电源

Orion o6 的供电方式有两种，一种是通过机箱电源（ATX 电源）座，另一种是通过 Type-C 口。
当 Orion O6 同时接了 ATX 电源和 Type-C 电源时，供电电源是 ATX 电源。

### 机箱电源（ATX 电源）接口

ATX 电源提供的电压是 12V。

### Type-C 口

Orion O6 有两个 Type-C 口，都是全功能 Type-C 口。支持通过该口为板子供电，也支持通过该口对外提供电。
选择的 Type-C 电源可以是：
- 支持输出 20V 的 Type-C DC 65W 适配器
- 支持 PD 20V 的 Type-C 65W 适配器
- 支持输出 20V Type-C 65W 适配器

## 网络

Orion O6 搭载了2个 5G 以太网口。使用的 Phy 是 Realtek RTL8126。

