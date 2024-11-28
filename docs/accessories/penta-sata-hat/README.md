---
sidebar_position: 1
---

# 瑞莎 Penta SATA 扩展板

瑞莎 Penta SATA 扩展板是为瑞莎和树莓派单板机设计的硬件帽(HAT)。它充分利用瑞莎 和树莓派单板机上的高速 PCIe 总线，提供多个盘位的硬盘扩展，可以组成一套完整 NAS 解决方案。

![Radxa Penta SATA HAT](/img/accessories/penta-sata-hat-01.webp)

目前支持瑞莎如下单板机：

- ROCK 3A
- ROCK 3C
- ROCK 4A / 4B
- ROCK 4A+ / 4B+
- ROCK 4SE
- ROCK 5A

支持如下树莓派型号：

- 树莓派 5

## 特征

- 高达 5x HDD/SSD，支持 2.5 英寸或 3.5 英寸 SSD，高达 100T 存储
- 4x SATA + 1x eSATA 带电源
- 在 ROCK 系列上使用 PCIe 总线
- 外置标准ATX电源支持HDD和ROCK系列
- 12V DC 电源输入，适用于 2.5/3.5 HDD 电源和 ROCK 系列（极性：内正外负）
- 支持硬盘挂起模式
- 支持软件RAID 0/1/5
- 可选的 PWM 控制风扇用于 HDD 热量分配
- 用于 IP/存储信息的可选 OLED 显示屏

:::tip
如果你在 Penta SATA 扩展板上使用大容量的 3.5 英寸机械硬盘，需要查看硬盘规格书，以确定硬盘的峰值电流。我们建议使用峰值电流小于 1.7A 的硬盘。
:::

## 套装清单

- 一个瑞莎 Penta SATA HAT 扩展板
- 铜柱若干
- 转接板
- IPEX 排线

- **支持 ROCK 5A 的 Penta SATA HAT 套装**

  ![Radxa M.2 Extension Board](/img/accessories/penta-sata-hat-02.webp)

- **支持 ROCK 3A / 4A / 4B / 4A+ / 4B+ / 4SE 的 Penta SATA HAT 套装**

  ![Radxa M.2 Extension Board](/img/accessories/penta-sata-hat-03.webp)

- **支持 ROCK 3C 的 Penta SATA HAT 套装**

  ![Radxa M.2 Extension Board](/img/accessories/penta-sata-hat-04.webp)

## 40 针 Pinout

| Description   | Function | Pin# | Pin# | Function | Description |
| ------------- | -------- | ---- | ---- | -------- | ----------- |
|               |          | 1    | 2    | VCC      |             |
| OLED I2C      | I2C_SDA  | 3    | 4    | VCC      |             |
| OLED I2C      | I2C_SCL  | 5    | 6    | GND      |             |
|               |          | 7    | 8    |          |             |
|               | GND      | 9    | 10   |          |             |
| top board key | GPIO     | 11   | 12   |          |             |
|               |          | 13   | 14   | GND      |             |
|               |          | 15   | 16   | GPIO     | reset OLED  |
|               |          | 17   | 18   |          |             |
|               |          | 19   | 20   | GND      |             |
|               |          | 21   | 22   |          |             |
|               |          | 23   | 24   |          |             |
|               | GND      | 25   | 26   |          |             |
|               |          | 27   | 28   |          |             |
|               |          | 29   | 30   | GND      |             |
|               |          | 31   | 32   |          |             |
| tb-fan speed  | PWM      | 33   | 34   | GND      |             |
|               |          | 35   | 36   |          |             |
|               |          | 37   | 38   |          |             |
|               | GND      | 39   | 40   |          |             |

## 使用指南

<DocCardList />
