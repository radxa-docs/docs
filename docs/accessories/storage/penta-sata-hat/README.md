---
sidebar_position: 1
---

# 瑞莎 Penta SATA HAT

瑞莎 ROCK Penta SATA HAT 是为 ROCK 系列设计的扩展板。它利用 ROCK 系列的高速 PCIe 总线，提供基于 ROCK 系列的完整 NAS 解决方案。

![Radxa Penta SATA HAT](/img/accessories/storage/penta-sata-hat-01.webp)

目前支持的瑞莎 ROCK 系列产品：

- ROCK 2A
- ROCK 2F
- ROCK 3A
- ROCK 3C
- ROCK 4A / 4B
- ROCK 4A+ / 4B+
- ROCK 4SE
- ROCK 5A
- ROCK 5C

目前支持的树莓派型号：

- Raspberry Pi 5

## 特性

- 最多支持 5 个 HDD/SSD，支持 2.5 英寸或 3.5 英寸 SSD，最高 100T 存储容量
- 4 个 SATA + 1 个带电源的 eSATA
- 利用 ROCK 系列和树莓派的 PCIe 总线
- 支持外部标准 ATX 电源为硬盘和 SBC 本身供电
- 12V DC 电源输入用于 2.5/3.5 英寸硬盘和 SBC 本身供电（极性：中心正极）
- 支持硬盘休眠模式
- 支持软件 RAID 0/1/5
- 可选 PWM 控制风扇用于硬盘散热
- 可选 OLED 显示屏显示 IP/存储信息

:::tip
如果您在 Penta SATA HAT 上使用大容量 3.5 英寸机械硬盘，需要查看硬盘规格以确定硬盘的峰值电流。我们建议使用峰值电流小于 1.7A 的硬盘。
:::

## 包装清单

- 瑞莎 ROCK Penta SATA HAT
- 固定用铜柱
- 转接板
- IPEX 线缆

- **支持 ROCK 5A 的 Penta SATA HAT 套件**

  ![Radxa Penta SATA HAT](/img/accessories/storage/penta-sata-hat-02.webp)

- **支持 ROCK 3A / 4A / 4B / 4A+ / 4B+ / 4SE 的 Penta SATA HAT**

  ![Radxa Penta SATA HAT](/img/accessories/storage/penta-sata-hat-03.webp)

- **支持 ROCK 3C 的 Penta SATA HAT**

  ![Radxa Penta SATA HAT](/img/accessories/storage/penta-sata-hat-04.webp)

## 40 针引脚定义

| 描述          | 功能    | 引脚# | 引脚# | 功能 | 描述       |
| ------------- | ------- | ----- | ----- | ---- | ---------- |
|               |         | 1     | 2     | VCC  |            |
| OLED I2C      | I2C_SDA | 3     | 4     | VCC  |            |
| OLED I2C      | I2C_SCL | 5     | 6     | GND  |            |
|               |         | 7     | 8     |      |            |
|               | GND     | 9     | 10    |      |            |
| top board key | GPIO    | 11    | 12    |      |            |
|               |         | 13    | 14    | GND  |            |
|               |         | 15    | 16    | GPIO | reset OLED |
|               |         | 17    | 18    |      |            |
|               |         | 19    | 20    | GND  |            |
|               |         | 21    | 22    |      |            |
|               |         | 23    | 24    |      |            |
|               | GND     | 25    | 26    |      |            |
|               |         | 27    | 28    |      |            |
|               |         | 29    | 30    | GND  |            |
|               |         | 31    | 32    |      |            |
| tb-fan speed  | PWM     | 33    | 34    | GND  |            |
|               |         | 35    | 36    |      |            |
|               |         | 37    | 38    |      |            |
|               | GND     | 39    | 40    |      |            |

## 2x5 针引脚定义

| Pin | Signal   | Pin | Signal     |
| --- | -------- | --- | ---------- |
| 1   | I2C_SDA  | 2   | VCC3V3_SYS |
| 3   | I2C_SCL  | 4   | VCC5V0_SYS |
| 5   | GPIO4_D2 | 6   | GPIO4_C2   |
| 7   | GND      | 8   | PWM_33     |
| 9   | GND      | 10  | NC         |

## 用户指南

<DocCardList />
